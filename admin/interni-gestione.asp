<!--#include file="connessionesql.asp" -->
<html>
<head>
<title>GESTIONE ARTICOLI</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" class="nero10">

<!-- #include file=_menu.inc --->

<%
Set tbcatalogo = Server.CreateObject("ADODB.RecordSet")	
if request("ricerca")=1 then
	sql_spi="Select * from prodotti where codice_buf like '%" & request.Form("cerca") & "%' or codice_od like '%" & request.Form("cerca") & "%' and fornitore like '%od%' limit 100"
else
	sql_spi="Select * from prodotti where fornitore like '%od%' order by codice_od asc limit 100"
end if
'response.Write(sql_spi)
tbcatalogo.Open sql_spi,connm
%>

	<table>
		<form action="interni-gestione.asp?ricerca=1" method="post">
		<tr><td>CERCA</td></tr>
		<tr><td><input type="text" name="cerca"></td></tr>
		<tr><td><input type="submit" value="CERCA"></td></tr>
		</form>
	</table>

	<table width="100%" cellpadding="0" cellspacing="0" style="border:1px solid black;">
		<%do while not tbcatalogo.eof
		'Nome_foto=Fotoimg(tbcatalogo("codice_prodotto"))
		%>
		<tr>
			<td style="border-right:1px solid black;border-bottom:1px solid black;"><%=tbcatalogo("codice_prodotto")%></td>
			<td style="border-right:1px solid black;border-bottom:1px solid black;"><%=tbcatalogo("descrizione")%></td>
			<td style="border-right:1px solid black;border-bottom:1px solid black;">
			
											<%codice_prodotto_txt=tbcatalogo("codice_prodotto") 
											'response.Write(tbcatalogo("fornitore"))
											if lcase(tbcatalogo("fornitore"))="od" then%>
												<img src='../foto.asp?cat=catalogoisp\piccole&img=<%=tbcatalogo("codice_od")%>.jpg' border="0">											
											    <%codice_prodotto_txt=tbcatalogo("codice_od")
											end if
											if lcase(tbcatalogo("fornitore"))="gruppo buffetti s.p.a." or lcase(tbcatalogo("fornitore"))="magazine" then%>
												<img src='../foto.asp?cat=catalogobuffetti2016_small&img=<%=tbcatalogo("codice_buf")%>.jpg' border="0">											
											<%codice_prodotto_txt=tbcatalogo("codice_buf")
											end if%>	
			
			
			</td>
			<td width="50px" style="border-bottom:1px solid black;border-right:1px solid black;"><a href="interni-modifica.asp?codice=<%=codice_prodotto_txt%>">MODIFICA</a></td>
			<!---td width="50px" style="border-bottom:1px solid black;" align="center"><a href="interni-elimina.asp?codice=<%=codice_prodotto_txt%>">ELIMINA</a></td--->
		</tr>
		<%tbcatalogo.movenext
		loop
		tbcatalogo.close%>
	</table>

</td>
</tr>
</table>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->