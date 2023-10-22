error_reporting(E_ALL);
ini_set('display_errors', 1);

<?php
require_once 'model/Paginar.php';
$conexion = new mysqli('localhost','root','','edbm');
$conexion->query("SET NAMES 'utf8'");
$pagina = (isset($_GET['page'])) ? $_GET['page'] : 1;
$enlaces = (isset($_GET['enlaces'])) ? $_GET['enlaces'] : 5;
$consulta = "SELECT * FROM empleado ";
$paginar = new Paginar($conexion, $consulta);
$resultados = $paginar->getDatos($pagina);


// Handle employee deletion with confirmation 
if (isset($_POST['delete']) && isset($_POST['selection'])) {
    $selected_checkboxes = $_POST['selection'];

    if (!empty($selected_checkboxes)) {
    $confirmDelete = isset($_POST['confirm_delete']) ? $_POST['confirm_delete'] : false;

        if ($confirmDelete) {
            foreach ($selected_checkboxes as $employeeId) {
                // Delete the related records in the empleadoproyecto table
                $deleteEmpleadoproyectoQuery = "DELETE FROM empleadoproyecto WHERE empleado = $employeeId";
                $conexion->query($deleteEmpleadoproyectoQuery);
    
                // Then, delete the employee
                $deleteQuery = "DELETE FROM empleado WHERE id = $employeeId";
                $conexion->query($deleteQuery);

                //Mensaje de que fue realizado correctamente
                $_SESSION['success_message'] = "El/Los empleado(s) han sido eliminados.";

                // Define $updateQuery here if needed
                $updateQuery = "UPDATE some_table SET some_column = some_value WHERE some_condition";
            }
        } else {
            // Set an error message
            $_SESSION['error_message'] = "Confirme la acción llenando los campos.";
        }
    }
}

if (isset($_POST['edit'])) {
    $editEmployeeId = $_POST['edit'];
    // Fetch the employee's information based on $editEmployeeId
    // Display an edit form with the employee's details
    // Allow the user to make changes and submit the form for updating the record
    $editQuery = "SELECT * FROM empleado WHERE id = $editEmployeeId";
    $editResult = $conexion->query($editQuery);
    $employeeData = $editResult->fetch_assoc();
?>

    <!-- Add the edit form -->
    <form method="post">
        <input type="hidden" name="employee_id" value="<?php echo $employeeData['id']; ?>">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" value="<?php echo $employeeData['nombre'];?>"><br>
        <label for="ap_paterno">Apellido Paterno:</label>
        <input type="text" name="ap_paterno" value="<?php echo $employeeData['ap_paterno'];?>"><br>
        <label for="ap_materno">Apellido Materno:</label>
        <input type="text" name="ap_materno" value="<?php echo $employeeData['ap_materno'];?>"><br>
        <label for="salario">Salario:</label>
        <input type="text" name="salario" value="<?php echo $employeeData['salario'];?>"><br>
        <label for="direccion">Direccion:</label>
        <input type="text" name="direccion" value="<?php echo $employeeData['direccion'];?>"><br>
        <label for="fecha_baja">Fecha de Baja:</label>
        <input type="text" name="fecha_baja" value="<?php echo $employeeData['fecha_baja'];?>"><br>
        <label for="puesto">Puesto:</label>
        <input type="text" name="puesto" value="<?php echo $employeeData['puesto'];?>"><br>
        <input type="submit" name="update" value="Actualizar">
        </form>
        <?php
}

?>

<!DOCTYPE html>
<html>
<head>
<title>Gestión de empleados</title>
<!-- <link rel="stylesheet" type="text/css" href="css/estilos.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" 
    integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" 
    crossorigin="anonymous">

<!-- Configura la codificación de caracteres en UTF-8 -->
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
</head>
<body>
<div class="container">
        <div class="col-md-12 ">
            <h1 style="text-align:center">Lista de empleados</h1>

            <form method="post">
                <!-- Muestra la tabla de resultados -->
                <table class="table table-hover table-condensed table-bordered ">
                    <thead>
                        <tr style="background:#337ab7; color:white;">
                            <th width="5%"></th>
                            <th class="text-center" width="10%">Id Empleado</th>
                            <th class="text-center" width="10%">Nombre</th>
                            <th class="text-center" width="15%">Apellido Paterno</th>
                            <th class="text-center" width="15%">Apellido Materno</th>
                            <th class="text-center" width="10%" >Fecha de Nacimiento</th>
                            <th class="text-center" width="15%">Direccion</th>
                            <th class="text-center" width="10%">Fecha de Alta</th>
                            <th class="text-center" width="10%">Fecha de Baja</th>
                            <th width="10%">Salario</th>
                            <th width="10%">Puesto</th>
                            <th class="text-center" width="10%"></th>
                        </tr>
                    </thead>

                    <label for="confirm_delete">
                        Confirme que lo(s) dese borrar
                        <input type="checkbox" name="confirm_delete" id="confirm_delete">
                    </label>

                    <tbody>
                        <?php for ($i = 0; $i < count($resultados->datos); $i++): ?>
                            <tr>
                                <td class="text-center"><input type="checkbox" name="selection[]" value="<?php echo $resultados->datos[$i]['id'];?>"></td>
                                <td class="text-center"><?php echo $resultados->datos[$i]['id']; ?></td>
                                <td class="text-center"><?php echo $resultados->datos[$i]['nombre']; ?></td>
                                <td class="text-center"><?php echo $resultados->datos[$i]['ap_paterno']; ?></td>
                                <td class="text-center"><?php echo $resultados->datos[$i]['ap_materno']; ?></td>
                                <td class="text-center"><?php echo $resultados->datos[$i]['fecha_nacimiento']; ?></td>
                                <td class="text-center"><?php echo $resultados->datos[$i]['direccion']; ?></td>
                                <td class="text-center"><?php echo $resultados->datos[$i]['fecha_alta']; ?></td>
                                <td class="text-center"><?php echo $resultados->datos[$i]['fecha_baja']; ?></td>
                                <td class="text-center"><?php echo $resultados->datos[$i]['salario']; ?></td>
                                <td class="text-center"><?php echo $resultados->datos[$i]['puesto']; ?></td>
                                <td><a href="model/EditarEmpleado.php?id=<?php echo $resultados->datos[$i]['id']; ?>" class="btn btn-primary">Editar</a></td>
                            </tr>
                        <?php endfor; ?>
                    </tbody>
                </table>
                <input type="submit" name="delete" value="Eliminar" class="btn btn-primary">  
            </form>
            <!-- Muestra los enlaces de paginación al inicio de la página -->
            <ul class="pagination">
                <?php echo $paginar->crearLinks($enlaces); ?>
            </ul>

            
            <?php
                if (isset($_SESSION['error_message'])): ?>
                <div class="alert alert-danger">
                    <?php echo $_SESSION['error_message']; ?>
                </div>
            <?php endif; ?>

            <?php if (isset($_SESSION['success_message'])): ?>
            <div class="alert alert-success">
                <?php echo $_SESSION['success_message']; ?>
            </div>
        <?php endif; ?>

        </div>
    </div>
</body>
</html>