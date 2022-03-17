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
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        Order orderIdP = md.getOrderIdP(IdA, IdP);
        Product pro = md.getProductByIdP(IdP);
        Account acc = md.getAccountById(IdA);
        String quantitys = request.getParameter("quantity");
        //check quantity
        if(quantitys.isEmpty()){
            String error = "Vui lòng nhập số lượng muốn mua!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("OrderProduct.jsp?IdS="+pro.getAccount().getIdA()+"&IdA="+IdA+"&IdP="+IdP).forward(request, response);
            return;
        }
        for(int i=0; i<quantitys.trim().length(); i++){
            char j = quantitys.charAt(i);
            if(Character.isLetter(j)){
                String error = "Vui lòng nhập số !";
                request.setAttribute("error", error);
                request.getRequestDispatcher("OrderProduct.jsp?IdS="+pro.getAccount().getIdA()+"&IdA="+IdA+"&IdP="+IdP).forward(request, response);
                return;
            }
        }        
        if(Integer.parseInt(quantitys) <= 0){
            String error = "Vui lòng nhập số lớn hơn 0!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("OrderProduct.jsp?IdS="+pro.getAccount().getIdA()+"&IdA="+IdA+"&IdP="+IdP).forward(request, response);
            return;
        }
        
        int quantity = Integer.parseInt(quantitys);
                
        
////        Account acc = (Account)request.getSession().getAttribute("user");
//        //
         
        
        if(quantity > pro.getQuantityStock()){
            String error = "Quá số lượng trong kho!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("OrderProduct.jsp?IdS="+pro.getAccount().getIdA()+"&IdA="+IdA+"&IdP="+IdP).forward(request, response);
            return;
        }
        

        int sold = pro.getQuantitySold();
        int stock = pro.getQuantityStock();
        pro.setQuantitySold(sold + quantity);
        pro.setQuantityStock(stock - quantity);

        PrintWriter out = response.getWriter();
        out.println("a");
////        out.println(submit);
////        out.println(request.getParameter("IdP"));
////        out.println(request.getParameter("IdA"));
//////        out.println(IdA);
////        out.println(quantity);
////        out.println(pro);
////        out.println(acc);
////        out.println(sold);
////        out.println(stock);
////        out.print(orderIdP);
//        //update product quantitysold, stock
        Bill bill = md.getTotalBillNull(IdA);
//        out.print(bill);
        Order order = null;
 
        if(bill == null){
            md.CreateTotalBill(IdA);
            Bill b = md.getTotalBillNull(IdA);
            int IdB = b.getIdB();
            order = new Order(acc, IdB, pro, quantity,0);
            md.CreateOrder(order);
        }else{
            int IdB = bill.getIdB();
            if(orderIdP == null){
                order = new Order(acc, IdB, pro, quantity,0);
                md.CreateOrder(order);
            }else{
                int i = orderIdP.getQuantity();
                int total = i+quantity;
                if(total <= orderIdP.getProduct().getQuantityStock()){
                    orderIdP.setQuantity(0);
                    orderIdP.setQuantity(total);
//                    out.print(total);
                    md.UpdateOrderQuantity(orderIdP);
                }else{
                    String error = "Giỏ hàng đã có "+orderIdP.getQuantity()+" sản phẩm!";
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("OrderProduct.jsp?IdS="+pro.getAccount().getIdA()+"&IdA="+IdA+"&IdP="+IdP).forward(request, response);
                }
            }
        }
        if (submit.equals("Thêm vào giỏ hàng")) {
            String idA = Integer.toString(IdA);
//            request.setAttribute("idA", idA);
//            request.setAttribute("accname", acc.getAccountName());
//            request.getRequestDispatcher("HomeServlet").forward(request, response);
            response.sendRedirect("HomeServlet?idA="+idA+"&accname="+acc.getAccountName());
        } else {
            request.getRequestDispatcher("CartPage.jsp?IdA="+IdA).forward(request, response);
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
