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
public class ManagerAccountServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        int IdA = Integer.parseInt(request.getParameter("IdA"));
        int begin = Integer.parseInt(request.getParameter("begin"));
        int end = Integer.parseInt(request.getParameter("end"));
        String[] isC = request.getParameterValues("isC");
        String[] isS = request.getParameterValues("isS");
        String[] isAdmin = request.getParameterValues("isAdmin");
        PrintWriter out = response.getWriter();
        out.print(begin);
        ManagerDAO md = new ManagerDAO();
        ArrayList<Account> acclist = md.getAccount();
        if (end > acclist.size()) {
            end = acclist.size();
        }
        out.print(end);
        for (int x = begin; x < end; x++) {
            boolean flag = false;
            if (isC != null) {
                for (String c : isC) {
                    if (Integer.parseInt(c) == acclist.get(x).getIdA()) {
                        flag = true;
                    }
                }
                acclist.get(x).setIsCustommser(flag);
            }
            if (isS != null) {
                flag = false;
                for (String item : isS) {
                    if (Integer.parseInt(item) == acclist.get(x).getIdA()) {
                        flag = true;
                    }
                }
                if(!flag){
                    md.DeleteProductIdC(acclist.get(x).getIdA());
                }
                acclist.get(x).setIsSaler(flag);
            }
            if (isAdmin != null) {
                flag = false;
                for (String admin : isAdmin) {
                    if (Integer.parseInt(admin) == acclist.get(x).getIdA()) {
                        flag = true;
                    }
                }
                acclist.get(x).setIsAdmin(flag);
            }
            md.UpdateAccount(acclist.get(x));
        }
        request.getRequestDispatcher("ManagerAccount.jsp?IdA=" + IdA + "&page=1").forward(request, response);
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
        ManagerDAO md = new ManagerDAO();
        int IdC = Integer.parseInt(request.getParameter("IdC"));
        int IdA = Integer.parseInt(request.getParameter("IdA"));
        String name = request.getParameter("name");
        String add = request.getParameter("add");
        String phone = request.getParameter("phone");
        String accname = request.getParameter("accname");
        String pass = request.getParameter("pass");
        String submit = request.getParameter("submit");

//        PrintWriter out = response.getWriter();
//        out.println(IdA);
//        out.println(name);
//        out.println(add);
//        out.println(phone);
//        out.println(accname);
//        out.println(pass);
//        out.println(submit);
        if (phone.length() != 10) {
            String error = "Số điện thoại có 10 chữ số!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("AccountPage.jsp?IdA=" + IdA).forward(request, response);
            return;
        }

        if (pass.length() > 10 || pass.length() < 6) {
            String error = "Mật khẩu từ 6 - 10 ký tự!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("AccountPage.jsp?IdA=" + IdA).forward(request, response);
            return;
        }

        ArrayList<Account> acclist = md.getAccount();
//        out.println(acclist);
        for (Account acclist1 : acclist) {
            if (acclist1.getAccountName().equals(accname) && acclist1.getIdA() != IdA) {
                String error = "Tên tài khoản đã tồn tại!";
                request.setAttribute("error", error);
                request.getRequestDispatcher("AccountPage.jsp?IdA=" + IdA).forward(request, response);
                return;
            }
        }

//        if(submit.equals("Thay đổi thông tin tài khoản")){
        Account acc = md.getAccountById(IdA);
        acc.setName(name);
        acc.setAddress(add);
        acc.setPhone(phone);
        acc.setAccountName(accname);
        acc.setPassword(pass);
        md.UpdateAccount(acc);
        request.getRequestDispatcher("AccountPage.jsp?IdA=" + IdA+"&IdC="+IdC).forward(request, response);
//        }else{
//            md.DeleteAccount(IdA);
//        }

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
