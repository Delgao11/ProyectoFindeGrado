<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Urasawa</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <link rel="stylesheet" href="./css/main.css">
</head>
<?php
  // Incluye el archivo de conexión a la base de datos
  require('../conexion.php');
?>
<body>
    
    <div class="wrapper">
        <header class="header-mobile">
            <h1 class="logo">Menú Urasawa</h1>
            <button class="open-menu" id="open-menu">
                <i class="bi bi-list"></i> <!--Muestra el icono de lista de Bootstrap.-->
            </button>
        </header>
        <aside> <!--Crea un elemento lateral para el menú.-->
            <button class="close-menu" id="close-menu"> <!--Crea un botón para cerrar el menú lateral.-->
                <i class="bi bi-x"></i> <!--Muestra el icono de la x de Bootstrap-->
            </button>
            <header>
                <h1 class="logo">Menú Urasawa</h1>
            </header>
            <nav> <!--Crea una lista de navegación para los enlaces.-->
                <ul>
                    <li>
                        <a class="boton-menu boton-volver" href="./index.html">
                            <i class="bi bi-arrow-return-left"></i> Seguir comprando<!--Muestra el icono de flecha de regreso de Bootstrap.-->
                        </a>
                    </li>
                    <li>
                        <a class="boton-menu boton-carrito active" href="./carrito.html">
                            <i class="bi bi-cart-fill"></i> Carrito <!--Muestra el icono de carrito lleno de Bootstrap.-->
                        </a>
                    </li>
                </ul>
            </nav>
            <footer>
                <p class="texto-footer">© 2023 Menú Urasawa</p>
            </footer>
        </aside>
        <main>
            <h2 class="titulo-principal">Carrito</h2>
            <div class="contenedor-carrito">
                <p id="carrito-vacio" class="carrito-vacio">Tu carrito está vacío. <i class="bi bi-emoji-frown"></i></p>

                <div id="carrito-productos" class="carrito-productos disabled">
                    <!-- Esto se va a completar con el JS -->
                </div>

                <div id="carrito-acciones" class="carrito-acciones disabled">
                    <div class="carrito-acciones-izquierda">
                        <button id="carrito-acciones-vaciar" class="carrito-acciones-vaciar">Vaciar carrito</button>
                    </div>
                    <div class="carrito-acciones-derecha">
                        <div class="carrito-acciones-total">
                            <p>Total:</p>
                            <p id="total"></p>
                        </div>
                        <button id="carrito-acciones-comprar" class="carrito-acciones-comprar">Pedir ahora</button>
                    </div>
                </div>

                <p id="carrito-comprado" class="carrito-comprado disabled">Muchas gracias por tu pedido. <i class="bi bi-emoji-laughing"></i></p>

            </div>
        </main>
    </div>
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="./js/carrito.js"></script>
    <script src="./js/menu.js"></script>
</body>
</html>