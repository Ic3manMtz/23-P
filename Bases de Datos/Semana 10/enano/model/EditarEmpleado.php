<!DOCTYPE html>
<html>
<head>
    <title>Editar Empleado</title>
</head>
<body>
    <div class="container">
        <div class="col-md-6 col-md-offset-3">
            <h1 style="text-align:center">Editar Empleado</h1>

            <?php
            // Verifica si se ha enviado el ID del empleado a través de la URL
            if (isset($_GET['id'])) {
                $employeeId = $_GET['id'];

                // Conecta a la base de datos y recupera los datos del empleado según el ID
                $conexion = new mysqli('localhost', 'root', '', 'edbm');
                $conexion->query("SET NAMES 'utf8'");
                $editQuery = "SELECT * FROM empleado WHERE id = $employeeId";
                $editResult = $conexion->query($editQuery);
                $employeeData = $editResult->fetch_assoc();

                if ($employeeData) {
                    // Verifica si se ha enviado el formulario de actualización
                    if (isset($_POST['update'])) {
                        // Recopila los datos del formulario
                        $employee_id = $_POST['employee_id'];
                        $nombre = $_POST['nombre'];
                        $ap_paterno = $_POST['ap_paterno'];
                        $ap_materno = $_POST['ap_materno'];
                        $salario = $_POST['salario'];
                        $direccion = $_POST['direccion'];
                        $fecha_baja = $_POST['fecha_baja'];
                        $puesto = $_POST['puesto'];

                        // Actualiza los datos en la base de datos
                        $updateQuery = "UPDATE empleado SET nombre = '$nombre', ap_paterno = '$ap_paterno', ap_materno = '$ap_materno', salario = '$salario', direccion = '$direccion', fecha_baja = '$fecha_baja', puesto = '$puesto' WHERE id = $employee_id";
                        
                        if ($conexion->query($updateQuery) === TRUE) {
                            echo "Los datos se actualizaron correctamente.";
                            // Redirige o muestra un mensaje de éxito
                             header('Location: /proyecto1/index.php');
                        } else {
                            echo "Error al actualizar los datos: " . $conexion->error;
                        }
                    }
            ?>
            <form method="post">
                <input type="hidden" name="employee_id" value="<?php echo $employeeData['id']; ?>">
                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" value="<?php echo $employeeData['nombre']; ?>"><br>
                <label for="ap_paterno">Apellido Paterno:</label>
                <input type="text" name="ap_paterno" value="<?php echo $employeeData['ap_paterno']; ?>"><br>
                <label for="ap_materno">Apellido Materno:</label>
                <input type="text" name="ap_materno" value="<?php echo $employeeData['ap_materno']; ?>"><br>
                <label for="salario">Salario:</label>
                <input type="text" name="salario" value="<?php echo $employeeData['salario']; ?>"><br>
                <label for="direccion">Direccion:</label>
                <input type="text" name="direccion" value="<?php echo $employeeData['direccion']; ?>"><br>
                <label for="fecha_baja">Fecha de Baja:</label>
                <input type="text" name="fecha_baja" value="<?php echo $employeeData['fecha_baja']; ?>"><br>
                <label for="puesto">Puesto:</label>
                <input type="text" name="puesto" value="<?php echo $employeeData['puesto']; ?>"><br>
                <input type="submit" name="update" value="Actualizar">
            </form>
            <?php
                } else {
                    echo "El empleado con ID $employeeId no se encontró en la base de datos.";
                }
            } else {
                echo "ID de empleado no proporcionado.";
            }
            ?>
        </div>
    </div>
</body>
</html>
