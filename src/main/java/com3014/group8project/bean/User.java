/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com3014.group8project.bean;

/**
 *
 * @author Andreas Neokleous
 * This is the model of the User, which can log in
 */
public class User {

    private String first_name;
    private String last_name;
    private String username;
    private String password;
    
    public User(String username, String first_name, String last_name){
        this.first_name = first_name;
        this.username = username;
        this.last_name = last_name;
    }

        public User(){

    }
    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
    
}
