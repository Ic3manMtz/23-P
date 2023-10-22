<?php
require_once('dao\EmpleadoDAO.php');
require_once('model\Empleado.php');

class EmpleadoController implements EmpleadoDAO{
    private $conexion;

    public function __construct($conexion){
        $this->conexion=$conexion;
        if($this->conexion->connect_error){
            die("Error de conexión: " . $this->conexion->connect_error);
        }
    }

    public function getAllEmpleado(){
        $query = "SELECT e.id, e.nombre, e.ap_paterno, e.ap_materno, e.fecha_nacimiento, e.direccion, e.fecha_alta, e.fecha_baja, e.salario, p.nombre AS puesto, d.nombre AS departamento FROM empleado AS e INNER JOIN puesto AS p ON e.puesto=p.id INNER JOIN departamento as d ON p.departamento=d.id ORDER BY fecha_alta ASC ";
        $result = $this->conexion->query($query);

        $empleados = array();

        if($result->num_rows>0){
            while($row = $result->fetch_assoc()){
                $empleados[] = new Empleado($row['id'],$row['nombre'],$row['ap_paterno'],$row['ap_materno'],$row['fecha_nacimiento'],$row['direccion'],$row['fecha_alta'],$row['fecha_baja'],$row['salario'],$row['departamento'],$row['puesto']);
            }
        }

        return $empleados;
    }

    public function createEmpleado(Empleado $empleado){
    }

    public function deleteEmpleado(array $empleados){
        foreach ($empleados as $empleado) {
            $query="DELETE FROM empleado WHERE id=?";
            $stmt = $this->conexion->prepare($query);
            $stmt->bind_param("s",$empleado);
            
            if ($stmt->execute()) {
                // Si la consulta se ejecutó correctamente, imprimir un mensaje en pantalla
                return 1;
            } else {
                // Si la consulta no se ejecutó correctamente, imprimir un mensaje de error
                return $stmt->errno;
            }
        }
    }

    public function updateEmpleado(Empleado $empleado){
        $id=$empleado->getId();
        $nombre=$empleado->getNombre();
        $apPaterno=$empleado->getApPaterno();
        $apMaterno=$empleado->getApMaterno();
        $fecNacimiento=$empleado->getFechaNacimiento();
        $direccion=$empleado->getDireccion();
        $fecAlta=$empleado->getFechaAlta();
        $fecBaja=$empleado->getFechaBaja();
        $salario=$empleado->getSalario();
        $puesto=$empleado->getPuesto();

        $query = "UPDATE empleado SET nombre=?,ap_paterno=?,ap_materno=?,fecha_nacimiento=?,direccion=?,fecha_alta=?,fecha_baja=?,salario=?,puesto=? WHERE id=? ";
        $stmt = $this->conexion->prepare($query);
        $stmt->bind_param("ssssssssss",$nombre,$apPaterno,$apMaterno,$fecNacimiento,$direccion,$fecAlta,$fecBaja,$salario,$puesto,$id);
        
        if ($stmt->execute()) {
            // Si la consulta se ejecutó correctamente, imprimir un mensaje en pantalla
            echo "El libro fue insertado correctamente en la base de datos.";
        } else {
            // Si la consulta no se ejecutó correctamente, imprimir un mensaje de error
            echo "Hubo un error al insertar el libro en la base de datos: " . $stmt->error;
        }
    }
}
?>