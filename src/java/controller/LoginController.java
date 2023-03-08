/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UsuariosDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UsuariosModel;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
        String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
        switch (accion) {
            case "Cerrar Sesion":
                HttpSession sesion = request.getSession(false);
                sesion.invalidate();                
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
            String usuario = request.getParameter("usuario") == null ? "" : request.getParameter("usuario");
            String clave = request.getParameter("clave") == null ? "" : request.getParameter("clave");
            HttpSession sesion = request.getSession(true);
            switch (accion) {
                case "Ingresar":
                    UsuariosDAO uDAO = new UsuariosDAO();
                    UsuariosModel uModel = uDAO.Login(usuario, clave);
                    switch (uModel.getTipo()) {
                        case 1:
                            response.sendRedirect("administrador.jsp");
                            sesion.setAttribute("id", uModel.getId());
                            sesion.setAttribute("tipo", uModel.getTipo());
                            sesion.setAttribute("nombre", uModel.getNombre());
                            break;
                        case 2:
                            response.sendRedirect("PeliculasController?accion=Cartelera");
                            sesion.setAttribute("id", uModel.getId());
                            sesion.setAttribute("tipo", uModel.getTipo());
                            sesion.setAttribute("nombre", uModel.getNombre());
                            break;
                        default:
                            response.sendRedirect("error.jsp");
                            break;
                    }
                    break;
                case "Registrarse":
                    response.sendRedirect("Usuarios/registrarse.jsp");
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
