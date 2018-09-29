package com3014.group8project.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

/**
 *
 * @author Andreas Neokleous
 * This class is imported in RootConfig and WebConfig to set the application properties, 
 * taken from application.properties file
 */
@Configuration
@PropertySource("classpath:config/application.properties")
public class AppProperties {

    @Bean
    public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
        return new PropertySourcesPlaceholderConfigurer();
    }
}
