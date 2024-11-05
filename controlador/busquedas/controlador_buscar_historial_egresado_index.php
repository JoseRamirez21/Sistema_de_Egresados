<?php
// Verifica si se ha enviado el DNI a través de la URL
if (!empty($_GET["txtdni"])) {
   $dni = $_GET["txtdni"]; // Almacena el DNI recibido
   // Realiza una consulta para buscar el ID del estudiante correspondiente al DNI
   $buscarEstudiante = $conexion->query("SELECT id FROM estudiante WHERE dni='$dni' LIMIT 1");
   $id_estudiante = $buscarEstudiante->fetch_object()->id; // Obtiene el ID del estudiante

   // Verifica si se encontró un ID de estudiante
   if (!empty($id_estudiante)) {
      // Comenta la redirección a otra página

      // header("location:./fpdf/pruebaV.php?id=$id_estudiante"); 
?>
   <script>
      // Abre una nueva ventana con los resultados del historial del estudiante
      window.open("./vista/fpdf/Resultado_historial_index.php?id=<?= $id_estudiante ?>", "_blank");
   </script>
<?php 
   } else {
   ?>
      <script>
         // Muestra una notificación de error si el estudiante no existe
         $(function notificacion() {
            new PNotify({
               title: "INCORRECTO", 
               type: "error", 
               text: "El estudiante no existe",
               styling: "bootstrap3" 
            });
         });
      </script>
<?php
   }
} 
?>
<script>
   // Establece un temporizador para reemplazar el estado de la historia del navegador
   setTimeout(() => {
      window.history.replaceState(null, null, window.location.pathname); // Limpia la URL para evitar reenvíos del formulario
   }, 0);
</script>