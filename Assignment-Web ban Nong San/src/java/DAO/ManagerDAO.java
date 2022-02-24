/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Buyer;
import Model.Saler;
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

    public ArrayList getSaler() {
        ArrayList<Saler> salerlist = new ArrayList<>();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM [Salser]");
            while (rs.next()) {
                int id = rs.getInt("IdS");
                String Name = rs.getString("Name");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String AccountName = rs.getString("AccountName");
                String Password = rs.getString("Password"); 
                Saler saler = new Saler(id,Name,Address,Phone,AccountName,Password);
                salerlist.add(saler);
            }
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
        return salerlist;
    }
    
    public ArrayList getBuyer() {
        ArrayList<Buyer> buyerlist = new ArrayList<>();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM [Buyer]");
            while (rs.next()) {
                int id = rs.getInt("IdB");
                String Name = rs.getString("Name");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String AccountName = rs.getString("AccountName");
                String Password = rs.getString("Password"); 
                Buyer buyer = new Buyer(id,Name,Address,Phone,AccountName,Password);
                buyerlist.add(buyer);
            }
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
        return buyerlist;
    }
}
