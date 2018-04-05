#!/usr/bin/php -q
<?php 
	include "phpagi.php";//llama el phpagi
	$dbase='call_center';
	$servidor='localhost';
	$usuario='root';
	$pass='firadankana';
	$link = mysql_connect($servidor,$usuario,$pass) or die("DB Connection Error");
	mysql_select_db($dbase) or die(mysqlerror()."Error: Cannot open database");
	
	
	$uniqueid = $argv[1];
	$agi = new AGI();//instancia el AGI
	$agi->answer();// contesta la llamada
	sleep(1);
	//$agi->text2wav("CALLE 50 Numero 10 A - 08");
	$fas = fopen("/usr/res.txt", 'w');
	
	  
	$query = 'SELECT id FROM calls WHERE uniqueid ='.$uniqueid;//selecciona cuantas llamadas estan en cola para la cola definida en $cola_id
	$result = mysql_query($query) or die(mysql_error());//ejecuto sql
	while ($fila = mysql_fetch_assoc($result)) {//recorro el arreglo
		$id = $fila['id'];//cargo el contador con las llamadas en cola que tenemos
	}

	$query2 = "SELECT * FROM llamadas_recordatorios WHERE id = " . $id;
	$result2 = mysql_query($query2) or die(mysql_error());//ejecuto sql
	while ($fila = mysql_fetch_assoc($result2)) {//recorro el arreglo
		$id = $fila['id'];//cargo el contador con las llamadas en cola que tenemos
		$nombre_paciente = $fila['nombre_paciente'];
		$fecha = $fila['fecha'];
		$nombre_profesional = $fila['nombre_profesional'];
		$direccion = $fila['direccion'];
		$servicio = $fila['servicio'];
		$mensaje = $fila['mensaje'];
		$correo = $fila['correo'];
		$telefono = $fila['telefono'];
		$sede = $fila['sede'];
	}
	fclose($fas);
	date_default_timezone_set('America/Bogota');
	
	$agi->text2wav("Cordial Saludo"); //$agi->exec("Playback","custom/saludo"); //Cordial saludo 
	$nomp = explode(' ', $nombre_paciente);
	foreach($nomp as $n){
		$agi->text2wav($n); //Nombre
	}
	$agi->text2wav("Nos contactamos para recordarle su cita el dia");//Nos contactamos para recordarle su cita el dia
	$agi->text2wav($fecha);//dia
	$agi->text2wav("con el doctor");//con el doctor
	$nomp = explode(' ', $nombre_profesional);
	foreach($nomp as $n){
		$agi->text2wav($n); //doctor
	}
	$agi->text2wav("en la sede");//en la sede
	$agi->text2wav($sede);//sede
	$agi->text2wav("con direccion");//con direccion
	$agi->text2wav($direccion);//direccion
	$agi->text2wav("y recuerde");//y recuerde
	$agi->text2wav($mensaje);
	
	/*$men = explode(' ', $mensaje);
	foreach($men as $n){
		$agi->text2wav($n); //mensaje
	}*/
	mysql_close($link);
?>