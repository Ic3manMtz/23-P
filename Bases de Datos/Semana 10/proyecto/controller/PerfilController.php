<?php
require_once('dao\PerfilDAO.php');
require_once('model\Perfil.php');

class PerfilController implements PerfilDAO{
    private $conexion;

    public function __construct($host, $usuario, $contrasena, $base){
        $this->conexion=new mysqli($host, $usuario, $contrasena, $base);
        if($this->conexion->connect_error){
            die("Error de conexión: " . $this->conexion->connect_error);
        }
    }

    public function getAllPerfil(){
        $perfiles=array();
        return $perfiles;
    }

    public function createPerfil(Perfil $perfil){
    }

    public function deletePerfil(Perfil $perfil){
    }

    public function updatePerfil(Perfil $perfil){
    }
}
?>