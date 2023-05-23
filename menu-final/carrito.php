<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Urasawa</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-icbq6l0pfQ28eVL96KhukdKDBtr2VvjGqxgco1BE5Ow1b2M2QsRmBke3vK6jI6s+DcXeE4Jb60YgQmE/dytn1Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <link rel="stylesheet" href="./css/main.css">
</head>
<?php
require('conexion.php');

$response = ""; // Variable para almacenar la respuesta

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $productosJSON = $_POST["productos"];
    $productos = json_decode($productosJSON);
    if (isset($productos)) {
        
        $mesa = filter_var($_POST["mesa"], FILTER_SANITIZE_NUMBER_INT);

        if ($mesa >= 1 && $mesa <= 15) {
            $tabla = "pedidomesa" . str_pad($mesa, 2, "0", STR_PAD_LEFT);

            foreach ($productos as $producto) {
                $titulo = $producto->titulo;
                $precio = $producto->precio;
                $cantidad = $producto->cantidad;
            
                $stmt = $conn->prepare("INSERT INTO $tabla (codigomesa, titulo, precio, cantidad) VALUES (?, ?, ?, ?)");
            
                if ($stmt) {
                    $stmt->bind_param("isii", $mesa, $titulo, $precio, $cantidad); // Cambio de "ssis" a "isii" para el tipo de dato correcto
                    if (!$stmt->execute()) {
                        $response = "Error al guardar los datos: " . $stmt->error;
                        break; // Salir del bucle si ocurre un error
                    }
                    $stmt->close();
                } else {
                    $response = "Error al preparar la consulta: " . $conn->error;
                    break; // Salir del bucle si ocurre un error
                }
            }
            

            // Si no hubo errores, la respuesta será "success"
            if ($response === "") {
                $response = "success";
            }
        } else {
            $response = "Número de mesa inválido.";
        }
    }
}

$conn->close();

if (empty($productos) && $response === "success") {
    echo '<script>window.location.href = "./carrito.php";</script>';
    exit();
}

echo $response; // Devolver la respuesta al cliente
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
                        <a class="boton-menu boton-volver" href="./index.php">
                            <i class="bi bi-arrow-return-left"></i> Seguir comprando<!--Muestra el icono de flecha de regreso de Bootstrap.-->
                        </a>
                    </li>
                    <li>
                        <a class="boton-menu boton-carrito active" href="./carrito.php">
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
                <a href="javascript:history.back()" class="boton-boton-secundario" id="volverBtn">Volver</a>


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