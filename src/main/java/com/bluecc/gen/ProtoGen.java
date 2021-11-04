package com.bluecc.gen;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.config.TemplateType;
import com.baomidou.mybatisplus.generator.fill.Column;
import com.baomidou.mybatisplus.generator.fill.Property;
import com.bluecc.bluesrv.common.BaseEntity;

import java.util.Collections;

import static com.bluecc.gen.OfbizCodeGen.entityList;

/*
$ just run gen.ProtoGen
 */
public class ProtoGen {
    public static void main(String[] args) {
        gen();
        System.exit(0);
    }
    public static void gen() {
        FastAutoGenerator.create("jdbc:mysql://127.0.0.1:3306/order_proto",
                        "root", "root")
                .globalConfig(builder -> {
                    builder.author("samlet") // 设置作者
                            .enableSwagger() // 开启 swagger 模式
                            .fileOverride() // 覆盖已生成文件
                            .disableOpenDir()
                            .outputDir("/opt/asset/order_proto/src/main/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("com.bluecc.bluesrv") // 设置父包名
                            .moduleName("ecomm"); // 设置父包模块名
//                            .pathInfo(Collections.singletonMap(OutputFile.mapperXml, "D://")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude(entityList())
                            .entityBuilder().enableLombok()
                            .superClass(BaseEntity.class)
                            .addSuperEntityColumns("last_updated_stamp", "last_updated_tx_stamp", "created_stamp", "created_tx_stamp")
                            .addTableFills(new Column("created_stamp", FieldFill.INSERT),
                                    new Property("createdDate", FieldFill.INSERT))
                            .addTableFills(new Column("last_updated_stamp", FieldFill.INSERT_UPDATE))
                            .enableChainModel()
                            .formatFileName("%sEntity")
                            .idType(IdType.ASSIGN_ID);
//                            .addTablePrefix("t_", "c_"); // 设置过滤表前缀
                })
                .templateConfig(builder -> {
                    builder.disable(TemplateType.CONTROLLER);
                })
//                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();

    }
}
