<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pedidos Urasawa</title>
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/pedidos.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
    <div class="wrapper">
        <!-- Resto del código... -->
        <main>
            <div id="titulo" class="titulo">
                <h2 class="titulo-principal">Pedidos realizados</h2>
            </div>
            <div id="pedidos-realizados" class="pedidos-realizados">
                <a href="javascript:history.back()" class="boton-boton-secundario" id="volverBtn">Volver</a>
                <?php
                    error_reporting(0);
                    require('conexion.php');
                    session_start();

                    // Obtener los pedidos agrupados por código de mesa
                    $stmt = $conn->prepare("SELECT codigo_mesa, GROUP_CONCAT(titulo SEPARATOR ', ') AS titulos, SUM(precio) AS total_precio, SUM(cantidad) AS total_cantidad, MAX(estado_pedido) AS estado FROM pedidos GROUP BY codigo_mesa");
                    if ($stmt) {
                        $stmt->execute();
                        $result = $stmt->get_result();
                        $pedidos = $result->fetch_all(MYSQLI_ASSOC);
                        $stmt->close();
                    } else {
                        $response = "Error al preparar la consulta: " . $conn->error;
                    }

                    $conn->close();

                    // Mostrar la tabla de pedidos
                    if (!empty($pedidos)) {
                        foreach ($pedidos as $pedido) {
                            echo '
                            <div class="pedido">
                                <p><strong>' . $pedido['codigo_mesa'] . '</strong> </p>
                                <p><strong>Productos:</strong> ' . $pedido['titulos'] . '</p>
                                <p><strong>Precio Total:</strong> ' . $pedido['total_precio'] . '€</p>
                                <p><strong>Cantidad Total:</strong> ' . $pedido['total_cantidad'] . '</p>
                                <p><strong>Estado:</strong> ' . $pedido['estado'] . '</p>
                                <form action="cambiarEstadoPedido.php" method="post">
                                    <input type="hidden" name="codigo_mesa" value="' . $pedido['codigo_mesa'] . '">
                                    <select name="estado_pedido">
                                        <option value="Cancelado">Cancelado</option>
                                        <option value="Realizado">Realizado</option>
                                        <option value="Pendiente">Pendiente</option>
                                    </select>
                                    <input type="submit" value="Cambiar Estado">
                                </form>
                                <form action="borrarPedidos.php" method="post">
                                    <input type="hidden" name="codigo_mesa" value="' . $pedido['codigo_mesa'] . '">
                                    <input type="submit" value="Borrar Pedidos" class="boton-borrar-pedido">

                                </form>
                            </div>';
                        }
                    } else {
                        echo '<p>No se han realizado pedidos.</p>';
                    }
                ?>
            </div>
        </main>
    </div>
    <script>
    // Obtén todos los elementos con la clase "boton-borrar-pedido"
    const botonesBorrarPedido = document.querySelectorAll('.boton-borrar-pedido');

    // Itera sobre los botones y agrega un evento click a cada uno
    botonesBorrarPedido.forEach(boton => {
        boton.addEventListener('click', (event) => {
            event.preventDefault(); // Evita que el formulario se envíe automáticamente

            // Muestra la Sweet Alert de confirmación
            Swal.fire({
                title: '¿Estás seguro?',
                text: '¿Quieres borrar este pedido?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, borrar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Si el usuario confirma, envía el formulario
                    boton.closest('form').submit();
                }
            });
        });
    });
</script>

</body>
</html>
