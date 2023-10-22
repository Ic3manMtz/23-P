<?php
class Empleado{
    private $id;
    private $nombre;
    private $ap_paterno;
    private $ap_materno;
    private $fecha_nacimiento;
    private $direccion;
    private $fecha_alta;
    private $fecha_baja;
    private $salario;
    private $departamento;
    private $puesto;

    public function __construct($id, $nombre, $ap_paterno, $ap_materno,$fecha_nacimiento,$direccion,$fecha_alta,$fecha_baja,$salario,$departamento,$puesto){
        $this->id=$id;
        $this->nombre=$nombre;
        $this->ap_paterno=$ap_paterno;
        $this->ap_materno=$ap_materno;
        $this->fecha_nacimiento=$fecha_nacimiento;
        $this->direccion=$direccion;
        $this->fecha_alta=$fecha_alta;
        $this->fecha_baja=$fecha_baja;
        $this->salario=$salario;
        $this->departamento=$departamento;
        $this->puesto=$puesto;
    }

    public function getId(){
        return $this->id;
    }
    public function getNombre(){
        return $this->nombre;
    }
    public function getApPaterno(){
        return $this->ap_paterno;
    }
    public function getApMaterno(){
        return $this->ap_materno;
    }
    public function getFechaNacimiento(){
        return $this->fecha_nacimiento;
    }
    public function getDireccion(){
        return $this->direccion;
    }
    public function getFechaAlta(){
        return $this->fecha_alta;
    }
    public function getFechaBaja(){
        return $this->fecha_baja;
    }
    public function getSalario(){
        return $this->salario;
    }
    public function getDepartamento(){
        return $this->departamento;
    }
    public function getPuesto(){
        return $this->puesto;
    }

    public function setId($id){
        $this->id=$id;
    }
    public function setNombre($nombre){
        $this->nombre=$nombre;
    }
    public function setApPaterno($ap_paterno){
        $this->ap_paterno=$ap_paterno;
    }
    public function setApMaterno($ap_materno){
        $this->ap_materno=$ap_materno;
    }
    public function setFechaNacimiento($fecha_nacimiento){
        $this->fecha_nacimiento=$fecha_nacimiento;
    }
    public function setDireccion($direccion){
        $this->direccion=$direccion;
    }
    public function setFechaAlta($fecha_alta){
        $this->fecha_alta=$fecha_alta;
    }
    public function setFechaBaja($fecha_baja){
        $this->fecha_baja=$fecha_baja;
    }
    public function setSalario($salario){
        $this->salario=$salario;
    }
    public function setDepartamento($departamento){
        $this->departamento=$departamento;
    }
    public function setPuest($puesto){
        $this->puesto=$puesto;
    }

    public function __toString(){
        return "\Empleado" .
        "\nId Empleado: " . $this->id . 
        "\nNombre: " . $this->nombre .
        "\nApellido paterno: " . $this->ap_paterno .
        "\nApellido materno: " . $this->ap_materno .
        "\nFecha de nacimiento: " . $this->fecha_nacimiento . 
        "\nDireccion: " . $this->direccion .
        "\nFecha de alta: " . $this->fecha_alta .
        "\nFecha de baja: " . $this->fecha_baja . 
        "\nSalario: " . $this->salario .
        "\nDepartamento: " . $this->departamento . 
        "\nPuesto: " . $this->puesto;
    }
}
?>