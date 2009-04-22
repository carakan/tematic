<?php
	/*
	$_GET['deg'] = 1;
	$_GET['des'] = 12;
	*/
?>
<?
//Consulta para sacar el todos los actores
	$host = "localhost";	 // el host de la base de datos
	$user = "bancote_banco";			 // usuario de la base de datos
	$pass = "banco1180";				 // contrase�a de la base de datos
	$bbdd = "bancote_tematico";// base de datos a usar
	//------- esto crea la conexi�n a la base de datos ------
	$conexio = mysql_connect($host,$user,$pass) or die(mysql_error()); // $conexion es la conexi�n a usar.
	mysql_select_db($bbdd,$conexio) or die(mysql_error());
	/////////////////////////////////////////////////////////////////////
	$actor = "";$nombre = "";
	$consulta = "SELECT * FROM dbm_actores A, dbm_posicion_actor B, dbm_descriptor_generico C, dbm_descriptor_especifico D WHERE A.Id_Actor = B.Id_Actor AND B.Id_Descrip_Generico = ".$_GET['deg']." AND B.Id_Descrip_Generico = C.idDescriptorGenerico AND B.Id_Descrip_Especifico = ".$_GET['des']." AND B.Id_Descrip_Especifico = D.idDescriptorEspecifico GROUP BY B.fecha ORDER BY B.fecha";

	$res = mysql_query($consulta)or die(mysql_error());
	while($val=mysql_fetch_array($res)){
		if($antFecha != substr($val["fecha"],0,4)){
			$fecha = $fecha.substr($val["fecha"],0,4).",";
		}
		$antFecha = substr($val["fecha"],0,4);
		$vardg = $val["descriptorGenerico"];
		$varde = $val["descriptorEspecifico"];
	}
	echo("age=".utf8_encode($fecha)."&");
	echo("dgenerico=".utf8_encode($vardg)."&");
	echo("despecifico=".utf8_encode($varde)."&");
?>