/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Bill {
    private int IDB;
    private ArrayList<Order> Order;
    private double TotalMoney;
    private Account Buyer;
    private String OrderTime;
    private String DeliveryTime;

    public Bill() {
    }

    public Bill(int IDB, ArrayList<Order> Order, double TotalMoney, Account Buyer, String OrderTime, String DeliveryTime) {
        this.IDB = IDB;
        this.Order = Order;
        this.TotalMoney = TotalMoney;
        this.Buyer = Buyer;
        this.OrderTime = OrderTime;
        this.DeliveryTime = DeliveryTime;
    }

    public int getIDB() {
        return IDB;
    }

    public void setIDB(int IDB) {
        this.IDB = IDB;
    }

    public ArrayList<Order> getOrder() {
        return Order;
    }

    public void setOrder(ArrayList<Order> Order) {
        this.Order = Order;
    }

    public double getTotalMoney() {
        return TotalMoney;
    }

    public void setTotalMoney(double TotalMoney) {
        this.TotalMoney = TotalMoney;
    }

    public Account getBuyer() {
        return Buyer;
    }

    public void setBuyer(Account Buyer) {
        this.Buyer = Buyer;
    }

    public String getOrderTime() {
        return OrderTime;
    }

    public void setOrderTime(String OrderTime) {
        this.OrderTime = OrderTime;
    }

    public String getDeliveryTime() {
        return DeliveryTime;
    }

    public void setDeliveryTime(String DeliveryTime) {
        this.DeliveryTime = DeliveryTime;
    }
    
    
}
