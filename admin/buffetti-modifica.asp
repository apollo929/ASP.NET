<!--#include file="connessionesql.asp" -->
<%
codice=request("codice")

Set tbbuffetti = Server.CreateObject("ADODB.RecordSet")	
sql_spi="Select codice_prodotto,codice_buf,descrizione,aa_linea,giacenza,categoria,sottocategoria from prodotti where codice_buf='" & codice & "' limit 1"
tbbuffetti.Open sql_spi,connm
codice_buf=""
categoria=tbbuffetti("categoria")
sottocategoria=tbbuffetti("sottocategoria")
cod_poker=tbbuffetti("codice_prodotto")
buffetti=tbbuffetti("codice_buf")
descrizione=tbbuffetti("descrizione")
aa_linea=tbbuffetti("aa_linea")
giacenza=tbbuffetti("giacenza")
codice_buf=tbbuffetti("codice_buf")
tbbuffetti.close

%>
<!doctype html>
<html>
<head>
<title>MODIFICA ARTICOLI BUFFETTI</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js.js"></script>
</head>
<body bgcolor="white" class="nero10" onLoad="javascript:Richiesta('<%=categoria%>','<%=sottocategoria%>')">

<!-- #include file=_menu.inc --->

	<table width="100%">

		<tr>
			<td>Codice: </td>
			<td colspan="2"><%=buffetti%></td>
		</tr>
		<tr><td colspan="2" style="border-bottom:1px solid #000000;"></td></tr>
	</table>
	
	<br>
	
	<table width="100%">
		<form action="buffetti-modifica-update.asp" method="post" id="form1" name="form1">
		<input type="hidden" name="spicers" value="<%=buffetti%>">
		<tr>
			<td>Categoria: </td>
			<td><%=categoria%></td>
		</tr>
		<tr>
			<td>Sottocategoria:</td>
			<td><%=sottocategoria%></td>
		</tr>
		<tr>
			<td>Descrizione:</td>
			<td><textarea name="descrizione"><%=descrizione%></textarea></td>
		</tr>
		<tr>
			<td>Linea:</td>
			<td><input type="text" name="aa_linea" value="<%=aa_linea%>"></td>
		</tr>
		<tr>
			<td>Giacenza:</td>
			<td><input type="text" name="giacenza" value="<%=giacenza%>"></td>
		</tr>
				
		<tr><td><input type="submit" value="MODIFICA"></td></tr>
	</form>
	</table>
	

	
	
	<br><table width="100%"><tr><td colspan="2" style="border-bottom:1px solid #000000;"></td></tr></table><br>
	
	
	<table width="100%">
		<form name="newad" method="post" enctype="multipart/form-data" action="https://www.schede.eu/cataloghi/upload-buffetti.php">
		<input type="hidden" name="codice" value="<%=codice%>" />
		
		<tr><td colspan="2" align="left">Modifica foto</td></tr>
		<tr>
			<td>Foto attuale: </td>
			<td><img src="../foto.asp?cat=catalogobuffetti2016_small&img=<%=codice_buf%>.jpg" border="0" border="0"></td>
		</tr>
		<tr>
			<td>Nuova foto: </td>
			<td><input type="file" name="image"></td>
		</tr>
		<tr><td><input name="Submit" type="submit" value="CARICA"></td></tr>
		
		</form>
	</table>

</td>
</tr>
</table>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->