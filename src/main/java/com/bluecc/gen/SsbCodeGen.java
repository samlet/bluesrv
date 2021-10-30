package com.bluecc.gen;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.converts.ClickHouseTypeConvert;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.querys.ClickHouseQuery;
import com.baomidou.mybatisplus.generator.config.querys.MySqlQuery;
import com.baomidou.mybatisplus.generator.keywords.MySqlKeyWordsHandler;

import java.sql.SQLException;

/**
 * $ just run gen.CodeGen
 */
public class SsbCodeGen extends CodeGenBase {
    public final DataSourceConfig dataSourceConfig =
            new DataSourceConfig.Builder("jdbc:clickhouse://localhost:8123/default",
                    "default",
                    "")
                    .dbQuery(new ClickHouseQuery())
                    .schema("default")
                    .typeConvert(new ClickHouseTypeConvert())
                    .keyWordsHandler(new MySqlKeyWordsHandler())
                    .build();

    public static void main(String[] args) throws SQLException {
        new SsbCodeGen().gen();
        System.out.println("ok.");
    }

    @Override
    public void gen() {
        AutoGenerator generator = getAutoGenerator();
        generator.execute();
    }

    @Override
    public String moduleName() {
        return "ssb";
    }


    /**
     * 策略配置
     */
    public StrategyConfig.Builder strategyConfig() {
        return new StrategyConfig.Builder()
                .addInclude("customer", "lineorder", "part", "supplier")
//                .likeTable(new LikeTable("party", SqlLike.RIGHT))
//                .likeTable(new LikeTable("person", SqlLike.RIGHT))
                ;
    }

    /**
     * 全局配置
     */
    public GlobalConfig.Builder globalConfig() {
        return new GlobalConfig.Builder()
//                .fileOverride()
                .enableSwagger()
                .outputDir("/opt/gen/ssb")
                .author("samlet")
                .disableOpenDir();
    }

    /**
     * 包配置
     */
    public PackageConfig.Builder packageConfig() {
        return new PackageConfig.Builder()
                .parent("com.bluecc.bluesrv")
                .moduleName(moduleName());
    }

    @Override
    public DataSourceConfig getDataSourceConfig() {
        return dataSourceConfig;
    }

}
