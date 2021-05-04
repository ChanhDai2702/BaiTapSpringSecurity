package com.se.onetomany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    @GetMapping("/showMyLoginPage")
    public String showMyLoginPage() {
        
        return "login-form";
        //return "fancy-login";
        //return "plain-login"; 
    }
}
