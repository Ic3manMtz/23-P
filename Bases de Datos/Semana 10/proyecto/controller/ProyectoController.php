<?php
require_once('dao\ProyectoDAO.php');
require_once('model\Proyecto.php');

class ProyectoController implements ProyectoDAO{
    private $conexion;

    public function __construct($host, $usuario, $contrasena, $base){
        $this->conexion=new mysqli($host, $usuario, $contrasena, $base);
        if($this->conexion->connect_error){
            die("Error de conexión: " . $this->conexion->connect_error);
        }
    }

    public function getAllProyecto(){
        $query = "SELECT p.descripcion, p.fecha_inicio, p.fecha_fin, p.presupuesto, d.nombre as departamento FROM proyecto as p JOIN departamento as d ON p.departamento=d.id ";
        $result = $this->conexion->query($query);

        $proyectos=array();

        if ($result->num_rows>0) {
            while ($row = $result->fetch_assoc()) {
                $proyectos[] = new Proyecto($row['descripcion'], $row['fecha_inicio'], $row['fecha_fin'], $row['presupuesto'], $row['departamento']);
            }
        }

        return $proyectos;
    }

    public function createProyecto(Proyecto $proyecto){
        $query = "SELECT id FROM departamento WHERE nombre = ?";
        $stmt = $this->conexion->prepare($query);
        $departamento = $proyecto->getDepartamento();
        $stmt->bind_param("s",$departamento);
        $stmt->execute();
        $stmt->bind_result($departamento);

        // Obtener los resultados
        while ($stmt->fetch()) {}
        
        $query = "INSERT INTO proyecto (descripcion, fecha_inicio, fecha_fin, presupuesto, departamento) VALUES (?,?,?,?,?)";
        $stmnt = $this->conexion->prepare($query);
        $descripcion = $proyecto->getDescripcion();
        $fec_inicio = $proyecto->getFechaInicio();
        $fec_fin = $proyecto->getFechaFin();
        $presupuesto = $proyecto->getPresupuesto();
        $stmnt->bind_param("sssss",$descripcion,$fec_inicio,$fec_fin,$presupuesto,$departamento);

        if($stmnt->execute()){
            echo "El proyecto fue insertado correctamente";
        }else{
            echo "Hubo un error al proyecto el departamento: " . $stmnt->error;
        }
    }

    public function deleteProyecto(Proyecto $proyecto){
    }

    public function updateProyecto(Proyecto $proyecto){
    }
}
?>