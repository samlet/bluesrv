package com.bluecc.gen;

import com.baomidou.mybatisplus.core.enums.SqlLike;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.po.LikeTable;
import com.baomidou.mybatisplus.generator.config.querys.MySqlQuery;
import com.baomidou.mybatisplus.generator.keywords.MySqlKeyWordsHandler;

import java.sql.SQLException;

/**
 * $ just run gen.CodeGen
 */
public class OfbizCodeGen extends CodeGenBase {
    public final DataSourceConfig dataSourceConfig =
            new DataSourceConfig.Builder("jdbc:mysql://127.0.0.1:3306/ofbiz", "root", "root")
                    .dbQuery(new MySqlQuery())
                    .schema("mybatis-plus")
                    .typeConvert(new MySqlTypeConvert())
                    .keyWordsHandler(new MySqlKeyWordsHandler())
                    .build();

    public static void main(String[] args) throws SQLException {
        new OfbizCodeGen().gen();
        System.out.println("ok.");
    }

    @Override
    public void gen() {
        AutoGenerator generator = getAutoGenerator();
        generator.execute();
    }

    @Override
    public String moduleName() {
        return "ofbiz";
    }


    /**
     * 策略配置
     */
    public StrategyConfig.Builder strategyConfig() {
        return new StrategyConfig.Builder()
                .addInclude("party", "person", "product", "inventory_item", "product_feature",
                        "product_feature_price", "product_feature_type", "product_geo",
                        "product_feature_appl", "product_facility")
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
                .outputDir("/opt/gen/ofbiz")
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
