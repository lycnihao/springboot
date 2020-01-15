package com.couldr.app.config;

import com.couldr.app.web.filter.CorsFilter;
import com.couldr.app.web.interceptor.ApiInterceptor;
import com.couldr.app.web.interceptor.AdminInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private ApiInterceptor apiInterceptor;

    @Autowired
    private AdminInterceptor adminInterceptor;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
        registry.addResourceHandler("/upload/**")
                .addResourceLocations("file:///" + System.getProperties().getProperty("user.home") + "/couldr/upload/");
        registry.addResourceHandler("/templates/**")
                .addResourceLocations("classpath:/templates/");
    }

    /**
     * 注册拦截器
     *
     * @param registry registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        /**
         * api接口拦截器
         */
        registry.addInterceptor(apiInterceptor)
            .addPathPatterns("/api/user/**")
            .addPathPatterns("/api/cate/**")
            .addPathPatterns("/api/webSite/**")
            .addPathPatterns("/oauth/callback")
            .excludePathPatterns("/api/webSite/list")
            .excludePathPatterns("/api/webSite/recommend")
            .excludePathPatterns("/api/webSite/recommend/r")
            .excludePathPatterns("/api/user/login")
            .excludePathPatterns("/api/user/register")
            .excludePathPatterns("/api/user/fail");
        /**
         * 后台管理拦截器
         */
        registry.addInterceptor(adminInterceptor)
            .addPathPatterns("/admin/**")
            .excludePathPatterns("/admin/login")
            .excludePathPatterns("/admin/getLogin")
            .excludePathPatterns("/static/**");

    }

    /**
     * Creates a CorsFilter.
     *
     * @return Cors filter registration bean
     */
    @Bean
    FilterRegistrationBean<CorsFilter> corsFilter() {
        FilterRegistrationBean<CorsFilter> corsFilter = new FilterRegistrationBean<>();

        corsFilter.setOrder(Ordered.HIGHEST_PRECEDENCE);
        corsFilter.setFilter(new CorsFilter());
        corsFilter.addUrlPatterns("/api/*");

        return corsFilter;
    }

}
