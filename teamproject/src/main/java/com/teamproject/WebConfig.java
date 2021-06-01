package com.teamproject;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //현재 클래스 설정 모든 결과 xml파일 <bean
//@ComponentScan-<context;component-scan.대신)
public class WebConfig implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/img/**")
		.addResourceLocations("file:///D:/kdigital/workspace_spring/teamproject/teamproject/img/");
	}
}

