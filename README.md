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
- Crear un usuario para que el sofint acceda a la base de datos: 
CREATE USER 'sofint'@'IP Sofint' IDENTIFIED BY 'contraseña';
GRANT SELECT, INSERT, UPDATE ON call_center.* TO 'sofint'@'IP Sofint';
FLUSH PRIVILEGES
- Crear la tabla llamadas_recordatorios: 
CREATE TABLE `llamadas_recordatorios` (
  `id` int(11) NOT NULL,
  `nombre_paciente` varchar(30) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `nombre_profesional` varchar(30) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `servicio` varchar(40) NOT NULL,
  `mensaje` text NOT NULL,
  `correo` varchar(255) default NULL,
  `telefono` varchar(10) default NULL,
  `sede` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) 

- Crar el siguiente contexto
[automsg] 
exten => 400,1,Set(CHANNEL(language)=es)
exten => 400,2,AGI(wakeup.php, ${UNIQUEID})  
exten => 400,3,Hangup 

-Incluirlo en el [from-internal-custom]
include => automsg

- Reiniciar el servicio asterisk
- Crear una cola con el numero 400 (U otro de estar ocupado, en tal caso cambiar el 400 en el contexto)
- Añadir los agentes respectivos
- Mover el archivo /additional/recordatorios.php al directorio /var/lib/asterisk/agi-bin/
- Dar al archivo permisos 755

Nota: De no ejecutarse el agi correctamente reemplazar los contenidos del archivo wakeup.php con los contenidos del archivo recordatorios.php.
En el contexto cambiar la linea exten => 400,n,AGI(recordatorios.php) por exten => 400,n,AGI(wakeup.php)

- En caso de no estar instalado el festival: https://www.voztovoice.org/?q=node/97
- En caso de que el text2wav no este convirtiendo los archicos txt a wav: 
	* Entrar /var/lib/asterisk/agi-bin/phpagi.php
	* Buscar la linea shell_exec("{$this->config['festival']['text2wave']} -F $frequency -o $fname.wav $fname.txt");
	* Reemplazarla por shell_exec("/usr/bin/text2wave -F $frequency -o $fname.wav $fname.txt");
	* Guardar

Finalmente en el servidor de sofint:
- Ingresar al archivo /protected/config/main.php
- Ir al array application components y buscar el elemento call_center
- Cambiar los datos de call center por los datos pertinentes de la base de datos del servidor elastix 
