/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;
import operacion.Operaciones;

/**
 *
 * @author felip
 */
public class MostrarUsuarios extends HttpServlet {


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        Operaciones op = new Operaciones();
        
        op.mostrar(lista);
        
        request.setAttribute("MostrarUsuarios", lista);
        response.sendRedirect("admclientes.jsp");
        
        
    }

   
   

    

}
