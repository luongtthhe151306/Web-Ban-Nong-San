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
public class CreateProductServlet extends HttpServlet {

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
        int IdA = Integer.parseInt(request.getParameter("IdA"));
        String name = request.getParameter("ipName");
        double price = Double.parseDouble(request.getParameter("ipPrice"));
        String typename1 = request.getParameter("checkType");
        String typename2 = request.getParameter("ipType");
        String origin = request.getParameter("ipOrigin");
        String img = request.getParameter("ipImg");
        int QuantityStock = Integer.parseInt(request.getParameter("ipQuantityStock"));
        
        PrintWriter out = response.getWriter();
        out.println(typename1);
        out.println(typename2);
        out.println(IdA);
        Type type = null;
        Account acc = null;
        boolean f = false;
        ManagerDAO md = new ManagerDAO();
        ArrayList<Type> typelist = md.getProductType();
        ArrayList<Account> acclist = md.getAccount();
        for (Type typelist1 : typelist) {
            if(typelist1.getTypeName().equals(typename1)){
                type = typelist1;
                f = true;
            }
        }
        out.print(type);
//        for (Account acclist1 : acclist) {
//            if(acclist1.getIdA() == IdA){
//                acc = acclist1;
//            }
//        }
//        
//        Product pro;
//        if(f){
//            pro = new Product(name, price, type,origin, img, QuantityStock, 0, acc);
//        }else{
//            type = new Type(typename2);
//            md.createTypeProduct(type);
//            pro = new Product(name, price, type,origin, img, QuantityStock, 0, acc);
//        }
//        md.createProduct(pro);
//        request.getRequestDispatcher("SalerServlet?IdA="+IdA).forward(request, response);
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
