<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pedidos Urasawa</title>
    <link rel="stylesheet" href="./css/main.css">
</head>
<body>
    <div class="wrapper">
        <header class="header">
        </header>
        <main>
            <h2 class="titulo-principal">Pedidos realizados</h2>
            <div id="pedidos-realizados" class="pedidos-realizados">
            <a href="javascript:history.back()" class="boton-boton-secundario" id="volverBtn">Volver</a>
                <?php
                require('conexion.php');
                session_start();

                $response = ""; // Variable para almacenar la respuesta

                // Obtener los pedidos realizados
                $pedidos = array();
                $mesas = range(1, 15);
                foreach ($mesas as $mesa) {
                    $tabla = "pedidomesa" . str_pad($mesa, 2, "0", STR_PAD_LEFT);
                    $stmt = $conn->prepare("SELECT * FROM $tabla");
                    if ($stmt) {
                        $stmt->execute();
                        $result = $stmt->get_result();
                        while ($row = $result->fetch_assoc()) {
                            $pedido = array(
                                'mesa' => $mesa,
                                'titulo' => $row['titulo'],
                                'precio' => $row['precio'],
                                'cantidad' => $row['cantidad']
                            );
                            array_push($pedidos, $pedido);
                        }
                        $stmt->close();
                    } else {
                        $response = "Error al preparar la consulta: " . $conn->error;
                        break; // Salir del bucle si ocurre un error
                    }
                }

                $conn->close();

                if (!empty($pedidos)) {
                    foreach ($pedidos as $pedido) {
                        echo '
                        <div class="pedido-realizado">
                            <h3>Mesa ' . $pedido['mesa'] . '</h3>
                            <p>Título: ' . $pedido['titulo'] . '</p>
                            <p>Precio: ' . $pedido['precio'] . '€</p>
                            <p>Cantidad: ' . $pedido['cantidad'] . '</p>
                            <p>-------------------------------------</p>
                        </div>
                        ';
                    }
                } else {
                    echo '<p>No se han realizado pedidos.</p>';
                }
                ?>
            </div>
        </main>
    </div>
</body>
</html>
