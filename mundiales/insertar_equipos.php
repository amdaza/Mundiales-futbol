<?php 

        $file = 'insertar_equipos.pl';
        $text = ":- consult(funciones).\n\n";
		$text .= "insertar:-\n";
		$text .= "mundiales_connect,\n";
		$text .= $_POST['text'];
		$text .= "mundiales_disconnect.\n";
        file_put_contents($file, $text);
?>