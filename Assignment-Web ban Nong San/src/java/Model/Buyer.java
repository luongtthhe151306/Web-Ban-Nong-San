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
public class Buyer {
    private int IdBuy;
    private String Name;
    private String Address;
    private String Phone;

    public Buyer() {
    }

    public Buyer(int IdBuy, String Name, String Address, String Phone) {
        this.IdBuy = IdBuy;
        this.Name = Name;
        this.Address = Address;
        this.Phone = Phone;
    }

    public int getIdBuy() {
        return IdBuy;
    }

    public void setIdBuy(int IdBuy) {
        this.IdBuy = IdBuy;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }
    
    
}
