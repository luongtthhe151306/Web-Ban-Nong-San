/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ManagerDAO;
import Model.Account;
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
public class CreateAccountServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateAccountServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateAccountServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("namecreate");
        String add = request.getParameter("addcreate");
        String phone = request.getParameter("phonecreate");
        String accname = request.getParameter("accnamecreate");
        String pass = request.getParameter("passcreate");
        Account acc = new Account(name,add,phone,accname,pass);
        
        String error;
        if(name.isEmpty() || add.isEmpty() || phone.isEmpty() || accname.isEmpty() || pass.isEmpty()){
            error = "Điền đầy đủ thông tin!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("CreateAccount.jsp").forward(request, response);
            return;
        }else{
            ManagerDAO md = new ManagerDAO();
            ArrayList<Account> acclist = md.getAccount();
            boolean f = false;
            for(Account acclist1 : acclist){
                if(acclist1.getAccountName().equals(accname)){
                    f = true;
                }
            }
            if(f){
                error = "Tên tài khoản đã tồn tại!";
                request.setAttribute("error", error);
                request.getRequestDispatcher("CreateAccount.jsp").forward(request, response);
                return;
            }else{
                int l = pass.length();
                if(l< 6 || l >10){
                    error = "Mật khẩu từ 6 - 10 ký tự!";
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("CreateAccount.jsp").forward(request, response);
                    return;
                }
                if(phone.length() != 10){
                    error = "Số điện thoại có 10 chữ số!";
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("CreateAccount.jsp").forward(request, response);
                    return;
                }
            }
        }
        
        if(accname.contains(" ")){
            error="Tên tài khoản không chứa dấu cách!!!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("CreateAccount.jsp").forward(request, response);
            return;
        }
        
        ManagerDAO md = new ManagerDAO();
        md.createAccount(acc);
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
