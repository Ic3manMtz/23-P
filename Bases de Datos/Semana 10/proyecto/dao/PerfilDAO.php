<?php
interface PerfilDAO{
    public function getAllPerfil();
    public function createPerfil(Perfil $perfil);
    public function deletePerfil(Perfil $perfil);
    public function updatePerfil(Perfil $perfil);
}
?>