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
import model.ComprasModel;

public class ComprasDAO {
    PreparedStatement ps;
    ResultSet rs;
    Conexion conexion = new Conexion();
    Connection conn;
    boolean respuesta = false;

    public ArrayList<ComprasModel> BuscarTodos() throws ClassNotFoundException {
        ArrayList<ComprasModel> lista = new ArrayList<ComprasModel>();
        String sql = "select * from compras inner join peliculas on peliculas.pel_id = compras.pel_id "
                + "inner join usuarios on usuarios.usu_id = compras.usu_id";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                ComprasModel compraTemp = new ComprasModel();
                compraTemp.setId(Integer.parseInt(rs.getString("comp_id")));
                compraTemp.setUsuario(rs.getString("usu_nombre"));
                compraTemp.setPelicula(rs.getString("pel_nombre"));
                compraTemp.setSala(rs.getString("comp_sala"));
                compraTemp.setCantidad(Integer.parseInt(rs.getString("comp_cantidad")));
                compraTemp.setTotal(Float.parseFloat(rs.getString("comp_total")));
                lista.add(compraTemp);
            }
        } catch (SQLException ex) {
            System.out.println("Error al BuscarTodos()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return lista;
    }

    public ArrayList<ComprasModel> BuscarPorId(int id) throws ClassNotFoundException {
        ArrayList<ComprasModel> lista = new ArrayList<ComprasModel>();        
        String sql = "select * from compras inner join peliculas on peliculas.pel_id = compras.pel_id "
                + "inner join usuarios on usuarios.usu_id = compras.usu_id where compras.usu_id = ?";        
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                ComprasModel compraTemp = new ComprasModel();
                compraTemp.setId(Integer.parseInt(rs.getString("comp_id")));
                compraTemp.setUsuario(rs.getString("usu_nombre"));
                compraTemp.setPelicula(rs.getString("pel_nombre"));                
                compraTemp.setSala(rs.getString("comp_sala"));
                compraTemp.setCantidad(Integer.parseInt(rs.getString("comp_cantidad")));
                compraTemp.setTotal(Float.parseFloat(rs.getString("comp_total")));
                lista.add(compraTemp);
            }
        } catch (SQLException ex) {
            System.out.println("Error al BuscarPorId()" + ex.getMessage());
        } finally {
            conexion.Cerrar(conn);
        }
        return lista;
    }

    public boolean Insertar(ComprasModel cModel) throws ClassNotFoundException {
        String sql = "insert into compras(comp_sala,comp_cantidad,comp_total,pel_id,usu_id) values(?,?,?,?,?)";
        try {
            conn = conexion.Conectar();
            ps = conn.prepareStatement(sql);
            ps.setString(1, cModel.getSala());
            ps.setInt(2, cModel.getCantidad());
            ps.setFloat(3, cModel.getTotal());
            ps.setInt(4, cModel.getIdPelicula());
            ps.setInt(5, cModel.getIdUsuario());
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
}
