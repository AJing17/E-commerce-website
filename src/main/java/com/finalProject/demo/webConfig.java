package com.finalProject.demo;


import com.finalProject.demo.jwtInterceptor.BackInterceptor;
import com.finalProject.demo.jwtInterceptor.FrontInterceptor;
import com.finalProject.demo.jwtInterceptor.ManagerPwdInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class webConfig  implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        //前端
        registry.addInterceptor(new FrontInterceptor())//"/**"為攔截全部
                .excludePathPatterns("/member/login","/member/register","/member/logout")
                .excludePathPatterns("/member/forgotpassword","/member/editpassword","/member/updatepassword")
                .addPathPatterns("/cartAll/**","/cart/**","/api/updateCart","/cart/deleteFromCart","/cartOrderDetail","/cartOrderDetail#loaded","/cartFinish","/api/postOrders")
                .addPathPatterns("/member/**")
                .addPathPatterns("/shop/addToCart");

        //後端
        registry.addInterceptor(new BackInterceptor())//後台
                .excludePathPatterns("/Back/manager/login","/Back/manager/logout")
                .addPathPatterns("/Back/**");
        //因為url的關係:沒有攔金流跟物流頁面

        //忘記密碼
        registry.addInterceptor(new ManagerPwdInterceptor())
                .addPathPatterns("Manager/Reset/password");
    }
}
