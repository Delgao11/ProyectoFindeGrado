<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Urasawa</title>
    <!--  Los iconos de Bootstrap son una fuente de iconos, lo que significa que están basados en texto en lugar de en imágenes. 
    Esto los hace escalables y personalizables mediante CSS. Además, al ser una fuente de iconos, pueden ser manipulados mediante JavaScript.-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <!--  Es una biblioteca de notificaciones en pantalla para aplicaciones web-->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <link rel="stylesheet" href="./css/main.css">


</head>

<body>
<?php
  // Incluye el archivo de conexión a la base de datos
  require('conexion.php');
  session_start(); // Inicia la sesión
?>

    <!-- el wrapper es un contenedor que envuelve todo el contenido de la página.-->
    <div class="wrapper">
        <!--una sección que contiene el encabezado de la página, incluyendo un título principal y un botón para abrir el menú-->
        <header class="header-mobile">
            <h1 class="logo">Menú Urasawa</h1>
         
            <button class="open-menu" id="open-menu">
            
                <!-- íconos de la biblioteca de iconos Bootstrap utilizados para indicar el estado del menú.-->
                <i class="bi bi-list"></i>
            </button>
        </header>
        <!--  el aside es una sección que se utiliza para mostrar el menú de navegación, incluyendo opciones para ver el carrito de compras y todos los productos.-->
        <aside>
            <button class="close-menu" id="close-menu">
                <!-- íconos de la biblioteca de iconos Bootstrap utilizados para indicar el estado del menú.-->
                <i class="bi bi-x"></i>
            </button>
            <header>
                <h1 class="logo">Menú Urasawa</h1>
            </header>
            <nav>
    <ul class="menu">
        <li>
            <button id="categoria-bebidas" class="boton-menu boton-categoria active">
                <i class="bi bi-hand-index-thumb-fill"></i> Bebidas
            </button>
        </li>
        <li>
            <button id="categoria-makis" class="boton-menu boton-categoria active">
                <i class="bi bi-hand-index-thumb-fill"></i> Makis
            </button>
        </li>
        <li>
            <button id="categoria-nigiris" class="boton-menu boton-categoria active">
                <i class="bi bi-hand-index-thumb-fill"></i> Nigiris
            </button>
        </li>
        <li>
            <button id="categoria-fritos" class="boton-menu boton-categoria active">
                <i class="bi bi-hand-index-thumb-fill"></i> Fritos
            </button>
        </li>
        <li>
            <button id="categoria-platos-elaborados" class="boton-menu boton-categoria active">
                <i class="bi bi-hand-index-thumb-fill"></i> Platos Elaborados
            </button>
        </li>
        <li>
            <button id="categoria-todos" class="boton-menu boton-categoria active">
                <i class="bi bi-hand-index-thumb-fill"></i> Todos los Productos
            </button>
        </li>
        
        <li>
            <a class="boton-menu boton-categoria active-carrito" href="./carrito.php">
                <i class="bi bi-cart-fill"></i> Para Pedir <span id="numerito" class="numerito">0</span>
            </a>
        </li>
        <li>
            <a class="boton-menu boton-categoria active-pedido" href="./pedidos.php">
                <i class="bi bi-cart-fill"></i>Cuenta<span id="numerito" class="numerito">0</span>
            </a>
        </li>
           
    </ul>
</nav>
            <footer>
                <p class="texto-footer">© 2023 Menú Urasawa</p>
            </footer>
        </aside>
        <main>
            <?php
              if (isset($_SESSION["codigo_mesa"])) {
                // Si la variable de sesión existe, muestra el código de la mesa en el título principal
                echo '<h2 class="titulo-principal" id="titulo-principal">' . $_SESSION["codigo_mesa"] . '</h2>';
              } else {
                // Si la variable de sesión no existe, muestra el título predeterminado
                echo '<h2 class="titulo-principal" id="titulo-principal">Todos los productos</h2>';
              }
            ?>
            <div id="contenedor-productos" class="contenedor-productos">
                <!-- Esto se va a rellenar con JS -->
            </div>
        </main>
    </div>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <script src="./js/main.js"></script>
    <script src="./js/menu.js"></script>
</body>

</html>
