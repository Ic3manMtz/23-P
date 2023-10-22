<?php
class Perfil{
    private $empleado;
    private $rol;
    private $usuario;

    public function __construct($empleado, $rol, $usuario){
        $this->empleado=$empleado;
        $this->rol=$rol;
        $this->usuario=$usuario;
    }

    public function getEmpleado(){
        return $this->empleado;
    }
    public function getRol(){
        return $this->rol;
    }
    public function getUsuario(){
        return $this->usuario;
    }

    public function setEmpleado($empleado){
        $this->empleado=$empleado;
    }
    public function setRol($rol){
        $this->rol=$rol;
    }
    public function setUsuario($usuario){
        $this->usuario=$usuario;
    }

    public function __toString(){
        return "\nPerfil" .
        "\nEmpleado: " . $this->empleado .
        "\nRol: " . $this->rol .
        "\nUsuario: " . $this->usuario;
    }
}
?>