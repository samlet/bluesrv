package com.bluecc.bluesrv.foo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class BluesrvApplicationTests {
	@Value("${mock.date}")
	String mockDate;

	@Test
	void contextLoads() {
		System.out.println(mockDate);
	}

}
