<?php
require_once('dao\PuestoDAO.php');
require_once('model\Puesto.php');

class PuestoController implements PuestoDAO{
    private $conexion;

    public function __construct($host, $usuario, $contrasena, $base){
        $this->conexion=new mysqli($host, $usuario, $contrasena, $base);
        if($this->conexion->connect_error){
            die("Error de conexión: " . $this->conexion->connect_error);
        }
    }

    public function getAllPuesto(){
        $puestos=array();
        return $puestos;
    }

    public function createPuesto(Puesto $Puesto){
    }

    public function deletePuesto(Puesto $Puesto){
    }

    public function updatePuesto(Puesto $Puesto){
    }
}
?>