<?php
  // Incluye el archivo de conexión a la base de datos
  require('conexion.php');

  // Define variables para almacenar el tipo de mensaje y el mensaje
  $tipoMensaje = "";
  $mensaje = "";

  // Verifica si se envió un formulario
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene el código de mesa y la contraseña ingresados
    $codigo = $_POST["codigo"];
    $password = $_POST["password"];

    // Verifica que ambos campos hayan sido completados
    if (!empty($codigo) && !empty($password)) {
      if ($codigo == "admin" && $password == "admin123") {
        // Es un administrador, redirige al usuario a pedidos.php
        session_start(); // Inicia la sesión
        $_SESSION["codigo_mesa"] = $codigo; // Crea la variable de sesión con el código de mesa
        header("Location: pedidosAdmin.php");
        exit();
      } else {
        // Busca la mesa en la base de datos con el código ingresado por el usuario
        $query = "SELECT * FROM mesas WHERE codigo = '$codigo'";
        $result = mysqli_query($conn, $query);

        // Verifica si la consulta devolvió alguna fila
        if (mysqli_num_rows($result) > 0) {
          // La mesa existe, verifica si la contraseña es correcta
          $row = mysqli_fetch_assoc($result);

          if ($row["password"] == $password) {
            // Es una mesa, redirige al usuario a index.php
            session_start(); // Inicia la sesión
            $_SESSION["codigo_mesa"] = $codigo; // Crea la variable de sesión con el código de mesa
            header("Location: index.php");
            exit();
          } else {
            // La contraseña es incorrecta, establece el tipo y mensaje de error
            $tipoMensaje = "error";
            $mensaje = "Contraseña incorrecta";
          }
        } else {
          // La mesa no existe, establece el tipo y mensaje de error
          $tipoMensaje = "error";
          $mensaje = "Código de mesa incorrecto";
        }
      }
    } else {
      // Si alguno de los campos está vacío, establece el tipo y mensaje de error
      $tipoMensaje = "error";
      $mensaje = "Por favor, completa todos los campos";
    }
  }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/main.css">
    
    <title>Login</title>
</head>
<body>
    <div class="login-container">
        <div class="login-info-container">
          <form class="inputs-container" method="post">
          <h1>URASAWA MENÚ</h1>
              <input class="f" type="text" name="codigo" placeholder="Código de mesa" required>
              <input class="f" type="password" name="password" placeholder="Contraseña" required>
              <button class="btn" type="submit">Login</button>
          </form>
        </div>
    </div>

    <!-- Agrega la librería de Sweet Alert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <?php
      // Verifica si hay un mensaje para mostrar
      if (!empty($tipoMensaje) && !empty($mensaje)) {
        // Muestra la alerta según el tipo de mensaje
        echo "<script>
          swal({
            title: '" . ucfirst($tipoMensaje) . "',
            text: '$mensaje',
            icon: '$tipoMensaje',
            button: 'Aceptar'
          });
        </script>";
      }
    ?>
</body>
</html>
