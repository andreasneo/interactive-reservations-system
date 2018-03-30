package com3014.group8project.controller;

import com3014.group8project.bean.Booking;
import com3014.group8project.bean.User;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.xml.bind.DatatypeConverter;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Andreas
 * This controller handles the Security requests - login, logout and unauthorized requests
 */
@Controller
public class SecurityController {

    //Passes the username of the logged in user to the unauthorized page
    @RequestMapping(value = "/unauthorized", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String userName = authentication.getName();
            model.addAttribute("userName", userName);
        }
        return "unauthorized";
    }

    //Loads the login page
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(ModelMap model) {
        return "login";
    }

    //Redirects the user to the login page after logging out.
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }
    
    
    //Register form
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    protected ModelAndView registerPage(ModelMap model) throws Exception {

        return new ModelAndView("register", "user", new User());
    }
    
    @RequestMapping(value = "/register/submit", method = RequestMethod.POST)
    public String submitRegisterForm(@Valid @ModelAttribute("user") User user,
            BindingResult result, ModelMap model, RedirectAttributes redirectAttrs) throws IOException, ClassNotFoundException{
        if (result.hasErrors()) {
            return "error";
        }
        
        /**
         * Checks if the username entered is used by querying the database
         * If it is, the controller returns the the register form
         * */
        if (usernameExists(user.getUsername())){
            redirectAttrs.addAttribute("userExists");
           return "redirect:/register";

        }else{
        
        //The password is being encoded before registering it to database
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encryptedPassword = passwordEncoder.encode(user.getPassword());
        
        model.addAttribute("first_name", user.getFirst_name());
        model.addAttribute("last_name", user.getLast_name());
        model.addAttribute("username", user.getUsername());
        model.addAttribute("password", encryptedPassword);

        System.out.println("USER PASS WORD  " + encryptedPassword);

        
        registerUser(user.getFirst_name(), user.getLast_name(),user.getUsername(),encryptedPassword);
        }
        return "redirect:/user";
    }

    /**
     * This method registers a user by inserting his details in the database
     */
    private void registerUser(String first_name, String last_name,String username, String password) throws IOException, ClassNotFoundException{
         try {
            Properties prop = new Properties();
            InputStream inputStream = MapController.class.getClassLoader().getResourceAsStream("config/application.properties");
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection;
            Statement statement;

            connection = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("user"), prop.getProperty("password"));
            statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO user (username, password, enabled, first_name, last_name) VALUES ('"+username+"', '"+password+"', '1', '"+first_name+"', '"+last_name+"')");
            statement.executeUpdate("INSERT INTO user_role (user_role_id, username, role) VALUES (NULL, '"+username+"', 'ROLE_USER')");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    /**
     * The method that checks if the username is already in the database
     */
    private boolean usernameExists(String username) throws ClassNotFoundException, IOException{
        boolean userExists = false;
        try {
            Properties prop = new Properties();
            InputStream inputStream = MapController.class.getClassLoader().getResourceAsStream("config/application.properties");
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection;
            Statement statement;
            ResultSet resultSet;
            
            connection = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("user"), prop.getProperty("password"));
            statement = connection.createStatement();
            
            resultSet = statement.executeQuery("SELECT * FROM user WHERE username = '"+username+"'");
            if (resultSet.next()) {
               userExists = true;
            }
           
            
        } catch (SQLException e) {
            e.printStackTrace();
        }  
         return userExists;
    }
        
   
}
