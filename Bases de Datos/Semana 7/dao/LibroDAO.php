<?php
interface LibroDAO {
    public function getTodosLibros();
    public function getLibroPorISBN($isbn);
    public function guardarLibro(Libro $l);
    public function borrarLibro(Libro $l);
	public function getTodosLibrosOrdenados($criterioOrden) ;
    public function getLibrosPorGenero($genero);
}
?>