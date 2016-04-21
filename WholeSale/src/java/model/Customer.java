/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author LoserGhost
 */
public class Customer {
    private String cus_ID;
    private String cus_Name;
    private String cus_Phone;
    private String cus_Email;

    public Customer() {
    }

    public String getCus_ID() {
        return cus_ID;
    }

    public void setCus_ID(String cus_ID) {
        this.cus_ID = cus_ID;
    }

    public String getCus_Name() {
        return cus_Name;
    }

    public void setCus_Name(String cus_Name) {
        this.cus_Name = cus_Name;
    }

    public String getCus_Phone() {
        return cus_Phone;
    }

    public void setCus_Phone(String cus_Phone) {
        this.cus_Phone = cus_Phone;
    }

    public String getCus_Email() {
        return cus_Email;
    }

    public void setCus_Email(String cus_Email) {
        this.cus_Email = cus_Email;
    }
    
}
