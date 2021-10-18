package com.bluecc.bluesrv.foo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan({"com.bluecc.bluesrv.foo.mapper"})
public class BluesrvApplication {
	public static void main(String[] args) {
		SpringApplication.run(BluesrvApplication.class, args);
	}

}
