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
public class UpdateProductItemServlet extends HttpServlet {

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
        int IdP = Integer.parseInt(request.getParameter("IdP"));
        String name = request.getParameter("ipName");
        double price = Double.parseDouble(request.getParameter("ipPrice"));
        String typename1 = request.getParameter("checkType");
        String typename2 = request.getParameter("ipType");
        String origin = request.getParameter("ipOrigin");
        String img = request.getParameter("ipImg");
        int QuantityStock = Integer.parseInt(request.getParameter("ipQuantityStock"));
        
//        PrintWriter out = response.getWriter();
//        out.println(IdA);
//        out.println(IdP);
//        out.println(name);
//        out.println(price);
//        out.println(request.getParameter("checkType"));
//        out.println(typename2);
//        out.println(origin);
//        out.println(img);
//        out.print(QuantityStock);
        Type type = null;
        Account acc = null;
        ManagerDAO md = new ManagerDAO();
        if (typename1 != null) {
            ArrayList<Type> typelist = md.getProductType();
            for (Type typelist1 : typelist) {
                if (typelist1.getTypeName().equals(typename1)) {
                    type = typelist1;
                }
            }
        } else {
            md.createTypeProduct(typename2);
            ArrayList<Type> typelist = md.getProductType();
            for (Type typelist1 : typelist) {
                if (typelist1.getTypeName().equalsIgnoreCase(typename2)) {
                    type = typelist1;
                }
            }
        }
        ArrayList<Product> prolist = md.getProductByIdA(IdA);
        Product pro = null;
        for(Product prolist1 : prolist){
            if(prolist1.getIdP() == IdP){
                pro = prolist1;
            }
        }
        
        pro.setImg(img);
        pro.setName(name);
        pro.setOrigin(origin);
        pro.setPrice(price);
        pro.setQuantityStock(QuantityStock);
        pro.setType(type);
        
        md.UpdateProduct(pro);
        request.getRequestDispatcher("UpdateProductPageServlet?IdA="+IdA).forward(request, response);
        
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
