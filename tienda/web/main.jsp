<%-- 
    Document   : main
    Created on : 11-abr-2016, 13:43:07
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Principal</title>
    </head>
    <body>
        <header class="w3-container w3-teal">
            <h1>EL JARDÍN DE PIPE</h1>
        </header><br/>
        <nav class="w3-container w3-teal">
            
        </nav>
        <main>
            <section>
                <%  HttpSession sesion = request.getSession();
                    String usuario = (String) sesion.getAttribute("usuario");
                    out.println("Bienvenido " + usuario);
                %>
        </main><br/>
        <footer class="w3-container w3-teal">
            <h5>Felipe Iglesias 2016</h5>
        </footer>
        
    </body>
</html>
