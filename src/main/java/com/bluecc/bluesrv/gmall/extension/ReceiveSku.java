package com.bluecc.bluesrv.gmall.extension;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.bluecc.bluesrv.gmall.entity.WareSku;
import com.bluecc.bluesrv.gmall.mapper.WareSkuMapper;
import com.bluecc.workflow.IProcessor;
import com.github.javafaker.Faker;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Locale;

@Component
@Slf4j
public class ReceiveSku implements IProcessor<ReceiveSku.ReceiveSkuData, WareSku> {
    @Autowired
    private WareSkuMapper wareSkuMapper;
    Faker usFaker = new Faker(new Locale("en-US"));

    @Override
    public WareSku process(ReceiveSkuData input) {
        QueryWrapper<WareSku> wrapper = new QueryWrapper<>();
        wrapper.eq("warehouse_id", input.warehouseId)
                .eq("sku_id", input.skuId);
        WareSku rec=wareSkuMapper.selectOne(wrapper);
        if(rec==null){
            rec=new WareSku();
            rec.setWarehouseId(input.warehouseId);
            rec.setSkuId(input.getSkuId());
            rec.setStock(input.quantity);
            // faker
            rec.setStockName(usFaker.lorem().word());
            wareSkuMapper.insert(rec);
        }else {
            rec.setStock(rec.getStock() + input.getQuantity());
            wareSkuMapper.updateById(rec);
        }

        return rec;
    }

    @Data
    public static class ReceiveSkuData{
        long skuId;
        long warehouseId;
        int quantity;
    }
}
