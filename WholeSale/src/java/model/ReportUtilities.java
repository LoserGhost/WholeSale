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

/**
 *
 * @author LoserGhost
 */
public class ReportUtilities {
    
     Connection conn;
    Statement stmt;
    PreparedStatement pstmt;
    ResultSet rs;

    public ReportUtilities() {
    }

    public void init() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/wholesale";
            String user = "root";
            String pwd = "root";
            conn = DriverManager.getConnection(url, user, pwd);
            stmt = conn.createStatement();
        } catch (Exception ex) {
            Logger.getLogger(ReportUtilities.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertReport(int account,String content, String text, String reciver) {
        String sqlCmd = "INSERT INTO report(account_id,content,report,receiver) VALUES('" + account + "','"
                + content + "','"
                + text + "','"
                + reciver + "')";
        try {
            stmt.executeUpdate(sqlCmd);

        } catch (SQLException ex) {
            
        }
    }
    
    public void deleteReport(int id) {
        String sqlCmd = "delete form report where report_id = '" + id + "')";
        try {
            stmt.executeUpdate(sqlCmd);

        } catch (SQLException ex) {
            
        }
    }
    
}
