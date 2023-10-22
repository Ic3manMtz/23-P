<?php
require_once 'dao/DepartamentoDAO.php';
require_once 'model/Departamento.php';

class DepartamentoController implements DepartamentoDAO{
    private $conexion;

    public function __construct($host, $usuario, $contrasena, $base){
        $this->conexion=new mysqli($host, $usuario, $contrasena, $base);
        if($this->conexion->connect_error){
            die("Error de conexión: " . $this->conexion->connect_error);
        }
    }

    public function getAllDepartamento(){
        $query = "SELECT * FROM departamento ";
        $result = $this->conexion->query($query);

        $departamentos=array();

        if ($result->num_rows>0) {
            while ($row = $result->fetch_assoc()) {
                $departamentos[] = new Departamento($row['nombre'], $row['descripcion'], $row['presupuesto']);
            }
        }

        return $departamentos;
    }

    public function createDepartamento(Departamento $departamento){
        $query = "INSERT INTO departamento (nombre, descripcion, presupuesto) VALUES (?,?,?)";
        $stmnt = $this->conexion->prepare($query);
        $nombre = $departamento->getNombre();
        $descripcion = $departamento->getDescripcion();
        $presupuesto = $departamento->getPresupuesto();
        $stmnt->bind_param("sss",$nombre,$descripcion,$presupuesto);

        if($stmnt->execute()){
            echo "El departamento fue insertado correctamente";
        }else{
            echo "Hubo un error al insertar el departamento: " . $stmnt->error;
        }
    }

    public function deleteDepartamento(Departamento $departamento){
    }

    public function updateDepartamento(Departamento $departamento){
    }
}
?>