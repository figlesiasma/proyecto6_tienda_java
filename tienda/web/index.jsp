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
        
        <title>Index</title>
    </head>
    <body>
        <header class="w3-container w3-teal">
            <h1>EL JARDÍN DE PIPE</h1>
        </header><br/>
        <nav class="w3-container w3-teal">
            
        </nav>
        <main>
            <section>
                <p>Login</p>
                <form action="Login" method="POST">
                        <input type="text" name="user" id="user" placeholder="Dni" required><br>
                        <input type="password" name="pass" id="pass" placeholder="Contraseña" required><br>
                    <input type="submit" value="Entrar">
                </form>
            </section><br>
            <a href="registrar.jsp">Regístrate</a>
            
        </main><br/>
        <footer class="w3-container w3-teal">
            <h5>Felipe Iglesias 2016</h5>
        </footer>
        
    </body>
</html>
