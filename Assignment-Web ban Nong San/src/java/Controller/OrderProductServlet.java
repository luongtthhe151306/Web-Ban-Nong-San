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
        Product pro = md.getProductByIdP(IdP);
        Account acc = md.getAccountById(IdA);
        int sold = pro.getQuantitySold();
        int stock = pro.getQuantityStock();
        pro.setQuantitySold(sold + quantity);
        pro.setQuantityStock(stock - quantity);

        //update product quantitysold, stock
        ArrayList<Bill> billlist = md.getTotalBill(IdA);
        int IdB = 0;
        if (billlist.isEmpty()) {
            md.CreateTotalBill(IdA);
        } else {
            boolean f = false;
            for (Bill bill : billlist) {
                if (bill.getOrderTime() == null) {
                    f = true;
                    IdB = bill.getIdB();
                }
            }
            if (!f) {
                md.CreateTotalBill(IdA);
                ArrayList<Bill> billlist1 = md.getTotalBill(IdA);
                for (Bill bill1 : billlist1) {
                    if (bill1.getOrderTime() == null) {
                        IdB = bill1.getIdB();
                    }
                }
                Order order = new Order(acc, IdB, pro, quantity);
                md.CreateOrder(order);
            } else {
                Order order = new Order(acc, IdB, pro, quantity);
                md.CreateOrder(order);
            }
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
