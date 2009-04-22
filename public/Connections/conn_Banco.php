<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$hostname_conexion = "localhost";
$database_conexion = "bancouni_tematic";
$username_conexion = "root";
$password_conexion = "";
$conn_Banco = mysql_pconnect($hostname_conn_Banco, $username_conn_Banco, $password_conn_Banco) or trigger_error(mysql_error(),E_USER_ERROR); 
?>