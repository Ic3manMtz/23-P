<?php
require_once('dao\UsuarioDAO.php');
require_once('model\Usuario.php');

class UsuarioController implements UsuarioDAO{
    private $conexion;

    public function __construct($host, $usuario, $contrasena, $base){
        $this->conexion=new mysqli($host, $usuario, $contrasena, $base);
        if($this->conexion->connect_error){
            die("Error de conexión: " . $this->conexion->connect_error);
        }
    }

    public function getAllUsuario(){
        $query = "SELECT * FROM usuario ";
        $result = $this->conexion->query($query);

        $usuarios=array();

        if ($result->num_rows>0) {
            while ($row = $result->fetch_assoc()) {
                $usuarios[] = new Usuario($row['nombre'], $row['correo'], $row['contrasena']);
            }
        }

        return $usuarios;
    }
    public function createUsuario(Usuario $usuario){
        $query = "INSERT INTO usuario (nombre, correo, contrasena) VALUES (?,?,?)";
        $stmnt = $this->conexion->prepare($query);
        $nombre = $usuario->getNombre();
        $correo = $usuario->getCorreo();
        $contrasena = $usuario->getContrasenia();
        $stmnt->bind_param("sss",$nombre,$correo,$contrasena);

        if($stmnt->execute()){
            echo "El usuario fue insertado correctamente";
        }else{
            echo "Hubo un error al insertar el usuario: " . $stmnt->error;
        }
    }
    public function deleteUsuario(Usuario $usuario){
    }

    public function updateUsuario(Usuario $usuario){
    }
}
?>