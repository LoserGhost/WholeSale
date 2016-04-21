/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Branch;
import model.Customer;
import model.UserUtilities;

/**
 *
 * @author LoserGhost
 */
@WebServlet(name = "UpdateController", urlPatterns = {"/UpdateController"})
public class UpdateController extends HttpServlet {

    private UserUtilities userUtilities = new UserUtilities();
    private Account account = new Account();
    private Customer customer = new Customer();
    private Branch branch = new Branch();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        request.setCharacterEncoding("UTF-8");
        
        
        String payment = request.getParameter("payment");
        String accountid = (String) request.getSession().getAttribute("accountID");
        
        String location = request.getParameter("location");
        String branchid = request.getParameter("branch");
        
        String cusname = request.getParameter("name");
        String cusid = request.getParameter("cusid");
        
        account.setAccount_ID(accountid);
        account.setPayment(payment);
        
        branch.setBranch_Location(location);
        branch.setBranch_ID(branchid);
        
        customer.setCus_Name(cusname);
        customer.setCus_ID(cusid);
        
        userUtilities.updateName(customer);
        userUtilities.updateLocation(branch);
        userUtilities.updatePayment(account);
        
        response.sendRedirect("paid.jsp");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
