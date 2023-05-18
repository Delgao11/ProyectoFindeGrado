<?php
require('conexion.php');

// Obtener los datos del producto del cuerpo de la solicitud
$json = file_get_contents('php://input');
$data = json_decode($json);

// Preparar la consulta SQL
$stmt = $conn->prepare("INSERT INTO mesa01 (titulo, precio, cantidad) VALUES (?, ?, ?)");
$stmt->bind_param("ssi", $data->titulo, $data->precio, $data->cantidad);

// Ejecutar la consulta SQL
if ($stmt->execute() === TRUE) {
    echo "Producto insertado correctamente";
} else {
    echo "Error al insertar el producto: " . $conn->error;
}

$stmt->close();
$conn->close();
?>
