/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class PeliculasModel {
    protected int Id;
    protected String Nombre;
    protected int IdGenero;
    protected int Duracion;
    protected String Sinopsis;
    protected String Foto;
    protected String Genero;
    protected int Estado;

    public PeliculasModel() {
    }

    public PeliculasModel(int Id, String Nombre, int IdGenero, int Duracion, String Sinopsis, String Foto, int Estado) {
        this.Id = Id;
        this.Nombre = Nombre;
        this.IdGenero = IdGenero;
        this.Duracion = Duracion;
        this.Sinopsis = Sinopsis;
        this.Foto = Foto;
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

    public int getIdGenero() {
        return IdGenero;
    }

    public void setIdGenero(int IdGenero) {
        this.IdGenero = IdGenero;
    }

    public int getDuracion() {
        return Duracion;
    }

    public void setDuracion(int Duracion) {
        this.Duracion = Duracion;
    }

    public String getSinopsis() {
        return Sinopsis;
    }

    public void setSinopsis(String Sinopsis) {
        this.Sinopsis = Sinopsis;
    }

    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }
    
    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }
}
