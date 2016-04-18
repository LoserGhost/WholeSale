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
public class Account {
    private String account_ID;
    private String username;
    private String password;
    private String role;
    private String payment;
    
    public void addAccount(){
        
    }
    
    public void deleteAccount(){
        
    }
    
    public void editAccount(){
        
    }
    
    public String getAccount(){
        return account_ID+","+username+","+password+","+role+","+payment;
    }
}
