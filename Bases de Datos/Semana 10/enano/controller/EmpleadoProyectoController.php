<?php
require_once('dao\EmpleadoProyectoDAO.php');
require_once('model\EmpleadoProyecto.php');

class EmpleadoProyectoController implements EmpleadoProyectoDAO{
    private $conexion;

    public function __construct($host, $usuario, $contrasena, $base){
        $this->conexion=new mysqli($host, $usuario, $contrasena, $base);
        if($this->conexion->connect_error){
            die("Error de conexión: " . $this->conexion->connect_error);
        }
    }

    public function getAllEmpleadoProyecto(){
        $empleadoProyectos=array();
        return $empleadoProyectos;
    }
    
    public function createEmpleadoProyecto(EmpleadoProyecto $empleadoProyecto){
    }

    public function deleteEmpleadoProyecto(EmpleadoProyecto $empleadoProyecto){
    }

    public function updateEmpleadoProyecto(EmpleadoProyecto $empleadoProyecto){
    }
}
?>