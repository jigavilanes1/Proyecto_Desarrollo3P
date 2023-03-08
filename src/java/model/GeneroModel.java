/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class GeneroModel {
    protected int Id;
    protected String Nombre;
    protected int Estado;

    public GeneroModel() {
    }

    public GeneroModel(int Id, String Nombre, int Estado) {
        this.Id = Id;
        this.Nombre = Nombre;
        this.Estado = Estado;
    }    

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }       

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }        
}
