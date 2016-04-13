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
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import operacion.ConexionBD;
import operacion.Operaciones;

/**
 *
 * @author Felipe Iglesias
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");

        Operaciones op = new Operaciones();
        
      
        if (op.validar(user, pass)) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", user);
            response.sendRedirect("main.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
        
        
    }
}
