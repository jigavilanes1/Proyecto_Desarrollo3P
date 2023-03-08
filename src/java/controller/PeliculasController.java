/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.GeneroDAO;
import dao.PeliculasDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PeliculasModel;

public class PeliculasController extends HttpServlet {

    PeliculasDAO pDAO = new PeliculasDAO();
    PeliculasModel pModel = new PeliculasModel();
    GeneroDAO gDAO = new GeneroDAO();

    protected void listarPeliculas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("peliculas", pDAO.BuscarTodos());
            request.getRequestDispatcher("Peliculas/listar.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PeliculasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
            int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));

            switch (accion) {
                case "Peliculas":
                    listarPeliculas(request, response);
                    break;
                case "Cartelera":
                    request.setAttribute("peliculas", pDAO.BuscarTodos());
                    request.getRequestDispatcher("cliente.jsp").forward(request, response);
                    break;
                case "Nuevo":
                    request.setAttribute("generos", gDAO.BuscarTodos());
                    request.getRequestDispatcher("Peliculas/nuevo.jsp").forward(request, response);
                    break;
                case "Editar":
                    request.setAttribute("pelicula", pDAO.BuscarPorId(id));
                    request.setAttribute("generos", gDAO.BuscarTodos());
                    request.getRequestDispatcher("Peliculas/editar.jsp").forward(request, response);
                    break;
                case "Eliminar":
                    pDAO.Eliminar(id);
                    listarPeliculas(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PeliculasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
            String nombre = request.getParameter("nombre") == null ? "" : request.getParameter("nombre");
            int duracion = request.getParameter("duracion") == null ? 0 : Integer.parseInt(request.getParameter("duracion"));
            String sinopsis = request.getParameter("sinopsis") == null ? "" : request.getParameter("sinopsis");
            String foto = request.getParameter("foto") == null ? "" : request.getParameter("foto");

            pModel.setNombre(nombre);
            pModel.setDuracion(duracion);
            pModel.setSinopsis(sinopsis);
            pModel.setFoto(foto);
            pModel.setIdGenero(Integer.parseInt(request.getParameter("idGenero")));

            switch (accion) {
                case "Guardar":
                    pDAO.Insertar(pModel);
                    break;
                case "Actualizar":
                    pModel.setId(Integer.parseInt(request.getParameter("id")));
                    pDAO.Actualizar(pModel);
                    break;
                default:
                    throw new AssertionError();
            }
            listarPeliculas(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PeliculasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
