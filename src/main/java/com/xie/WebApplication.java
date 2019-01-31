package com.xie;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableAspectJAutoProxy
@EnableCaching
public class WebApplication extends SpringBootServletInitializer {
    public static void main(String[] args){
        ConfigurableApplicationContext context = SpringApplication.run(WebApplication.class);
        CacheTest cacheTest = context.getBean(CacheTest.class);
        System.out.println("第一次调用getValue="+cacheTest.getValue("dd"));
        System.out.println("第二次调用getValue="+cacheTest.getValue("dd"));
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(WebApplication.class);
    }
}
