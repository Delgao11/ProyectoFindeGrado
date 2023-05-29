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
            <h2 class="titulo-principal"> Tus Pedidos realizados:</h2>
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
    echo '<p>Acceso solo para mesas</p>';
} else {
    // Obtener el número de mesa a partir del código
    $mesa = substr($codigoMesa, -2);

    // Construir el nombre de la tabla de pedidos correspondiente a la mesa
    $tablaPedidos = "pedidomesa" . str_pad($mesa, 2, "0", STR_PAD_LEFT);

    // Obtener los pedidos realizados en la mesa
    $stmt = $conn->prepare("SELECT * FROM $tablaPedidos");
    if ($stmt) {
        $stmt->execute();
        $result = $stmt->get_result();
        $pedidos = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();
    } else {
        $response = "Error al preparar la consulta: " . $conn->error;
    }

    if (!empty($pedidos)) {
        foreach ($pedidos as $pedido) {
            // Obtener la fecha y hora actual
            $fechaHoraActual = date('Y-m-d H:i:s');

            // Calcular la diferencia en segundos entre la fecha y hora actual y la fecha y hora del pedido
            $diferencia = strtotime($fechaHoraActual) - strtotime($pedido['fecha_hora']);

            // Convertir la diferencia a minutos
            $diferenciaMinutos = $diferencia / 60;

            // Verificar si la diferencia es menor o igual a 90 minutos (una hora y media)
            if ($diferenciaMinutos <= 60) {
                echo '
                <div class="pedido-realizado">
                    <h3>Mesa ' . $mesa . '</h3>
                    <p>Título: ' . $pedido['titulo'] . '</p>
                    <p>Precio: ' . $pedido['precio'] . '€</p>
                    <p>Cantidad: ' . $pedido['cantidad'] . '</p>
                </div>
                ';
            }
        }
    } else {
        echo '<p>No se han realizado pedidos.</p>';
    }
}

$conn->close();
?>

            </div>
        </main>
    </div>
</body>
</html>
