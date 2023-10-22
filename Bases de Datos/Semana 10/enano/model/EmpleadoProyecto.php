<?php
class EmpleadoProyecto{
    private $empleado;
    private $proyecto;

    public function __construct($empleado, $proyecto){
        $this->empleado=$empleado;
        $this->proyecto=$proyecto;
    }

    public function getEmpleado(){
        return $this->empleado;
    }
    public function getProyecto(){
        return $this->proyecto;
    }

    public function setEmpleado($empleado){
        $this->empleado=$empleado;
    }
    public function setProyecto($proyecto){
        $this->proyecto=$proyecto;
    }


    public function __toString(){
        return "\nUsuario" .
        "\nempleado: " . $this->empleado .
        "\nProyecto: " . $this->proyecto;
    }
}
?>