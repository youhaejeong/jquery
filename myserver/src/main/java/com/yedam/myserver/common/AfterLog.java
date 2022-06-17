package com.yedam.myserver.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component  // 
@Aspect
public class AfterLog {
	@AfterReturning(pointcut ="LogAdvice.allpointcut()" ,returning = "obj")//서비스 실행후 리턴값을 받아서 리턴값을 출력?
	public void printLog(JoinPoint jp, Object obj) {
		String name = jp.getSignature().getName();
		System.out.println("[after] 로그:" + name);
		System.out.println(obj);
	}
}
