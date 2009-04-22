<?php require_once('Connections/conexion.php'); ?>
<?php
$maxRows_xmlMapaDeActores = 10;
$pageNum_xmlMapaDeActores = 0;
if (isset($_GET['pageNum_xmlMapaDeActores'])) {
  $pageNum_xmlMapaDeActores = $_GET['pageNum_xmlMapaDeActores'];
}
$startRow_xmlMapaDeActores = $pageNum_xmlMapaDeActores * $maxRows_xmlMapaDeActores;

mysql_select_db($database_conexion, $conexion);
$query_xmlMapaDeActores = "SELECT * FROM dbm_actores A, dbm_posicion_actor B, dbm_descriptor_generico C WHERE A.Id_Actor = B.Id_Actor AND C.idDescriptorGenerico = B.Id_Descrip_Generico GROUP BY B.Id_Descrip_Generico ORDER BY B.fecha DESC";
$query_limit_xmlMapaDeActores = sprintf("%s LIMIT %d, %d", $query_xmlMapaDeActores, $startRow_xmlMapaDeActores, $maxRows_xmlMapaDeActores);
$xmlMapaDeActores = mysql_query($query_limit_xmlMapaDeActores, $conexion) or die(mysql_error());
$row_xmlMapaDeActores = mysql_fetch_assoc($xmlMapaDeActores);

if (isset($_GET['totalRows_xmlMapaDeActores'])) {
  $totalRows_xmlMapaDeActores = $_GET['totalRows_xmlMapaDeActores'];
} else {
  $all_xmlMapaDeActores = mysql_query($query_xmlMapaDeActores);
  $totalRows_xmlMapaDeActores = mysql_num_rows($all_xmlMapaDeActores);
}
$totalPages_xmlMapaDeActores = ceil($totalRows_xmlMapaDeActores/$maxRows_xmlMapaDeActores)-1;
?>
<?php
header("Content-type: text/xml");
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT"); // Date in the past
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // Always modified
header("Cache-Control: private, no-store, no-cache, must-revalidate"); // HTTP/1.1 
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache"); // HTTP/1.0
echo("<icons>");
do {
echo("<icon image='".utf8_encode(html_entity_decode($row_xmlMapaDeActores['urlArchivo']))."' tooltip='".utf8_encode(html_entity_decode($row_xmlMapaDeActores['nombre']))."' link='"."/actor/?dg=".$row_xmlMapaDeActores['Id_Descrip_Generico']."&amp;de=".$row_xmlMapaDeActores['Id_Descrip_Especifico']."' tooltipDG='".utf8_encode(html_entity_decode($row_xmlMapaDeActores['descriptorGenerico']))."'></icon>");
} while ($row_xmlMapaDeActores = mysql_fetch_assoc($xmlMapaDeActores));
echo("</icons>");
?>
<?php
mysql_free_result($xmlMapaDeActores);
?>