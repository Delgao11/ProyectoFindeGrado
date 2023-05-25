<?php
// Obtener el valor de la mesa desde la URL
session_start();

$mesa = $_GET['mesa'];

$codigo_mesa = $_SESSION['codigo_mesa'];

// Comparar con el valor de la variable $codigo_mesa
if ($mesa === $codigo_mesa) {
  // Devolver respuesta en formato JSON
  echo json_encode(array('status' => 'success'));
} else {
  echo json_encode(array('status' => 'Carrito vacío'));
}
?>


