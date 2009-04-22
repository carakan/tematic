<?php
	/*	
	$_GET['deg'] = 1;
	$_GET['des'] = 12;
	$_GET['age'] = 2007;
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
	if($_GET['age'] == "Todos"){
		$consulta = "SELECT A.Id_Actor, A.nombre, A.urlArchivo FROM dbm_actores A, dbm_posicion_actor B WHERE A.Id_Actor = B.Id_Actor AND B.Id_Descrip_Generico = ".$_GET['deg']." AND B.Id_Descrip_Especifico = ".$_GET['des']."  GROUP BY A.Id_Actor ORDER BY A.Id_Actor";
	}else{
		$consulta = "SELECT A.Id_Actor, A.nombre, A.urlArchivo, B.fecha FROM dbm_actores A, dbm_posicion_actor B WHERE A.Id_Actor = B.Id_Actor AND B.Id_Descrip_Generico = ".$_GET['deg']." AND B.Id_Descrip_Especifico = ".$_GET['des']." AND B.fecha LIKE '%".$_GET['age']."%' GROUP BY A.Id_Actor ORDER BY A.Id_Actor";
	}
	//$consulta = "SELECT A.Id_Actor, A.nombre, A.urlArchivo FROM dbm_actores A, dbm_posicion_actor B WHERE A.Id_Actor = B.Id_Actor AND B.Id_Descrip_Generico = 1 AND B.Id_Descrip_Especifico = 12 AND B.fecha LIKE '%2007%' GROUP BY A.Id_Actor ORDER BY A.Id_Actor";
		
	$res = mysql_query($consulta)or die(mysql_error());
	while($val=mysql_fetch_array($res)){
		//$actor = $actor."../imgMapaActores/".$val["urlArchivo"].".jpg"."|,|";
		$actor = $actor.$val["urlArchivo"]."|,|";
		$nombre = $nombre.$val["nombre"]."|,|";
		$idActor = $idActor.$val["Id_Actor"]."|,|";
		//echo("a�o =".$val["fecha"]."<br>");
		//$nombre = $nombre.$val["Ac_Nombre"]."holas".",";
	}
	echo("pathURL=".utf8_encode("../archivos/imgMapaActores/")."&");
	echo("actor=".utf8_encode($actor)."&");
	echo("nombre=".utf8_encode($nombre)."&");
	echo("idActor=".$idActor);
?>