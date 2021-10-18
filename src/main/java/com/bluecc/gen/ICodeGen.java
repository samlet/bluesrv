package com.bluecc.gen;

import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;

public interface ICodeGen {
    ConfigBuilder getConfigBuilder();

    void gen();
}
