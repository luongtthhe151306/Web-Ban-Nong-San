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
    private Account Account;
    private int IdB;
    private Product Product;
    private int Quantity;
    private int payment;

    public Order(Account Account, int IdB, Product Product, int Quantity, int payment) {
        this.Account = Account;
        this.IdB = IdB;
        this.Product = Product;
        this.Quantity = Quantity;
        this.payment = payment;
    }

    public Order() {
    }

    public Order(int IdO, Account Account, int IdB, Product Product, int Quantity, int payment) {
        this.IdO = IdO;
        this.Account = Account;
        this.IdB = IdB;
        this.Product = Product;
        this.Quantity = Quantity;
        this.payment = payment;
    }

    public int getIdO() {
        return IdO;
    }

    public void setIdO(int IdO) {
        this.IdO = IdO;
    }

    public Account getAccount() {
        return Account;
    }

    public void setAccount(Account Account) {
        this.Account = Account;
    }

    public int getIdB() {
        return IdB;
    }

    public void setIdB(int IdB) {
        this.IdB = IdB;
    }

    public Product getProduct() {
        return Product;
    }

    public void setProduct(Product Product) {
        this.Product = Product;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }
    
}
