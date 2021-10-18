package com.bluecc.bluesrv.bot.service.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.bluecc.bluesrv.bot.entity.Users;
import com.bluecc.bluesrv.bot.mapper.UsersMapper;
import com.bluecc.bluesrv.bot.service.IUsersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author samlet
 * @since 2021-10-17
 */
@Service
@DS("bot")
public class UsersServiceImpl extends ServiceImpl<UsersMapper, Users> implements IUsersService {

}
