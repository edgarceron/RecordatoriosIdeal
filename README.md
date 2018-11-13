# RecordatoriosIdeal
Sistema de recordatorios para clinica ideal 

Este repositorio incluye los contenidos de la carpeta de una aplicación de Yii.
Ademas de un archivos SQL con las declaraciones necesarias para la base de datos en la carpeta Protected.

#Instalación

- Mover los archivos de esta carpeta la ubicación de los archivos de su servidor apache.
- Crear un base de datos que se llame sofintcorporativa.
- Importar los datos a la BD desde el archivo /protected/sofintcorporativa.sql
- Si esta intalando en un sistema operativo linux, asegurese de dar permisos 755 a los archivos correspondientes al runtime de Yii 

En elastix:
- Abrir el archivo /etc/my.cnf y comentar o eleminar la linea que dice old_passwords = 1
- Reiniciar el servicio de mysql: service mysqld restart
- Crear un usuario para que el sofint acceda a la base de datos, reemplazar "IP Sofint" por la ip del host donde esta instalada el aplicativo, reemplazar "Contraseña" por la contraseña deseada: 
CREATE USER 'sofint'@'IP Sofint' IDENTIFIED BY 'contraseña';
GRANT SELECT, INSERT, UPDATE ON call_center.* TO 'sofint'@'IP Sofint';
FLUSH PRIVILEGES;

- Crear la tabla llamadas_recordatorios: 

```
 CREATE TABLE `llamadas_recordatorios` (
  `id` int(11) NOT NULL,
  `nombre_paciente` varchar(60) NOT NULL,
  `fecha` varchar(50) NOT NULL,
  `nombre_profesional` varchar(60) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `servicio` varchar(40) NOT NULL,
  `mensaje` text NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `sede` varchar(30) DEFAULT NULL,
  `id_cita_recordatorio` int(11) DEFAULT NULL,
  `fecha_cita_recordatorio` date DEFAULT NULL,
  PRIMARY KEY (`id`)
)
```

- Añadir el archivo additional/recordatorios.php a la carpeta /var/lib/asterisk/agi-bin 
- Añadir las credenciales de la bd mysql del servidor asterisk, esto se hace modificando las siguientes lineas el archivo recordatorios.php:	
```
	$dbase='call_center';
	$servidor='direccion ip del servidor';
	$usuario='usuario del servidor, usualmente root';
	$pass='contraseña para el usuario asignado';
	
```
- Crar el siguiente contexto, en el archivo etc/asterisk/extension-custom.conf: 
```
[automsg] 
exten => 400,1,Set(CHANNEL(language)=es) 
exten => 400,2,AGI(wakeup.php, ${UNIQUEID})  
exten => 400,3,Hangup 

```

-Incluirlo en el [from-internal-custom] 
include => automsg

- Reiniciar el servicio asterisk
- Crear una cola con el numero 400 (U otro de estar ocupado, en tal caso cambiar el 400 en el contexto)
- Crear una campaña de salida con la cola creada y la troncal que saque llamadas a celular
- Mover el archivo /additional/recordatorios.php al directorio /var/lib/asterisk/agi-bin/
- Dar al archivo permisos 755

Nota: De no ejecutarse el agi correctamente reemplazar los contenidos del archivo wakeup.php con los contenidos del archivo recordatorios.php.
En el contexto cambiar la linea exten => 400,n,AGI(recordatorios.php) por exten => 400,n,AGI(wakeup.php)

- En caso de no estar instalado el festival: https://www.voztovoice.org/?q=node/97
- En caso de que el text2wav no este convirtiendo los archicos txt a wav: 
		
```
#Entrar /var/lib/asterisk/agi-bin/phpagi.php
#Buscar la linea:
shell_exec("{$this->config['festival']['text2wave']} -F $frequency -o $fname.wav $fname.txt");
#Reemplazarla por: 
shell_exec("/usr/bin/text2wave -F $frequency -o $fname.wav $fname.txt");
```


Finalmente en el servidor de sofint:
- Ingresar al archivo /protected/config/main.php
- Ir al array application components y buscar el elemento call_center, se debe ver algo como esto:
	 
```	
'call_center'=>array(
	'connectionString' => 'mysql:host='Dirección IP del servidor elastix sin comillas';dbname=call_center',
	'emulatePrepare' => true,
	'username' => 'sofint',
	'password' => 'contraseña creada en el mysql del servidor asterisk',
	'charset' => 'utf8',
	'class' => 'CDbConnection',
),

```
- Cambiar los datos de call_center por los datos pertinentes de la base de datos del servidor elastix (IP, contraseña)
- Si se usa windows como sistema operativo, añadir PHP a las variables de entorno
- Posteriormente usar el programador de tares para crear una rutina diaria usando php y como argumento /(ip)/RecordatoriosIdeal/additional/enviarMensajes
- En caso de existir un prefijo para las llamadas a celular ejecutar la siguiente linea en el mysql del servidor(Puede ser desde phpmyadmin): UPDATE `opciones` SET `valor` = 'Numero del prefijo a utilizar' WHERE `opciones`.`opcion` = 'PREFIJO'

A la hora de subir recordatorios:
- El archivo debe estar en formato csv, el caracter delimitador debe ser punto y coma(;)
- La codificación del archivo debe ser UTF-8 (En otras palabras, al crear el csv desde excel solo se debe utilizar el formato "CSV (Delimitado por comas)"
- El reporte de llamada solo muestra las llamadas que ya se han enviado al servidor asterisk 
