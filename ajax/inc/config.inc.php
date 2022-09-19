<?php

$table_name = " (SELECT codice,descrizione,fornitore FROM catbuffetti UNION SELECT spicers as codice,descrizione,fornitore FROM spicers UNION SELECT codice_isp as codice,descrizione,fornitore FROM db_articoli) as temp "; //which table from database
$first_field = "codice"; //which field from table
$second_field = "descrizione"; //which field from table
$limitchar = 4; //minimum of characters
$records_number = 15;  // Number of records to show per page (different from 0)
$page_number = 1;// default start page
?>