<?php

    $database= new mysqli("localhost","root","","bdapp");
    if ($database->connect_error){
        die("Connection failed:  ".$database->connect_error);
    }

?>