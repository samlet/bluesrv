package com.bluecc.bluesrv.gmall;

import com.beust.jcommander.JCommander;
import com.beust.jcommander.Parameter;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

/*
$ just app gmall.GmallApp
 */

@SpringBootApplication
@MapperScan({"com.bluecc.bluesrv.gmall.mapper"})
public class GmallApp {
    @Parameter(names = {"--workflow", "-w"})
    boolean startWorkflow;

    public static void main(String[] args) {
        GmallApp main = new GmallApp();
        JCommander.newBuilder()
                .addObject(main)
                .build()
                .parse(args);

        ConfigurableApplicationContext context = SpringApplication.run(GmallApp.class, args);

        if (main.startWorkflow) {
            System.out.println(".. connect workflow center");
            GmallWorkflow workflow = context.getBean(GmallWorkflow.class);
            workflow.subscribe();
            System.out.println(".. all done.");
        }
    }

}
