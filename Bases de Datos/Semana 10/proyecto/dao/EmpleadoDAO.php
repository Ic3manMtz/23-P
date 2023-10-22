<?php
interface EmpleadoDAO{
    public function getAllEmpleado();
    public function createEmpleado(Empleado $empleado);
    public function deleteEmpleado(array $empleados);
    public function updateEmpleado(Empleado $empleado);
}
?>