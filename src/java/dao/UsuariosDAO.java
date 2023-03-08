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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.UsuariosModel;

public class UsuariosDAO {
    PreparedStatement ps;
    ResultSet rs;
    Conexion conexion = new Conexion();
    Connection conn;
    boolean respuesta = false;
    
    public ArrayList<UsuariosModel> BuscarTodos(int tipo) throws ClassNotFoundException {
        ArrayList<UsuariosModel> lista = new ArrayList<UsuariosModel>();
        String sql = "select * from usuarios where usu_tipo = ? and usu_estado = 1";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, tipo);
            rs = ps.executeQuery();            
            while(rs.next()) {
                UsuariosModel usuarioTemp = new UsuariosModel();
                usuarioTemp.setId(Integer.parseInt(rs.getString("usu_id")));
                usuarioTemp.setNombre(rs.getString("usu_nombre"));
                usuarioTemp.setUser(rs.getString("usu_user"));                
                usuarioTemp.setCedula(rs.getString("usu_cedula"));
                usuarioTemp.setEmail(rs.getString("usu_email"));                
                usuarioTemp.setGenero(rs.getString("usu_genero"));
                lista.add(usuarioTemp);
            }            
        } catch(SQLException ex) {
            System.out.println("Error al BuscarTodos()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return lista;
    }
    
    public UsuariosModel BuscarPorId(int id) throws ClassNotFoundException {
        UsuariosModel usuarioTemp = new UsuariosModel();
        
        String sql = "select * from usuarios where usu_id = ? and usu_estado = 1";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()) {
                usuarioTemp.setId(Integer.parseInt(rs.getString("usu_id")));
                usuarioTemp.setNombre(rs.getString("usu_nombre"));
                usuarioTemp.setUser(rs.getString("usu_user"));                
                usuarioTemp.setCedula(rs.getString("usu_cedula"));
                usuarioTemp.setEmail(rs.getString("usu_email"));
                usuarioTemp.setGenero(rs.getString("usu_genero"));                
                usuarioTemp.setTipo(Integer.parseInt(rs.getString("usu_tipo")));
            }
        } catch (SQLException ex) {
            System.out.println("Error al BuscarPorId()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return usuarioTemp;
    }
    
    public boolean InsertarUsuario(UsuariosModel uModel) throws ClassNotFoundException {
        String sql = "insert into usuarios(usu_nombre,usu_user,usu_password,usu_cedula,usu_email,"
                + "usu_genero,usu_tipo,usu_estado) values(?,?,?,?,?,?,1,1)";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);            
            ps.setString(1, uModel.getNombre());
            ps.setString(2, uModel.getUser());
            ps.setString(3, uModel.getPassword());
            ps.setString(4, uModel.getCedula());
            ps.setString(5, uModel.getEmail());
            ps.setString(6, uModel.getGenero());            
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
    
    public boolean InsertarCliente(UsuariosModel uModel) throws ClassNotFoundException {
        String sql = "insert into usuarios(usu_nombre,usu_user,usu_password,usu_cedula,usu_email,"
                + "usu_genero,usu_tipo,usu_estado) values(?,?,?,?,?,?,2,1)";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);            
            ps.setString(1, uModel.getNombre());
            ps.setString(2, uModel.getUser());
            ps.setString(3, uModel.getPassword());
            ps.setString(4, uModel.getCedula());
            ps.setString(5, uModel.getEmail());
            ps.setString(6, uModel.getGenero());            
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
    
    public boolean Actualizar(UsuariosModel uModel) throws ClassNotFoundException {
        String sql = "update usuarios set usu_nombre = ?, usu_user = ?,usu_cedula = ?,usu_email = ?,"
                + "usu_genero = ? where usu_id = ?";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);            
            ps.setString(1, uModel.getNombre());
            ps.setString(2, uModel.getUser());            
            ps.setString(3, uModel.getCedula());
            ps.setString(4, uModel.getEmail());
            ps.setString(5, uModel.getGenero());            
            ps.setInt(6, uModel.getId());
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
        String sql = "update usuarios set usu_estado = 0 where usu_id = ?";
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
    
    public UsuariosModel Login(String usuario, String clave) throws SQLException{
        UsuariosModel uModelTemp = new UsuariosModel();
        try {
            String sql = "select * from usuarios where usu_user = ? and usu_password = ? and usu_estado = 1";
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);   
            ps.setString(1, usuario);
            ps.setString(2, clave);
            rs = ps.executeQuery();
            while (rs.next()) {                
                uModelTemp.setId(rs.getInt("usu_id"));
                uModelTemp.setNombre(rs.getString("usu_nombre"));                
                uModelTemp.setCedula(rs.getString("usu_cedula"));
                uModelTemp.setEmail(rs.getString("usu_email"));
                uModelTemp.setGenero(rs.getString("usu_genero"));
                uModelTemp.setTipo(Integer.parseInt(rs.getString("usu_tipo")));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuariosDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexion.Cerrar(conn);
        }
        return uModelTemp;
    }
}
