<!--#include file="connessionesql.asp" -->
<%
Function Fotoimg(Byval Cod)
	Set Tbf = Server.CreateObject("ADODB.RecordSet")
	sSql="select Spicers,foto from Spicersdett2014 where Spicers='" & Replace(Trim(Cod),"spi","") & "' limit 1"
	'response.Write(sSql)
	'response.End()
	Tbf.Open sSql, conn
	Nome_foto=""
	if not Tbf.EOF then
	   Fotoimg=Trim(Tbf("foto")) & " "
	end if   
	Tbf.Close
End function

codice=request("codice")
if session("codice")="" then
	session("codice")=codice
else
	codice=session("codice")
end if


if instr(1,codice,"spi")>0 then
	codice=right(codice,6)
end if


Set tbspi = Server.CreateObject("ADODB.RecordSet")	
sql_spi="Select codice_prodotto,codice_sp,descrizione,aa_linea,giacenza,categoria,sottocategoria from prodotti where codice_sp like '%" & codice & "%' or codice_prodotto='" & codice & "' limit 1"
'response.Write(sql_spi)
tbspi.Open sql_spi,connm

if isnull(tbspi("categoria"))=false then categoria=tbspi("categoria")
if isnull(tbspi("sottocategoria"))=false then sottocategoria=tbspi("sottocategoria")
cod_poker=tbspi("codice_prodotto")
spicers=tbspi("codice_sp")
descrizione=tbspi("descrizione")
aa_linea=tbspi("aa_linea")
giacenza=tbspi("giacenza")

if isnull(spicers)=false then
	Nome_foto=Fotoimg(spicers)
else
	Nome_foto=Fotoimg(cod_poker)
end if

tbspi.close

%>
<!doctype html>
<html>
<head>
<title>MODIFICA ARTICOLI SPICERS</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js.js"></script>
<script>
function indietro(){
	
};
</script>
</head>
<body bgcolor="white" class="nero10" onLoad="javascript:Richiesta('<%=categoria%>','<%=sottocategoria%>')">

<!-- #include file=_menu.inc --->

	<table width="100%">
		<tr><td colspan="2" align="left"><a href="javascript:history.back();"><img src="img/indietro-arrow.png" border="0"></a></td></tr>
		<tr>
			<td>Codice: </td>
			<td colspan="2"><%=spicers%></td>
		</tr>
		<tr><td colspan="2" style="border-bottom:1px solid #000000;"></td></tr>
	</table>
	
	<br>
	
	<table width="100%">
		<form action="spicers-modifica-update.asp" method="post" id="form1" name="form1">
		<input type="hidden" name="spicers" value="<%=spicers%>">
		<tr>
			<td>Codice prodotto:</td>
			<td><input type="text" name="cod_poker" value="<%=cod_poker%>"></td>
		</tr>
		<%
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		Set tb_cat = Server.CreateObject("ADODB.RecordSet")	
		sql_cat="Select distinct(categoria) from spicersdett2014"
		tb_cat.Open sql_cat,Conn
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		%>
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
		<form name="newad" method="post" enctype="multipart/form-data" action="http://www.schede.eu/cataloghi/upload2.php">
		<input type="hidden" name="codice" value="<%=codice%>" />
		 
		<tr><td colspan="2" align="left">Modifica foto</td></tr>
		<tr>
			<td>Foto attuale: </td>
			<td><img src="http://www.schede.eu/cataloghi/catalogospicerpiccole/<%=Nome_foto%>" border="0"></td>
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