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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.team.marketd.service.MemberService;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	MemberService ms;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,Object handler,ModelAndView modelAndView) throws Exception{
	 Object midx = modelAndView.getModel().get("midx"); // object타占쏙옙占쏙옙 null占쏙옙 占쏟교몌옙 占쏙옙 占쏙옙 占쌍댐옙
	 System.out.println("midx:?"+midx);
	 
	 System.out.println("占쏙옙占쏙옙占쏙옙占� 占쏙옙占쏙옙");
	 //占쏙옙占썩서 占쏙옙占쏙옙
	 int midxx = (int)midx;	//keepLogin占쏙옙占쏙옙 int타占쏙옙占쏙옙 占쏙옙占쏙옙占쌍깍옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙환占쏙옙 占쏙옙占�

	 //modelAndView.getModelMap().get()占쏙옙 占쏙옙체 占쏙옙占쏙옙占쏙옙
	 
	 if(midx != null){
		 
		 if(request.getParameter("useCookie")!=null) {		
			 if (request.getParameter("useCookie").equals("on") ) {		
			 	System.out.println("占쏙옙占쏙옙2?");
			 Cookie useCookie = new Cookie("useCookie",request.getSession().getId());	
			 System.out.println("cookie:"+useCookie.getValue());
			 useCookie.setPath("/");
			 useCookie.setMaxAge(60*60*24*7);				 
			 response.addCookie(useCookie);	
			 
			 Calendar cal = Calendar.getInstance();
			 cal.setTime(new Date());
			 cal.add(Calendar.DATE, 7);
			 DateFormat df1 = new SimpleDateFormat("yy-MM-dd");   
			 String sessionLimit = df1.format(cal.getTime());
			 
			 ms.keepLogin(midxx, useCookie.getValue(), sessionLimit);	
		  }
		 }
	 }
		}
	 @Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception{

		 HttpSession session = request.getSession();	
		 
		 if(session.getAttribute("midx") != null){
			 session.removeAttribute("midx");
		 }
		 
		 return true;		
	 	}
	 }
