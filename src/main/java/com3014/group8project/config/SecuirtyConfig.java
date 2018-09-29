package com3014.group8project.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 *
 * @author Andreas Neokleous
 * This class enables the Spring Web Security
 * Our app allows users to Sign in/out, and view the views they have access to.
 * The registered users are in th SQL database.
 */
@Configuration
@EnableWebSecurity
public class SecuirtyConfig extends WebSecurityConfigurerAdapter{
    
    //Getting the connection to the database
    @Autowired
    DataSource dataSource;

    /**
     * Using dataSource to get the registered users from the SQL database
     */
    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
      auth.jdbcAuthentication().dataSource(dataSource)
     .passwordEncoder(passwordEncoder())
     .usersByUsernameQuery(
      "select username,password, enabled from user where username=?")
     .authoritiesByUsernameQuery(
      "select username, role from user_role where username=?");
    } 

    /**
     * There are two roles, Admin and User. Each has access to different views.
     * This method sets the access to each view.
     * Also, it sets the path to the custom login page, unauthorized page and logout  
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
      http.csrf().disable().authorizeRequests()
            .antMatchers("/", "/home", "/table/**", "/tables", "/user/**").permitAll() 
            .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
            .antMatchers("/allusers/**").access("hasRole('ROLE_ADMIN')")
            .antMatchers("/user/**").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')") 
            .and().formLogin().loginPage("/login").permitAll()
            .and().logout().logoutSuccessUrl("/login?logout").permitAll()
            .and().exceptionHandling().accessDeniedPage("/unauthorized");

    }   
     
    /**
     * Bean that decodes the password when a user logins
     */
     @Bean
	public PasswordEncoder passwordEncoder(){
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
}
