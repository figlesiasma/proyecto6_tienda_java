/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Administrador;
import operacion.ConexionBD;
import operacion.Operaciones;

/**
 *
 * @author Felipe Iglesias
 */
@WebServlet(name = "LoginAdmin", urlPatterns = {"/LoginAdmin"})
public class LoginAdmin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String user = request.getParameter("user").trim().toUpperCase();
        String pass = request.getParameter("pass").trim();

        Operaciones op = new Operaciones();
      
        boolean nivel = true;
      
        if (op.validar(user, pass, nivel)) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("administrador", user);
            response.sendRedirect("admintranet.jsp");
        } else {
            response.sendRedirect("admin.jsp");
        }
        
        
    }
}
