<?php require_once('../../Connections/conexion.php'); ?>
<?php
//$_GET['idPA'] = 1;
$maxRows_mostrarPosicionActor = 1;
$pageNum_mostrarPosicionActor = 0;
if (isset($_GET['pageNum_mostrarPosicionActor'])) {
  $pageNum_mostrarPosicionActor = $_GET['pageNum_mostrarPosicionActor'];
}
$startRow_mostrarPosicionActor = $pageNum_mostrarPosicionActor * $maxRows_mostrarPosicionActor;

$colname_mostrarPosicionActor = "-1";
if (isset($_GET['idPA'])) {
  $colname_mostrarPosicionActor = (get_magic_quotes_gpc()) ? $_GET['idPA'] : addslashes($_GET['idPA']);
}
mysql_select_db($database_conexion, $conexion);
$query_mostrarPosicionActor = sprintf("SELECT fecha, titular, posicion, fuente FROM dbm_posicion_actor WHERE Id_PosicionActor = %s", $colname_mostrarPosicionActor);
$query_limit_mostrarPosicionActor = sprintf("%s LIMIT %d, %d", $query_mostrarPosicionActor, $startRow_mostrarPosicionActor, $maxRows_mostrarPosicionActor);
$mostrarPosicionActor = mysql_query($query_limit_mostrarPosicionActor, $conexion) or die(mysql_error());
$row_mostrarPosicionActor = mysql_fetch_assoc($mostrarPosicionActor);

if (isset($_GET['totalRows_mostrarPosicionActor'])) {
  $totalRows_mostrarPosicionActor = $_GET['totalRows_mostrarPosicionActor'];
} else {
  $all_mostrarPosicionActor = mysql_query($query_mostrarPosicionActor);
  $totalRows_mostrarPosicionActor = mysql_num_rows($all_mostrarPosicionActor);
}
$totalPages_mostrarPosicionActor = ceil($totalRows_mostrarPosicionActor/$maxRows_mostrarPosicionActor)-1;
?>
<table border="0" bgcolor="#FFFFFF" cellpadding="7">
  <?php do { ?>
  	<tr>
		<td colspan="2" class="title" align="center"><?php echo utf8_encode($row_mostrarPosicionActor['titular']); ?></td>
  	</tr>
 	<tr>
		<td class="normal" align="justify" colspan="2">
    	<!--<img src="<?php //echo $_GET['imgURL'] ?>" align="left" hspace="5" vspace="5"/>-->
		<img src="<?php echo $_GET['pathURL']."show_image.php?filename=".$_GET['imgURL']."&width=55&height=55" ?>" align="left" hspace="5" vspace="5"/>
		<!--<img src="<?php //echo "./mapaDeActores/imgMapaActores/".$_GET['imgURL'] ?>" align="left" hspace="5" vspace="5"/>-->
		<?php echo utf8_encode($row_mostrarPosicionActor['posicion']); ?>
		</td>
  	</tr>
	<tr>
      	<td class="menuSubtitulo" align="left"><?php echo utf8_encode($row_mostrarPosicionActor['fuente']); ?></td>
  	  <td class="menuSubtitulo" align="right"><?php echo $row_mostrarPosicionActor['fecha']; ?></td>
    </tr>
    <?php } while ($row_mostrarPosicionActor = mysql_fetch_assoc($mostrarPosicionActor)); ?>
</table>
<?php
mysql_free_result($mostrarPosicionActor);
?>
