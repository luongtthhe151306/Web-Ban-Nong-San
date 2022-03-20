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
public class ProductTypeServlet extends HttpServlet {

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
        ManagerDAO  md = new ManagerDAO();
//        String idT = request.getParameter("idT");
//        String IdA = request.getParameter("IdA");
        int idT = Integer.parseInt(request.getParameter("idT"));
        int page = Integer.parseInt(request.getParameter("page"));
        String IdA = request.getParameter("IdA");
        String accname = md.getAccountById(Integer.parseInt(IdA)).getAccountName();
        ArrayList<Type> typelist = md.getProductType();
        ArrayList<Product> prolist = md.getProduct(idT);
        String typename = "";
        for (Type typelist1 : typelist) {
            if(typelist1.getIdType() == idT){
                typename = typelist1.getTypeName();
            }
        }
//        PrintWriter out = response.getWriter();
//        out.print(page);
//        out.print(IdA);
        request.setAttribute("IdA", IdA);
        request.setAttribute("accname", accname);
        request.setAttribute("idT", idT);
        request.setAttribute("typename", typename);
        request.setAttribute("typelist", typelist);
        request.setAttribute("prolist", prolist);
        request.getRequestDispatcher("ProductTypePage.jsp?page="+page).forward(request, response);
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
