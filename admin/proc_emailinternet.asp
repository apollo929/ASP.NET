<!--#include file="connessionesql.asp" -->

<%   
    Set tb = Server.CreateObject("ADODB.Recordset")
	strSQL = "select DISTINCT EMAIL from Registrazioneint order by EMAIL asc "
	Tb.Open strSQL,connm
		
%>
<HTML>
<head>
<title>E@MAIL</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body  bgcolor=white text="#000000" >
<a class=nero10 href=adutentipro.asp><img border=0 src=imgnew/tasto.gif>&nbsp;INDIETRO</a><br>
<font face="Verdana" size="2">
	<table name="documento" width="100%" class=nero11>
		<tr>
			<td><%
			Do While not Tb.eof
				'response.write(  Tb("Ragione") & " --- Utente=" & Tb("utente1") & " --- Password=" & Tb("Password1") & " --- Sconto=" & Tb("Sconto") & " --- Prezzo=" & Tb("prezzo") & " --- "  & Tb("Indirizzo") & " --- " & Tb("citta") & " --- " & Tb("Provincia") & " --- " & Tb("cap") & " --- " & Tb("telefono") & " --- " & Tb("pi") & "---<br>")  							
				if instr(1,Trim(Tb("EMAIL")),"@")<>0 then
				 response.write(lCASE(Tb("EMAIL")) & "<br>")  							
				end if
				'response.write (Tb("Ragione") & " --- " & Tb("Passowrd1") & "---<br>") ' & Tb("Sconto") & " --- "  & Tb("Indirizzo") & " --- " & Tb("citta") & " --- " & Tb("Provincia") & " --- " & Tb("cap") & " --- " & Tb("telefono") & " --- " & Tb("pi") & "---<br>"
				
				Tb.movenext
			loop%>


			</td>
		</tr>
	</table>
</body>
</html>

<!-- #include file=sqlchiudi.inc --->