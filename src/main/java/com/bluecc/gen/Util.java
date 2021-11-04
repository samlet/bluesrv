package com.bluecc.gen;

import com.google.common.base.CaseFormat;

import java.util.Arrays;

public class Util {
    public static String arrayAwareToString(Object o) {
        final String arrayString = Arrays.deepToString(new Object[] {o});
        return arrayString.substring(1, arrayString.length() - 1);
    }

    public static String snakeToCamel(String str){
        return CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, str);
    }

    public static String toSnakecase(String str){
        return CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, str);
    }

    public static String toVarName(String str){
        return CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_CAMEL, str);
    }
}
