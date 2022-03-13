/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ManagerDAO;
import Model.Account;
import Model.Product;
import Model.Type;
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
public class SalerServlet extends HttpServlet {

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
        int IdA = Integer.parseInt(request.getParameter("idA"));
//        int IdA = 1;
        String accname = "";
        ManagerDAO md = new ManagerDAO();
        ArrayList<Product> prolistbyIdA = md.getProductByIdA(IdA);
        ArrayList<Account> acclist = md.getAccount();
        ArrayList<Type> typelist = md.getProductTypeByIdA(IdA);
        for (Account acclist1 : acclist) {
            if(acclist1.getIdA() == IdA){
                accname = acclist1.getAccountName();
            }
        }
        request.setAttribute("IdA", IdA);
        request.setAttribute("accname", accname);
        request.setAttribute("prolistbyIdA", prolistbyIdA);
        request.setAttribute("typelist", typelist);
        request.getRequestDispatcher("SalerPage.jsp").forward(request, response);
//        PrintWriter out = response.getWriter();
//        out.print(prolistbyIdA);
//        out.print(acclist);
//        out.print(typelist.get(0).getTypeName());
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
