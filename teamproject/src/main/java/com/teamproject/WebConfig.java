package com.teamproject;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/img/**")
		.addResourceLocations("file:///D:/kdigital/workspace_spring/teamproject/teamproject/img/");
		
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///C:/kdigital/worksapce_spring/teamproject/img/");
	}
}

