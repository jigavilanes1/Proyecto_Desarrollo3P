/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UsuariosDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UsuariosModel;

public class UsuariosController extends HttpServlet {

    UsuariosDAO uDAO = new UsuariosDAO();
    UsuariosModel uModel = new UsuariosModel();

    protected void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("usuarios", uDAO.BuscarTodos(1));
            request.getRequestDispatcher("Usuarios/listarUsuarios.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuariosController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    protected void listarClientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("clientes", uDAO.BuscarTodos(2));
            request.getRequestDispatcher("Usuarios/listarClientes.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuariosController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
            int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
            switch (accion) {
                case "Usuarios":
                    listarUsuarios(request, response);
                    break;
                case "Clientes":
                    listarClientes(request, response);
                    break;
                case "Nuevo":
                    response.sendRedirect("Usuarios/nuevo.jsp");
                    break;
                case "Editar":
                    request.setAttribute("usuario", uDAO.BuscarPorId(id));                  
                    request.getRequestDispatcher("Usuarios/editar.jsp").forward(request, response);
                    break;
                case "Eliminar":
                    uModel = uDAO.BuscarPorId(id);
                    uDAO.Eliminar(id);
                    if(uModel.getTipo() == 1) {
                        listarUsuarios(request, response);
                    } else {
                        listarClientes(request, response);
                    }                    
                    break;
                case "Regresar":                    
                    response.sendRedirect("LoginController");
                    break;                
                case "Administrador":                    
                    response.sendRedirect("administrador.jsp");
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuariosController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");        
        uModel.setNombre(request.getParameter("nombre"));
        uModel.setUser(request.getParameter("usuario"));
        uModel.setPassword(request.getParameter("password"));
        uModel.setCedula(request.getParameter("cedula"));
        uModel.setEmail(request.getParameter("email"));
        uModel.setGenero(request.getParameter("genero"));        
        try {
            switch (accion) {
                case "Guardar":
                    uDAO.InsertarUsuario(uModel);
                    listarUsuarios(request, response);
                    break;
                case "Guardar Datos":
                    uDAO.InsertarCliente(uModel);
                    response.sendRedirect("LoginController");
                    break;
                case "Actualizar":
                    uModel.setId(Integer.parseInt(request.getParameter("id")));
                    uModel.setTipo(Integer.parseInt(request.getParameter("tipo")));
                    uDAO.Actualizar(uModel);
                    if(uModel.getTipo() == 1) {
                        listarUsuarios(request, response);
                    }else {
                        listarClientes(request, response);
                    }
                    break;                
            }                        
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuariosController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
