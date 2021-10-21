package com.bluecc.gen;

import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.config.po.TableField;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.engine.VelocityTemplateEngine;
import com.beust.jcommander.JCommander;
import com.beust.jcommander.Parameter;
import com.beust.jcommander.internal.Lists;
import com.google.common.base.Charsets;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import com.google.common.io.Resources;
import com.google.gson.Gson;
import com.hubspot.jinjava.Jinjava;
import com.hubspot.jinjava.interpret.JinjavaInterpreter;
import com.hubspot.jinjava.lib.filter.Filter;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * $ just run gen.SchemaGen -m bot
 * $ just run gen.SchemaGen --module gmall
 */
public class SchemaGen {
    @Parameter(names = {"--module", "-m"})
    String module;

    public static void main(String[] args) throws IOException {
        SchemaGen main = new SchemaGen();
        JCommander.newBuilder()
                .addObject(main)
                .build()
                .parse(args);

        if (main.module == null) {
            main.testify(new GmallCodeGen());
        } else if (main.module.equals("bot")) {
            ICodeGen gen = new BotCodeGen();
            main.testify(gen);
        } else {
            main.testify(new GmallCodeGen());
        }

        System.exit(0);
    }

    static class Mapping {
        String flinkType;
        List<String> mysqlTypes = Lists.newArrayList();

        Mapping(String flinkType, String... mysqlTypes) {
            this.flinkType = flinkType;
            this.mysqlTypes.addAll(Lists.newArrayList(mysqlTypes));
        }
    }

    static class Mappings {
        List<Mapping> mappings = new ArrayList<>();

        public String getFlinkTypeMapping(String mysqlType) {
            mysqlType = mysqlType.toUpperCase();
            for (Mapping mapping : mappings) {
                if (StringUtils.startsWith(mysqlType, "NUMERIC(")) {
                    return mapping.flinkType.replaceFirst("NUMERIC", "DECIMAL");
                } else if (StringUtils.startsWith(mysqlType, "DECIMAL(")) {
                    return mysqlType; // same type
                } else if (StringUtils.startsWith(mysqlType, "CHAR(")
                        || StringUtils.startsWith(mysqlType, "VARCHAR(")
                        || mysqlType.equals("TEXT")) {
                    return "STRING";
                } else if (mapping.mysqlTypes.contains(mysqlType)) {
                    return mapping.flinkType;
                }
            }
            return "_UNK_";
        }

        public Mappings putMapping(String flinkType, String... mysqlTypes) {
            mappings.add(new Mapping(flinkType, mysqlTypes));
            return this;
        }
    }

    static Mappings type_mappings;

    static Mappings get_mappings() {
        if (type_mappings == null) {
            type_mappings = new Mappings()
                    .putMapping("TINYINT", "TINYINT")
                    .putMapping("SMALLINT", "SMALLINT", "TINYINT UNSIGNED")
                    .putMapping("INT", "INT", "MEDIUMINT", "SMALLINT UNSIGNED")
                    .putMapping("BIGINT", "BIGINT", "INT UNSIGNED")
                    .putMapping("DECIMAL(20, 0)", "BIGINT UNSIGNED")
                    .putMapping("BIGINT", "BIGINT")
                    .putMapping("FLOAT", "FLOAT")
                    .putMapping("DOUBLE", "DOUBLE", "DOUBLE PRECISION")
                    // .putMapping("DECIMAL(p, s)", "NUMERIC(p, s)", "DECIMAL(p, s)")
                    .putMapping("BOOLEAN", "BOOLEAN", "TINYINT(1)")
                    .putMapping("DATE", "DATE")
                    .putMapping("TIME", "TIME")
                    .putMapping("TIMESTAMP", "DATETIME")
//                .putMapping("STRING")
                    .putMapping("BYTES", "BINARY", "VARBINARY", "BLOB");
        }
        return type_mappings;
    }

