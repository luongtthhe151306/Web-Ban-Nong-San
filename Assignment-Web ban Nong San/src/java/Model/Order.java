/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Admin
 */
public class Order {
    private int IdO;
    private String ProductName;
    private double Price;
    private int Quantity;

    public Order() {
    }

    public Order(int IdO, String ProductName, double Price, int Quantity) {
        this.IdO = IdO;
        this.ProductName = ProductName;
        this.Price = Price;
        this.Quantity = Quantity;
    }

    public int getIdO() {
        return IdO;
    }

    public void setIdO(int IdO) {
        this.IdO = IdO;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }
    
    
}
