package com.bluecc.gen;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.querys.MySqlQuery;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.keywords.MySqlKeyWordsHandler;

import java.sql.SQLException;

/**
 * $ just run gen.CodeGen
 */
public class CodeGen {
    public static final DataSourceConfig DATA_SOURCE_CONFIG =
            new DataSourceConfig.Builder("jdbc:mysql://127.0.0.1:3306/bot", "root", "root")
                    .dbQuery(new MySqlQuery())
                    .schema("mybatis-plus")
                    .typeConvert(new MySqlTypeConvert())
                    .keyWordsHandler(new MySqlKeyWordsHandler())
                    .build();

    public static void main(String[] args) throws SQLException {
        new CodeGen().gen();
        System.out.println("ok.");
    }

    public void gen() {
        AutoGenerator generator = getAutoGenerator();

        generator.execute();
    }

    public AutoGenerator getAutoGenerator() {
        AutoGenerator generator = new AutoGenerator(DATA_SOURCE_CONFIG);
        generator.strategy(strategyConfig().build());
        generator.global(globalConfig().build());
        generator.packageInfo(packageConfig().build());
        return generator;
    }

    /**
     * 策略配置
     */
    StrategyConfig.Builder strategyConfig() {
        return new StrategyConfig.Builder()
                .addInclude("hotel", "addresses",
                        "restaurant", "users");
    }

    /**
     * 全局配置
     */
    GlobalConfig.Builder globalConfig() {
        return new GlobalConfig.Builder()
//                .fileOverride()
                .enableSwagger()
                .outputDir("/opt/gen")
                .author("samlet")
                .disableOpenDir()
                ;
    }

    /**
     * 包配置
     */
    PackageConfig.Builder packageConfig() {
        return new PackageConfig.Builder()
                .parent("com.bluecc.bluesrv")
                .moduleName("bot")
                ;
    }

    /**
     * 模板配置
     */
    TemplateConfig.Builder templateConfig() {
        return new TemplateConfig.Builder();
    }
}
