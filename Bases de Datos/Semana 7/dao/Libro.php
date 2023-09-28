<?php
class Libro {
    private $titulo;
    private $autor;
    private $isbn;
    private $genero;

    public function __construct($titulo, $autor, $isbn, $genero) {
        $this->titulo = $titulo;
        $this->autor = $autor;
        $this->isbn = $isbn;
        $this->genero = $genero;
    }

    public function getTitulo() {
        return $this->titulo;
    }

    public function getAutor() {
        return $this->autor;
    }

    public function getIsbn() {
        return $this->isbn;
    }

    public function getGenero() {
        return $this->genero;
    }

    public function setTitulo($titulo) {
        $this->titulo = $titulo;
    }

    public function setAutor($autor) {
        $this->autor = $autor;
    }

    public function setIsbn($isbn) {
        $this->isbn = $isbn;
    }

    public function setGenero($genero) {
        $this->genero = $genero;
    }

    public function __toString() {
        return "\nLibro" .
            "\nTítulo: " . $this->titulo .
            "\nAutor: " . $this->autor .
            "\nISBN: " . $this->isbn .
            "\nGenero: " . $this->genero;
    }
}

?>