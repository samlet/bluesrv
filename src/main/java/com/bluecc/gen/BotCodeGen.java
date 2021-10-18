package com.bluecc.gen;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.querys.MySqlQuery;
import com.baomidou.mybatisplus.generator.keywords.MySqlKeyWordsHandler;

import java.sql.SQLException;

/**
 * $ just run gen.CodeGen
 */
public class BotCodeGen implements ICodeGen {
    public final DataSourceConfig dataSourceConfig =
            new DataSourceConfig.Builder("jdbc:mysql://127.0.0.1:3306/bot", "root", "root")
                    .dbQuery(new MySqlQuery())
                    .schema("mybatis-plus")
                    .typeConvert(new MySqlTypeConvert())
                    .keyWordsHandler(new MySqlKeyWordsHandler())
                    .build();

    @Override
    public  ConfigBuilder getConfigBuilder() {
        ConfigBuilder conf=new ConfigBuilder(packageConfig().build(),
                this.dataSourceConfig,
                this.strategyConfig().build(),
                this.templateConfig().build(),
                this.globalConfig().build(),
                null);
        return conf;
    }

    public static void main(String[] args) throws SQLException {
        new BotCodeGen().gen();
        System.out.println("ok.");
    }

    @Override
    public void gen() {
        AutoGenerator generator = getAutoGenerator();
        generator.execute();
    }

    public AutoGenerator getAutoGenerator() {
        AutoGenerator generator = new AutoGenerator(dataSourceConfig);
        generator.strategy(strategyConfig().build());
        generator.global(globalConfig().build());
        generator.packageInfo(packageConfig().build());
        return generator;
    }

    /**
     * 策略配置
     */
    public StrategyConfig.Builder strategyConfig() {
        return new StrategyConfig.Builder()
                .addInclude("hotel", "addresses",
                        "restaurant", "users");
    }

    /**
     * 全局配置
     */
    public GlobalConfig.Builder globalConfig() {
        return new GlobalConfig.Builder()
//                .fileOverride()
                .enableSwagger()
                .outputDir("/opt/gen")
                .author("samlet")
                .disableOpenDir();
    }

    /**
     * 包配置
     */
    public PackageConfig.Builder packageConfig() {
        return new PackageConfig.Builder()
                .parent("com.bluecc.bluesrv")
                .moduleName("bot");
    }

    /**
     * 模板配置
     */
    TemplateConfig.Builder templateConfig() {
        return new TemplateConfig.Builder();
    }
}
