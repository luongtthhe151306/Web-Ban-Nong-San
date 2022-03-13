/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ManagerDAO;
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
public class UpdateProductTypeServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        int IdA = Integer.parseInt(request.getParameter("IdA"));
        ManagerDAO md = new ManagerDAO();
        if (!request.getParameter("typename").isEmpty()) {
            String typename = request.getParameter("typename");
            int IdT = Integer.parseInt(request.getParameter("TypeId"));  
//            PrintWriter out = response.getWriter();
//            out.println(IdT);
//            out.println(typename);
            Type type = null;
            ArrayList<Type> typelist = md.getProductType();
            for (Type typelist1 : typelist) {
                if (typelist1.getIdType() == IdT) {
                    type = typelist1;
                }
            }
            type.setTypeName(typename);
            md.UpdateProductType(type);
            ArrayList<Product> prolistbyIdA = md.getProductByIdA(IdA);
            request.setAttribute("prolistbyIdA", prolistbyIdA);
            request.getRequestDispatcher("UpdateProductPageServlet").forward(request, response);
        } else {
            ArrayList<Product> prolistbyIdA = md.getProductByIdA(IdA);
            request.setAttribute("prolistbyIdA", prolistbyIdA);
            request.getRequestDispatcher("UpdateProductPageServlet").forward(request, response);
        }
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
