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
import modelo.Administrador;
import modelo.Usuario;
import operacion.ConexionBD;
import operacion.Operaciones;

/**
 *
 * @author felip
 */
public class InsertarAdmin extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Operaciones op = new Operaciones();

            Administrador adm = new Administrador();

            adm.setNombre(request.getParameter("adm_nombre").trim().toLowerCase());
            adm.setDni(request.getParameter("adm_dni").trim().toUpperCase());
            adm.setEmail(request.getParameter("adm_email").trim().toLowerCase());
            adm.setPassword(request.getParameter("adm_password").trim());
            adm.setActivo(1);
            adm.setRol_id(1);

            if (op.insertarAdm(adm)) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("administrador", adm.getNombre());
                response.sendRedirect("admintranet.jsp");
            } else {
                response.sendRedirect("admregistrar.jsp");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
              
    }

}
