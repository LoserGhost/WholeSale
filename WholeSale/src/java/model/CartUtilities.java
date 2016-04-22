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
public class CartUtilities {

    Connection conn;
    Statement stmt;
    PreparedStatement pstmt;
    ResultSet rs;

    public CartUtilities() {
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

    public void insertItem(Order order) {
        String sqlCmd = "INSERT INTO order_has_product VALUES('" + order.getOrderID() + "','"
                + order.getProductID() + "','"
                + order.getQuantity() + "')";
        try {
            stmt.executeUpdate(sqlCmd);

        } catch (SQLException ex) {
            sqlCmd = "UPDATE order_has_product SET quantity ='" + order.getQuantity() + 
                    "' WHERE order_order_id = '" + order.getOrderID() +
                    "' AND product_product_id = '" + order.getProductID() + "'";
            try {
                stmt.executeUpdate(sqlCmd);

            } catch (SQLException e) {
                Logger.getLogger(CartUtilities.class.getName()).log(Level.SEVERE, null, e);
            }
        }

    }

    public void removeItem(Order order) {
        String sqlCmd = "DELETE FROM order_has_product WHERE order_order_id = '" + order.getOrderID() +
                    "' AND product_product_id = '" + order.getProductID() + "'";
        try {
            stmt.executeUpdate(sqlCmd);
        } catch (SQLException ex) {
            Logger.getLogger(CartUtilities.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void pendOrder(String order,String account){
        String sqlCmd = "UPDATE sale_order SET status = 'pending' WHERE order_id = '" + order + "'";
            try {
                stmt.executeUpdate(sqlCmd); 
               sqlCmd = "insert into sale_order(account_account_id) value("+Integer.parseInt(account)+") ";
               stmt.executeUpdate(sqlCmd);

            } catch (SQLException e) {
                Logger.getLogger(CartUtilities.class.getName()).log(Level.SEVERE, null, e);
            }
        
        
    }
}
