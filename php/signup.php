<?php
include 'conexion.php';

$nombre = $_POST['nombre'];
$edad = $_POST['edad'];
$carrera = $_POST['carrera'];
$semestre = $_POST['semestre'];
$correo = $_POST['correo_electronico'];
$contraseña = $_POST['contraseña']; // ← ya no se encripta
$fecha_registro = date('Y-m-d');

// Verifica si el correo ya está registrado
$check_query = "SELECT 1 FROM usuario WHERE correo_electronico = '$correo'";
$check_result = pg_query($conexion, $check_query);
if (pg_num_rows($check_result) > 0) {
    // Si el correo ya existe, redirige con mensaje de error
    header("Location: ../signup.html?error=correo_usado");
    exit();
}

// Si el correo no está registrado, realiza el registro
$query = "INSERT INTO usuario (nombre, edad, carrera, semestre, correo_electronico, contraseña, fecha_registro) 
          VALUES ('$nombre', '$edad', '$carrera', '$semestre', '$correo', '$contraseña', '$fecha_registro')";

if (pg_query($conexion, $query)) {
    // Redirige al login con mensaje en la URL
    header("Location: ../signup.html?registro=exitoso");
    exit();
} else {
    echo "❌ Error al registrar: " . pg_last_error($conexion);
}
?>
