<?php
// Conectar a la base de datos
include("conexion.php");

// Verificar ID recibido
if (!isset($_GET['id'])) {
    die("ID de evaluación no especificado.");
}
$id_evaluacion = intval($_GET['id']);

// Definir preguntas fijas
$preguntas = [
    1 => "¿Te sientes generalmente motivado para realizar tus actividades diarias?",
    2 => "¿Te cuesta conciliar el sueño por preocupaciones?",
    3 => "¿Te sientes estresado o preocupado con frecuencia?",
    4 => "¿Tienes dificultades para dormir o descansar adecuadamente?",
    5 => "¿Te sientes solo o aislado de tus compañeros y amigos?",
    6 => "¿Resuelves conflictos con facilidad?",
    7 => "¿Tienes pensamientos negativos sobre ti mismo o sobre tu futuro?",
    8 => "¿Has notado cambios significativos en tu apetito o peso?",
    9 => "¿Disfrutas de las actividades que antes te resultaban placenteras?",
    10 => "¿Sientes preocupación por las responsabilidades académicas o personales?"
];

// Obtener respuestas asociadas a la evaluación
$sql = "SELECT numero_pregunta, respuesta_usuario
        FROM respuesta_cuestionario
        WHERE id_evaluacion = $id_evaluacion";
$resultado = pg_query($conexion, $sql);

$respuestas = [];
while ($row = pg_fetch_assoc($resultado)) {
    $respuestas[intval($row['numero_pregunta'])] = $row['respuesta_usuario'];
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Detalles de la Encuesta</title>
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
      text-align: left;
    }

    th {
      background-color: #0e93bb;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    .volver {
      margin-top: 20px;
      display: block;
      text-align: center;
    }

    .volver a {
      padding: 10px 20px;
      background-color: #0e93bb;
      color: white;
      border-radius: 8px;
      text-decoration: none;
      font-weight: bold;
    }

    .volver a:hover {
      background-color: #066a85;
    }
  </style>
</head>
<body>

<h2>Detalles de la Encuesta</h2>

<table>
  <tr>
    <th>Pregunta</th>
    <th>Respuesta del Usuario</th>
  </tr>

  <?php
  foreach ($preguntas as $numero => $pregunta) {
      if (isset($respuestas[$numero])) {
          $respuesta_texto = match ($respuestas[$numero]) {
              0 => 'No',
              1 => 'Tal vez',
              2 => 'Sí',
              default => 'Sin respuesta'
          };
      } else {
          $respuesta_texto = "Sin respuesta";
      }

      echo "<tr>
              <td>" . htmlspecialchars($pregunta) . "</td>
              <td>" . htmlspecialchars($respuesta_texto) . "</td>
            </tr>";
  }
  ?>
</table>

<div class="volver">
  <a href="panel_terapeuta.php">← Volver al panel</a>
</div>

</body>
</html>
