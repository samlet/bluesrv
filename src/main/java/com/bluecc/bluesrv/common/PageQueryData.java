package com.bluecc.bluesrv.common;

import lombok.Data;

import java.util.List;

@Data
public class PageQueryData {
    long pageNo;
    long pageSize;
    long totalPages;

    List<Condition> conditions;

    @Data
    public static class Condition{
        String op;
        String column;
        String val;
    }
}
