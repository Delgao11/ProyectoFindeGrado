<?php
  // Incluye el archivo de conexión a la base de datos
  require('../conexion.php');

  // Verifica si se envió un formulario
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene la contraseña ingresada
    $password = $_POST["password"];

    // Busca la contraseña en la tabla de contraseñas
    $query = "SELECT * FROM contraseñas WHERE password = '$password'";
    $result = mysqli_query($conn, $query);

    // Verifica si la consulta devolvió alguna fila
    if (mysqli_num_rows($result) > 0) {
      // La contraseña es correcta, redirige al usuario al index.php
      header("Location: index.php");
      exit();
    } else {
      // La contraseña es incorrecta, muestra un mensaje de error
      $error = "Contraseña incorrecta";
    }
  }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="./css/login.css">
    
    <title>Login</title>
</head>
<body>
      <div class="login-container">
          <div class="login-info-container">
            <form class="inputs-container" method="post">
                <input class="input" type="password" name="password" placeholder="Contraseña">
                <button class="btn" type="submit">Login</button>
            </form>
            <?php if (isset($error)) { ?>
              <div class="error"><?php echo $error ?></div>
            <?php } ?>
          </div>
      </div>
</body>
</html>
