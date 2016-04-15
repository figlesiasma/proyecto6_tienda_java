<%-- 
    Document   : admin
    Created on : 11-abr-2016, 9:15:21
    Author     : felip
--%>
<%
    ArrayList<Usuario> lista = new ArrayList<Usuario>();
    Operaciones op = new Operaciones();
   
%>
<%@page import="operacion.Operaciones"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Intranet</title>
    </head>
    <body>
        <header class="w3-container w3-red">
            <h1>EL JARDÍN DE PIPE</h1>
        </header><br/>
        <nav class="w3-container w3-red">
            
        </nav>
        <main>
             <section>
                <%  HttpSession sesion = request.getSession();
                    String usuario = (String) sesion.getAttribute("administrador");
                    out.println("Hola administrador " + usuario);
                    %><br><br>
                    <p>CLIENTES</p>
                    <div class="w3-row">
                        <div class="w3-col m2 w3-red w3-center"><p>ID</p></div>
                        <div class="w3-col m2 w3-red w3-center"><p>NOMBRE</p></div>
                        <div class="w3-col m2 w3-red w3-center"><p>DNI</p></div>
                        <div class="w3-col m2 w3-red w3-center"><p>EMAIL</p></div>
                        <div class="w3-col m2 w3-red w3-center"><p>ACTIVO</p></div>
                        <div class="w3-col m2 w3-red w3-center"><p>MODIFICAR</p></div>
                    </div>
                    <%                        
                        op.mostrar(lista);
                        
                        for (Usuario cliente : lista) {
                        int clienteId = (Integer)cliente.getId();
                    %>
                    <div class="w3-row">    
                        <div class="w3-row">
                        <div class="w3-col m2 w3-pale-green w3-left"><p><%= clienteId %></p></div>
                        <div class="w3-col m2 w3-pale-green w3-left"><p><%=cliente.getNombre()%></p></div>
                        <div class="w3-col m2 w3-pale-green w3-left"><p><%=cliente.getDni()%></p></div>
                        <div class="w3-col m2 w3-pale-green w3-left"><p><%=cliente.getEmail()%></p></div>
                        <div class="w3-col m2 w3-pale-green w3-center"><p><a href="ActivarDesactivarUsuario?id=<%=clienteId%>">
                                    <% if (op.comprobarActivo(cliente.getActivo())){
                                        out.println("Desactivar");
                                        request.setAttribute("objCliente", cliente);
                                    }else{
                                        out.println("Activar");
                                        request.setAttribute("objCliente", cliente);
                                    }%></a></p></div>
                        <div class="w3-col m2 w3-pale-green w3-center"><p><a href="#">Modificar</a></p></div>
                    </div>
                        <%                           
                        }
                    %>
                    <a href="admintranet.jsp"><button>Volver</button></a>
            </section>          
        </main><br/>
        <footer class="w3-container w3-red">
            <h5>Felipe Iglesias 2016</h5>
        </footer>
        
    </body>
</html>
