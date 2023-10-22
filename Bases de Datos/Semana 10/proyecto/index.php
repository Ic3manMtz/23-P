<?php
    require_once 'model/Paginar.php';
    $conexion = new mysqli('localhost','root','','edbm');
    $conexion->query("SET NAMES 'utf8'");
    $pagina = (isset($_GET['page'])) ? $_GET['page'] : 1;
    $enlaces = (isset($_GET['enlaces'])) ? $_GET['enlaces'] : 5;
    $paginar = new Paginar($conexion);
    $resultados = $paginar->getDatos($pagina);

    require_once 'controller/EmpleadoController.php';
    require_once 'model/Empleado.php';

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Obtener el valor seleccionado en el formulario de ordenamiento
        if(isset($_POST['selection']) && isset($_POST['edit'])){
            $selected_checkboxes = $_POST['selection'];
            $num_selected = count($selected_checkboxes);

            if($num_selected > 0){
                #confirmacion
                $information = $selected_checkboxes;
                $encodedArray = urlencode(serialize($information));
                header("Location: delete.php?array=" . $encodedArray);
                exit();

                #$empleadoDAO = new EmpleadoController($conexion);
                #$result=$empleadoDAO->deleteEmpleado($selected_checkboxes);
            }else{
                #notificaciones
                echo '<script type="text/javascript">alert("No checkboxes selected");</script>';
            }
        }else{
            #noficaciones
            echo '<script type="text/javascript">alert("No checkboxes selected");</script>';
        }
    
        // Obtener el valor seleccionado en el formulario de géneros
        if(isset($_POST['edit'])){
            $selected = $_POST['edit'];
            echo "Botón presionado: " . $selected;
        }
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
                    <input type="submit" value="Eliminar" class="btn btn-primary"> 
                    <br>
                    <br>
                    <!-- Muestra la tabla de resultados -->
                    <table class="table table-condensed table-dark table-striped">
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
                                <th class="text-center" width="10%">Departamento</th>
                                <th class="text-center" width="20%">Puesto</th>
                                <th class="text-center" width="10%"></th>
                            </tr>
                        </thead>
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
                                    <td class="text-center"><?php echo $resultados->datos[$i]['departamento']; ?></td>
                                    <td class="text-center"><?php echo $resultados->datos[$i]['puesto']; ?></td>
                                    <td class="text-center">
                                        <form method="post">
                                            <input type="hidden" name="edit" value="<?php echo $resultados->datos[$i]['id']; ?>">
                                            <input type="submit" class="btn btn-secondary" value="Editar">
                                        </form>
                                    </td>
                                </tr>
                            <?php endfor; ?>
                        </tbody>
                    </table>

                </form>

                <!-- Muestra los enlaces de paginación al inicio de la página -->
                <ul class="pagination">
                    <?php echo $paginar->crearLinks($enlaces); ?>
                </ul>
                
                <?php

                ?>
            </div>
        </div>
</body>
</html>