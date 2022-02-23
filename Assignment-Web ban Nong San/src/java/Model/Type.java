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
public class Type {
    private int IdType;
    private String TypeName;

    public Type() {
    }

    public Type(int IdType, String TypeName) {
        this.IdType = IdType;
        this.TypeName = TypeName;
    }

    public void setIdType(int IdType) {
        this.IdType = IdType;
    }

    public void setTypeName(String TypeName) {
        this.TypeName = TypeName;
    }

    public int getIdType() {
        return IdType;
    }

    public String getTypeName() {
        return TypeName;
    }
    
    
}
