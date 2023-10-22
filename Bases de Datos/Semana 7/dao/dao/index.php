<!DOCTYPE html>
<html>
<head>
    <title>Libros en la Base de Datos</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
    <h1>Libros en la Base de Datos</h1>
    
    <div class="formulario-container">
        <form method="post" class="formulario">

            <label for="orden">Ordenar por:</label>
            <select name="orden" id="orden">
                <option value="titulo">Título</option>
                <option value="autor">Autor</option>
            </select>

            <label for="genero">Generos:</label>
            <select name="genero" id="genero">
                <option value="def">Generos</option>
                <option value="novela">Novela</option>
                <option value="ensayo">Ensayo</option>
                <option value="ciencia ficción">Ciencia Ficción</option>
                <option value="teatro">Teatro</option>
                <option value="poesía">Poesía</option>
            </select>

            <input type="submit" value="Ordenar">
        </form>
    </div>

    <br>
    <form action="AgregarLibro.php" method="get">
        <input type="submit" value="Agregar nuevo libro">
    </form>
    <br>

    <?php
    // Incluir la clase Libro y la clase LibroDAOMySQL
    require_once('Libro.php'); // Asegúrate de que Libro.php contiene la definición de la clase Libro
    require_once('LibroDAOMySQL.php'); // Asegúrate de que LibroDAOMySQL.php contiene la definición de la clase LibroDAOMySQL

    // Crear una instancia de LibroDAOMySQL (proporciona los detalles de conexión)
    $libroDAO = new LibroDAOMySQL("localhost", "root", "", "biblioteca");

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Obtener el valor seleccionado en el formulario de ordenamiento
        if (isset($_POST["orden"])) {
            $ordenSeleccionado = $_POST["orden"];
            // Hacer algo con el valor seleccionado
        }
    
        // Obtener el valor seleccionado en el formulario de géneros
        if (isset($_POST["genero"])) {
            $generoSeleccionado = $_POST["genero"];
            // Hacer algo con el valor seleccionado
        }
    }

    if($generoSeleccionado=="def"){
        $libros=$libroDAO->getTodosLibrosOrdenados($ordenSeleccionado);
    }else{
        $libros = $libroDAO->getLibrosPorGenero($generoSeleccionado, $ordenSeleccionado);
    }
    
    echo '<br>';
    // Mostrar la lista de libros en una tabla
    if (!empty($libros)) {
        echo '<table border="1">';
        echo '<tr><th>Título</th><th>Autor</th><th>ISBN</th><th>Género</th></tr>';
        foreach ($libros as $libro) {
            echo '<tr>';
            echo '<td>' . $libro->getTitulo() . '</td>';
            echo '<td>' . $libro->getAutor() . '</td>';
            echo '<td>' . $libro->getIsbn() . '</td>';
            echo '<td style="text-align: center;">' . $libro->getGenero() . '</td>';
            echo '</tr>';
        }
        echo '</table>';
    } else {
        echo '<p>No se encontraron libros en la base de datos.</p>';
    }

    // Obtener el valor seleccionado por el usuario (por título o autor)
    //$ordenSeleccionado = isset($_POST['orden']) ? $_POST['orden'] : 'titulo';
    ?>


</body>
</html>