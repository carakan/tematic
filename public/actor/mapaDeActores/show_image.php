<?php
/**
 * show_image.php
 * 
 * Example utility file for dynamically displaying images
 * 
 * @author      Ian Selby
 * @version     1.0 (php 5 version)
 */

//reference thumbnail class
/*include('thumbnail.inc.php');
$thumb = new Thumbnail($_GET['filename']);
$thumb->resize($_GET['width'],$_GET['height']);
$thumb->show();*/
include("resize.php");
$thumb=new thumbnail($_GET['filename']);
$valMax = $_GET['width'];
if($_GET['height'] > $valMax){
	$valMax = $_GET['height'];
}
$thumb->size_auto($valMax);
$thumb->show();
?>