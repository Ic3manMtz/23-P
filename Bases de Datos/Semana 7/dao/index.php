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
            <input type="submit" value="Ordenar">
        </form>

        <form method="post" class="formulario">
            <label for="genero">Géneros:</label>
            <select name="genero" id="genero">
                <option value="novela">Novela</option>
                <option value="ensayo">Ensayo</option>
                <option value="cifi">Ciencia Ficción</option>
                <option value="poesia">Poesía</option>
            </select>
        </form>
    </div>

    <?php
    // Incluir la clase Libro y la clase LibroDAOMySQL
    require_once('Libro.php'); // Asegúrate de que Libro.php contiene la definición de la clase Libro
    require_once('LibroDAOMySQL.php'); // Asegúrate de que LibroDAOMySQL.php contiene la definición de la clase LibroDAOMySQL

    // Crear una instancia de LibroDAOMySQL (proporciona los detalles de conexión)
    $libroDAO = new LibroDAOMySQL("localhost", "root", "", "biblioteca");

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isset($_POST['orden'])=='autor' || isset($_POST['orden'])=='titulo') {
            $ordenSeleccionado = isset($_POST['orden']);
            // Obtener todos los libros desde la base de datos y ordenarlos según la selección del usuario
            $libros = $libroDAO->getTodosLibrosOrdenados($ordenSeleccionado);

            // Mostrar la lista de libros en una tabla
            if (!empty($libros)) {
                echo '<table border="1">';
                echo '<tr><th>Título</th><th>Autor</th><th>ISBN</th><th>Genero</th></tr>';
                foreach ($libros as $libro) {
                    echo '<tr>';
                    echo '<td>' . $libro->getTitulo() . '</td>';
                    echo '<td>' . $libro->getAutor() . '</td>';
                    echo '<td>' . $libro->getIsbn() . '</td>';
                    echo '<td>' . $libro->getGenero() . '</td>';
                    echo '</tr>';
                }
                echo '</table>';
            } else {
                echo '<p>No se encontraron libros en la base de datos.</p>';
            }
        } else {
            echo 'No se envió el valor de acción.';
        }
    }

    // Obtener el valor seleccionado por el usuario (por título o autor)
    //$ordenSeleccionado = isset($_POST['orden']) ? $_POST['orden'] : 'titulo';

    
    ?>
</body>
</html>