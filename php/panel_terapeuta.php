<?php
session_start();
include("conexion.php");

// Parámetros de paginación
$por_pagina = 10;
$pagina = isset($_GET['pagina']) ? max(1, intval($_GET['pagina'])) : 1;
$offset = ($pagina - 1) * $por_pagina;

// Obtener total de evaluaciones para calcular páginas
$total_query = pg_query($conexion, "SELECT COUNT(*) FROM evaluacion");
$total_filas = pg_fetch_result($total_query, 0, 0);
$total_paginas = ceil($total_filas / $por_pagina);

// Consulta paginada
$sql = "SELECT e.id_evaluacion, u.nombre, u.correo_electronico, e.fecha, e.resultado_general, 
               d.nivel_gravedad, d.descripcion AS diagnostico
        FROM evaluacion e
        INNER JOIN usuario u ON e.id_usuario = u.id_usuario
        LEFT JOIN diagnostico d ON e.id_evaluacion = d.id_evaluacion
        ORDER BY e.fecha DESC
        LIMIT $por_pagina OFFSET $offset";

$resultado = pg_query($conexion, $sql);

if (!$resultado) {
    die("Error en la consulta: " . pg_last_error($conexion));
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Panel del Terapeuta</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f6f7;
      padding: 40px;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
    }

    th, td {
      padding: 12px;
      border: 1px solid #ddd;
      text-align: center;
    }

    th {
      background-color: #0e93bb;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    .riesgo-alto {
      color: red;
      font-weight: bold;
    }

    .riesgo-medio {
      color: orange;
      font-weight: bold;
    }

    .riesgo-bajo {
      color: green;
      font-weight: bold;
    }

    .ver-detalles a {
      text-decoration: none;
      color: #0e93bb;
      font-weight: bold;
    }

    .paginacion {
      text-align: center;
      margin-top: 20px;
    }

    .paginacion a {
      margin: 0 4px;
      padding: 8px 14px;
      background-color: #0e93bb;
      color: white;
      text-decoration: none;
      border-radius: 5px;
    }

    .paginacion a:hover {
      background-color: #066a85;
    }

    .paginacion .actual {
      font-weight: bold;
      background-color: #066a85;
    }

    .paginacion .disabled {
      background-color: #ccc;
      pointer-events: none;
      cursor: default;
    }
  </style>
</head>
<body>

<h2>Resultados de Autoevaluaciones</h2>

<table>
  <thead>
    <tr>
      <th>Nombre del Usuario</th>
      <th>Correo</th>
      <th>Fecha</th>
      <th>Resultado</th>
      <th>Nivel de Gravedad</th>
      <th>Diagnóstico</th>
      <th>Ver Encuesta</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($fila = pg_fetch_assoc($resultado)) { ?>
      <tr>
        <td><?= htmlspecialchars($fila['nombre']) ?></td>
        <td><?= htmlspecialchars($fila['correo_electronico']) ?></td>
        <td><?= htmlspecialchars($fila['fecha']) ?></td>
        <td><?= htmlspecialchars($fila['resultado_general']) ?></td>
        <td class="<?= $fila['nivel_gravedad'] >= 8 ? 'riesgo-alto' : ($fila['nivel_gravedad'] >= 5 ? 'riesgo-medio' : 'riesgo-bajo') ?>">
          <?= htmlspecialchars($fila['nivel_gravedad']) ?>
        </td>
        <td><?= htmlspecialchars($fila['diagnostico']) ?></td>
        <td class="ver-detalles">
          <a href="ver_encuesta.php?id=<?= $fila['id_evaluacion'] ?>">Ver</a>
        </td>
      </tr>
    <?php } ?>
  </tbody>
</table>

<div class="paginacion">
  <!-- Botón anterior -->
  <a class="<?= $pagina <= 1 ? 'disabled' : '' ?>" href="?pagina=<?= max(1, $pagina - 1) ?>">← Anterior</a>

  <!-- Números de página -->
  <?php for ($i = 1; $i <= $total_paginas; $i++): ?>
    <a href="?pagina=<?= $i ?>" class="<?= $i == $pagina ? 'actual' : '' ?>"><?= $i ?></a>
  <?php endfor; ?>

  <!-- Botón siguiente -->
  <a class="<?= $pagina >= $total_paginas ? 'disabled' : '' ?>" href="?pagina=<?= min($total_paginas, $pagina + 1) ?>">Siguiente →</a>
</div>

</body>
</html>
