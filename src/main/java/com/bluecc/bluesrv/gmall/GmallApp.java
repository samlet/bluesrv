package com.bluecc.bluesrv.gmall;

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
	public static void main(String[] args) {
		ConfigurableApplicationContext context = SpringApplication.run(GmallApp.class, args);
		System.out.println(".. connect workflow center");
		GmallWorkflow workflow=context.getBean(GmallWorkflow.class);
		workflow.subscribe();
		System.out.println(".. all done.");
	}

}
