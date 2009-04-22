<?php require_once('Connections/conexion.php'); ?>
<?php
mysql_select_db($database_conexion, $conexion);
$query_mostrarValorNoticia = "SELECT idValorNoticia, titulo, descripcion FROM dbm_biblioteca_valornoticia ORDER BY idValorNoticia DESC";
$mostrarValorNoticia = mysql_query($query_mostrarValorNoticia, $conexion) or die(mysql_error());
$row_mostrarValorNoticia = mysql_fetch_assoc($mostrarValorNoticia);
?>
<?php
header("Content-type: text/xml");
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT"); // Date in the past
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // Always modified
header("Cache-Control: private, no-store, no-cache, must-revalidate"); // HTTP/1.1 
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache"); // HTTP/1.0
?>
<docxml><valorNoticia idVN='<?php echo $row_mostrarValorNoticia['idValorNoticia'] ?>' titulo='<?php echo utf8_encode(htmlspecialchars(trim($row_mostrarValorNoticia['titulo']))) ?>' resumen='<?php echo utf8_encode(html_entity_decode(str_replace("&ndash;","",strip_tags(trim($row_mostrarValorNoticia['descripcion']))))) ?>'></valorNoticia><valorNoticia titulo='fin' resumen='fin'></valorNoticia></docxml>
<?php
mysql_free_result($mostrarValorNoticia);
?>
