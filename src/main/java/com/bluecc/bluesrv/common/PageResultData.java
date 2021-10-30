package com.bluecc.bluesrv.common;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class PageResultData<T> {
    PageQueryData meta;
    List<T> records;
}

