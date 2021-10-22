package com.bluecc.bluesrv.gmall.service.impl;

import com.bluecc.bluesrv.gmall.entity.WareSku;
import com.bluecc.bluesrv.gmall.mapper.WareSkuMapper;
import com.bluecc.bluesrv.gmall.service.IWareSkuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * sku与仓库关联表 服务实现类
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@Service
public class WareSkuServiceImpl extends ServiceImpl<WareSkuMapper, WareSku> implements IWareSkuService {

}
