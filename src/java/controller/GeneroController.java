/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.GeneroDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.GeneroModel;

public class GeneroController extends HttpServlet {

    GeneroDAO gDAO = new GeneroDAO();
    GeneroModel gModel = new GeneroModel();

    protected void listarGenero(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("generos", gDAO.BuscarTodos());
            request.getRequestDispatcher("Genero/listar.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GeneroController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
            int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));

            switch (accion) {
                case "Genero":
                    listarGenero(request, response);
                    break;
                case "Nuevo":
                    response.sendRedirect("Genero/nuevo.jsp");
                    break;
                case "Editar":
                    request.setAttribute("genero", gDAO.BuscarPorId(id));
                    request.getRequestDispatcher("Genero/editar.jsp").forward(request, response);
                    break;
                case "Eliminar":
                    gDAO.Eliminar(id);
                    listarGenero(request, response);
                    break;
                case "Regresar":
                    listarGenero(request, response);
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
            String nombre = request.getParameter("nombre") == null ? "" : request.getParameter("nombre");

            gModel.setNombre(nombre);

            switch (accion) {
                case "Guardar":
                    gDAO.Insertar(gModel);
                    break;
                case "Actualizar":
                    gModel.setId(Integer.parseInt(request.getParameter("id")));
                    gDAO.Actualizar(gModel);
                    break;
                default:
                    throw new AssertionError();
            }
            listarGenero(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GeneroController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
