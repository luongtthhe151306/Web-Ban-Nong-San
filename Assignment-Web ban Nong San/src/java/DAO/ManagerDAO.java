/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import Model.Product;
import Model.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class ManagerDAO {

    public ArrayList getAccount() {
        try {
            Connection conn = new BaseDAO().getConnection();
            PreparedStatement state = conn.prepareStatement("SELECT * FROM [Account]");
            ResultSet rs = state.executeQuery();
            ArrayList<Account> acclist = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("IdC");
                String Name = rs.getString("Name");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String AccountName = rs.getString("AccountName");
                String Password = rs.getString("Password");
                Account acc = new Account(id, Name, Address, Phone, AccountName, Password);
                acclist.add(acc);
            }
            return acclist;
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
    

    public void createAccount(Account acc) {
        try {
            Connection conn = new BaseDAO().getConnection();
            PreparedStatement state = conn.prepareStatement("INSERT INTO [Account]( [Name], [Address], [Phone], [AccountName], [Password])\n"
                    + "VALUES('" + acc.getName() + "','" + acc.getAddress() + "','" + acc.getPhone() + "','"
                    + acc.getAccountName() + "','" + acc.getPassword() + "')");
            ResultSet rs = state.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList getProductType() {
        try {
            ArrayList<Type> typelist = new ArrayList<>();
            Connection conn = new BaseDAO().getConnection();
            PreparedStatement state = conn.prepareStatement("SELECT * FROM [Type]");
            ResultSet rs = state.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String Name = rs.getString("NameType");
                Type acc = new Type(id, Name);
                typelist.add(acc);
            }
            return typelist;
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Type getTypeById(int id) {
        ArrayList<Type> typelist = getProductType();
        for (Type typelist1 : typelist) {
            if (typelist1.getIdType() == id) {
                return typelist1;
            }
        }
        return null;
    }
    
    public static void main(String[] args) {
        ManagerDAO n = new ManagerDAO();
        ArrayList<Account> a = n.getAccount();
        System.out.println(a.get(0).getAccountName());
        Account acc = n.getAccountById(1);
        System.out.println(acc.getAccountName());
        ArrayList<Product> list = n.getProductByIdA(1);
        System.out.println(list.get(0).getName());
    }

    public Account getAccountById(int id) {
        ArrayList<Account> acclist = getAccount();
        for (Account acclist1 : acclist) {
            if (acclist1.getIdA() == id) {
                return acclist1;
            }
        }
        return null;
    }

    public ArrayList getProduct(int ID) {
        try {
            ArrayList<Product> prolist = new ArrayList<>();
            Connection conn = new BaseDAO().getConnection();
            PreparedStatement state = conn.prepareStatement("SELECT * FROM [Product] WHERE TypeID=" + ID);
            ResultSet rs = state.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("IdP");
                String Name = rs.getString("Name");
                double Price = rs.getFloat("Price");
                Type Type = getTypeById(rs.getInt("TypeID"));
                String o = rs.getString("Origin");
                String i = rs.getString("image");
                int QuantityStock = rs.getInt("QuantityStock");
                int QuantitySold = rs.getInt("QuantitySold");
                Account IdC = getAccountById(rs.getInt("IdC"));
                Product acc = new Product(id, Name, Price, Type, o, i, QuantityStock, QuantitySold, IdC);
                prolist.add(acc);
            }
            return prolist;
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList getProductByIdA(int IdA) {
        try {
            ArrayList<Product> prolist = new ArrayList<>();
            Connection conn = new BaseDAO().getConnection();
            PreparedStatement state = conn.prepareStatement("SELECT * FROM [Product] WHERE IdC=" + IdA);
            ResultSet rs = state.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("IdP");
                String Name = rs.getString("Name");
                double Price = rs.getFloat("Price");
                Type Type = getTypeById(rs.getInt("TypeID"));
                String o = rs.getString("Origin");
                String i = rs.getString("image");
                int QuantityStock = rs.getInt("QuantityStock");
                int QuantitySold = rs.getInt("QuantitySold");
                Account IdC = getAccountById(rs.getInt("IdC"));
                Product acc = new Product(id, Name, Price, Type, o, i, QuantityStock, QuantitySold, IdC);
                prolist.add(acc);
            }
            return prolist;
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}