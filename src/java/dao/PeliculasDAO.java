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
import model.PeliculasModel;

public class PeliculasDAO {
    PreparedStatement ps;
    ResultSet rs;
    Conexion conexion = new Conexion();
    Connection conn;
    boolean respuesta = false;

    public ArrayList<PeliculasModel> BuscarTodos() throws ClassNotFoundException {
        ArrayList<PeliculasModel> lista = new ArrayList<PeliculasModel>();
        String sql = "select * from peliculas inner join genero on genero.gen_id = peliculas.gen_id where pel_estado = 1";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                PeliculasModel peliculaTemp = new PeliculasModel();
                peliculaTemp.setId(Integer.parseInt(rs.getString("pel_id")));
                peliculaTemp.setNombre(rs.getString("pel_nombre"));
                peliculaTemp.setGenero(rs.getString("gen_nombre"));
                peliculaTemp.setDuracion(Integer.parseInt(rs.getString("pel_duracion")));
                peliculaTemp.setSinopsis(rs.getString("pel_sinopsis"));
                peliculaTemp.setFoto(rs.getString("pel_foto"));
                lista.add(peliculaTemp);
            }
        } catch (SQLException ex) {
            System.out.println("Error al BuscarTodos()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return lista;
    }

    public PeliculasModel BuscarPorId(int id) throws ClassNotFoundException {
        PeliculasModel peliculaTemp = new PeliculasModel();
        String sql = "select * from peliculas where pel_id = ? and pel_estado = 1";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                peliculaTemp.setId(Integer.parseInt(rs.getString("pel_id")));
                peliculaTemp.setNombre(rs.getString("pel_nombre"));
                peliculaTemp.setIdGenero(Integer.parseInt(rs.getString("gen_id")));
                peliculaTemp.setDuracion(Integer.parseInt(rs.getString("pel_duracion")));
                peliculaTemp.setSinopsis(rs.getString("pel_sinopsis"));
                peliculaTemp.setFoto(rs.getString("pel_foto"));
            }
        } catch (SQLException ex) {
            System.out.println("Error al BuscarPorId()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return peliculaTemp;
    }

    public boolean Insertar(PeliculasModel pModel) throws ClassNotFoundException {
        String sql = "insert into peliculas(pel_nombre,gen_id,pel_duracion,pel_sinopsis,pel_foto,pel_estado) values(?,?,?,?,?,1)";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);
            ps.setString(1, pModel.getNombre());
            ps.setInt(2, pModel.getIdGenero());
            ps.setInt(3, pModel.getDuracion());
            ps.setString(4, pModel.getSinopsis());
            ps.setString(5, pModel.getFoto());
            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException ex) {
            System.out.println("Error al Insertar()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return respuesta;
    }

    public boolean Actualizar(PeliculasModel pModel) throws ClassNotFoundException {
        String sql = "update peliculas set pel_nombre = ?, gen_id = ?, pel_duracion = ?, pel_sinopsis = ?, pel_foto = ? where pel_id = ?";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);
            ps.setString(1, pModel.getNombre());
            ps.setInt(2, pModel.getIdGenero());
            ps.setInt(3, pModel.getDuracion());
            ps.setString(4, pModel.getSinopsis());
            ps.setString(5, pModel.getFoto());            
            ps.setInt(6, pModel.getId());
            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException ex) {
            System.out.println("Error al Actualizar()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return respuesta;
    }

    public boolean Eliminar(int id) throws ClassNotFoundException {
        String sql = "update peliculas set pel_estado = 0 where pel_id = ?";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);                        
            ps.setInt(1, id);
            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException ex) {
            System.out.println("Error al Eliminar()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return respuesta;
    }
}
