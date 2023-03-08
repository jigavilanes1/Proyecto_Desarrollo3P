/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.GeneroModel;

public class GeneroDAO {
    PreparedStatement ps;
    ResultSet rs;
    Conexion conexion = new Conexion();
    Connection conn;
    boolean respuesta = false;
    
    public ArrayList<GeneroModel> BuscarTodos() throws ClassNotFoundException {
        ArrayList<GeneroModel> lista = new ArrayList<GeneroModel>();
        String sql = "select * from genero where gen_estado = 1";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()) {
                GeneroModel generoTemp = new GeneroModel();
                generoTemp.setId(Integer.parseInt(rs.getString("gen_id")));
                generoTemp.setNombre(rs.getString("gen_nombre"));                
                generoTemp.setEstado(Integer.parseInt(rs.getString("gen_estado")));
                lista.add(generoTemp);
            }            
        } catch(SQLException ex) {
            System.out.println("Error al BuscarTodos()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return lista;
    }
    
    public GeneroModel BuscarPorId(int id) throws ClassNotFoundException {
        GeneroModel generoTemp = new GeneroModel();
        
        String sql = "select * from genero where gen_id = ? and gen_estado = 1";        
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()) {
                generoTemp.setId(Integer.parseInt(rs.getString("gen_id")));
                generoTemp.setNombre(rs.getString("gen_nombre"));                
                generoTemp.setEstado(Integer.parseInt(rs.getString("gen_estado")));                
            }
        } catch (SQLException ex) {
            System.out.println("Error al BuscarPorId()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return generoTemp;
    }
    
    public boolean Insertar(GeneroModel gModel) throws ClassNotFoundException {
        String sql = "insert into genero(gen_nombre,gen_estado) values(?,1)";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);            
            ps.setString(1, gModel.getNombre());            
            if(ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException ex) {
            System.out.println("Error al Insertar()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return respuesta;
    }
    
    public boolean Actualizar(GeneroModel gModel) throws ClassNotFoundException {
        String sql = "update genero set gen_nombre = ? where gen_id = ?";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);            
            ps.setString(1, gModel.getNombre());
            ps.setInt(2, gModel.getId());            
            if(ps.executeUpdate() > 0) {
                respuesta = true;
            }
        }catch (SQLException ex) {
            System.out.println("Error al Actualizar()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return respuesta;
    }
    
    public boolean Eliminar(int id) throws ClassNotFoundException{
        String sql = "update genero set gen_estado = 0 where gen_id = ?";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);                                  
            ps.setInt(1, id);
            if(ps.executeUpdate() > 0) {
                respuesta = true;
            }
        }catch (SQLException ex) {
            System.out.println("Error al Eliminar()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return respuesta;
    }    
}
