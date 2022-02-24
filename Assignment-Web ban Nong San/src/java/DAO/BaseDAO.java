package DAO;


import model.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Admin
 */
public abstract class BaseDAO<T> {
    protected Connection connection;
    
    public BaseDAO(){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=NongSan",
                    "sa", "123456");
        }catch(ClassNotFoundException | SQLException ex){
            Logger.getLogger(BaseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
    
    
}
