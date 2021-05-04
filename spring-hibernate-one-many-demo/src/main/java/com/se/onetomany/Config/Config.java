/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se.onetomany.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;

/**
 *
 * @author ACER
 */
@Configuration
@EnableWebSecurity
public class Config extends WebSecurityConfigurerAdapter {

    static String AUTH_ADMIN = "ROLE_ADMIN";

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        // add our users for in memory authentication
        User.UserBuilder users = User.withDefaultPasswordEncoder();
        auth.inMemoryAuthentication()
                .withUser(users.username("daiviet1420").password("123456").roles("EMPLOYEE"))
                .withUser(users.username("daiviet1023").password("123456").roles("MANAGER"))
                .withUser(users.username("daiviet1012").password("123456").roles("ADMIN"));
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/resources/css/**").permitAll()
                .antMatchers("/resources/bootstrap/**").permitAll()
                .antMatchers("/resources/jquery/**").permitAll()
                .antMatchers("/resources/fonts/**").permitAll()
                .anyRequest().authenticated()
                .and().formLogin()
                .loginPage("/showMyLoginPage")
                .loginProcessingUrl("/authenticateTheUser")
                .permitAll()
                .and().logout()
                .permitAll();
    }
}
