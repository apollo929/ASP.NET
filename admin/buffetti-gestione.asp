<!--#include file="connessionesql.asp" -->
<html>
<head>
<title>GESTIONE BUFFETTI</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" class="nero10">

<!-- #include file=_menu.inc --->

<%
Set tbbuffetti = Server.CreateObject("ADODB.RecordSet")	
if request("ricerca")=1 then
	sql_spi="Select codice_buf,descrizione from prodotti where codice_buf like '%" & request.Form("cerca") & "%' and fornitore like '%buffetti%' limit 100"
else
	sql_spi="Select codice_buf,descrizione from prodotti where fornitore like '%buffetti%' order by codice_buf limit 100"
end if
'response.Write(sql_spi)
tbbuffetti.Open sql_spi,connm
%>

	<table>
		<form action="buffetti-gestione.asp?ricerca=1" method="post">
		<tr><td>CERCA</td></tr>
		<tr><td><input type="text" name="cerca"></td></tr>
		<tr><td><input type="submit" value="CERCA"></td></tr>
		</form>
	</table>

	<table width="100%" cellpadding="0" cellspacing="0" style="border:1px solid black;">
		<%do while not tbbuffetti.eof
		%>
		<tr>
			<td style="border-right:1px solid black;border-bottom:1px solid black;"><%=tbbuffetti("codice_buf")%></td>
			<td style="border-right:1px solid black;border-bottom:1px solid black;"><%=tbbuffetti("descrizione")%></td>
			<td style="border-right:1px solid black;border-bottom:1px solid black;"><img src="../foto.asp?cat=catalogobuffetti2016_small&img=<%=tbbuffetti("codice_buf")%>.jpg" border="0"></td>
			<td width="50px" style="border-bottom:1px solid black;border-right:1px solid black;"><a href="buffetti-modifica.asp?codice=<%=tbbuffetti("codice_buf")%>">MODIFICA</a></td>
			<!---td style="border-bottom:1px solid black;"><a href="buffetti-elimina.asp?codice=<%=tbbuffetti("codice_buf")%>">ELIMINA</a></td--->
		</tr>
		<%tbbuffetti.movenext
		loop
		tbbuffetti.close%>
	</table>

</td>
</tr>
</table>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->