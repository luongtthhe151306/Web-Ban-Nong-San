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
    private int IdB;
    private double TotalMoney;
    private int IdA;
    private String OrderTime;

    public Bill() {
    }

    public Bill(int IdB, int IdA) {
        this.IdB = IdB;
        this.IdA = IdA;
    }
    
    public Bill(double TotalMoney, int IdA, String OrderTime) {
        this.TotalMoney = TotalMoney;
        this.IdA = IdA;
        this.OrderTime = OrderTime;
    }

    public Bill(int IdB, double TotalMoney, int IdA, String OrderTime) {
        this.IdB = IdB;
        this.TotalMoney = TotalMoney;
        this.IdA = IdA;
        this.OrderTime = OrderTime;
    }

    public int getIdB() {
        return IdB;
    }

    public void setIdB(int IdB) {
        this.IdB = IdB;
    }

    public double getTotalMoney() {
        return TotalMoney;
    }

    public void setTotalMoney(double TotalMoney) {
        this.TotalMoney = TotalMoney;
    }

    public int getIdA() {
        return IdA;
    }

    public void setIdA(int IdA) {
        this.IdA = IdA;
    }

    public String getOrderTime() {
        return OrderTime;
    }

    public void setOrderTime(String OrderTime) {
        this.OrderTime = OrderTime;
    }
 
}
