<?php
class Departamento{
    private $nombre;
    private $descripcion;
    private $presupuesto;

    public function __construct($nombre, $descripcion, $presupuesto){
        $this->nombre=$nombre;
        $this->descripcion=$descripcion;
        $this->presupuesto=$presupuesto;
    }

    public function getNombre(){
        return $this->nombre;
    }
    public function getDescripcion(){
        return $this->descripcion;
    }
    public function getPresupuesto(){
        return $this->presupuesto;
    }

    public function setNombre($nombre){
        $this->nombre=$nombre;
    }
    public function setDescripcion($descripcion){
        $this->descripcion=$descripcion;
    }
    public function setPresupuesto($presupuesto){
        $this->presupuesto=$presupuesto;
    }

    public function __toString(){
        return "\nDepartamento" .
        "\nNombre: " . $this->nombre .
        "\nDescripcipon: " . $this->descripcion .
        "\nPresupuesto: " . $this->presupuesto;
    }
}
?>