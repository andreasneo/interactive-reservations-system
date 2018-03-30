package com3014.group8project.config;

import java.util.Arrays;
import java.util.List;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 *
 * @author Andreas
 * In this class the web MVC configuration is set up with annotations.
 * It extends the base class WebMvcConfigurerAdapter and the needed methods are 
 * overriden
 */
@Configuration
@EnableWebMvc
@ComponentScan({"com3014.group8project.controller"})
@Import({AppProperties.class})
public class WebConfig extends WebMvcConfigurerAdapter {

    public WebConfig() {
    }
    
    /**
     * View resolver to setup the Views of the application (JSP files)
     */    
    @Bean
    public ContentNegotiatingViewResolver contentViewResolver() throws Exception {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/jsp/");
        viewResolver.setSuffix(".jsp");
        ContentNegotiatingViewResolver contentViewResolver = new ContentNegotiatingViewResolver();
        contentViewResolver.setViewResolvers(Arrays.<ViewResolver>asList(viewResolver));
        return contentViewResolver;
    }
    
    /**
     * This method is used to forward the requested URLs to the appropriate views
     * 
     */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("redirect:home"); //if you dont put "redirect:" it will resolve the view without going in the controller!!!
        registry.addViewController("/mapview").setViewName("mapview");
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/allusers").setViewName("allusers");
        registry.addViewController("/form").setViewName("form");
        registry.addViewController("/register").setViewName("register");
        registry.addViewController("/admin").setViewName("admin");
        registry.addViewController("/user").setViewName("user");
        registry.addViewController("/unauthorized").setViewName("unauthorized");
    }

    /**
     * Added to allow convert JSON to HTML
     */
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(new MappingJackson2HttpMessageConverter());

        super.configureMessageConverters(converters);
    }
    
    /**
     * This method sets the location of the resources
     */
       @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
        registry.addResourceHandler("/config/**").addResourceLocations("classpath:/config/");
        registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
        registry.addResourceHandler("/img/**").addResourceLocations("classpath:/img/");
    }
    
   /**
     * This method is used to connect to the SQL database.
     */
    @Bean(name = "dataSource")
    public DriverManagerDataSource dataSource() {
        DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
        driverManagerDataSource.setDriverClassName("com.mysql.jdbc.Driver");
        driverManagerDataSource.setUrl("jdbc:mysql://localhost:3306/booking");
        driverManagerDataSource.setUsername("root");
        driverManagerDataSource.setPassword("");
        return driverManagerDataSource;
    }

}
    