package com.it15301;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.it15301.interceptors.Authenticateceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
	@Autowired
	private Authenticateceptor authenInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authenInterceptor)
		.addPathPatterns("admin/**","/admin/users","/admin/product","/admin/category","shopping-cart/**","/user/listproduct","/users/**")
				.excludePathPatterns("/login", "/register","/auth/dang_ky");
	}
}
