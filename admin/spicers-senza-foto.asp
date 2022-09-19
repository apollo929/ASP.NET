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
<title>GESTIONE ARTICOLI SENZA FOTO</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" class="nero10">

<!-- #include file=_menu.inc --->

<%
Set tbspi = Server.CreateObject("ADODB.RecordSet")	
sql_spi="Select codice_sp,descrizione from prodotti where fornitore like '%spicers%' order by id asc limit 10000,2027"
tbspi.Open sql_spi,connm
%>

	<table width="100%" cellpadding="0" cellspacing="0" style="border:1px solid black;">
		<%do while not tbspi.eof
		
			Set Tbf = Server.CreateObject("ADODB.RecordSet")
			sSql="select Spicers,foto from Spicersdett2014 where Spicers='" & tbspi("codice_sp") & "' limit 1"
			'response.Write("<br>" & sSql)
			Tbf.Open sSql, conn
			if Tbf.EOF then
			
			else
		%>
		<tr>
			<td style="border-right:1px solid black;border-bottom:1px solid black;"><%=tbspi("codice_sp")%></td>
			<td style="border-right:1px solid black;border-bottom:1px solid black;"><%=tbspi("descrizione")%></td>
			<td style="border-right:1px solid black;border-bottom:1px solid black;"><img src="http://www.schede.eu/cataloghi/catalogospicerpiccole/<%=Nome_foto%>" border="0"></td>
			<td width="50px" style="border-bottom:1px solid black;border-right:1px solid black;"><a href="spicers-modifica.asp?codice=<%=tbspi("codice_sp")%>">MODIFICA</a></td>
			<td width="50px" style="border-bottom:1px solid black;" align="center"><a href="spicers-elimina.asp?codice=<%=tbspi("codice_sp")%>">ELIMINA</a></td>
		</tr>
		<%
			end if
			Tbf.close
		tbspi.movenext
		loop
		tbspi.close%>
	</table>

</td>
</tr>
</table>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->