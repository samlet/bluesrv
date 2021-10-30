package com.bluecc.bluesrv.bot.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bluecc.bluesrv.bot.entity.Users;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author samlet
 * @since 2021-10-17
 */
public interface IUsersService extends IService<Users> {

//    List<Users> selectUserPage(IPage<Users> page, QueryWrapper<Users> wrapper);
IPage<Users> selectUserPage(Page<Users> page, Integer state);
}
