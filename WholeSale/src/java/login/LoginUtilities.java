/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static java.time.Clock.system;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LoserGhost
 */
public class LoginUtilities {
    Connection conn;
    Statement stmt;
    PreparedStatement pstmt;
    ResultSet rs;
    public void init(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/wholesale";
            String user = "root";
            String pwd = "root";
            conn = DriverManager.getConnection(url,user,pwd);
            stmt = conn.createStatement();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginUtilities.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public String goLogin(Login login){
        String username = login.getUsername();
        String password = login.getPassword();
        String role;
        try{
            pstmt=conn.prepareStatement("select * from Account where username=? AND password=?" );
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs=pstmt.executeQuery();
            if(rs.next()){
                role = rs.getString("role");
                if(role.equals("dist")){
                    return "distributor.jsp";
                } else if(role.equals("ac")){
                    return "acm.jsp";
                }
                return "main.jsp";
            }else{
                Exception notFound = new Exception("Invalid username or password");
                throw notFound;
            }
            
            
        }catch(Exception e){
            return "login.jsp";
        }
    }
    
    public String getID(Login login){
        String username = login.getUsername();
        String password = login.getPassword();
        String role;
        try{
            pstmt=conn.prepareStatement("select * from Account where username=? AND password=?" );
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs=pstmt.executeQuery();
            if(rs.next()){
                return rs.getString("account_ID");
                
            }else{
                Exception notFound = new Exception("Invalid username or password");
                throw notFound;
            }           
            
        }catch(Exception e){
            return "";
        }
    }
}
