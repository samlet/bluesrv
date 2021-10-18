package com.bluecc.bluesrv.bot;

import com.baomidou.dynamic.datasource.annotation.DS;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan({"com.bluecc.bluesrv.bot.mapper"})
public class BotApp {
	public static void main(String[] args) {
		SpringApplication.run(BotApp.class, args);
	}

}
