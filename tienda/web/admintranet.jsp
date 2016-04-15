<%-- 
    Document   : admin
    Created on : 11-abr-2016, 9:15:21
    Author     : felip
--%>

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
                <a href="admregistrar.jsp"><button>Añadir Administrador</button></a>
                <a href="admclientes.jsp"><button>Mostrar Clientes</button></a>
            </section>          
        </main><br/>
        <footer class="w3-container w3-red">
            <h5>Felipe Iglesias 2016</h5>
        </footer>
        
    </body>
</html>
