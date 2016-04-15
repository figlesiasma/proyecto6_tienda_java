<%-- 
    Document   : registrar
    Created on : 13-abr-2016, 11:30:11
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registrar</title>
    </head>
    <body>
        <a href="../src/java/modelo/Usuario.java"></a>
        <header class="w3-container w3-teal">
            <h1>EL JARDÍN DE PIPE</h1>
        </header><br/>
        <nav class="w3-container w3-teal">
            
        </nav>
        <main>
            <section>
                <p>Registro</p>
                <form action="Insertar" method="POST">
                    <input type="text" name="usu_nombre" id="nombre" placeholder="Nombre" required><br>
                    <input type="text" name="usu_dni" id="dni" placeholder="Dni" pattern="(([X-Z]{1})([-]?)(\d{7})([-]?)([A-Z]{1}))|((\d{8})([-]?)([A-Z]{1}))" title="Formato: 46452322G" required><br>
                    <input type="text" name="usu_email" id="email" placeholder="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Formato: felipe_iglesias@hotmail.com" required><br>
                    <input type="password" name="usu_password" id="password" placeholder="Password" required><br>
                    <input type="password" name="usu_password2" id="password" placeholder="Repite password" required><br>
                    <input type="submit" value="Registrar">
                </form>
                <a href="index.jsp"><button>Volver</button></a>
            </section>
            
        </main><br/>
        <footer class="w3-container w3-teal">
            <h5>Felipe Iglesias 2016</h5>
        </footer>
        
    </body>
</html>
