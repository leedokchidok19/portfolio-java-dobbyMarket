package com.team.marketd;



import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;


@EnableWebMvc
@ComponentScan(basePackages= {"com.team.marketd.controller"})//스캔범위
public class ServletConfig implements WebMvcConfigurer { //구현받아서
	//완성된거라서 빨간줄이 안 떳다 구현하라고, 재정의 가능함
	@Override//오버라이딩을 안 했다 타이핑 ㄴㄴ 직접 인터페이스 들어가서 복사 붙여넣기 하자
	public void configureViewResolvers(ViewResolverRegistry registry) { //Registry : 등록소 
	
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/");
		bean.setSuffix(".jsp");
		registry.viewResolver(bean);
	}
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}	
	@Bean//파일 업로드 준비
	public MultipartResolver multipartResolver() {
		StandardServletMultipartResolver resolver
		= new StandardServletMultipartResolver();
		return resolver;
	}
		
}
