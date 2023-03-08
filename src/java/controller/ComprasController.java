/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ComprasDAO;
import dao.PeliculasDAO;
import dao.UsuariosDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ComprasModel;

public class ComprasController extends HttpServlet {
    
    ComprasDAO cDAO = new ComprasDAO();
    ComprasModel cModel = new ComprasModel();
    UsuariosDAO uDAO = new UsuariosDAO();
    PeliculasDAO pDAO = new PeliculasDAO();

    protected void listarCompras(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("compras", cDAO.BuscarTodos());
            request.getRequestDispatcher("administrador.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ComprasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }       
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
            int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
            int idP = request.getParameter("idP") == null ? 0 : Integer.parseInt(request.getParameter("idP"));

            switch (accion) {
                case "Historial":
                    request.setAttribute("historial", cDAO.BuscarPorId(id));
                    request.getRequestDispatcher("Cliente/historial.jsp").forward(request, response);
                    break;
                case "Comprar":                    
                    request.setAttribute("usuario", uDAO.BuscarPorId(id));
                    request.setAttribute("pelicula", pDAO.BuscarPorId(idP));
                    request.getRequestDispatcher("Cliente/compra.jsp").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GeneroController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
            String sala = request.getParameter("sala") == null ? "" : request.getParameter("sala");
            int cantidad = request.getParameter("cantidad") == null ? 0 : Integer.parseInt(request.getParameter("cantidad"));
            float total = request.getParameter("total") == null ? 0 : Float.parseFloat(request.getParameter("total"));            
            int usuario = request.getParameter("usuario") == null ? 0 : Integer.parseInt(request.getParameter("usuario"));
            int pelicula = request.getParameter("pelicula") == null ? 0 : Integer.parseInt(request.getParameter("pelicula"));

            cModel.setSala(sala);
            cModel.setCantidad(cantidad);
            cModel.setTotal(total);
            cModel.setIdUsuario(usuario);
            cModel.setIdPelicula(pelicula);

            switch (accion) {
                case "Guardar":
                    cDAO.Insertar(cModel);
                    break;          
                default:
                    throw new AssertionError();
            }
            response.sendRedirect("PeliculasController?accion=Cartelera");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PeliculasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
