package com.bluecc.gen;

import com.beust.jcommander.internal.Lists;
import lombok.Builder;
import lombok.Data;

import java.util.List;

public class GenTypes {
    @Data
    public static class SqlTable{
        String name;
        List<SqlField> fields= Lists.newArrayList();
    }

    @Data
    @Builder
    public static class SqlField{
        String name;
        String sqlType;
        String flinkType;
    }
}

