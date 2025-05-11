<?php
$conexion = pg_connect("host=localhost port=5433 dbname=alertamental_db user=postgres password=PostgreSql13@");

if (!$conexion) {
    die("Error de conexión a la base de datos.");
}
?>
