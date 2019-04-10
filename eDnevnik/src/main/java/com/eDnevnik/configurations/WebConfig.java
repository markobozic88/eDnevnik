package com.eDnevnik.configurations;

import com.eDnevnik.servlets.HelloCountryServlet;
import com.eDnevnik.servlets.HelloStateServlet;
import javax.servlet.http.HttpServlet;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    
    @Override
    public void addViewControllers(ViewControllerRegistry registry){
        
        registry.addViewController("/eDnevnik").setViewName("login");
        
    }
    
    
    
    
    
    
    
    
//    
//    @Bean
//    public ServletRegistrationBean<HttpServlet> countrySrvlet(){
//        ServletRegistrationBean<HttpServlet> servRegBean = new ServletRegistrationBean<>();
//        servRegBean.setServlet(new HelloCountryServlet());
//        servRegBean.addUrlMappings("/country/*");
//        servRegBean.setLoadOnStartup(1);
//        return servRegBean;
//    }
//    
//    @Bean
//    public ServletRegistrationBean<HttpServlet> stateServlet(){
//        ServletRegistrationBean<HttpServlet> servRegBean = new ServletRegistrationBean<>();
//        servRegBean.setServlet(new HelloStateServlet());
//        servRegBean.addUrlMappings("/state/*");
//        servRegBean.setLoadOnStartup(1);
//        return servRegBean;
//    }
}
