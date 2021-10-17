package com.bluecc.gen;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.engine.VelocityTemplateEngine;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.bluecc.gen.CodeGen.DATA_SOURCE_CONFIG;

public class SchemaGen {
    public static void main(String[] args) {
        CodeGen gen=new CodeGen();
        ConfigBuilder conf=new ConfigBuilder(gen.packageConfig().build(),
                DATA_SOURCE_CONFIG,
                gen.strategyConfig().build(),
                gen.templateConfig().build(),
                gen.globalConfig().build(),
                null);

        List<TableInfo> tableInfoList= conf.getTableInfoList();
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
            System.out.println("fields: "+tableInfo.getFields()
                    .stream().map(f -> f.getName())
                    .collect(Collectors.joining(", ")));
//            System.out.println("keys: "+objectMap.keySet());
            TableInfo table = (TableInfo) objectMap.get("table");
            System.out.println(table.getFields().size());
        }

    }
}
