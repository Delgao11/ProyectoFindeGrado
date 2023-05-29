<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pedidos Urasawa</title>
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/pedidos.css">
</head>
<body>
    <div class="wrapper">
        <header class="header">
        </header>
        <main>
            <div id="titulo" class="titulo">
                <h2 class="titulo-principal">Pedidos realizados</h2>
            </div>
            <div id="pedidos-realizados" class="pedidos-realizados">
                <a href="javascript:history.back()" class="boton-boton-secundario" id="volverBtn">Volver</a>
                
                <div id ="filtro" class="filtro-mesas">
                    
                <h3>Filtrar por mesa:</h3><form action="" method="get"><input type="submit" value="Filtrar"></form>
                    
                </div>
                
                <div class="filtro-pedidos">
                    <h3>Filtrar por pedidos:</h3>
                    <form action="" method="get">
                        <select name="filtro">
                            <option value="recientes">Pedidos más recientes</option>
                            <option value="antiguos">Pedidos más antiguos</option>
                        </select>
                        <input type="submit" value="Filtrar">
                    </form>
                </div>
                
                <?php
                error_reporting(0);
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
                                'cantidad' => $row['cantidad'],
                                'fecha_hora' => $row['fecha_hora'] // Agregado el campo de fecha
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

                // Filtrar los pedidos según el tipo seleccionado
                if (!empty($pedidos)) {
                    $filtro = isset($_GET['filtro']) ? $_GET['filtro'] : '';

                    if ($filtro == 'recientes') {
                        usort($pedidos, function ($a, $b) {
                            return strtotime($b['fecha_hora']) - strtotime($a['fecha_hora']);
                        });
                    } elseif ($filtro == 'antiguos') {
                        usort($pedidos, function ($a, $b) {
                            return strtotime($a['fecha_hora']) - strtotime($b['fecha_hora']);
                        });
                    }

                    foreach ($pedidos as $pedido) {
                        echo '
                        <div class="pedido-realizado">
                            <h3>Mesa ' . $pedido['mesa'] . '</h3>
                            <p>Título: ' . $pedido['titulo'] . '</p>
                            <p>Precio: ' . $pedido['precio'] . '€</p>
                            <p>Cantidad: ' . $pedido['cantidad'] . '</p>';
                    
                        if (isset($pedido['fecha_hora'])) {
                            echo '<p>Fecha: ' . $pedido['fecha_hora'] . '</p>';
                        }
                    
                        echo '</div>';
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
