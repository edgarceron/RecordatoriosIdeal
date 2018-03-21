<html>
<head>
<title>Recordatorio de cita</title>
</head>
<body>
<div style="background: none repeat scroll 0 0 #00AFDA;
    font-family: arial;
    height: 25%;
    padding: 2%;
    text-align: center;
    width: 96%;">
<h2>AQUI UNA IMAGEN</h2>
</div>
<div style="background: none repeat scroll 0 0 #FFFFFF;
    font-family: arial;
    height: 30%;
    padding: 2%;
    text-align: center;
    width: 96%;">
		Recordatorio de cita medica asignada</br><hr>
		Fecha de cita: </br>
		<p><?php echo $recordatorio['fecha'] ?> </p><hr>
		Nombre afiliado: </br>
		<p><?php echo $recordatorio['nombre_paciente'] ?> </p><hr>
		Nombre profesional: </br>
		<p><?php echo $recordatorio['nombre_profesional'] ?> </p><hr>
		Nombre de la sede:</br>
		<p><?php echo $recordatorio['sede'] ?> </p><hr>
		Nombre del servicio:</br>
		<p><?php //echo $recordatorio['servicio'] ?> </p><hr><br> 
		<p> <?php echo $recordatorio['mensaje'] ?> </p><br>
		<p> Nota, este mensaje se genero automaticamente por 
		favor no responda </p>
	</div>

</body>
</html>