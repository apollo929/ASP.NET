<!--#include file="connessionesql.asp" -->

<%   
    Set tb = Server.CreateObject("ADODB.Recordset")
	strSQL = "select * from Registrazione order by Ragione asc "
	Tb.Open strSQL,connm
		
%>
<HTML>
<head>
<title>Stampa</title>
	<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
	function openWindow(url) {
		popupWin = window.open(url, 'new_page', 'width=520,height=300')
	}
</script>
</head>
<body bgcolor="#ffffff" onload="window.print()" text="#000000" name="printform">
<font face="Verdana" size="2">
<center>
Stampa del <%Response.Write Date%> , <%Response.Write Time%>
</center>				
<br><br><br>
</font>
</BODY>
</HTML>
	<table name="documento" width="100%" class=nero8>
		<tr>
			<td><%
			Do While not Tb.eof
				'response.write(  Tb("Ragione") & " --- Utente=" & Tb("utente1") & " --- Password=" & Tb("Password1") & " --- Sconto=" & Tb("Sconto") & " --- Prezzo=" & Tb("prezzo") & " --- "  & Tb("Indirizzo") & " --- " & Tb("citta") & " --- " & Tb("Provincia") & " --- " & Tb("cap") & " --- " & Tb("telefono") & " --- " & Tb("pi") & "---<br>")  							
				response.write(  Tb("Ragione") & " --- Utente=" & Tb("utente1") & " --- Password=" & Tb("Password1") & " --- Prezzoisp=" & Tb("Prezzoisp") &  " --- Prezzo=" & Tb("prezzo") & " --- tel." & Tb("telefono") & " --- Frequenza=" & Tb("frequenza") & "<br>")  							
				'response.write (Tb("Ragione") & " --- " & Tb("Passowrd1") & "---<br>") ' & Tb("Sconto") & " --- "  & Tb("Indirizzo") & " --- " & Tb("citta") & " --- " & Tb("Provincia") & " --- " & Tb("cap") & " --- " & Tb("telefono") & " --- " & Tb("pi") & "---<br>"
				
				Tb.movenext
			loop%>


			</td>
		</tr>
	</table>
</body>
</html>

<!-- #include file=sqlchiudi.inc --->