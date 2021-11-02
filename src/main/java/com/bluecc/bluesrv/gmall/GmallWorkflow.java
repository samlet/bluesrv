package com.bluecc.bluesrv.gmall;

import com.bluecc.bluesrv.gmall.entity.WareSku;
import com.bluecc.bluesrv.gmall.extension.ReceiveSku;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.camunda.bpm.client.ExternalTaskClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
@Slf4j
public class GmallWorkflow {
    @Autowired
    ReceiveSku receiveSku;
    ObjectMapper mapper = new ObjectMapper();

    public void subscribe() {
        ExternalTaskClient client = ExternalTaskClient.create()
                .baseUrl("http://localhost:8080/engine-rest")
                .asyncResponseTimeout(10000) // 长轮询超时时间
                .build();

        client.subscribe("receive-sku")
                .lockDuration(1000) // 默认锁定时间为20秒，这里修改为1秒
                .handler((externalTask, externalTaskService) -> {
                    Map<String, Object> dataMap = externalTask.getVariable("sku");
                    log.info("Receive sku as string {}", dataMap);
//                    ReceiveSku.ReceiveSkuData item = externalTask.getVariable("sku");
                    ReceiveSku.ReceiveSkuData item = mapper.convertValue(dataMap, ReceiveSku.ReceiveSkuData.class);
                    log.info("Converted sku {}", item);
                    WareSku rec = receiveSku.process(item);
                    log.info("Update result: {}", rec);

                    // 完成任务
                    externalTaskService.complete(externalTask);
                })
                .open();
    }
}

/*
POST http://localhost:8080/engine-rest/process-definition/key/receive-sku/start
    {
        "variables": {
            "sku": {
                "value": {
                                "skuId": 1,
                                "warehouseId": 2,
                                "quantity": 18
                            }
            }
        }
    }

 */