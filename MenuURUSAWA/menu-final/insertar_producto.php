<?php
require('conexion.php');

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Obtener los datos del producto del cuerpo de la solicitud
$json = file_get_contents('php://input');
$data = json_decode($json);

// Preparar la consulta SQL
$stmt = $conn->prepare("INSERT INTO productos (titulo, precio) VALUES (?, ?)");
$stmt->bind_param("ss", $data->titulo, $data->precio);

// Ejecutar la consulta SQL
if ($stmt->execute() === TRUE) {
  echo "Producto insertado correctamente";
} else {
  echo "Error al insertar el producto: " . $conn->error;
}

$stmt->close();
$conn->close();
?>
