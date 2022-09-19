<?php

// file for database connection
include('inc/db.inc.php');

// configuration file
include('inc/config.inc.php');

if(isset($_GET['p'])) {
  $page_number = $_GET['p'];
  $arraySearch = $_GET['terms'];
  $show_count = $_GET['count'];
  settype($page_number, 'integer');
}
$nospaces = substr($_GET['terms'],0,4);
  $offset = ($page_number - 1) * $records_number;
// check for an empty string and display a message.
if ($_GET['terms'] == "") {
  echo  '<div id="counter">ex. write &acute;here and&acute; or &acute;search&acute; without quotes.</div>';
// minim 3 characters condition
  } else if(strlen($_GET['terms']) < $limitchar) {
 echo '<div id="counter">'. $limitchar .' characters minimum</div>';
// no spaces in first 4 letters
  } else if(preg_replace('/[a-zA-Z0-9]/', '', $nospaces))  {
 echo '<div id="counter">Please use letters or numbers in first 4 characters</div>';
  } else  {

// explode search words into an array
  $arraySearch = explode(" ", $_GET['terms']);
// table fields to search
  $arrayFields = array(0 => $first_field, 1 => $second_field);
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
  $arrayFields = array(0 => $first_field, 1 => $second_field);
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
  $query = $query.")";
  $count_results = mysql_query($query);
  $numrows = mysql_num_rows($count_results);

// no results
if($numrows == 0) {
		echo '<div id="counter">No results found</div>';

// show results
} else {

echo '<div id="results">
<div id="results_top"><p><b>'. $_GET['terms'] .'</b> - '. $numrows .' results found</p></div>
';

while($row = mysql_fetch_assoc($search)) {

echo '<div class="item">
<div class="details"><a href=ricercaajax.asp?cod='.$row['codice'].'&for='.$row['fornitore'].'>'.$row['codice'].' desc. : '.substr($row['descrizione'],1,60).'</a></div>
<p></p></div>
<div style="clear:both;"></div></div>'; 
}
// pagination
  $maxPage = ceil($numrows/$records_number);

  $nav = '';
for($page = 1; $page <= $maxPage; $page++) {
  if ($page == $page_number)     {
     $nav .= "$page";
  }
  else
  {
      $nav .= "<a href=\"javascript:htmlData('search.php','terms=".$_GET['terms']."&amp;p=$page')\">$page</a>";
  }
}

if ($page_number > 1) {

  $page = $page_number - 1;
  $prev = "<a href=\"javascript:htmlData('search.php','terms=".$_GET['terms']."&amp;p=$page')\">&laquo;</a>";

  $first = "<a href=\"javascript:htmlData('search.php','terms=".$_GET['terms']."&amp;p=1')\">First</a>";
}
else {
  $prev = '';
  $first = '';
}

if ($page_number < $maxPage) {
  $page = $page_number + 1;
  $next = "<a href=\"javascript:htmlData('search.php','terms=".$_GET['terms']."&amp;p=$page')\">&raquo;</a>";

  $last = "<a href=\"javascript:htmlData('search.php','terms=".$_GET['terms']."&amp;p=$maxPage')\">Last</a>";
}
else {
  $next = '';
  $last = '';
}
  echo $data;
echo "<div id=\"results_bottom\"><p>$first $prev $nav $next $last</p></div>
</div>";
	}
 }
?>