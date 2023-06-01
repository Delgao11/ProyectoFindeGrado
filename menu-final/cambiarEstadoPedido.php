<?php
require('conexion.php');

// Obtener el código de la mesa y el nuevo estado
$codigoMesa = $_POST['codigo_mesa'];
$estadoPedido = $_POST['estado_pedido'];

// Actualizar el estado de los pedidos en la base de datos
$stmt = $conn->prepare("UPDATE pedidos SET estado_pedido = ? WHERE codigo_mesa = ?");
if ($stmt) {
    $stmt->bind_param("ss", $estadoPedido, $codigoMesa);
    $stmt->execute();
    $stmt->close();

    // Redireccionar a la página de pedidos
    header("Location: pedidosAdmin.php");
    exit();
} else {
    $response = "Error al preparar la consulta: " . $conn->error;
}
?>
