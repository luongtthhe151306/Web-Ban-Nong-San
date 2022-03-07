/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import Model.Product;
import Model.Type;
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
public class ManagerDAO extends BaseDAO {
    
    public ArrayList getAccount() {
        try {
            ArrayList<Account> acclist = new ArrayList<>();
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM [Account]");
            while (rs.next()) {
                int id = rs.getInt("IdC");
                String Name = rs.getString("Name");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String AccountName = rs.getString("AccountName");
                String Password = rs.getString("Password"); 
                Account acc = new Account(id,Name,Address,Phone,AccountName,Password);
                acclist.add(acc);
            }
            return acclist;
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
    public void createAccount(Account acc) {
        try {
            String sql = "INSERT INTO [Account]( [Name], [Address], [Phone], [AccountName], [Password])\n" +
                         "VALUES('"+ acc.getName()+"','"+acc.getAddress()+"','"+acc.getPhone()+"','"
                                 +acc.getAccountName()+"','"+acc.getPassword()+"')";
            Statement st = connection.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList getProductType(){
        try {
            ArrayList<Type> typelist = new ArrayList<>();
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM [Type]");
            while (rs.next()) {
                int id = rs.getInt("ID");
                String Name = rs.getString("NameType"); 
                Type acc = new Type(id,Name);
                typelist.add(acc);
            }
            return typelist;
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
    public Type getTypeById(int id){
        ArrayList<Type> typelist = getProductType();
        for (Type typelist1 : typelist) {
            if(typelist1.getIdType() == id){
                return typelist1;
            }
        }
        return null;
    }
    
    public Account getAccountById(int id){
        ArrayList<Account> acclist = getAccount();
        for (Account acclist1 : acclist) {
            if(acclist1.getIdA() == id){
                return acclist1;
            }
        }
        return null;
    }
    
    public ArrayList getProduct( int ID) {
        try {
            ArrayList<Product> prolist = new ArrayList<>();
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM [Product] WHERE TypeID="+ID);
            while (rs.next()) {
                int id = rs.getInt("Idp");
                String Name = rs.getString("Name");
                double Price = rs.getFloat("Price");
                Type Type = getTypeById(rs.getInt("TypeID"));
                String Origin = rs.getString("Origin");
                String img = rs.getString("image");
                int QuantityStock = rs.getInt("QuantityStock");
                int QuantitySold = rs.getInt("QuantitySold");
                Account IdC = getAccountById(rs.getInt("IdC"));
                Product acc = new Product(id,Name,Price,Type, Origin, img, QuantityStock, QuantitySold, IdC);
                prolist.add(acc);
            }
            return prolist;
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
}
