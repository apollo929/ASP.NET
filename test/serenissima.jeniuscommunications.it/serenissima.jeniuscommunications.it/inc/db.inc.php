<?php

$username = "beb-ufficiosrl";
$password = "Genovese001";
$hostname = "localhost";	
$database = "beb-ufficiosrl";

mysql_connect($hostname, $username, $password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error()); 

?>