<?php
// $table_name = " (SELECT codice,descrizione,fornitore FROM catbuffetti UNION SELECT spicetbprodcatalogo as codice,descrizione,fornitore FROM spicetbprodcatalogo UNION SELECT codice_isp as codice,partnumber as descrizione,fornitore FROM db_articoli order by codice) as temp "; //which table from database
// $table_name = " (SELECT codice,descrizione,fornitore FROM catbuffetti UNION SELECT spicetbprodcatalogo as codice,descrizione,fornitore FROM spicetbprodcatalogo order by codice) as temp "; //which table from database
// $table_name = " (SELECT codice,descrizione,fornitore FROM catbuffetti order by codice) as temp "; //which table from database
// $table_name = " (SELECT codice,descrizione,fornitore FROM catbuffetti UNION SELECT codice_isp as codice,partnumber as descrizione,fornitore FROM db_articoli order by codice ) as temp "; //which table from database
// $table_name = " (SELECT codice,descrizione,fornitore FROM catbuffetti where categoria<>'consumabili' UNION SELECT spicetbprodcatalogo as codice,descrizione,fornitore FROM spicetbprodcatalogo where categoria<>'consumabili' order by codice ) as temp "; //which table from database
$table_name = " (SELECT cdescription,ccode,cname,catalogid,cimageurl,fornitore FROM shop_products order by fornitore asc )  as temp ";
$first_field = "cdescription"; //which field from table
$second_field = "cname"; //which field from table
$tre_field = "ccode"; //which field from table
$qua_field = "cimageurl"; //which field from table
$limitchar = 2; //minimum of charactetbprodcatalogo
$records_number = 15;  // Number of records to show per page (different from 0)
$page_number = 1;// default start page
?> 