<?php require_once('../Connections/conexion.php'); ?>
<?php 
mysql_select_db($database_conexion, $conexion);
$query_Recordset1 = "SELECT * FROM users";
$Recordset1 = mysql_query($query_Recordset1, $conexion) or die(mysql_error());
$row_Recordset1 = mysql_fetch_assoc($Recordset1);
$totalRows_Recordset1 = mysql_num_rows($Recordset1);

mysql_select_db($database_conexion, $conexion);
$query_Recordset2 = "SELECT * FROM dbm_periodistas WHERE email <> ''";
$Recordset2 = mysql_query($query_Recordset2, $conexion) or die(mysql_error());
$row_Recordset2 = mysql_fetch_assoc($Recordset2);
$totalRows_Recordset2 = mysql_num_rows($Recordset2);

mysql_select_db($database_conexion, $conexion);
$query_Recordset3 = "SELECT * FROM dbm_especialistas WHERE email <> ''";
$Recordset3 = mysql_query($query_Recordset3, $conexion) or die(mysql_error());
$row_Recordset3 = mysql_fetch_assoc($Recordset3);
$totalRows_Recordset3 = mysql_num_rows($Recordset3);

mysql_select_db($database_conexion, $conexion);
$query_Recordset4 = "SELECT * FROM dbm_instituciones_periodisticas WHERE email <> ''";
$Recordset4 = mysql_query($query_Recordset4, $conexion) or die(mysql_error());
$row_Recordset4 = mysql_fetch_assoc($Recordset4);
$totalRows_Recordset4 = mysql_num_rows($Recordset4);


?>
<?php 
if($_POST["enviar_mensaje"] != '1') {
    echo("Leyendo de boletin<br>");
    $body = implode('',file('/home/bancote/banco/public/boletin/'.$_POST["nombre_boletin"].'.html'));
}
else{
    echo("Hacer mensaje<br>");
    $body = $_POST["mensaje"];
}

$email = '';
$subject = $_POST["titulo"];
$headers = "From: Noticias del Banco Tematico <info@bancotematico.org>\n";

$headers .= "Bcc: ".$_POST['email_prueba']."\n"; 

if($_POST["prueba"] != '1') {
$contador = 0;
do { 
	$headers .= "Bcc: ".$row_Recordset1['email']."\n"; 
	$contador ++;
} while ($row_Recordset1 = mysql_fetch_assoc($Recordset1));

do { 
	$headers .= "Bcc: ".$row_Recordset1['email']."\n"; 
	$contador ++;
} while ($row_Recordset1 = mysql_fetch_assoc($Recordset2));

do { 
	 $headers .= "Bcc: ".$row_Recordset1['email']."\n"; 
	 $contador ++;
} while ($row_Recordset1 = mysql_fetch_assoc($Recordset3));

do { 
	 $headers .= "Bcc: ".$row_Recordset1['email']."\n"; 
	 $contador ++;
} while ($row_Recordset1 = mysql_fetch_assoc($Recordset4));

} 
$headers .= "Content-Type: text/html; charset=UTF-8\n";
mail ($email, $subject, $body, $headers);
echo "Se envio satisfactoriamente el e-mail a <strong>".$contador." personas</strong>.<br>".$headers."<a href='/admin'>Volver a Administracion</a>";
?>
<?php 
mysql_free_result($Recordset1);
mysql_free_result($Recordset2);
mysql_free_result($Recordset3);
mysql_free_result($Recordset4);
?>
