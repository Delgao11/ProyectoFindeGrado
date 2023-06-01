<?php
require('conexion.php');

// Obtener el código de mesa
$codigoMesa = $_POST['codigo_mesa'];

// Eliminar los pedidos de la base de datos con el mismo código de mesa
$stmt = $conn->prepare("DELETE FROM pedidos WHERE codigo_mesa = ?");
if ($stmt) {
    $stmt->bind_param("s", $codigoMesa);
    $stmt->execute();
    $stmt->close();

    // Redireccionar a la página de pedidos
    header("Location: pedidosAdmin.php");
    exit();
} else {
    $response = "Error al preparar la consulta: " . $conn->error;
}
?>
