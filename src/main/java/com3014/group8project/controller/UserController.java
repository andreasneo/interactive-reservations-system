package com3014.group8project.controller;

import com3014.group8project.bean.Booking;
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
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Andreas Neokleous
 * This is the Controller which handles the requests of the User
 */
@Controller
public class UserController {

     /**
     * This method handles the request to the to User page.
     * It builds the "user" view by passing the 1)Username of the user and 2) the bookings of the logged in user
     */
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String userPage(ModelMap model) throws IOException, ClassNotFoundException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String userName = authentication.getName();
            List<Booking> userBookings = getUserBookings(userName);
            model.addAttribute("userName", userName);
            model.addAttribute("userBookings", userBookings);
        }
        return "user";
    }

    /**
     * Method to get the bookings of a particular user via INNER JOIN SLQ query. 
     * This INNER JOIN is used to get the evenetName from the event table
     */
    private List<Booking> getUserBookings(String username) throws IOException, ClassNotFoundException {
        List<Booking> userBookings = new ArrayList<Booking>();
        try {
            Properties prop = new Properties();
            InputStream inputStream = SecurityController.class.getClassLoader().getResourceAsStream("config/application.properties");
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection;
            Statement statement;
            ResultSet resultSet;

            connection = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("user"), prop.getProperty("password"));
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT bookingID, event.eventName, booking.tableID, booking.status FROM booking INNER JOIN event ON booking.eventID=event.eventId WHERE username = '" + username + "'");
            while (resultSet.next()) {
                Booking booking = new Booking(resultSet.getInt("bookingID"), resultSet.getString("eventName"), resultSet.getInt("tableID"), resultSet.getString("status"));
                userBookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userBookings;
    }
}
