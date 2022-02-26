/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
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
}
