package com.bluecc.bluesrv.gmall;

import com.bluecc.bluesrv.gmall.extension.ReceiveSku;
import lombok.extern.slf4j.Slf4j;
import org.camunda.bpm.client.ExternalTaskClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class GmallWorkflow {
    @Autowired
    ReceiveSku receiveSku;

    public void subscribe(){
        ExternalTaskClient client = ExternalTaskClient.create()
                .baseUrl("http://localhost:8080/engine-rest")
                .asyncResponseTimeout(10000) // 长轮询超时时间
                .build();

        client.subscribe("receive-sku")
                .lockDuration(1000) // 默认锁定时间为20秒，这里修改为1秒
                .handler((externalTask, externalTaskService) -> {
                    ReceiveSku.ReceiveSkuData item = externalTask.getVariable("sku");
                    log.info("Receive sku {}", item);
                    // 完成任务
                    externalTaskService.complete(externalTask);
                })
                .open();
    }
}
