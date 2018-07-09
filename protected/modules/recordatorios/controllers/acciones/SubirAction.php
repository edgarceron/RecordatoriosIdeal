<?php
class SubirAction extends CAction
{
    public function run()
    {	 
		//print_r($_POST);
		//exit();
        $model = new SubirArchivo;
        
		if(isset($_POST['SubirArchivo']['datos']))
        {
            $model->attributes=$_POST['SubirArchivo']['datos'];
            $model->datos=CUploadedFile::getInstance($model,'datos');
            if($model->upload())
            {
                $model->datos->saveAs('./csv/'.$model->datos->name, false);
				$gestor = @fopen('./csv/'.$model->datos->name,'r');
				$numeroLinea = 1;
				$error = false;
				$mensaje_error = "";
				$mensaje_filas = "";
				$exitosas = 0;
				$fallidas = 0;
				
				
				while(!feof($gestor)){
					$linea = fgets($gestor);
					$campos = explode(";",trim($linea));
					if(count($campos)== 11){
						if($this->verificarValidez($campos)){
							//Se crea el modelo para guardar la información del recordatorio
							$citas_recordatorios = new CitasRecordatorios;
							$citas_recordatorios->nombre_paciente = $campos[1];
							$fecha = date_create($this->transformarFecha($campos[2]) . " " . $campos[3]);
							$citas_recordatorios->fecha = $fecha->format('Y-m-d H:i:s');
							$citas_recordatorios->nombre_profesional = $campos[4];
							$citas_recordatorios->direccion = $campos[5];
							$citas_recordatorios->servicio = $campos[6];
							if(mb_detect_encoding ($campos[7]) == "UTF-8"){
								$citas_recordatorios->mensaje = $campos[7];
							}
							else{
								$citas_recordatorios->mensaje = utf8_encode ($campos[7]);
							}
							$citas_recordatorios->correo = $campos[8];
							$citas_recordatorios->telefono = $campos[9];
							$citas_recordatorios->sede = $campos[10];
							if( !($citas_recordatorios->save()) ){
								$mensaje_error = $mensaje_error . print_r($citas_recordatorios->getErrors());
								$mensaje_error = $mensaje_error . "<br>";
							}
							else{
								$exitosas++;
							}
						}
						else{
							$mensaje_filas = $mensaje_filas . "Fila " . $numeroLinea . " campos erroneos<br>";
							$fallidas++;
						}
					}
					else{
						$mensaje_filas = $mensaje_filas . "Fila " . $numeroLinea . " hacen falta campos<br>";
						$fallidas++;
					}
					$numeroLinea++;
				}
				
				$mensaje = "Recordatorios subidos exitosamente: " . $exitosas . "<br>Recordatorios no subidos: " . $fallidas;
				$this->controller->render('confirmacion', array("mensaje" => $mensaje,"filas" => $mensaje_filas,"error" => $mensaje_error));
			}	
		}
	}
	
	
	/**
	 * Transforma la fecha desde un formato dd/mm/aaaa a formato dd-mm-aaaa
	 * @param $fecha String con la fecha en formato dd/mm/aaaa 
	 * @return String con la fecha en formato dd-mm-aaaa
	 */
	public  function transformarFecha($fecha){
		$campos = explode("/",$fecha);
		$nuevaFecha = "";
		if(count($campos) != 3) return $fecha;
		for($i = 0; $i < count($campos); $i++){
			if($i == 2){
				$nuevaFecha = $nuevaFecha . $campos[$i];
			}
			else{
				$nuevaFecha = $nuevaFecha . $campos[$i] . "-";
			}
		}
		return $nuevaFecha;
	}
	
	/**
	 * Verifica que los campos de un registro sean los indicados para guardar el recordatorio
	 * Para que una fila sea valida los campos del 1 al 7 deben estar ocupados, y debe tener
	 * al menos uno entre numero telefonico o correo electronico. 
	 * @param $campos Array con la información de un fila
	 * @return bool true si los datos son validos, false en caso contrario
	 */
	public function verificarValidez($campos){
		for($i = 1; $i<=7; $i++){
			if(trim($campos[$i]) == ''){
				return false;
			}
		}
		
		if( !(trim($campos[9]) == '' && trim($campos[8]) == '')){
			
			$telefono_correcto = true;
			$email_correcto = true;
			if(!is_numeric($campos[9])){
				$telefono_correcto = false;
			}
			if(!filter_var($campos[8], FILTER_VALIDATE_EMAIL)){
				$email_correcto = false;
			}
			return ($telefono_correcto || $email_correcto);
		}
		else{
			return false;
		}
	}
	
	
	
}
?>