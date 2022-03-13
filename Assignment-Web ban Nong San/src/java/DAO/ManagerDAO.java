/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import Model.Bill;
import Model.Order;
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
            String sql = "INSERT INTO [Account]( [Name], [Address], [Phone], [AccountName], [Password])\n"
                    + "VALUES('" + acc.getName() + "','" + acc.getAddress() + "','" + acc.getPhone() + "','"
                    + acc.getAccountName() + "','" + acc.getPassword() + "')";
            Connection conn = new BaseDAO().getConnection();
            Statement state = conn.createStatement();
            state.executeUpdate(sql);
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
//        ArrayList<Account> a = n.getAccount();
//        System.out.println(a.get(0).getAccountName());
//        Account acc = n.getAccountById(1);
//        System.out.println(acc.getAccountName());
//        ArrayList<Product> list = n.getProductByIdA(1);
//        System.out.println(list.get(0).getName());
//        Product p = new Product("Mận hậu", 13, new Type(2,"Hoa quả"),"Moc Chau", "https://traicaycaonghe.vn/wp-content/uploads/2021/04/manhau13.jpg",
//                100, 0, n.getAccountById(1));
//        n.createProduct(p);
//        Product p = new Product(30,"Mận hậu", 13, new Type(2,"Hoa quả"),"Moc Chau", "https://traicaycaonghe.vn/wp-content/uploads/2021/04/manhau13.jpg",
//                100, 0, n.getAccountById(1));
//        //System.out.println(p.getIdP()+"/"+p.getName());
//        n.UpdateProduct(p);
        Type t = new Type(6, "Hoa hoét");
        n.UpdateProductType(t);
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

    public Product getProductByIdP(int ID) {
        try {
            Connection conn = new BaseDAO().getConnection();
            PreparedStatement state = conn.prepareStatement("SELECT * FROM [Product] WHERE IdP=" + ID);
            ResultSet rs = state.executeQuery();
            int id = rs.getInt("IdP");
            String Name = rs.getString("Name");
            double Price = rs.getFloat("Price");
            Type Type = getTypeById(rs.getInt("TypeID"));
            String o = rs.getString("Origin");
            String i = rs.getString("image");
            int QuantityStock = rs.getInt("QuantityStock");
            int QuantitySold = rs.getInt("QuantitySold");
            Account acc = getAccountById(rs.getInt("IdC"));
            Product pro = new Product(id, Name, Price, Type, i, i, QuantityStock, QuantitySold, acc);
            return pro;
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList getAllProduct() {
        try {
            ArrayList<Product> prolist = new ArrayList<>();
            Connection conn = new BaseDAO().getConnection();
            PreparedStatement state = conn.prepareStatement("SELECT * FROM [Product]");
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

    public void DeleteProduct(int IdP) {
        try {
            String sql = "DELETE FROM [Product] WHERE IdP=" + IdP;
            Connection conn = new BaseDAO().getConnection();
//            PreparedStatement state = conn.prepareStatement("DELETE FROM [Product] WHERE IdP=" + IdP);
            Statement st = conn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void DeleteAllTypeProductByIdA(int IdA, int IdType) {
        try {
            String sql = "DELETE FROM [Product] WHERE IdC=" + IdA + "AND TypeID=" + IdType;
            Connection conn = new BaseDAO().getConnection();
//            PreparedStatement state = conn.prepareStatement("DELETE FROM [Product] WHERE IdP=" + IdP);
            Statement st = conn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createProduct(Product pro) {
        try {
            String sql = "insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)\n"
                    + "values(N'" + pro.getName() + "'," + pro.getPrice() + "," + pro.getType().getIdType() + ",N'"
                    + pro.getOrigin() + "','" + pro.getImg() + "'," + pro.getQuantitySold() + ","
                    + pro.getQuantityStock() + "," + pro.getAccount().getIdA() + ")";
            Connection conn = new BaseDAO().getConnection();
            Statement state = conn.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createTypeProduct(String typename) {
        try {
            String sql = "insert into Type( NameType)\n"
                    + "values(N'" + typename + "')";
            Connection conn = new BaseDAO().getConnection();
            Statement state = conn.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void UpdateProduct(Product pro) {
        try {
            String sql = "UPDATE [Product] SET [Name]=N'" + pro.getName() + "', [Price]=" + pro.getPrice()
                    + ", [TypeId]=" + pro.getType().getIdType() + ", [Origin]=N'" + pro.getOrigin()
                    + "', [image]='" + pro.getImg() + "', [QuantityStock]=" + pro.getQuantityStock()
                    + " WHERE IdP = " + pro.getIdP();
            Connection conn = new BaseDAO().getConnection();
            Statement state = conn.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList getProductTypeByIdA(int IdA) {
        try {
            ArrayList<Type> typelist = new ArrayList<>();
            Connection conn = new BaseDAO().getConnection();
            PreparedStatement state = conn.prepareStatement("SELECT DISTINCT A.ID, A.NameType\n"
                    + "FROM [Type] AS A JOIN [Product] AS B ON A.ID = B.TypeID\n"
                    + "WHERE B.IdC =" + IdA);
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

    public void DeleteProductType(int IdT) {
        try {
            String sql = "DELETE FROM [Type] WHERE ID=" + IdT;
            Connection conn = new BaseDAO().getConnection();
//            PreparedStatement state = conn.prepareStatement("DELETE FROM [Product] WHERE IdP=" + IdP);
            Statement st = conn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void UpdateProductType(Type type) {
        try {
            String sql = "UPDATE [Type] SET [NameType]=N'" + type.getTypeName() + "'\n"
                    + "WHERE ID = " + type.getIdType();
            Connection conn = new BaseDAO().getConnection();
            Statement state = conn.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void CreateTotalBill(int IdA){
        try {
            String sql = "INSERT INTO [TotalBill] ([IdC])\n"+
                            "VALUES("+IdA+")";
            Connection conn = new BaseDAO().getConnection();
            Statement state = conn.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList getTotalBill(int IdA) {
        try {
            ArrayList<Bill> billlist = new ArrayList<>();
            Connection conn = new BaseDAO().getConnection();
            PreparedStatement state = conn.prepareStatement("SELECT * FROM [TotalBill] WHERE IdC = "+IdA);
            ResultSet rs = state.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("IdTB");
                double Price = rs.getFloat("TotalMoney");
                int idA = rs.getInt("IdC");
                int Quantity = rs.getInt("QuantitySold");
                String OderTime = rs.getString("OrderTime");
                Bill bill = new Bill(idA, Price, idA, OderTime);
                billlist.add(bill);
            }
            return billlist;
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void CreateOrder(Order order){
        try {
            String sql = "INSERT INTO [Orders] ([IdC],[IdTb],[IdP],[NameP],[PriceP],[Quantity])\n"+
                            "VALUES("+order.getAccount().getIdA()+","+order.getIdB()+","+
                            order.getProduct().getIdP()+","+order.getProduct().getName()+","+
                            order.getProduct().getPrice()+","+order.getQuantity()+")";
            Connection conn = new BaseDAO().getConnection();
            Statement state = conn.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList getOrder(int IdA){
        try {
            ArrayList<Order> orderlist = new ArrayList<>();
            Connection conn = new BaseDAO().getConnection();
            PreparedStatement state = conn.prepareStatement("SELECT * FROM [Orders] WHERE IdC =" + IdA);
            ResultSet rs = state.executeQuery();
            while (rs.next()) {
                int idO = rs.getInt("IdO");
                Account acc = getAccountById(rs.getInt("IdC"));
                int idB = rs.getInt("IdTB");
                Product pro = getProductByIdP(rs.getInt("IdP"));
                int quantity = rs.getInt("Quantity");
                Order order = new Order(idO, acc, idB, pro, quantity);
                orderlist.add(order);
            }
            return orderlist;
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
