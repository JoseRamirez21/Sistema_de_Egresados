<?php
// Inicia la sesión para poder almacenar información del usuario
session_start();

// Verifica si se ha enviado el formulario al hacer clic en el botón 'btningresar'
if (!empty($_POST['btningresar'])) {
    // Verifica que los campos de usuario, contraseña y tipo no estén vacíos
    if (!empty($_POST['txtusuario']) and !empty($_POST['txtpassword']) and !empty($_POST['txttipo'])) {
        
        // Almacena los datos ingresados por el usuario
        $usuario = $_POST['txtusuario']; // Nombre de usuario
        $clave = md5($_POST['txtpassword']); // Contraseña encriptada con MD5
        $tipo = $_POST['txttipo']; // Tipo de usuario (administrador o egresado)

        // Verifica el tipo de usuario e intenta buscar en la base de datos
        if ($tipo == "administrador") {
            // Consulta para verificar administrador
            $consulta = $conexion->query("SELECT * FROM usuario WHERE usuario='$usuario' AND clave='$clave'");
        } else {
            if ($tipo == "egresado") {
                // Consulta para verificar egresado
                $consulta = $conexion->query("SELECT * FROM estudiante WHERE usuario='$usuario' AND clave='$clave'");
            }
        }

        // Verifica si se encontraron datos del usuario
        if ($datos = $consulta->fetch_object()) {
            // Almacena información del usuario en la sesión
            $_SESSION['user'] = $datos->usuario; // Almacena el nombre de usuario

            // Almacena el ID del usuario basado en el tipo
            if ($tipo == "administrador") {
                $_SESSION['id'] = $datos->id_usuario; // ID para administrador
            } else {
                if ($tipo == "egresado") {
                    $_SESSION['id'] = $datos->id; // ID para egresado
                }
            }

            // Almacena información adicional del usuario en la sesión
            $_SESSION['nombre'] = $datos->nombre; // Nombre del usuario
            $_SESSION['ape_paterno'] = $datos->ape_paterno; // Apellido paterno
            $_SESSION['ape_materno'] = $datos->ape_materno; // Apellido materno
            $_SESSION['tipo'] = $tipo; // Tipo de usuario

            // Redirige al usuario al menú correspondiente
            header('location:../menu_coordinador.php');
        } else {
            // Si las credenciales son incorrectas, muestra un mensaje de error
            echo '<div style="padding:15px;color:red">Usuario o contraseña incorrecta</div>';
        }
    } else {
        // Si algún campo está vacío, muestra un mensaje de advertencia
        echo '<div style="padding:15px;color:red">Campos vacíos</div>';
    }
}
?>