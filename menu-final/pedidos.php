<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pedidos Urasawa</title>
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/pedidos.css">
</head>
<body>
    <div class="wrapper">
        <header class="header">
        </header>
        <main>
            <h2 class="titulo-principal">Tus Pedidos:</h2>
            <div id="pedidos-realizados" class="pedidos-realizados">
                <a href="javascript:history.back()" class="boton-boton-secundario" id="volverBtn">Volver</a>
                <?php
require('conexion.php');
session_start();

$response = ""; // Variable para almacenar la respuesta

// Obtener el código de mesa de la sesión
$codigoMesa = $_SESSION["codigo_mesa"];

// Verificar si el usuario es un administrador
if ($codigoMesa == "admin") {
    echo '<p class="ningun-pedido">No tienes ningún pedido reciente</p>';
} else {
    // Obtener los pedidos realizados por el usuario actual, agrupados por codigo_mesa
    $stmt = $conn->prepare("SELECT codigo_mesa, GROUP_CONCAT(titulo SEPARATOR ', ') AS titulos, SUM(precio * cantidad) AS total FROM pedidos WHERE codigo_mesa = ? AND TIMESTAMPDIFF(MINUTE, fecha_hora, NOW()) <= 60 GROUP BY codigo_mesa");
    if ($stmt) {
        $stmt->bind_param("s", $codigoMesa);
        $stmt->execute();
        $result = $stmt->get_result();
        $pedidos = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();
    } else {
        $response = "Error al preparar la consulta: " . $conn->error;
    }

    if (!empty($pedidos)) {
        foreach ($pedidos as $pedido) {
            echo '
            <div class="pedido-realizado">
                <h3>' . $pedido['codigo_mesa'] . '</h3>
                <p>Productos: ' . $pedido['titulos'] . '</p>
                <p>Total: ' . $pedido['total'] . '€</p>
            </div>
            ';
        }
    } else {
        echo '<p>No se han realizado pedidos o han pasado más de 60 minutos.</p>';
    }
}

$conn->close();
?>

            </div>
        </main>
    </div>
</body>
</html>
