<?php
	/*
	$_GET['deg'] = 1;
	$_GET['des'] = 12;
	$_GET['age'] = 2007;
	$_GET["actor"] = 10;
	*/
?>
<?php require_once('../../Connections/conexion.php'); ?>
<?
	mysql_select_db($database_conexion, $conexion);
	$actor = "";$nombre = "";
	if($_GET['age'] == "Todos"){
	$consulta = "SELECT * FROM dbm_actores A, dbm_posicion_actor B WHERE A.Id_Actor = B.Id_Actor AND B.Id_Descrip_Generico = ".$_GET["deg"]." AND B.Id_Descrip_Especifico = ".$_GET["des"]." AND A.Id_Actor = ".$_GET["actor"]." GROUP BY B.posicion ORDER BY A.Id_Actor";
	}else{
	$consulta = "SELECT B.fecha, B.Id_PosicionActor FROM dbm_actores A, dbm_posicion_actor B WHERE A.Id_Actor = B.Id_Actor AND B.Id_Descrip_Generico = ".$_GET["deg"]." AND B.Id_Descrip_Especifico = ".$_GET["des"]." AND B.Fecha LIKE '%".$_GET["age"]."%' AND A.Id_Actor = ".$_GET["actor"]." GROUP BY B.posicion ORDER BY A.Id_Actor";
	}
	$cargarPosicionActor = mysql_query($consulta, $conexion) or die(mysql_error());
	$row_cargarPosicionActor = mysql_fetch_assoc($cargarPosicionActor);
	$totalRows_cargarPosicionActor = mysql_num_rows($cargarPosicionActor);
	//while($row_cargarPosicionActor = mysql_fetch_assoc($cargarPosicionActor)){
	do {
		$fecha = $fecha.$row_cargarPosicionActor["fecha"]."|,|";
		$idPosicionActor = $idPosicionActor.$row_cargarPosicionActor["Id_PosicionActor"]."|,|";
	} while ($row_cargarPosicionActor = mysql_fetch_assoc($cargarPosicionActor));
	//}
	echo("fecha=".utf8_encode($fecha)."&");
	echo("idPosicionActor=".utf8_encode($idPosicionActor));
?>