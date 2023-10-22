<?php
interface UsuarioDAO{
    public function getAllUsuario();
    public function createUsuario(Usuario $usuario);
    public function deleteUsuario(Usuario $usuario);
    public function updateUsuario(Usuario $usuario);
}
?>