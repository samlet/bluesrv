package com.bluecc.workflow;

import com.bluecc.bluesrv.gmall.extension.ReceiveSku;
import org.camunda.bpm.client.ExternalTaskClient;

import java.util.logging.Logger;

/*
curl -H "Content-Type: application/json" -X POST \
    -d '{"variables": {"amount": {"value":555,"type":"long"}, "item": {"value":"item-xyz"} } }' \
    http://localhost:8080/engine-rest/process-definition/key/payment-retrieval/start
 */
public class ChargeCardWorker {
    private final static Logger LOGGER = Logger.getLogger(ChargeCardWorker.class.getName());

    public static void main(String[] args) {
        ExternalTaskClient client = ExternalTaskClient.create()
                .baseUrl("http://localhost:8080/engine-rest")
                .asyncResponseTimeout(10000) // 长轮询超时时间
                .build();

        // 订阅指定的外部任务
        client.subscribe("charge-card")
                .lockDuration(1000) // 默认锁定时间为20秒，这里修改为1秒
                .handler((externalTask, externalTaskService) -> {
                    // 获取流程变量
                    String item = externalTask.getVariable("item");
                    Long amount = externalTask.getVariable("amount");

                    LOGGER.info("Charging credit card with an amount of '" + amount + "'€ for the item '" + item + "'...");
                    // 完成任务
                    externalTaskService.complete(externalTask);
                })
                .open();


    }
}

