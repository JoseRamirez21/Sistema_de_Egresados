<?php
// Conexión a la base de datos
$conexion = new mysqli("localhost", "root", "", "sistema_egresados");

// Establecer el conjunto de caracteres
$conexion->set_charset("utf8");

// Establecer la zona horaria
date_default_timezone_set("America/Lima");

// Verificación de la conexión
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
} else {
    echo "Conexión exitosa a la base de datos.<br>";
}

// Consulta simple para verificar que la base de datos responde
$result = $conexion->query("SELECT DATABASE() AS current_db");

if ($result) {
    $row = $result->fetch_assoc();
    echo "Base de datos actual: " . $row['current_db'] . "<br>";
} else {
    echo "Error al ejecutar la consulta: " . $conexion->error;
}

// Cerrar la conexión
$conexion->close();
?>