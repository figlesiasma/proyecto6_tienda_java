/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;
import operacion.ConexionBD;
import operacion.Operaciones;

/**
 *
 * @author felip
 */
public class Insertar extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Operaciones op = new Operaciones();
        
        Usuario user = new Usuario();
        
        user.setNombre(request.getParameter("usu_nombre").trim().toLowerCase());
        user.setDni(request.getParameter("usu_dni").trim().toUpperCase());
        user.setEmail(request.getParameter("usu_email").trim().toLowerCase());
        user.setPassword(request.getParameter("usu_password").trim());
        user.setActivo(1);
        
        if (op.insertar(user)){
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", user.getNombre());
            response.sendRedirect("main.jsp");
        }else{
            response.sendRedirect("registrar.jsp");
        }
        
        
    }

}
