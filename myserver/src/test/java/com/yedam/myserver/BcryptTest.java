package com.yedam.myserver;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BcryptTest {
	
	@Test
	public void test() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
		String result = encoder.encode("1111");
		System.out.println(result);
		assertTrue(encoder.matches("1234", result));
	}

}
