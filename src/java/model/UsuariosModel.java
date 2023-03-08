/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class UsuariosModel {
    protected int Id;
    protected String Nombre;
    protected String User;
    protected String Password;
    protected String Cedula;
    protected String Email;
    protected String Genero;
    protected int Tipo;
    protected int Estado;

    public UsuariosModel() {
    }

    public UsuariosModel(int Id, String Nombre, String User, String Password, String Cedula, String Email, String Genero, int Tipo, int Estado) {
        this.Id = Id;
        this.Nombre = Nombre;
        this.User = User;
        this.Password = Password;
        this.Cedula = Cedula;
        this.Email = Email;
        this.Genero = Genero;
        this.Tipo = Tipo;
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

    public String getUser() {
        return User;
    }

    public void setUser(String User) {
        this.User = User;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getCedula() {
        return Cedula;
    }

    public void setCedula(String Cedula) {
        this.Cedula = Cedula;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }

    public int getTipo() {
        return Tipo;
    }

    public void setTipo(int Tipo) {
        this.Tipo = Tipo;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }       
}
