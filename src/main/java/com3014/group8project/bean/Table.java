/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com3014.group8project.bean;

/**
 *
 * @author Angelos
 * This is model of the tables
 */
public class Table {

    int tableID;
    String tableName;

    public Table(int tableID, String tableName) {
        this.tableID = tableID;
        this.tableName = tableName;
    }

    public Table() {

    }

    public int getTableID() {
        return tableID;
    }

    public void setTableID(int tableID) {
        this.tableID = tableID;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

}
