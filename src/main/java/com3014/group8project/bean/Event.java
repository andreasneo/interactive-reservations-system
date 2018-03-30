/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com3014.group8project.bean;

/**
 *
 * @author Angelos
 * This model holds the name of an event and its ID.
 */
public class Event {

    int eventID;
    String eventName;

    public Event(int eventID, String eventName) {
        this.eventID = eventID;
        this.eventName = eventName;
    }

    public Event() {

    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

}
