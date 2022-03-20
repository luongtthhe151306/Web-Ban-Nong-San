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
public class Account {
    private int IdA;
    private String Name;
    private String Address;
    private String Phone;
    private String AccountName;
    private String Password;
    private boolean isSaler;
    private boolean isCustommser;
    private boolean isAdmin;

    public Account(String Name, String Address, String Phone, String AccountName, String Password, boolean isCustommser) {
        this.Name = Name;
        this.Address = Address;
        this.Phone = Phone;
        this.AccountName = AccountName;
        this.Password = Password;
        this.isCustommser = isCustommser;
    }

    public Account(String Name, String Address, String Phone, String AccountName, String Password) {
        this.Name = Name;
        this.Address = Address;
        this.Phone = Phone;
        this.AccountName = AccountName;
        this.Password = Password;
    }

    public Account(int IdA, String Name, String Address, String Phone, String AccountName, String Password, boolean isSaler, boolean isCustommser, boolean isAdmin) {
        this.IdA = IdA;
        this.Name = Name;
        this.Address = Address;
        this.Phone = Phone;
        this.AccountName = AccountName;
        this.Password = Password;
        this.isSaler = isSaler;
        this.isCustommser = isCustommser;
        this.isAdmin = isAdmin;
    }

    public Account() {
    }

    public int getIdA() {
        return IdA;
    }

    public void setIdA(int IdA) {
        this.IdA = IdA;
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

    public boolean isIsSaler() {
        return isSaler;
    }

    public void setIsSaler(boolean isSaler) {
        this.isSaler = isSaler;
    }

    public boolean isIsCustommser() {
        return isCustommser;
    }

    public void setIsCustommser(boolean isCustommser) {
        this.isCustommser = isCustommser;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
    
}
