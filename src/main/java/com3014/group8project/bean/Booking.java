/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com3014.group8project.bean;

/**
 *
 * @author Angelos, Andreas
 * Booking model.
 * When the user makes a booking, an instance of this class is created.
 */
public class Booking {

    int bookingID;
    int eventID;
    int tableID;
    boolean booked;
    String eventName;
    String status;
    String username;
    String request;

    public String getRequest() {
        return request;
    }

    public void setRequest(String request) {
        this.request = request;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    //Used in Map controller
    int noPeople;

    public int getNoPeople() {
        return noPeople;
    }

    public void setNoPeople(int noPeople) {
        this.noPeople = noPeople;
    }

    public Booking(int bookingID, int eventID, int tableID, boolean booked) {
        this.bookingID = bookingID;
        this.eventID = eventID;
        this.tableID = tableID;
        this.booked = booked;
        // this.eventName = eventName;
    }

    //Used in User page
    public Booking(int bookingID, String eventName, int tableID, String status) {
        this.bookingID = bookingID;
        this.tableID = tableID;
        this.eventName = eventName;
        this.status = status;
    }

    //Used in Admin page
    public Booking(int bookingID, String eventName, String username, int tableID, String request, String status) {
        this.bookingID = bookingID;
        this.eventName = eventName;
        this.username = username;
        this.tableID = tableID;
        this.status = status;
        this.request = request;
    }

    public Booking() {

    }

    public int getBookingID() {
        return this.bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public int getTableID() {
        return tableID;
    }

    public void setTableID(int tableID) {
        this.tableID = tableID;
    }

    public boolean isBooked() {
        return booked;
    }

    public void setBooked(boolean booked) {
        this.booked = booked;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
