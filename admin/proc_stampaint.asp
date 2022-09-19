<!--#include file="connessionesql.asp" -->

<%  'set data
    session.lcid=1040 
	'report stampautenti internet
	Set Tb = Server.CreateObject("ADODB.Recordset")
	strSQL = "select * from Registrazioneint order by Ragione asc "
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
<HR>
<b>GESTIONE UTENTI PROVENIENTI DA INTERNET</b>
<HR>	
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
				response.write(  Tb("Ragione") & " --- Utente=" & Tb("utente1") & " --- Password=" & Tb("Password2") & " --- Rif.Wincody=" & Tb("Password1") & " --- Prezzoisp=" & Tb("Prezzoisp") & " --- Prezzo=" & Tb("prezzo") & " --- tel." & Tb("telefono") & " --- Frequenza=" & Tb("frequenza") & "<br>")  							
				Tb.movenext
			Loop%>


			</td>
		</tr>
	</table>
</body>
</html>
<!-- #include file=sqlchiudi.inc --->