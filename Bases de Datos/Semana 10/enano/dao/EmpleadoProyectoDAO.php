<?php
interface EmpleadoProyectoDAO{
    public function getAllEmpleadoProyecto();
    public function createEmpleadoProyecto(EmpleadoProyecto $empleadoProyecto);
    public function deleteEmpleadoProyecto(EmpleadoProyecto $empleadoProyecto);
    public function updateEmpleadoProyecto(EmpleadoProyecto $empleadoProyecto);
}
?>