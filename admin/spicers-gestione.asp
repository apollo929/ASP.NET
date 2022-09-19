<!--#include file="connessionesql.asp" -->
<%
session("codice")=""
Function Fotoimg(Byval Cod)
	Set Tbf = Server.CreateObject("ADODB.RecordSet")
	sSql="select Spicers,foto from Spicersdett2014 where Spicers='" & Replace(Trim(Cod),"spi","") & "' limit 1"
	Tbf.Open sSql, conn
	Nome_foto=""
	if not Tbf.EOF then
	   Fotoimg=Trim(Tbf("foto")) & " "
	end if   
	Tbf.Close
End function
%>
<html>
<head>
<title>GESTIONE ARTICOLI SLIDE</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" class="nero10">

<!-- #include file=_menu.inc --->

<%
Set tbspi = Server.CreateObject("ADODB.RecordSet")	
if request("ricerca")=1 then
	sql_spi="Select codice_prodotto,codice_sp,descrizione from prodotti where (codice_sp like '%" & request.Form("cerca") & "%' or codice_prodotto like '%" & request.Form("cerca") & "%') and fornitore like '%spicers%' limit 1"
else
	sql_spi="Select codice_prodotto,codice_sp,descrizione from prodotti where fornitore like '%spicers%' order by id asc limit 100"
end if
'response.Write(sql_spi)
tbspi.Open sql_spi,connm
%>

	<table>
		<form action="spicers-gestione.asp?ricerca=1" method="post">
		<tr><td>CERCA</td></tr>
		<tr><td><input type="text" name="cerca"></td></tr>
		<tr><td><input type="submit" value="CERCA"></td></tr>
		</form>
	</table>

	<table width="100%" cellpadding="0" cellspacing="0" style="border:1px solid black;">
		<%do while not tbspi.eof
		if tbspi("codice_sp")<>"" then
			codicep=tbspi("codice_sp")
			Nome_foto=Fotoimg(tbspi("codice_sp"))
		else
			codicep=tbspi("codice_prodotto")
			Nome_foto=Fotoimg(tbspi("codice_prodotto"))
		end if
		%>
		<tr>
			<td style="border-right:1px solid black;border-bottom:1px solid black;"><%=codicep%></td>
			<td style="border-right:1px solid black;border-bottom:1px solid black;"><%=tbspi("descrizione")%></td>
			<td style="border-right:1px solid black;border-bottom:1px solid black;"><img src="http://www.schede.eu/cataloghi/catalogospicerpiccole/<%=Nome_foto%>" border="0"></td>
			<td width="50px" style="border-bottom:1px solid black;border-right:1px solid black;"><a href="spicers-modifica.asp?codice=<%=codicep%>">MODIFICA</a></td>
			<td width="50px" style="border-bottom:1px solid black;" align="center"><a href="spicers-elimina.asp?codice=<%=codicep%>">ELIMINA</a></td>
		</tr>
		<%tbspi.movenext
		loop
		tbspi.close%>
	</table>

</td>
</tr>
</table>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->