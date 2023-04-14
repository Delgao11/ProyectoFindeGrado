<?php
// Retrieve the data sent via POST
$product_id = $_POST['product_id'];
$product_name = $_POST['product_name'];
$product_price = $_POST['product_price'];
$product_image = $_POST['product_image'];

// Define the username and password for your MySQL database
$username = "alvaro";
$password = "1234";

// Create a new database connection
$servername = "localhost";
$dbname = "orders";
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Prepare and execute the SQL query to insert the data
$sql = "INSERT INTO orders (product_id, product_name, product_price, product_image)
        VALUES ('$product_id', '$product_name', '$product_price', '$product_image')";
if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close the connection
$conn->close();
?>