    void testify(ICodeGen gen) throws IOException {
        ConfigBuilder conf = gen.getConfigBuilder();

        List<TableInfo> tableInfoList = conf.getTableInfoList();

        // with template
        Jinjava jinjava = new Jinjava();
        jinjava.getGlobalContext().registerFilter(new ClickHouseTypeFilter());
        String dir = "./maintain/init_script/" + gen.moduleName() + "/";
        File newDirectory = new File(dir);
        if (!newDirectory.exists()) {
            Preconditions.checkArgument(newDirectory.mkdirs(),
                    "create module directory");
        }

        for (TableInfo tableInfo : tableInfoList) {
            Map<String, Object> context = Maps.newHashMap();
            context.put("table", tableInfo);
            context.put("flds", tableInfo.getFields());
            String renderedTemplate = jinjava.render(
                    "create table if not exists {{table.name}}(\n" +
                            "{% for f in flds %} " +
                            "   {{ f.name }} {{ f|chtype }}" +
                            "{% if not loop.last %}" +
                            ",\n" +
                            "{% endif %}" +
                            "{% endfor %}" +
                            ") engine=MergeTree\n" +
                            "partition by toYYYYMMDD(create_time)\n" +
                            "primary key (id) order by (id);",
                    context);
            System.out.println(renderedTemplate);
            System.out.println();

            FileWriter writer = new FileWriter(dir + tableInfo.getName() + ".sql");
            IOUtils.write(renderedTemplate, writer);
            writer.close();
        }

        List<String> tableNames = tableInfoList.stream().map(t -> t.getName()).collect(Collectors.toList());
        Map<String, List<String>> cfg = ImmutableMap.of("tables", tableNames);
        Gson gson = new Gson();
        FileWriter writer = new FileWriter("./maintain/gencfg.json");
        IOUtils.write(gson.toJson(cfg), writer);
        writer.close();

        // for debug
//        printFields(conf, tableInfoList);
        buildPipeline(tableInfoList, jinjava);

        System.out.println("created.");
    }

    private void buildPipeline(List<TableInfo> tableInfoList, Jinjava jinjava) {
        tableInfoList.forEach(t -> {
            GenTypes.SqlTable table = new GenTypes.SqlTable();
            table.setName(t.getName());
            System.out.println(t.getName());
            t.getFields().forEach(f -> {
                System.out.println("\t" + f.getName() + ", "
                        + f.getType() + ", "
                        + get_mappings().getFlinkTypeMapping(f.getType())
                );
                table.getFields().add(GenTypes.SqlField.builder()
                        .name(f.getName())
                        .flinkType(get_mappings().getFlinkTypeMapping(f.getType()))
                        .sqlType(f.getType())
                        .build());
            });
            System.out.println();

            Map<String, Object> context = Maps.newHashMap();
            context.put("table", table);

            String template = null;
            try {
                template = Resources.toString(Resources
                                .getResource("templates/kafka_source.j2"),
                        Charsets.UTF_8);
                String renderedTemplate = jinjava.render(template, context);
                System.out.println(renderedTemplate);
            } catch (IOException e) {
                e.printStackTrace();
            }
            System.out.println();
        });
    }

    private void printFields(ConfigBuilder conf, List<TableInfo> tableInfoList) {
        for (TableInfo tableInfo : tableInfoList) {
            // template
            VelocityTemplateEngine velocityTemplateEngine = new VelocityTemplateEngine();
            Map<String, Object> objectMap = velocityTemplateEngine.getObjectMap(conf, tableInfo);
            System.out.println(tableInfo.getEntityName());
            System.out.println(tableInfo.getControllerName());
            System.out.println("fields: " + tableInfo.getFields()
                    .stream().map(f -> f.getPropertyName() + "(" + f.getPropertyType() + ")")
                    .collect(Collectors.joining(", ")));
//            System.out.println("keys: "+objectMap.keySet());
            TableInfo table = (TableInfo) objectMap.get("table");
//            System.out.println(table.getFields().size());
        }
    }

    private static class ClickHouseTypeFilter implements Filter {
        Map<String, String> fieldTypes = ImmutableMap.of(
                "String", "String",
                "BigDecimal", "Decimal(16,2) ",
                "LocalDateTime", "Datetime",
                "Long", "Int64",
                "Integer", "Int32"
        );

        public ClickHouseTypeFilter() {

        }

        @Override
        public Object filter(Object o, JinjavaInterpreter jinjavaInterpreter, String... strings) {
            TableField fld = (TableField) o;

            String typ = fld.getPropertyType();
            return fieldTypes.getOrDefault(typ, "**UNK**");
        }

        @Override
        public String getName() {
            return "chtype";
        }
    }
}

