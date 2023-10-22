<?php
require_once('LibroDAO.php');
require_once("Libro.php");

class LibroDAOMySQL implements LibroDAO {
    private $conexion;

    public function __construct($host, $usuario, $contrasena, $base_de_datos) {
        // Conectar a la base de datos MySQL
        $this->conexion = new mysqli($host, $usuario, $contrasena, $base_de_datos);

        if ($this->conexion->connect_error) {
            die("Error de conexión: " . $this->conexion->connect_error);
        }
    }

    public function getTodosLibros() {
        $libros = array();

        // Realizar una consulta para obtener todos los libros de la base de datos
        $query = "SELECT * FROM libros";
        $result = $this->conexion->query($query);

        if ($result) {
            while ($row = $result->fetch_assoc()) {
                $libros[] = new Libro($row['titulo'], $row['autor'], $row['isbn'], $row['genero']);
            }
            $result->free();
        }

        return $libros;
    }

    public function getLibroPorISBN($isbn) {
        // Realizar una consulta para obtener un libro por ISBN
        $query = "SELECT * FROM libros WHERE isbn = ?";
        $stmt = $this->conexion->prepare($query);
        $stmt->bind_param("s", $isbn);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result && $result->num_rows > 0) {
            $row = $result->fetch_assoc();
            return new Libro($row['titulo'], $row['autor'], $row['isbn'], $row['genero']);
        }

        return null;
    }

    public function guardarLibro(Libro $l) {
        $query = "SELECT * FROM libros WHERE isbn = ?";
        $stmt = $this->conexion->prepare($query);
        $stmt->bind_param("s", $l->getIsbn());
        $stmt->execute();

        // Almacenar el resultado para poder usar num_rows
        $stmt->store_result();

        // Verificar si la consulta devolvió algún resultado
        if ($stmt->num_rows > 0) {
            // Si la consulta devolvió al menos un resultado, salir de la función
            echo "El libro ya existe en la base de datos.";
            return;
        }

        $query = "SELECT id_genero FROM generos WHERE nombre = ?";
        $stmt = $this->conexion->prepare($query);
        $stmt->bind_param("s",$l->getGenero());
        $stmt->execute();
        $stmt->bind_result($id_genero);

        // Obtener los resultados
        while ($stmt->fetch()) {}

        $query = "INSERT INTO libros (titulo, autor, isbn, genero) VALUES (?, ?, ?, ?)";
        $stmt = $this->conexion->prepare($query);
        $stmt->bind_param("ssss", $l->getTitulo(), $l->getAutor(), $l->getIsbn(), $id_genero);

        if ($stmt->execute()) {
            // Si la consulta se ejecutó correctamente, imprimir un mensaje en pantalla
            echo "El libro fue insertado correctamente en la base de datos.";
        } else {
            // Si la consulta no se ejecutó correctamente, imprimir un mensaje de error
            echo "Hubo un error al insertar el libro en la base de datos: " . $stmt->error;
        }
    }

    public function borrarLibro(Libro $l) {
        // Eliminar un libro de la base de datos por ISBN
        $query = "DELETE FROM libros WHERE isbn = ?";
        $stmt = $this->conexion->prepare($query);
        $stmt->bind_param("s", $l->getIsbn());
        $stmt->execute();
    }

    public function __destruct() {
        // Cerrar la conexión a la base de datos al destruir el objeto
        $this->conexion->close();
    }
	
	public function getTodosLibrosOrdenados($criterioOrden) {
            $sql = "SELECT l.titulo, l.autor, l.isbn, g.nombre FROM libros as l JOIN generos as g ON l.genero = g.id_genero ORDER BY ";
            
			if ($criterioOrden === "titulo") {
				$sql .= "titulo";
			} elseif ($criterioOrden === "autor") {
				$sql .= "autor";
			} else {
				// Por defecto, ordenar por título si el criterio no es válido
				$sql .= "titulo";
			}

			$result = $this->conexion->query($sql);
			$libros = array();

			if ($result->num_rows > 0) {
				while ($fila = $result->fetch_assoc()) {
					$libros[] = new Libro($fila['titulo'], $fila['autor'], $fila['isbn'], $fila['nombre']);
				}
			}

			return $libros;
	}

    public function getLibrosPorGenero($genero, $orden) {
        $query = "SELECT l.titulo, l.autor, l.isbn, g.nombre FROM libros as l JOIN generos as g ON l.genero = g.id_genero WHERE g.nombre = ? ORDER BY ";

        if ($orden === "titulo") {
            $query .= "titulo";
        } elseif ($orden === "autor") {
            $query .= "autor";
        } else {
            // Por defecto, ordenar por título si el criterio no es válido
            $query .= "titulo";
        }

        $stmt = $this->conexion->prepare($query);
        $stmt->bind_param("s",$genero);
        $stmt->execute();

        $result=$stmt->get_result();       
        $libros = array();

		if ($result->num_rows > 0) {
			while ($fila = $result->fetch_assoc()) {
				$libros[] = new Libro($fila['titulo'], $fila['autor'], $fila['isbn'], $fila['nombre']);
			}
		}

		return $libros;
    }
}





// Ejemplo de uso
/*
$libroDAO = new LibroDAOMySQL("localhost", "usuario", "contrasena", "basededatos");
$libros = $libroDAO->getTodosLibros();

foreach ($libros as $libro) {
    echo $libro;
}
*/
?>