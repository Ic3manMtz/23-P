<!DOCTYPE html>
<html>
<head>
    <title>Agregar Libro</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
    <h1>Agregar Libro</h1>
    
    <form method="post" class="formulario">
        <label for="titulo">Título:</label>
        <input type="text" name="titulo" id="titulo" required>
        <br>

        <label for="autor">Autor:</label>
        <input type="text" name="autor" id="autor" required>
        <br>

        <label for="isbn">ISBN:</label>
        <input type="text" name="isbn" id="isbn" required>
        <br>

        <label for="genero">Generos:</label>
            <select name="genero" id="genero" required>
                <option value="novela">Novela</option>
                <option value="ensayo">Ensayo</option>
                <option value="ciencia ficción">Ciencia Ficción</option>
                <option value="teatro">Teatro</option>
                <option value="poesía">Poesía</option>
            </select>
        <br>

        <input type="submit" value="Agregar">
    </form>

    <?php
    // Incluir la clase Libro y la clase LibroDAOMySQL
    require_once('Libro.php'); // Asegúrate de que Libro.php contiene la definición de la clase Libro
    require_once('LibroDAOMySQL.php'); // Asegúrate de que LibroDAOMySQL.php contiene la definición de la clase LibroDAOMySQL

    // Crear una instancia de LibroDAOMySQL (proporciona los detalles de conexión)
    $libroDAO = new LibroDAOMySQL("localhost", "root", "", "biblioteca");

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      // Obtener los valores del formulario
      $titulo = $_POST["titulo"];
      $autor = $_POST["autor"];
      $isbn = $_POST["isbn"];
      $genero = $_POST["genero"];
  
      // Crear una instancia de la clase Libro con los valores del formulario
      $libro = new Libro($titulo, $autor, $isbn, $genero);
  
      // Guardar el libro en la base de datos utilizando la instancia de LibroDAOMySQL
      $libroDAO->guardarLibro($libro);
    }
    ?>

    <form action="index.php" method="get">
        <input type="submit" value="Regresar al catálogo">
    </form>
</body>
</html>

