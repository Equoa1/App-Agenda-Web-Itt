    <?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "bdapp";

    // Crear conexión
    $conexion = mysqli_connect($servername, $username, $password, $dbname);

        session_start();

        
        
        
        if($_GET){
            $id = $_GET['id']; 
            $consulta = "select * from inscripcion inner join users on users.id=inscripcion.udi inner join exam on exam.idexamen=inscripcion.examen_id where exam.idexamen=$id;";
            $resultado = mysqli_query($conexion, $consulta);
            $consulta_fecha = "SELECT fechaexamen FROM exam WHERE idexamen=$id";
            $resultado_fecha = mysqli_query($conexion, $consulta_fecha);
            $fecha_examen = mysqli_fetch_assoc($resultado_fecha)['fechaexamen'];
          

            $nombre_archivo = 'C:\Users\Equoa\Desktop\Examen_Dia '.$fecha_examen.'.csv';

        
            $encabezados = array('Genero','Folio', 'Control', 'Paterno', 'Materno', 'Nombre', 'Carrera','Calificacion','Calificacion Con Letra');
            
            $archivo = fopen($nombre_archivo, 'w');
            fputcsv($archivo, $encabezados);
        
        
            
            while ($fila = mysqli_fetch_assoc($resultado)) {
                $fila_csv = array(
                    $fila['genero'],
                    $fila['folio'],
                    $fila['matricula'],
                    $fila['apellidopaterno'],
                    $fila['apellidomaterno'],
                    $fila['name'],
                    $fila['carrera'],
                   
                );
                fputcsv($archivo, $fila_csv);
            }
        
           
            fclose($archivo);
        }
            
            
            
        


    ?>