package com.eDnevnik.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EDnevnikController {
    
    @RequestMapping("/")
    public String login (Model model){
        System.out.println("login strana");
        return "login";
    }
    
    
    
}
