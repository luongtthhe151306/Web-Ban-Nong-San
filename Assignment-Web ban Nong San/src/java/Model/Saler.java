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
public class Saler {
    private int IdS;
    private String Name;
    private String Address;
    private String Phone;
    private String AccountName;
    private String Password;

    public Saler(int IdS, String Name, String Address, String Phone, String AccountName, String Password) {
        this.IdS = IdS;
        this.Name = Name;
        this.Address = Address;
        this.Phone = Phone;
        this.AccountName = AccountName;
        this.Password = Password;
    }

    public Saler() {
    }

    public int getIdS() {
        return IdS;
    }

    public void IdS(int IdS) {
        this.IdS = IdS;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getAccountName() {
        return AccountName;
    }

    public void setAccountName(String AccountName) {
        this.AccountName = AccountName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
    
}
