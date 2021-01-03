package com.team.marketd;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.team.marketd.interceptor.AuthInterceptor;
import com.team.marketd.interceptor.LoginCheck;
import com.team.marketd.interceptor.LoginInterceptor;


@EnableWebMvc
@Configuration
public class SecurityConfig implements WebMvcConfigurer {//extends WebMvcConfigurerAdapter 
	@Bean
    public LoginInterceptor loginSuccessHandler(){
    	return new LoginInterceptor();
    }
	@Bean
    public AuthInterceptor loginSuccessHandler2(){
    	return new AuthInterceptor();
    }
	@Autowired
    private LoginInterceptor loginInterceptor2; //post
	
	@Autowired
	private AuthInterceptor loginInterceptor1; //pre
	
	@Autowired
	private LoginCheck loginCheck; //pre

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	
    	registry.addInterceptor(loginCheck)
        .addPathPatterns("/Needlogin/**");

       registry.addInterceptor(loginInterceptor1)
         .addPathPatterns("/login.dobby");
        registry.addInterceptor(loginInterceptor2)
        .addPathPatterns("/loginAction.dobby");
}
}
    
    
