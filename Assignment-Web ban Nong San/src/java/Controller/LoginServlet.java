/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ManagerDAO;
import Model.Buyer;
import Model.Saler;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        ManagerDAO md = new ManagerDAO();
        ArrayList<Buyer> buyerlist = md.getBuyer();
        ArrayList<Saler> salerlist = md.getSaler();
        String accname = request.getParameter("accname");
        String pass = request.getParameter("pass");
        
        int flag = 0;
        //find saler account
        for(int i=0; i<salerlist.size(); i++){
            if(salerlist.get(i).getAccountName().equals(accname)
               && salerlist.get(i).getPassword().equals(pass)){
                flag = 1;
            }
        }
        //find buyer account
        for(int i=0; i<buyerlist.size(); i++){
            if(buyerlist.get(i).getAccountName().equals(accname)
               && buyerlist.get(i).getPassword().equals(pass)){
                flag = 2;
            }
        }
        
        //login for saler
        if(flag == 1){
            request.getRequestDispatcher("HomeSaler.jsp").forward(request, response);
        }//login for buyer
        else if(flag == 2){
            request.getRequestDispatcher("HomeBuyer.jsp").forward(request, response);
        }
        //login faile
        else{
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html><head>");
            out.println("</head><body>");
            out.println("<form name=\"login\" action=\"LoginServlet\" method=\"post\">");
            out.println("<table>");
            out.println("<tr>");
            out.println("<td>Account Name:</td>");
            out.println("<td><input type=\"text\" name=\"accname\"/></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Password:</td>");
            out.println("<td><input type=\"text\" name=\"pass\"/></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td></td>");
            out.println("<td><input type=\"submit\" value=\"Login\"/></td>");
            out.println("</tr>");
            out.println("</table>");
            out.println("</form>");
            out.println("<a href=\"CreateAccount.jsp\">Create Account</a>");
            out.println("</table>");
            out.println("</body></html>");
        }
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
