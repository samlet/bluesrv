package com.bluecc.gen;

import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.config.po.TableField;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.engine.VelocityTemplateEngine;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import com.hubspot.jinjava.Jinjava;
import com.hubspot.jinjava.interpret.JinjavaInterpreter;
import com.hubspot.jinjava.lib.filter.Filter;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class SchemaGen {
    public static void main(String[] args) {
//        ICodeGen gen=new BotCodeGen();
        testify(new GmallCodeGen());
    }

    private static void testify(ICodeGen gen) {
        ConfigBuilder conf = gen.getConfigBuilder();

        List<TableInfo> tableInfoList = conf.getTableInfoList();

        tableInfoList.forEach(t -> {
            t.getFields().forEach(f -> {
                System.out.println(f.getName());
            });
        });

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
            System.out.println(table.getFields().size());
        }

        // with template
        Jinjava jinjava = new Jinjava();
        jinjava.getGlobalContext().registerFilter(new ClickHouseTypeFilter());
        for (TableInfo tableInfo : tableInfoList) {
            Map<String, Object> context = Maps.newHashMap();
            context.put("table", tableInfo);
            context.put("flds", tableInfo.getFields());
            String renderedTemplate = jinjava.render(
                    "create table {{table.name}}(\n" +
                            "{% for f in flds %} " +
                            "   {{ f.name }} {{ f|chtype }}" +
                            "{% if not loop.last %}" +
                            ",\n" +
                            "{% endif %}"+
                            "{% endfor %}" +
                            ") engine=MergeTree\n" +
                            "partition by toYYYYMMDD(create_time)\n" +
                            "primary key (id) order by (id);",
                    context);
            System.out.println(renderedTemplate);
            System.out.println();
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

            String typ= fld.getPropertyType();
            return fieldTypes.getOrDefault(typ, "**UNK**");
        }

        @Override
        public String getName() {
            return "chtype";
        }
    }
}

