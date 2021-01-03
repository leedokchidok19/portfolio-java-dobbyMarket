package com.team.marketd.interceptor;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.team.marketd.domain.MemberVo;
import com.team.marketd.service.MemberService;

@Component
public class LoginCheck extends HandlerInterceptorAdapter {
		
	@Autowired
	MemberService ms;
	
	 @Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception{
		 System.out.println("interceptor 들어옴?");
		 HttpSession session = request.getSession();	
		 if(session.getAttribute("midx") == null){			
			 
				 response.sendRedirect(request.getContextPath()+"/login2.dobby");
				 return false;
			 }
			 
		 return true;		
	 	}
	
}