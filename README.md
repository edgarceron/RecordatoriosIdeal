# RecordatoriosIdeal
Sistema de recordatorios para clinica ideal 

Este repositorio incluye los contenidos de la carpeta de una aplicación de Yii.
Ademas de un archivos SQL con las declaraciones necesarias para la base de datos en la carpeta Protected.

#Instalación

- Mover los archivos de esta carpeta la ubicación de los archivos de su servidor apache.
- Crear un base de datos que se llame sofintcorporativa.
- Importar los datos a la BD desde el archivo /protected/sofintcorporativa.sql
- Si esta intalando en un sistema operativo linux, asegurese de dar permisos 755 
- Ingresar al archivo /protected/config/main.php
- Ir al array application components y buscar el elemento call_center
- Cambiar los datos de call center por los datos pertinentes de la base de datos del servidor elastix (Se recomienda crear un usuario que solo tenga permisos de lectura y escritura sobre la BD)


En elastix:

- Crar el siguiente contexto
[automatic-msg] 
exten => 400,1,Answer
exten => 400,n,Playback(custom/mensaje) 
exten => 400,n,Hangup

-Incluirlo en el [from-internal-custom]
include => automatic-msg

- Reiniciar el servicio asterisk
- Crear una cola con el numero 400 
- Añadir los agentes respectivos