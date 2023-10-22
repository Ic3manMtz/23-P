<!DOCTYPE html>
<html>
<head>
    <title>Agregar Usuario</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
    <h1>Agregar usuario</h1>
    
    <form method="post" class="formulario">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" id="nombre" required>
        <br>

        <label for="correo">Correo:</label>
        <input type="email" name="correo" id="correo" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Por favor introduce un correo electrónico válido" required>
        <br>

        <label for="contrasena">Contraseña:</label>
        <input type="password" name="contrasena" id="contrasena" required>
        <br>

        <input type="submit" value="Agregar">
    </form>

    <?php
    // Incluir la clase Libro y la clase LibroDAOMySQL
    require_once 'controller/UsuarioController.php';
    require_once 'model/Usuario.php';

    // Crear una instancia de LibroDAOMySQL (proporciona los detalles de conexión) 
    $usuarioDAO = new UsuarioController("localhost", "root", "", "edbm");

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Obtener los valores del formulario
        $nombre = $_POST["nombre"];
        $correo = $_POST["correo"];
        $contrasena = $_POST["contrasena"];

      // Crear una instancia de la clase Libro con los valores del formulario
        $usuario = new Usuario($nombre, $correo, $contrasena);

      // Guardar el libro en la base de datos utilizando la instancia de LibroDAOMySQL
        $usuarioDAO->createUsuario($usuario);
    }
    ?>

    <br>
    <form action="index.php" method="get">
        <input type="submit" value="Regresar al catalogo de departamentos">
    </form>
</body>
</html>