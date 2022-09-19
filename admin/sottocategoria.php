<select name="sottocat">
	<option selected value="-----------">--------------------------------</option>
<?php
	$abc="";
	$sottocategoria="";
	$abc=$_GET['abc'];
	$sottocategoria=$_GET['sottocategoria'];
	
	$conn = mysql_connect("50.62.146.197","poker","Genovese001");
	$query="SELECT distinct(sottocategoria) FROM prodotti WHERE CATEGORIA LIKE '%" . $abc . "%'";
	$db_selected = mysql_select_db('poker', $conn);
	
	$result = mysql_query ($query, $conn) or die(mysql_error());
	$a=-1;
	while ($row = mysql_fetch_assoc($result)) {
		$a=$a+1;
			if ($row["sottocategoria"]=$sottocategoria){
		?>
			<option value="<?php echo $row["sottocategoria"];?>" selected="selected"><?php echo $row["sottocategoria"];?></option>
		<? }else{?>
			<option value="<?php echo $row["sottocategoria"];?>"><?php echo $row["sottocategoria"];?></option>
		<? }
	}
?>	

</select>
