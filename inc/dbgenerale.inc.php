<?php

$username = "informaticaml";
$password = "Genovese001";
$hostname = "localhost";	
$database = "informaticaml";

mysql_connect($hostname, $username, $password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error()); 

?>