<?php
interface PuestoDAO{
    public function getAllPuesto();
    public function createPuesto(Puesto $Puesto);
    public function deletePuesto(Puesto $Puesto);
    public function updatePuesto(Puesto $Puesto);
}
?>