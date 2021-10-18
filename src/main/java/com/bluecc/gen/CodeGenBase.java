package com.bluecc.gen;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;

import java.security.cert.CertPathBuilder;

public abstract class CodeGenBase implements ICodeGen {

    public AutoGenerator getAutoGenerator() {
        AutoGenerator generator = new AutoGenerator(getDataSourceConfig());
        generator.strategy(strategyConfig().build());
        generator.global(globalConfig().build());
        generator.packageInfo(packageConfig().build());
        return generator;
    }

    protected abstract StrategyConfig.Builder strategyConfig();
    public abstract GlobalConfig.Builder globalConfig();
    public abstract PackageConfig.Builder packageConfig();
    public abstract DataSourceConfig getDataSourceConfig();
    /**
     * 模板配置
     */
    protected TemplateConfig.Builder templateConfig() {
        return new TemplateConfig.Builder();
    }
    @Override
    public ConfigBuilder getConfigBuilder() {
        return new ConfigBuilder(packageConfig().build(),
                this.getDataSourceConfig(),
                this.strategyConfig().build(),
                this.templateConfig().build(),
                this.globalConfig().build(),
                null);
    }
}
