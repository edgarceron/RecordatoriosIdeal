<?php
        // create curl resource
		try{
			
			/*
			$ch = curl_init();
			// set url
			curl_setopt($ch, CURLOPT_URL, "http://127.0.0.1/RecordatoriosIdeal/index.php/recordatorios/default/enviarSms");
			//return the transfer as a string
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_exec($ch);
			// $output contains the output string
			$output = curl_exec($ch);
			print_r($output);
			// close curl resource to free up system resources
			curl_close($ch);   	
			*/
			$ch2 = curl_init();
			// set url
			curl_setopt($ch2, CURLOPT_URL, "http://127.0.0.1/RecordatoriosIdeal/index.php/recordatorios/default/enviarCorreos");
			//return the transfer as a string
			curl_setopt($ch2, CURLOPT_RETURNTRANSFER, true);
			// $output contains the output string
			$output = curl_exec($ch2);
			print_r($output);
			// close curl resource to free up system resources
			curl_close($ch2);   
			
			$ch3 = curl_init();
			// set url
			curl_setopt($ch3, CURLOPT_URL, "http://127.0.0.1/RecordatoriosIdeal/index.php/recordatorios/default/enviarLlamadas");
			//return the transfer as a string
			curl_setopt($ch3, CURLOPT_RETURNTRANSFER, true);
			// $output contains the output string
			$output = curl_exec($ch3);
			print_r($output);
			// close curl resource to free up system resources
			curl_close($ch3);   
			
		}
		catch (Exception $e) {
				echo "???";
				echo $e->getMessage();
		}
?>