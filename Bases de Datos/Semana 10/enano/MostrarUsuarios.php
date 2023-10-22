<!DOCTYPE html>
<html>
<head>
    <title>Usuarios</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
    <h1>Lista de Usuarios</h1>

    <div class="formulario-container">
        <form action="index.php" method="get">
            <input type="submit" value="Mostrar departamentos">
        </form>
    </div>
    <br>
    <div>
        <form action="MostrarProyectos.php" method="get">
            <input type="submit" value="Mostrar proyectos">
        </form>
    </div>
    <br>
    <div>
        <form method="get" action="AgregarUsuario.php">
            <input type="submit" value="Agregar usuario nuevo">
        </form>
    </div>

    <?php
    // Incluir la clase Libro y la clase LibroDAOMySQL
    require_once 'controller/UsuarioController.php';
    require_once 'model/Usuario.php';

    // Crear una instancia de LibroDAOMySQL (proporciona los detalles de conexión)
    $usuarioDAO = new UsuarioController("localhost", "root", "", "edbm");
    $usuarios=$usuarioDAO->getAllUsuario();

    echo '<br>';
    // Mostrar la lista de libros en una tabla
    if (!empty($usuarios)) {
        echo '<table border="1">';
        echo '<tr><th>Nombre</th><th>Correo</th><th>Contraseña</th></tr>';
        foreach ($usuarios as $usuario) {
            echo '<tr>';
            echo '<td>' . $usuario->getNombre() . '</td>';
            echo '<td>' . $usuario->getCorreo() . '</td>';
            echo '<td>' . $usuario->getContrasenia() . '</td>';
            echo '</tr>';
        }
        echo '</table>';
    } else {
        echo '<p>No se encontraron usuarios en la base de datos.</p>';
    }
    ?>


</body>
</html>