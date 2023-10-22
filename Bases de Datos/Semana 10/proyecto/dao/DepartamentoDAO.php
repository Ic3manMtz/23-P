<?php
interface DepartamentoDAO{
    public function getAllDepartamento();
    public function createDepartamento(Departamento $Departamento);
    public function deleteDepartamento(Departamento $Departamento);
    public function updateDepartamento(Departamento $Departamento);
}
?>