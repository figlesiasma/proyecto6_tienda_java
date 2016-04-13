<%-- 
    Document   : index
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
        
        <title>JSP Page</title>
    </head>
    <body>
        <header class="w3-container w3-teal">
            <h1>EL JARDÍN DE PIPE</h1>
        </header><br/>
        <nav class="w3-container w3-teal">
            
        </nav>
        <main>
            <form action="Login" method="POST">
                Usuario:    <input type="text" name="user" id="user" required><br>
                Contraseña: <input type="password" name="pass" id="pass" required><br>
                <input type="submit" value="Entrar">
            </form>
        </main><br/>
        <footer class="w3-container w3-teal">
            <h5>Felipe Iglesias 2016</h5>
        </footer>
        
    </body>
</html>
