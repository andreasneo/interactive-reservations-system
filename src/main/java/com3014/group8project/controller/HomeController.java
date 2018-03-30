package com3014.group8project.controller;

import java.awt.Button;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

    /**
     *
     * @author Angelos This controller handles all requests produced by the
     * home page. There is not much it requests so this is here for scalability
     * reasons.
     */
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    protected String viewHome(ModelMap model) throws Exception {

        model.addAttribute("message", "Group 8!");

        return "home";
    }

}
