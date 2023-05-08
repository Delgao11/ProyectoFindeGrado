<?php
// Conectar a la base de datos
$servername = "localhost";
$username = "root";
$password = "4444";
$dbname = "productosmenu";

$conn = mysqli_connect($servername, $username, $password, $dbname);
if (!$conn) {
    die("Conexión fallida: " . mysqli_connect_error());
}

// Leer el archivo .json
$json = file_get_contents('./js/productos.json');

// Decodificar los datos del archivo .json en un array asociativo
$array_data = json_decode($json, true);

// Iterar sobre los datos y guardarlos en la tabla de MySQL
foreach ($array_data as $row) {
    $id = $row['id'];
    $titulo = $row['titulo'];
    $imagen = $row['imagen'];
    $categoria_nombre = $row['categoria_nombre'];
    $categoria_id = $row['categoria_id'];
    $precio = $row['precio'];

    $sql = "INSERT INTO productos (id, titulo, imagen, categoria_nombre, categoria_id, precio) VALUES ('$id', '$titulo', '$imagen', '$categoria_nombre', '$categoria_id', '$precio')";
    if (!mysqli_query($conn, $sql)) {
        die('Error : Query Not Executed. Please Fix the Issue! ' . mysqli_error($conn));
    } 
    echo "$id"
}

// Cerrar la conexión a la base de datos
mysqli_close($conn);

?>