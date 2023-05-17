
    <?php
    // Configuración de la conexión a la base de datos
    $host = '127.0.0.1';
    $user = 'root';
    $database = 'urusawa';
    $password = ""; 

    
    // Establecer conexión a la base de datos
    $conn = mysqli_connect($host, $user, $password, $database);
    
    // Verificar si la conexión fue exitosa
    if (!$conn) {
        die("Conexión fallida: " . mysqli_connect_error());
    }
    
    echo "Conexión exitosa";
    mysqli_set_charset($conn, "utf8");

    ?>
    


