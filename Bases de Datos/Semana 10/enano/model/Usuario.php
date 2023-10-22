<?php
class Usuario{
    private $nombre;
    private $correo;
    private $contrasenia;

    public function __construct($nombre, $correo, $contrasenia){
        $this->nombre=$nombre;
        $this->correo=$correo;
        $this->contrasenia=$contrasenia;
    }

    public function getNombre(){
        return $this->nombre;
    }
    public function getCorreo(){
        return $this->correo;
    }
    public function getContrasenia(){
        return $this->contrasenia;
    }

    public function setNombre($nombre){
        $this->nombre=$nombre;
    }
    public function setCorreo($correo){
        $this->correo=$correo;
    }
    public function setContrasenia($contrasenia){
        $this->contrasenia=$contrasenia;
    }

    public function __toString(){
        return "\nUsuario" .
        "\nNombre: " . $this->nombre .
        "\nCorreo: " . $this->correo .
        "\nContraseña: " . $this->contrasenia;
    }
}
?>