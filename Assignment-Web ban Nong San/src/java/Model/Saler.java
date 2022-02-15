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
    private String DOB;
    private boolean gender;
    private String Gmail;
    private String Phone;

    public Saler(int IdS, String Name, String DOB, boolean gender, String Gmail, String Phone) {
        this.IdS = IdS;
        this.Name = Name;
        this.DOB = DOB;
        this.gender = gender;
        this.Gmail = Gmail;
        this.Phone = Phone;
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

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getGmail() {
        return Gmail;
    }

    public void setGmail(String Gmail) {
        this.Gmail = Gmail;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }
    
}
