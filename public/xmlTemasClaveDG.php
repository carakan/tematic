<?php require_once('Connections/conexion.php'); ?>
<?php
mysql_select_db($database_conexion, $conexion);
$query_nombreValorNoticia = "SELECT * FROM dbm_descriptor_generico ORDER BY descriptorGenerico DESC";
$nombreValorNoticia = mysql_query($query_nombreValorNoticia, $conexion) or die(mysql_error());
$row_nombreValorNoticia = mysql_fetch_assoc($nombreValorNoticia);
?>
<?php
header("Content-type: text/xml");
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT"); // Date in the past
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // Always modified
header("Cache-Control: private, no-store, no-cache, must-revalidate"); // HTTP/1.1 
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache"); // HTTP/1.0
?>
<docxml>
<?php do { ?>
<temasClaveDG id='<?php echo trim(utf8_encode($row_nombreValorNoticia['idDescriptorGenerico'])) ?>' nombre='<?php echo trim(utf8_encode($row_nombreValorNoticia['descriptorGenerico'])) ?>'></temasClaveDG>
<?php } while ($row_nombreValorNoticia = mysql_fetch_assoc($nombreValorNoticia)); ?>
</docxml>
<?php
mysql_free_result($nombreValorNoticia);
?>
