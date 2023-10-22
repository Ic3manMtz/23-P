<?php
class Puesto{
    private $nombre;
    private $descripcion;
    private $salario_base;
    private $departamento;

    public function __construct($nombre, $descripcion, $salario_base, $departamento){
        $this->nombre=$nombre;
        $this->descripcion=$descripcion;
        $this->salario_base=$salario_base;
        $this->departamento=$departamento;
    }

    public function getNombre(){
        return $this->nombre;
    }
    public function getDescripcion(){
        return $this->descripcion;
    }
    public function getSalario_base(){
        return $this->salario_base;
    }
    public function getDepartamento(){
        return $this->departamento;
    }

    public function setNombre($nombre){
        $this->nombre=$nombre;
    }
    public function setDescripcion($descripcion){
        $this->descripcion=$descripcion;
    }
    public function setSalario_base($salario_base){
        $this->salario_base=$salario_base;
    }
    public function setDepartamento($departamento){
        $this->departamento=$departamento;
    }

    public function __toString(){
        return "\nPuesto" .
        "\nNombre: " . $this->nombre .
        "\nDescripcion: " . $this->descripcion .
        "\nSalario base: " . $this->salario_base .
        "\nDepartamento: " . $this->departamento;
    }
}
?>