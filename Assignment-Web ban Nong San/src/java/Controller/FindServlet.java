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
public class FindServlet extends HttpServlet {

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
        String find = request.getParameter("find");
        ManagerDAO md = new ManagerDAO();
        ArrayList<Product> prolist = md.getAllProduct();
        ArrayList<Type> typelist = md.getProductType();
        ArrayList<Account> acclist = md.getAccount();
        
        PrintWriter out = response.getWriter();
        out.print(find);
        
        String findToLower = find.toLowerCase();
        for(Product pro:prolist){
            if(pro.getName().toLowerCase().contains(findToLower)){
                request.getRequestDispatcher("OrderProduct.jsp?IdS="+pro.getAccount().getIdA()+"&IdA="+IdA+"&IdP="+pro.getIdP()).forward(request, response);
                return;
            }
        }
        
        for(Type type:typelist){
            if(type.getTypeName().toLowerCase().contains(findToLower)){
                request.getRequestDispatcher("ProductTypeServlet?idT="+type.getIdType()+"&IdA="+IdA).forward(request, response);
                return;
            }
        }
        
        for(Account acc:acclist){
            if(acc.getAccountName().toLowerCase().contains(findToLower) && acc.isIsSaler()){
                request.setAttribute("typelist1", typelist);
                request.setAttribute("typelist", md.getProductTypeByIdA(acc.getIdA()));
                request.setAttribute("prolistbyIdA", md.getProductByIdA(acc.getIdA()));
                request.setAttribute("IdA", IdA);
                request.setAttribute("accname", md.getAccountById(IdA).getAccountName());
                request.setAttribute("storename", acc.getAccountName());
                request.getRequestDispatcher("StorePage.jsp").forward(request, response);
                return;
            }
        }
        
        String error = "Không tìm thấy!";
        request.setAttribute("error", error);
        request.getRequestDispatcher("HomeServlet?accname="+md.getAccountById(IdA).getAccountName()+"&idA="+IdA).forward(request, response);
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
