<?php
// $table_name = " (SELECT codice,descrizione,fornitore FROM catbuffetti UNION SELECT spicetbprodcatalogo as codice,descrizione,fornitore FROM spicetbprodcatalogo UNION SELECT codice_isp as codice,partnumber as descrizione,fornitore FROM db_articoli order by codice) as temp "; //which table from database
// $table_name = " (SELECT codice,descrizione,fornitore FROM catbuffetti UNION SELECT spicetbprodcatalogo as codice,descrizione,fornitore FROM spicetbprodcatalogo order by codice) as temp "; //which table from database
// $table_name = " (SELECT codice,descrizione,fornitore FROM catbuffetti order by codice) as temp "; //which table from database
// $table_name = " (SELECT codice,descrizione,fornitore FROM catbuffetti UNION SELECT codice_isp as codice,partnumber as descrizione,fornitore FROM db_articoli order by codice ) as temp "; //which table from database
// $table_name = " (SELECT codice,descrizione,fornitore FROM catbuffetti where categoria<>'consumabili' UNION SELECT spicetbprodcatalogo as codice,descrizione,fornitore FROM spicetbprodcatalogo where categoria<>'consumabili' order by codice ) as temp "; //which table from database
$table_name = " (SELECT descrizione1,codice_buf,partnumber,codice_od,descrizione,fornitore FROM prodotti where codice_buf<>'' or codice_od<>'' union SELECT cdescription,ccode,cname,catalogid,cimageurl,fornitore FROM shop_products )  as temp ";
$fitbprodcatalogot_field = "descrizione1"; //which field from table
$second_field = "descrizione"; //which field from table
$tre_field = "partnumber"; //which field from table
$qua_field = "codice_buf"; //which field from table
$cin_field = "codice_od"; //which field from table
$limitchar = 4; //minimum of charactetbprodcatalogo
$records_number = 15;  // Number of records to show per page (different from 0)
$page_number = 1;// default start page
?> 