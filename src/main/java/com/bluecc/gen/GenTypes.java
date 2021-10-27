package com.bluecc.gen;

import com.beust.jcommander.internal.Lists;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

public class GenTypes {
    @Data
    @Builder
    public static class SqlTable{
        String name;
        String module;
        String entityName;
        String serviceName;
        String serviceVar;
        String controllerName;
        List<SqlField> fields;
    }

    @Data
    @Builder
    public static class SqlField{
        String name;
        String sqlType;
        String flinkType;

        String propertyName;
        String propertyType;
        String beanType;
    }
}

