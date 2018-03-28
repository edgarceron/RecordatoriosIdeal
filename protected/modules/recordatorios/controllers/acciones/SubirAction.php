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
				$mensaje = "";
				$exitosas = 0;
				$fallidas = 0;
				
				
				while(!feof($gestor)){
					$linea = fgets($gestor);
					$campos = explode(";",trim($linea));
					if(count($campos)== 11){
						
						if($this->verificarValidez($campos)){
							$exitosas++;
							//Se crea el modelo para guardar la información del recordatorio
							$citas_recordatorios = new CitasRecordatorios;
							$citas_recordatorios->nombre_paciente = $campos[1];
							$fecha = date_create($this->transformarFecha($campos[2]) . " " . $campos[3]);
							$citas_recordatorios->fecha = $fecha->format('Y-m-d H:i:s');
							echo $fecha->format('Y-m-d H:i:s');
							$citas_recordatorios->nombre_profesional = $campos[4];
							$citas_recordatorios->direccion = $campos[5];
							//$citas_recordatorios->servicio = $campos[6];
							$citas_recordatorios->mensaje = $campos[7];
							$citas_recordatorios->correo = $campos[8];
							$citas_recordatorios->telefono = $campos[9];
							$citas_recordatorios->save();
							print_r($citas_recordatorios->getErrors());
							echo "<br><br>";
						}
						else{
							$fallidas++;
						}
					}
					else{
						$fallidas++;
					}
				}
				echo "Existosas: " . $exitosas . " Fallidas: " . $fallidas;
			}	
		}
	}
	
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