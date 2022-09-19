<?php

$username = "dbhatseries";
$password = "0Ave1g8^";
$hostname = "localhost";	
$database = "dbhatseries";

mysql_connect($hostname, $username, $password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error()); 

?>