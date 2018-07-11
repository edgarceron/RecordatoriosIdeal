<html>
<head>
<title>Recordatorio de cita</title>
</head>
<body>
<div style="background: none repeat scroll 0 0 #FDD828;
    font-family: arial;
    height: 25%;
    padding: 2%;
    text-align: center;
    width: 96%;">
<h2><img src="http://www.fundacionideal.org.co/sites/all/themes/clean_theme/images/fundacion-ideal.svg"/></h2>
</div>
<div style="background: none repeat scroll 0 0 #F1F2F2;
    font-family: arial;
    height: 30%;
    padding: 2%;
    text-align: center;
    width: 96%;">
		<h2 style="color: #58595B; font-size: 20px;"><?php echo strtoupper ("Recordatorio de cita medica asignada") ?></h2></br><hr>
		Fecha de cita: </br>
		<h2 style="color: #58595B; font-size: 20px;"><?php echo strtoupper (date('j/n/o',  strtotime($recordatorio['fecha']))) ?> </h2><hr>
		Nombre afiliado: </br>
		<h2 style="color: #58595B; font-size: 20px;"><?php echo strtoupper ($recordatorio['nombre_paciente']) ?> </h2><hr>
		Nombre profesional: </br>
		<h2 style="color: #58595B; font-size: 20px;"><?php echo strtoupper ($recordatorio['nombre_profesional']) ?> </h2><hr>
		Nombre de la sede:</br>
		<h2 style="color: #58595B; font-size: 20px;"><?php echo strtoupper ($recordatorio['sede']) ?> </h2><hr>
		<h2 style="color: #58595B; font-size: 20px;"><?php echo strtoupper ($recordatorio['direccion']) ?> </h2><hr>
		Nombre del servicio:</br>
		<h2 style="color: #58595B; font-size: 20px;"><?php echo strtoupper ($recordatorio['servicio']) ?> </h2><hr><br> 
		<p> <?php echo $recordatorio['mensaje'] ?> </p><br>
		<p> Nota, este mensaje se genero automaticamente por 
		favor no responda </p>
	</div>

</body>
</html>