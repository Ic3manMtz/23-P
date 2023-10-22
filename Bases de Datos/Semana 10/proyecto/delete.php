<!DOCTYPE html>
<html>
<head>
    <title>Eliminar empleado</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
</head>
<body>
    <div class="d-flex flex-column align-items-center justify-content-center" style="height: 100vh;">
        <div class="alert alert-danger" role="alert">
            ¿Estás seguro que quieres eliminar a los siguientes empleados?
        </div>

            <?php
                $encodedArray = $_GET['array'];
                $array = unserialize(urldecode($encodedArray));
                foreach($array as $value) {
                    echo $value . "<br>";
                }
                
            ?>

            <form action="index.php" method="get">
                <input type="submit" value="Regresar al catálogo">
            </form>
        </div>
    </div>
</body>
</html>
