package com3014.group8project.controller;

import com3014.group8project.bean.Booking;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import javax.validation.Valid;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
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
 * @author Andreas Neokleous
 * This controller handles all requests produced during the booking form
 */
@Controller
public class FormController {

    @RequestMapping(value = "/form", method = RequestMethod.GET)
    protected ModelAndView viewFormPage(ModelMap model) throws Exception {

        return new ModelAndView("form", "booking", new Booking());
    }

    // Use URI GET Mapping in order to carry forward to the booking form the values of the EventID and the TableID selected from hover over the mapview
    @RequestMapping(value = "/form/{newEventID}/{tableID}", method = RequestMethod.GET)
    protected ModelAndView redirectForm(@PathVariable("newEventID") int newEventID, @PathVariable("tableID") int tableID, RedirectAttributes model) throws IOException, ClassNotFoundException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/form");

        //Add these attributes to the model for easy retrieval
        model.addFlashAttribute("newEventID", newEventID);
        model.addFlashAttribute("tableID", tableID);
        model.addFlashAttribute("fromEventName", getEventNameByEventID(newEventID));

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String userName = authentication.getName();
            model.addFlashAttribute("username", userName);
        }

        return modelAndView;
    }

    //When the form is submitted redirect the user to his bookings page.
    @RequestMapping(value = "/form/submit", method = RequestMethod.POST)
    public String submitForm(@Valid @ModelAttribute("booking") Booking booking,
            BindingResult result, ModelMap model) throws IOException, ClassNotFoundException {
        if (result.hasErrors()) {
            return "error";
        }

        model.addAttribute("eventName", booking.getEventName());
        model.addAttribute("tableID", booking.getTableID());
        model.addAttribute("username", booking.getUsername());
        model.addAttribute("noPeople", booking.getNoPeople());
        model.addAttribute("request", booking.getRequest());

        updateBookingInDatabase(booking.getEventName(), booking.getTableID(), booking.getNoPeople(), booking.getRequest(), booking.getUsername());

        return "redirect:/user";
    }

    /**
     * This method is used to transform an eventID into an eventName by querying the database.
     * It is needed because when dealing with URIs for RESTful services, there are sometimes 
     * errors thrown when carrying String literals with 'space'/ '%20' characters present.
     * By converting to a number and passing that around(and then querying to get the name again) this is avoided.
     * @param eventID - The Event ID to query the database with.
     * @return - The Event Name from the database. 
     */
    public String getEventNameByEventID(int eventID) throws IOException, ClassNotFoundException {
        String eventName = null;
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
            resultSet = statement.executeQuery("SELECT * FROM Event WHERE eventID = " + eventID);

            while (resultSet.next()) {
                eventName = resultSet.getString("eventName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventName;

    }

    /**
     * This method is exactly the inverse of the one provided above. 
     * Tranforms an eventName into an eventID.
     * @param eventName - The Event Name to query the database with.
     * @return - The Event ID from the database.
     */
    public int getEventIDfromEventName(String eventName) throws IOException, ClassNotFoundException {
        int eventID = 0;
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
            resultSet = statement.executeQuery("SELECT * FROM Event WHERE eventName = '" + eventName + "'");

            while (resultSet.next()) {
                eventID = resultSet.getInt("eventID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventID;

    }

    /**
     * When the user submits the booking request form, this method is called in order
     * to update the SQL database with their booking details and any new
     * requests input.
     * @param eventName - Which event are we booking for - auto
     * @param tableID - Which table are we booking - auto
     * @param noPeople - How many people selected from the form - manual
     * @param request - The requests typed in the form - manual
     * @param username - The user that is booking the table - auto
     * @throws IOException
     * @throws ClassNotFoundException 
     */
    public void updateBookingInDatabase(String eventName, int tableID, int noPeople, String request, String username) throws IOException, ClassNotFoundException {

        int eventID = getEventIDfromEventName(eventName);

        try {
            Properties prop = new Properties();
            InputStream inputStream = MapController.class.getClassLoader().getResourceAsStream("config/application.properties");
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection;
            Statement statement;

            connection = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("user"), prop.getProperty("password"));
            statement = connection.createStatement();
            statement.executeUpdate("UPDATE booking SET booked = 1, status = 'pending', noPeople = " + noPeople + ", request = '" + request + "', username =  '" + username + "' WHERE tableID = " + tableID + " AND eventID = " + eventID);

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
