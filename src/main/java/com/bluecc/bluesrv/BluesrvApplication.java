package com.bluecc.bluesrv;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.bluecc.bluesrv.mapper")
public class BluesrvApplication {

	public static void main(String[] args) {
		SpringApplication.run(BluesrvApplication.class, args);
	}

}
