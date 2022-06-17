package com.yedam.myserver.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAdvice {
	@Pointcut("execution(* com.yedam..*Impl.*(..))")
	public void allpointcut() {
		
	}
	@Before("LogAdvice.allpointcut()")//매겨 변수 읽어옮  //이형식으로 하면 위에 포인트 컷 따로 안들만어줘도 됨 
		public void printLog(JoinPoint jp) {
		String name = jp.getSignature().getName(); // 조인포인트 이름
		String arg = jp.getArgs() != null && jp.getArgs().length>0 ? jp.getArgs()[0].toString() : ""; // 조인포인트 argument
		System.out.println("[before] 로그 출력:" + name + ":" + arg);
	}

}
