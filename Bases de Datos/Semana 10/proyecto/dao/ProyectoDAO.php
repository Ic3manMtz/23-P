<?php
interface ProyectoDAO{
    public function getAllProyecto();
    public function createProyecto(Proyecto $proyecto);
    public function deleteProyecto(Proyecto $proyecto);
    public function updateProyecto(Proyecto $proyecto);
}
?>