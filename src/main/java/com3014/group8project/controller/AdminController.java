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
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Andreas
 * This is the Controller which handles the requests of the Admin
 */
@Controller
public class AdminController {

    /**
     * This method handles the request to the to Admin page.
     * It builds the "admin" view by passing the 1)Username of the admin and 2) all the bookings
     */
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(ModelMap model) throws IOException, ClassNotFoundException, SQLException {
        //The Authentication class is called to get the username of the user
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String userName = authentication.getName();
            List<Booking> bookingList = getBookings();
            model.addAttribute("userName", userName);
            model.addAttribute("bookingList", bookingList);
        }
        return "admin";
    }

    /**
     * This method is used to allow the Admin to approve/reject pending bookings.
     * It binds the URL variables bookingID and status to variables, which are then handled
     * to the approveBookings method.
     */
    @RequestMapping(value = "/admin/{bookingID}/{status}", method = RequestMethod.GET)
    protected ModelAndView approveBooking(@PathVariable("bookingID") int bookingID, @PathVariable("status") String status) throws IOException, ClassNotFoundException {
        approveBookings(status, bookingID);
        return new ModelAndView("redirect:../../admin");
    }

    /**
     * This method handles the request the /allusers view.
     * Here, the Admin can see all the registered users from the database 
     */
    @RequestMapping(value = "/allusers", method = RequestMethod.GET)
    protected String viewUsers(ModelMap model) throws IOException, ClassNotFoundException {
        List<User> userList = getUsers();
        model.addAttribute("userList", userList);
        return "allusers";
    }

    /**
     * Method to return the active bookings ('booked'=1) from the database to the Admin.
     * An INNER JOIN statement is used to also retrieve event name of the booking.
     *
     */
    private List<Booking> getBookings() throws IOException, ClassNotFoundException {
        List<Booking> bookingList = new ArrayList<Booking>();
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
            resultSet = statement.executeQuery("SELECT bookingID, event.eventName, username, tableID, request, status FROM booking INNER JOIN event ON booking.eventID = event.eventId WHERE booked = 1");
            while (resultSet.next()) {
                Booking booking = new Booking(resultSet.getInt("bookingID"), resultSet.getString("eventName"), resultSet.getString("username"), resultSet.getInt("tableID"), resultSet.getString("request"), resultSet.getString("status"));
                bookingList.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingList;
    }

    /**
     * Method to to allow the Admin to approve bookings. The parameters are taken via the URL.
     * Different SQL statement is used to update the booking record based on the action of the admin.
     *
     */
    private void approveBookings(String status, int bookingID) throws IOException, ClassNotFoundException {
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

            if (status.equals("approved")) {
                statement.executeUpdate("UPDATE booking SET status = 'approved' WHERE bookingID = " + bookingID);
            }
            
            if (status.equals("rejected")) {
                statement.executeUpdate("UPDATE booking SET booked = 0, status = 'rejected', request = '', noPeople = 0 WHERE bookingID = " + bookingID);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * This method retrieves all the registered users from the database and returns then in a list 
     */
    private List<User> getUsers() throws IOException, ClassNotFoundException {
        List<User> userList = new ArrayList<User>();
        try {
            Properties prop = new Properties();
            InputStream inputStream = AdminController.class.getClassLoader().getResourceAsStream("config/application.properties");
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection;
            Statement statement;
            ResultSet resultSet;

            connection = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("user"), prop.getProperty("password"));
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT username, first_name, last_name FROM user");

            while (resultSet.next()) {
                User user = new User(resultSet.getString("username"), resultSet.getString("first_name"), resultSet.getString("last_name"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}
