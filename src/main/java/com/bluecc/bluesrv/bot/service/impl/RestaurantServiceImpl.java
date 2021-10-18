package com.bluecc.bluesrv.bot.service.impl;

import com.bluecc.bluesrv.bot.entity.Restaurant;
import com.bluecc.bluesrv.bot.mapper.RestaurantMapper;
import com.bluecc.bluesrv.bot.service.IRestaurantService;
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
public class RestaurantServiceImpl extends ServiceImpl<RestaurantMapper, Restaurant> implements IRestaurantService {

}
