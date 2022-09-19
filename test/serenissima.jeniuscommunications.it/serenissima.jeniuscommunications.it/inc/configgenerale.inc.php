<?php

$table_name = " (select id,tipologia,modello from modello order by modello asc ) as temp "; //which table from database
$first_field = "tipologia"; //which field from table
$second_field = "tipologia"; //which field from table
$limitchar = 1; //minimum of characters
$records_number = 100;  // Number of records to show per page (different from 0)
$page_number = 1;// default start page
?>