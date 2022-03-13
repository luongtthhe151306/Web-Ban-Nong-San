/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ManagerDAO;
import Model.Account;
import Model.Bill;
import Model.Order;
import Model.Product;
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
public class OrderProductServlet extends HttpServlet {

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
        String submit = request.getParameter("submit");
        ManagerDAO md = new ManagerDAO();
        int IdP = Integer.parseInt(request.getParameter("IdP"));
        int IdA = Integer.parseInt(request.getParameter("IdA"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Order orderIdP = md.getOrderIdP(IdA, IdP);
        Product pro = md.getProductByIdP(IdP);
        Account acc = md.getAccountById(IdA);
        int sold = pro.getQuantitySold();
        int stock = pro.getQuantityStock();
        pro.setQuantitySold(sold + quantity);
        pro.setQuantityStock(stock - quantity);

//        PrintWriter out = response.getWriter();
//        out.println(submit);
//        out.println(request.getParameter("IdP"));
//        out.println(request.getParameter("IdA"));
////        out.println(IdA);
//        out.println(quantity);
//        out.println(pro);
//        out.println(acc);
//        out.println(sold);
//        out.println(stock);
//        out.print(orderIdP);
        //update product quantitysold, stock
        Bill bill = md.getTotalBillNull(IdA);
//        out.print(billlist);
        Order order = null;
 
        if(bill == null){
            md.CreateTotalBill(IdA);
            Bill b = md.getTotalBillNull(IdA);
            int IdB = b.getIdB();
            order = new Order(acc, IdB, pro, quantity);
            md.CreateOrder(order);
            md.UpdateProduct(pro);
        }else{
            int IdB = bill.getIdB();
            if(order == null){
                order = new Order(acc, IdB, pro, quantity);
                md.CreateOrder(order);
            }else{
                int i = order.getQuantity();
                order.setQuantity(i+quantity);
                md.UpdateOrder(order);
            }
            md.UpdateProduct(pro);
        }
        if (submit.equals("Thêm vào giỏ hàng")) {
            String idA = Integer.toString(IdA);
            request.setAttribute("idA", idA);
            request.setAttribute("accname", acc.getAccountName());
            request.getRequestDispatcher("HomeServlet").forward(request, response);
        } else {

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
