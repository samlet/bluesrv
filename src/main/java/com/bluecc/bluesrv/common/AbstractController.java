package com.bluecc.bluesrv.common;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AbstractController {
    protected  <T> QueryWrapper<T> convertQueryWrapper(PageQueryData queryData) {
        QueryWrapper<T> wrapper = new QueryWrapper<T>();
        queryData.getConditions().forEach(c -> {
            switch (c.getOp()){
                case "eq": wrapper.eq(c.getColumn(), c.getVal()); break;
                case "ne": wrapper.ne(c.getColumn(), c.getVal()); break;
                case "gt": wrapper.gt(c.getColumn(), c.getVal()); break;
                case "lt": wrapper.lt(c.getColumn(), c.getVal()); break;
                default:
                    // skip
                    log.warn("ignore condition {}", c.getOp());
            }
        });
        return wrapper;
    }

}
