DROP DATABASE IF EXISTS biblioteca;
-- Crear la base de datos "biblioteca" si no existe
CREATE DATABASE IF NOT EXISTS biblioteca;

-- Seleccionar la base de datos "biblioteca" para su uso
USE biblioteca;

-- Crear la tabla "libros"
CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) NOT NULL,
	genero INT NOT NULL
);

--Crear la tabla "generos"
CREATE TABLE generos (
	id_genero INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	descripcion TEXT NOT NULL
);

-- Opcional: Establecer el valor máximo de caracteres para el campo "isbn"
ALTER TABLE libros MODIFY isbn VARCHAR(13);
ALTER TABLE libros ADD CONSTRAINT librosGeneros_fk FOREIGN KEY (genero) REFERENCES generos(id_genero);

INSERT INTO generos (nombre, descripcion)
VALUES
	('Novela','Este género incluye una amplia variedad de obras narrativas de ficción, desde novelas de romance y misterio hasta novelas de ciencia ficción y fantasía.'),
	('Ensayo','Obras no ficticias en las que los autores expresan sus opiniones, argumentos y análisis sobre temas específicos.'),
	('Ciencia Ficción','Género literario que se centra en conceptos especulativos basados en la ciencia y la tecnología.'),
	('Teatro','Género literario que se representa en escena. Las obras teatrales incluyen diálogos y acciones interpretadas por actores.'),
	('Poesía','énero literario que se caracteriza por su uso de la estructura métrica, la rima y una expresión artística intensa.');
	

INSERT INTO libros (titulo, autor, isbn, genero)
VALUES
    ('Los pilares de la tierra', 'Ken Follett', '9780451166890',1),
    ('It', 'Stephen King', '9780451166891',1),
    ('Desierto', 'J. M. G. Le Clézio', '9780451166892',3),
	("La funcación", "Isaac Asimov", "9780553293357",4),
	("Dune", "Frank Herbert", "8712384923",1),
	("Neuromante", "William Gibson","98713248",2),
	("1984","George Orwell","98712393",1),
	("El fin de la eternidad", "Isaac Asimov", "987123483",5),
	("Solaris","Stanislaw Lem","987123482",2),
	("Un mundo feliz", "Aldous Huxley","98723423",1),
	("El juego de Ender","Oscon Scott Card", "8672344893",4),
	("Fahrenheit 451", "Ray Bradbury", "98234789234",3),
	("Los juegos del hambre", "Suzanne Collins", "98172384723",2), 
	("La carretera", "Cormac McCarthy", "872345034569",1),
	("El día de los trífidos", "John Wyndham", "987123459443",4),
	("El marciano", "Andy Weir", "872388723492",1),
	("Cien años de soledad", "Gabriel García Márquez", "9780307350433",2),
	("El gran Gatsby", "F. Scott Fitzgerald", "9788437613637",5),
	("Matar a un ruiseñor", "Harper Lee", "9788497593814",3),
	("En busca del tiempo perdido", "Marcel Proust", "9788491046002",4),
	("Don Quijote de la Mancha", "Miguel de Cervantes", "9788424113575",1),
	("Crimen y castigo", "Fiodor Dostoievski", "9788491041878",5),
	("El nombre de la rosa", "Umberto Eco", "9788432217545",4),
	("Orgullo y prejuicio", "Jane Austen", "9788491052522",2),
	("La sombra del viento", "Carlos Ruiz Zafón" ,"9788401334139",3),
	("Rayuela", "Julio Cortázar", "9788437615495",1),
	("La odisea", "Homero", "9788432053034",3),
	("El Señor de los Anillos", "J.R.R. Tolkien", "9788445074530",2),
	("Crónica de una muerte anunciada", "Gabriel García Márquez", "9788420471839",1),
	("La metamorfosis", "Franz Kafka", "9789875666470",1),
	("Moby-Dick", "Herman Melville", "9788420674205",2),
	("Ensayos", "Michel de Montaigne", "9788437601122",3),
	("Drácula", "Bram Stoker", "9788490701229",5),
	("Sapiens: De animales a dioses", "Yuval Noah Harari", "9788499924217",5);