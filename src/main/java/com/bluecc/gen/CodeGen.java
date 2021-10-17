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
    }

    public void gen() {
        AutoGenerator generator = new AutoGenerator(DATA_SOURCE_CONFIG);
        generator.strategy(strategyConfig().build());
        generator.global(globalConfig().build());
        generator.packageInfo(packageConfig().build());

        generator.execute();
    }

    /**
     * 策略配置
     */
    private StrategyConfig.Builder strategyConfig() {
        return new StrategyConfig.Builder()
                .addInclude("hotel", "addresses",
                        "restaurant", "users");
    }

    /**
     * 全局配置
     */
    private GlobalConfig.Builder globalConfig() {
        return new GlobalConfig.Builder()
                .fileOverride()
                .enableSwagger()
                .outputDir("/opt/gen")
                .author("samlet")
                .disableOpenDir()
                ;
    }

    /**
     * 包配置
     */
    private PackageConfig.Builder packageConfig() {
        return new PackageConfig.Builder()
                .parent("com.bluecc.bluesrv")
                .moduleName("bot")
                ;
    }

    /**
     * 模板配置
     */
    private TemplateConfig.Builder templateConfig() {
        return new TemplateConfig.Builder();
    }
}
