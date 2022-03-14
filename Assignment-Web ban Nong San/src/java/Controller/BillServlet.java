/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ManagerDAO;
import Model.Bill;
import Model.Order;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class BillServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        ManagerDAO md = new ManagerDAO();
        int IdA = Integer.parseInt(request.getParameter("IdA"));
        String[] choose = request.getParameterValues("choose");
        if(choose == null){
            String error = "Chọn sản phẩm muốn mua!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("CartPage.jsp?IdA="+IdA).forward(request, response);
            return;
        }
        ArrayList<Order> orderlist = new ArrayList();
        double totalmoney = 0;
        for(int i=0; i<choose.length; i++){
            int IdO = Integer.parseInt(choose[i]);
            Order order = md.getOrderIdO(IdO);
            int IdP = order.getProduct().getIdP();
            Product pro = md.getProductByIdP(IdP);
            if(pro.getQuantityStock() >= order.getQuantity()){
                order.setPayment(1);
                md.UpdateOrderPayment(order);
                orderlist.add(order);
                totalmoney += order.getProduct().getPrice()*order.getQuantity();
            }else{
                String error = "Số lượng "+pro.getName()+ " không đủ! Thay đổi số lượng.";
                request.setAttribute("error", error);
                request.getRequestDispatcher("CartPage.jsp?IdA="+IdA).forward(request, response);
                return;
            }
        }
            
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String ordertime = dtf.format(now);
        Bill bill = md.getTotalBillNull(IdA);
        bill.setOrderTime(ordertime);
        bill.setTotalMoney(totalmoney);
        ArrayList<Bill> billlist = new ArrayList();
        billlist.add(bill);
//            out.println(IdA);
//            out.println(choose);
//            out.println(orderlist);
//            out.println(totalmoney);
//            out.println(bill);
//            out.println(ordertime);
        md.UpdateBill(bill);
        request.setAttribute("orderlist", orderlist);
        request.setAttribute("billlist", billlist);
        request.getRequestDispatcher("BillPage.jsp?IdA="+IdA).forward(request, response);
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
