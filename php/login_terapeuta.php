<?php
include 'conexion.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $correo = $_POST['correo_electronico'];
    $contraseña = $_POST['contraseña'];

    $query = "SELECT * FROM terapeuta WHERE correo_electronico = '$correo' AND contraseña = '$contraseña'";
    $resultado = pg_query($conexion, $query);

    if (pg_num_rows($resultado) > 0) {
        $fila = pg_fetch_assoc($resultado);
        $_SESSION['terapeuta_id'] = $fila['id_terapeuta'];
        $_SESSION['nombre_terapeuta'] = $fila['nombre'];
        header("Location: panel_terapeuta.php");
        exit();
    } else {
        header("Location: login_terapeuta.html?error=credenciales_incorrectas");
        exit();
    }
}
?>
