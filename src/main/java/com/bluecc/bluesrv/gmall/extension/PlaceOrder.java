package com.bluecc.bluesrv.gmall.extension;

import com.bluecc.bluesrv.gmall.entity.OrderDetail;
import com.bluecc.bluesrv.gmall.entity.OrderInfo;
import com.bluecc.workflow.IProcessor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Slf4j
public class PlaceOrder implements IProcessor<PlaceOrder.OrderData, OrderInfo> {
    @Override
    public OrderInfo process(OrderData input) {

        return null;
    }

    @Data
    public static class OrderData{
        OrderInfo orderInfo;
        List<OrderDetail> orderItems;
    }
}
