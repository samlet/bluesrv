package com.bluecc.bluesrv.gmall.service.impl;

import com.bluecc.bluesrv.gmall.entity.CartInfo;
import com.bluecc.bluesrv.gmall.mapper.CartInfoMapper;
import com.bluecc.bluesrv.gmall.service.ICartInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 购物车表 用户登录系统时更新冗余 服务实现类
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@Service
public class CartInfoServiceImpl extends ServiceImpl<CartInfoMapper, CartInfo> implements ICartInfoService {

}
