package com.yedam.myserver.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.yedam.myserver.users.vo.UserVO;


//로그인 처리  후 -> handler로 옴 ( 추가작업 ,session ) -> 페이지 포워드 
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		String name = authentication.getName(); //getName 유저 아이디
		UserVO vo =(UserVO)authentication.getPrincipal();
		request.getSession().setAttribute("suser", vo);
		logger.info("handler====" + name);
		response.sendRedirect("top.jsp");
	}

	
}
