<?php
		
switch ($correo->estado) {
			case 1:
				$estado = "Pendiente";						
				break;
			case 2:
				$estado = "Ejecutado";						
				break;	
			case 2:
				$estado = "Cancelado";						
				break;
		}
?>
<html>
<head>
<title><?php echo $correo->nombre ?></title>
</head>
<body>
<div style="background: none repeat scroll 0 0 #00AFDA;
    font-family: arial;
    height: 25%;
    padding: 2%;
    text-align: center;
    width: 96%;">
<h2>SOFINT CRM</h2>
<h3>Agenda Automatizada</h3>
</div>
<div style="background: none repeat scroll 0 0 #FFFFFF;
    font-family: arial;
    height: 30%;
    padding: 2%;
    text-align: center;
    width: 96%;">
		<h1><?php echo $correo->nombre ?></h1>
		<p><?php echo $correo->observacion ?></p>
		<b>Estado <?php echo $estado ?></b></br>
		<i>Fecha de Expiracion <?php echo date("d-m-Y", $correo->fecha_fin) ?></i>
	</div>
<div style="background: none repeat scroll 0 0 #00AFDA;
    font-family: arial;
    height: 15%;
    padding: 2%;
    text-align: center;
    width: 96%;"></div>
</body>
</html>