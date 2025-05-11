<?php
include 'conexion.php';

$correo = $_POST['correo_electronico'];
$contraseña = $_POST['contraseña'];

// Consulta para verificar las credenciales
$query = "SELECT * FROM usuario WHERE correo_electronico = '$correo' AND contraseña = '$contraseña'";
$result = pg_query($conexion, $query);

// Si no se encuentra un usuario con esas credenciales
if (pg_num_rows($result) == 0) {
    // Redirigir al login con mensaje de error
    header("Location: ../login.html?error=credenciales_incorrectas");
    exit();
} else {
    // Si las credenciales son correctas, iniciar sesión (puedes agregar más lógica aquí)
    session_start();
    $_SESSION['usuario_id'] = pg_fetch_result($result, 0, 'id_usuario');
    header("Location: ../index.html"); // Redirige a la página principal del usuario
    exit();
}
?>
