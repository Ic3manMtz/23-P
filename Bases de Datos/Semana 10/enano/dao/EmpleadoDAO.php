<?php
interface EmpleadoDAO{
    public function getAllEmpleado();
    public function createEmpleado(Empleado $empleado);
    public function deleteEmpleado(Empleado $empleado);
    public function updateEmpleado(Empleado $empleado);
}
?>