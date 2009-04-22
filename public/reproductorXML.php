<?php require_once('Connections/conexion.php'); ?>
<?php
$maxRows_xmlMultimedia = 100;
$pageNum_xmlMultimedia = 0;
if (isset($_GET['pageNum_xmlMultimedia'])) {
  $pageNum_xmlMultimedia = $_GET['pageNum_xmlMultimedia'];
}
$startRow_xmlMultimedia = $pageNum_xmlMultimedia * $maxRows_xmlMultimedia;

mysql_select_db($database_conexion, $conexion);
$query_xmlMultimedia = "SELECT * FROM dbm_multimedia ORDER BY created DESC, titulo";
$query_limit_xmlMultimedia = sprintf("%s LIMIT %d, %d", $query_xmlMultimedia, $startRow_xmlMultimedia, $maxRows_xmlMultimedia);
$xmlMultimedia = mysql_query($query_limit_xmlMultimedia, $conexion) or die(mysql_error());
$row_xmlMultimedia = mysql_fetch_assoc($xmlMultimedia);

if (isset($_GET['totalRows_xmlMultimedia'])) {
  $totalRows_xmlMultimedia = $_GET['totalRows_xmlMultimedia'];
} else {
  $all_xmlMultimedia = mysql_query($query_xmlMultimedia);
  $totalRows_xmlMultimedia = mysql_num_rows($all_xmlMultimedia);
}
$totalPages_xmlMultimedia = ceil($totalRows_xmlMultimedia/$maxRows_xmlMultimedia)-1;
?>
<?php
header("Content-type: text/xml");
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT"); // Date in the past
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // Always modified
header("Cache-Control: private, no-store, no-cache, must-revalidate"); // HTTP/1.1 
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache"); // HTTP/1.0

echo("<lista>");
echo('<multimedia titulo="'.utf8_encode('Seleccione multimedia...').'" archivo=""/>');
do {
echo("<multimedia titulo='".utf8_encode(html_entity_decode($row_xmlMultimedia['titulo']))."' archivo='".utf8_encode(html_entity_decode($row_xmlMultimedia['archivo']))."'></multimedia>");
} while ($row_xmlMultimedia = mysql_fetch_assoc($xmlMultimedia));
echo("</lista>");
?>
<?php
mysql_free_result($xmlMultimedia);
?>