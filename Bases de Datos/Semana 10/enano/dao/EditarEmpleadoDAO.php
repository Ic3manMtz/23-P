<?php
require_once('model/Empleado.php');

interface EditarEmpleadoDAO {
    public function getEmpleadoById($id);
    public function updateEmpleado(Empleado $empleado);
}
?>