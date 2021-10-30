package com.bluecc.gen;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.converts.ClickHouseTypeConvert;
import com.baomidou.mybatisplus.generator.config.querys.ClickHouseQuery;
import com.baomidou.mybatisplus.generator.keywords.MySqlKeyWordsHandler;

import java.sql.SQLException;

/**
 * $ just run gen.CodeGen
 */
public class FactsCodeGen extends CodeGenBase {
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
        new FactsCodeGen().gen();
        System.out.println("ok.");
    }

    @Override
    public void gen() {
        AutoGenerator generator = getAutoGenerator();
        generator.execute();
    }

    @Override
    public String moduleName() {
        return "facts";
    }


    /**
     * 策略配置
     */
    public StrategyConfig.Builder strategyConfig() {
        return new StrategyConfig.Builder()
                .addInclude("opensky", "trips", "ontime", // 旅行: flightlist(航空), ontime(航空), nyc-taxi(出租)
                        "uk_price_paid", // 房地产: uk-property
                        "visits_v1", "hits_v1",  // 网站: visits
                        "cell_towers"   // 电信: cell-towers
                        )
                // user_behavior, taxi
//                .addInclude("customer", "lineorder", "part", "supplier")
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
                .outputDir("/opt/gen/"+moduleName())
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
