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
					$campos = explode(";",$linea);
					if(count($campos)== 10){
						if($campos[0] != 'No' && $campos[0] != null){
							//Se crea el modelo para guardar la información del recordatorio
							$citas_recordatorios = new CitasRecordatorios;
							$citas_recordatorios->nombre_paciente = $campos[1];
							$fecha = date_create($this->transformarFecha($campos[2]) . " " . $campos[3]);
							$citas_recordatorios->fecha = $fecha->format('Y-m-d H:i:s');
							echo $fecha->format('Y-m-d H:i:s');
							$citas_recordatorios->nombre_profesional = $campos[4];
							$citas_recordatorios->direccion = $campos[5];
							$citas_recordatorios->mensaje = $campos[6];
							$citas_recordatorios->correo = $campos[7];
							$citas_recordatorios->sede = $campos[8];
							$citas_recordatorios->save();
							print_r($citas_recordatorios->getErrors());
							echo "<br><br>";
						}
					}	
				}	
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
}
?>