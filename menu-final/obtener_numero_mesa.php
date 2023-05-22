<?php
session_start(); // Inicia la sesión

if (isset($_SESSION["codigo_mesa"])) {
  $codigoMesa = $_SESSION["codigo_mesa"];
  echo $codigoMesa;
} else {
  echo "Código de mesa no disponible";
}
?>
