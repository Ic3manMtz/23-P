<?php
require_once('dao/EditarEmpleadoDAO.php');
require_once('model/Empleado.php');

class EditarEmpleadoController {
    private $editarEmpleadoDAO;

    public function __construct() {
        $this->editarEmpleadoDAO = new EditarEmpleadoDAO();
    }

    public function editarEmpleado($id) {
        // Recuperar el empleado a editar de la base de datos usando el EditarEmpleadoDAO
        $empleado = $this->editarEmpleadoDAO->getEmpleadoById($id);

        if ($empleado) {
            include('View/EditarEmpleado.php'); // Cargar la vista para editar empleado
        } else {
            // Manejar el caso en que el empleado no existe
        }
    }

    public function guardarCambios($empleado) {
        // Validar y guardar los cambios del empleado en la base de datos usando el EditarEmpleadoDAO
        $this->editarEmpleadoDAO->updateEmpleado($empleado);
        // Puedes agregar lógica adicional aquí, como redireccionar o mostrar un mensaje de éxito
    }
}
?>