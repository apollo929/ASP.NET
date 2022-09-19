<!--#include file="connessionesql.asp" -->
<%
session("codice")=""
Function Fotobuf(Byval Cod)
	Set Tbf = Server.CreateObject("ADODB.RecordSet")
	sSql="select * from BuffettiSchede where Codice='" & Trim(Cod) & "' limit 1"
	Tbf.Open sSql, conn
	Nome_foto=""
	if not Tbf.EOF then
	 if Tbf("foto1")<>"" then
	   Fotobuf=Trim(Tbf("foto1")) 
	   else
	   Fotobuf="vuoto.gif" 
	 end if  
	else
	   Fotobuf="vuoto.gif"   
	end if   
	Tbf.Close
End function

%>
<html>
<head>
<title>GESTIONE BUFFETTI</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" class="nero10">

<!-- #include file=_menu.inc --->

<%
Set tbspi = Server.CreateObject("ADODB.RecordSet")	

	sql_spi="Select codice_buf,descrizione from prodotti where fornitore like '%buffetti%' order by codice_buf limit 0,10000"

'response.Write(sql_spi)
tbspi.Open sql_spi,connm
i=0
%>



	<table width="100%" cellpadding="0" cellspacing="0" style="border:1px solid black;">
		<%do while not tbspi.eof
		
		Set Tbf = Server.CreateObject("ADODB.RecordSet")
		sSql="select * from BuffettiSchede where Codice='" & tbspi("codice_buf") & "' limit 1"
		Tbf.Open sSql, conn
		Nome_foto=""

		
		if not Tbf.EOF then
			
		else
		
			if tbspi("codice_buf")<>"" then
				i=i+1
				sql_del="delete from prodotti where codice_buf='" & tbspi("codice_buf") & "' and fornitore like '%Gruppo Buffetti S.p.A.%'"
				connm.execute(sql_del)
				response.Write("<br>"& i & ") " & sql_del)
			end if
		
		end if
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