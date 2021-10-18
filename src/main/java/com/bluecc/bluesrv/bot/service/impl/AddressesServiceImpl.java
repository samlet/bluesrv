package com.bluecc.bluesrv.bot.service.impl;

import com.bluecc.bluesrv.bot.entity.Addresses;
import com.bluecc.bluesrv.bot.mapper.AddressesMapper;
import com.bluecc.bluesrv.bot.service.IAddressesService;
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
public class AddressesServiceImpl extends ServiceImpl<AddressesMapper, Addresses> implements IAddressesService {

}
