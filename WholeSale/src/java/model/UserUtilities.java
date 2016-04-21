/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import login.Login;
import login.LoginUtilities;

/**
 *
 * @author LoserGhost
 */
public class UserUtilities {

    Connection conn;
    Statement stmt;
    PreparedStatement pstmt;
    ResultSet rs;

    public UserUtilities() {
    }

    public void init() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/wholesale";
            String user = "root";
            String pwd = "root";
            conn = DriverManager.getConnection(url, user, pwd);
            stmt = conn.createStatement();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginUtilities.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateName(Customer customer) {
        String sqlCmd = "UPDATE customer SET cus_name = '" + customer.getCus_Name()
                + "' WHERE cus_id = '" + customer.getCus_ID() + "'";
        try {
            stmt.executeUpdate(sqlCmd);

        } catch (SQLException e) {
            Logger.getLogger(CartUtilities.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    public void updateLocation(Branch branch) {
        String sqlCmd = "UPDATE branch SET location = '" + branch.getBranch_Location()
                + "' WHERE branch_id = '" + branch.getBranch_ID() + "'";
        try {
            stmt.executeUpdate(sqlCmd);

        } catch (SQLException e) {
            Logger.getLogger(CartUtilities.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updatePayment(Account account) {
        String sqlCmd = "UPDATE account SET payment = '" + account.getPayment()
                + "' WHERE account_id = '" + account.getAccount_ID() + "'";
        try {
            stmt.executeUpdate(sqlCmd);

        } catch (SQLException e) {
            Logger.getLogger(CartUtilities.class.getName()).log(Level.SEVERE, null, e);
        }
    }

}
