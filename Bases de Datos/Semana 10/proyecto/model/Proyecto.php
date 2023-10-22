<?php
class Proyecto{
    private $descripcion;
    private $fecha_inicio;
    private $fecha_fin;
    private $presupuesto;
    private $departamento;

    public function __construct($descripcion, $fecha_inicio, $fecha_fin, $presupuesto, $departamento){
        $this->descripcion=$descripcion;
        $this->fecha_inicio=$fecha_inicio;
        $this->fecha_fin=$fecha_fin;
        $this->presupuesto=$presupuesto;
        $this->departamento=$departamento;
    }

    public function getDescripcion(){
        return $this->descripcion;
    }
    public function getFechaInicio(){
        return $this->fecha_inicio;
    }
    public function getFechaFin(){
        return $this->fecha_fin;
    }
    public function getPresupuesto(){
        return $this->presupuesto;
    }
    public function getDepartamento(){
        return $this->departamento;
    }

    public function setDescripcion($descripcion){
        $this->descripcion=$descripcion;
    }
    public function setFechaInicio($fecha_inicio){
        $this->fecha_inicio=$fecha_inicio;
    }
    public function setFechaFin($fecha_fin){
        $this->fecha_fin=$fecha_fin;
    }
    public function setPresupuesto($presupuesto){
        $this->presupuesto=$presupuesto;
    }
    public function setDepartamento($departamento){
        $this->departamento=$departamento;
    }

    public function __toString(){
        return "\nProyecto" .
        "\nDescripción: " . $this->descripcion .
        "\nFecha de inicio: " . $this->fecha_inicio .
        "\nFecha de fin: " . $this->fecha_fin .
        "\nPresupuesto: " . $this->presupuesto .
        "\nDepartamento: " . $this->departamento;
    }
}
?>