package com.bluecc.bluesrv.bot.service.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bluecc.bluesrv.bot.entity.Users;
import com.bluecc.bluesrv.bot.mapper.UsersMapper;
import com.bluecc.bluesrv.bot.service.IUsersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

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

//    @Override
//    public List<Users> selectUserPage(IPage<Users> page, QueryWrapper<Users> wrapper) {
//        return baseMapper.selectUsersPage(page, wrapper);
//    }
public IPage<Users> selectUserPage(Page<Users> page, Integer state) {
    // 不进行 count sql 优化，解决 MP 无法自动优化 SQL 问题，这时候你需要自己查询 count 部分
    // page.setOptimizeCountSql(false);
    // 当 total 为小于 0 或者设置 setSearchCount(false) 分页插件不会进行 count 查询
    // 要点!! 分页返回的对象与传入的对象是同一个
    return baseMapper.selectPageVo(page, state);
}
}
