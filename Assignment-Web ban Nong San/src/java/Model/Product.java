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
public class Product {
    private int IdP;
    private String Name;
    private double Price;
    private String Type;
    private String Origin;
    private String Img;
    private int QuantityStock;
    private int QuantitySold;
    private int IdSaler;

    public Product() {
    }

    public Product(int IdP, String Name, double Price, String Type, String Origin, String Img, int QuantityStock, int QuantitySold, int IdSaler) {
        this.IdP = IdP;
        this.Name = Name;
        this.Price = Price;
        this.Type = Type;
        this.Origin = Origin;
        this.Img = Img;
        this.QuantityStock = QuantityStock;
        this.QuantitySold = QuantitySold;
        this.IdSaler = IdSaler;
    }

    public int getIdP() {
        return IdP;
    }

    public void setIdP(int IdP) {
        this.IdP = IdP;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    public String getOrigin() {
        return Origin;
    }

    public void setOrigin(String Origin) {
        this.Origin = Origin;
    }

    public String getImg() {
        return Img;
    }

    public void setImg(String Img) {
        this.Img = Img;
    }

    public int getQuantityStock() {
        return QuantityStock;
    }

    public void setQuantityStock(int QuantityStock) {
        this.QuantityStock = QuantityStock;
    }

    public int getQuantitySold() {
        return QuantitySold;
    }

    public void setQuantitySold(int QuantitySold) {
        this.QuantitySold = QuantitySold;
    }

    public int getIdSaler() {
        return IdSaler;
    }

    public void setIdSaler(int IdSaler) {
        this.IdSaler = IdSaler;
    }
    
}
