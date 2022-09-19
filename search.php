<?php

// file for database connection
include('inc/db.inc.php');

// configuration file
include('inc/config.inc.php');

if(isset($_GET['p'])) {
  $page_number = $_GET['p'];
  $arraySearch = $_GET['terms'];
  $vatbprodcatalogoearch  = $_GET['terms'];
  $show_count = $_GET['count'];
  settype($page_number, 'integer');
}
$nospaces = substr($_GET['terms'],0,4);
  $offset = ($page_number - 1) * $records_number;
// check for an empty string and display a message.
if ($_GET['terms'] == "") {
  // echo  '<div id="counter">sono sufficienti 4 caratteri. (attesa media 4 sec.)</div>';
// minim 3 charactetbprodcatalogo condition
  } else if(strlen($_GET['terms']) < $limitchar) {
 // echo '<div id="counter">'. $limitchar .' caratteri minimi per la ricerca (attesa media 4 sec.)</div>';
// no spaces in first 4 lettetbprodcatalogo
  } else if(preg_replace('/[a-zA-Z0-9]/', '', $nospaces))  {
 // echo '<div id="counter">prego inserire max 4 caratteri per quello che cerchi</div>';
  } else  {

// explode search words into an array
  $arraySearch = explode(" ", $_GET['terms']);
// table fields to search
  $arrayFields = array(0 => $first_field, 1 => $second_field, 2 => $tre_field, 3 => $qua_field,);
  $countSearch = count($arraySearch);
  $a = 0;
  $b = 0;
  $query = "SELECT * FROM $table_name WHERE (";
  $countFields = count($arrayFields);
  while ($a < $countFields)
  {
    while ($b < $countSearch)
    {
      $query = $query."$arrayFields[$a] LIKE '%$arraySearch[$b]%'";
      $b++;
      if ($b < $countSearch)
      {
        $query = $query." AND ";
      }
    }
    $b = 0;
    $a++;
    if ($a < $countFields)
    {
      $query = $query.") OR (";
    }
  }
  $query = $query.") LIMIT $offset, $records_number;";
  
  $search = mysql_query($query);
  
  
// get number of search results
  $arrayFields = array(0 => $first_field, 1 => $second_field, 2 => $tre_field, 3 => $qua_field);
  $countSearch = count($arraySearch);
  $a = 0;
  $b = 0;
  $query = "SELECT count(*) AS numerorecord FROM $table_name WHERE (";
  $countFields = count($arrayFields);
  while ($a < $countFields)
  {
    while ($b < $countSearch)
    {
      $query = $query."$arrayFields[$a] LIKE '%$arraySearch[$b]%'";
      $b++;
      if ($b < $countSearch)
      {
        $query = $query." AND ";
      }
    }
    $b = 0;
    $a++;
    if ($a < $countFields)
    {
      $query = $query.") OR (";
    }
  }
$query = $query.") LIMIT 1"; 
$count_results = mysql_query($query);
$row9=mysql_fetch_assoc($count_results);
$numrows =$row9['numerorecord'];

// no results
if($numrows == 0) {


// show results
} else {

echo '<div id="results">
<div id="results_top"><p><b>'. $_GET['terms'] .'</b> - n° '. $numrows .' record trovati</p></div>
';

while($row = mysql_fetch_assoc($search)) {
if ($row['fornitore'] == 'Gruppo Buffetti S.p.A.') 
	echo '<div class="details"><a href=dettaglibuffettishop.asp?cod='.$row['codice_buf'].'&for='.$row['fornitore'].'><img border=0 width=55px src=foto.asp?cat=catalogobuffetti2016_small&img='.$row['codice_buf'].'.jpg>'.$row['codice_buf'].'<font color=#000000> desc. : '.substr($row['descrizione'],0,65).'</a></div>
    <div style="clear:both;"></div></div>'; 
if ($row['fornitore'] == 'ecommerce') 
	echo '<div class="details"><a href=shopmandett.asp?id='.$row['catalogid'].'&for='.$row['fornitore'].'><img border=0 width=55px src="admin/articoli/'.$row['cimageurl'].'">'.$row['ccode'].'<font color=#000000> desc. : '.substr($row['cdescription'],0,65).'</a></div>
   <div style="clear:both;"></div></div>'; 
if ($row['fornitore'] == 'od') 
   echo '<div class="details"><a href=oddettagli.asp?cod='.$row['codice_od'].'&for='.$row['fornitore'].'><img border=0 width=55px src=foto.asp?cat=catalogoisp/piccole/&img='.$row['codice_od'].'.jpg>'.$row['codice_od'].'<font color=#000000> desc. : '.substr($row['descrizione'],0,65).'</a></div>
   <div style="clear:both;"></div></div>'; 
//echo $query;   
}
// pagination
  $maxPage = ceil($numrows/$records_number);

  $nav = '';
for($page = 1; $page <= $maxPage; $page++) {
  if ($page == $page_number)     {
     $nav .= "<font color=red>&nbsp;$page</font>";
  }
  else
  {
      $nav .= "<li><a href=\"javascript:htmlData('search.php','terms=".$_GET['terms']."&amp;p=$page')\">&nbsp;$page</a></li>";
  }
}

if ($page_number > 1) {

  $page = $page_number - 1;
  $prev = "<li><a href=\"javascript:htmlData('search.php','terms=".$_GET['terms']."&amp;p=$page')\">&laquo;</a></li>";

  $first = "<li><a href=\"javascript:htmlData('search.php','terms=".$_GET['terms']."&amp;p=1')\">&nbsp;&nbsp;&nbsp;First</a></li>";
}
else {
  $prev = '';
  $first = '';
}

if ($page_number < $maxPage) {
  $page = $page_number + 1;
  $next = "<li><a href=\"javascript:htmlData('search.php','terms=".$_GET['terms']."&amp;p=$page')\">&raquo;</a></li>";

  $last = "<li><a href=\"javascript:htmlData('search.php','terms=".$_GET['terms']."&amp;p=$maxPage')\">Last</a></li>";
}
else {
  $next = '';
  $last = '';
}
  echo $data;
echo "<div style='background-color:#ffffff'><ul class='list-inline'>$first $prev $nav $next $last</ul></div>
</div>";
return false;
	}
 }
?>