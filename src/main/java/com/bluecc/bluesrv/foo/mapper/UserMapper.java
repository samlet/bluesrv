package com.bluecc.bluesrv.foo.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bluecc.bluesrv.foo.bean.User;


@DS("master")
public interface UserMapper extends BaseMapper<User> {

}
