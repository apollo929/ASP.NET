<!--#include file="connessionesql.asp" -->

<%  

on error goto 0
	
Function Estr_Ragione(Byval Rif_cody)
	Set tbreg= Server.CreateObject("ADODB.Recordset")
	SQL = "select Ragione FROM Registrazione where Password1='" & Rif_cody & "' union select Ragione FROM Registrazioneint where Password1='" & Rif_cody & "'"
	tbreg.Open SQL,connm
	if tbreg.eof then
		Estr_Ragione="n/a"
	else
		Estr_Ragione=tbreg("Ragione")
	end if
End function

'impostazione data
session.lcid=1040
'tabelle utilita'
Set tbst = Server.CreateObject("ADODB.Recordset")
Sql="Select ordine.* from ordine order by ID desc"
tbst.Open Sql,connm
		

%>
<html>
<head>
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
	<LINK rel="stylesheet" href="style.css">
</head>
<body  bgcolor=white>
<br>
<!--#include file="_menu.inc"-->

            <TABLE WIDTH=800 BORDER=1 CELLSPACING=0 CELLPADDING=0 align=left>
              <TR> 
                <TH   >Ordine</TH>
                <TH   >Codice Cliente</TH>
                <TH   >Ragione Sociale</TH>
                <TH   >Data</TH>
                <TH   >Ora dell'ordine</TH>
                <TH   >Visualizza</TH>
              </TR>
              <%		
					if Tbst.EOF then%>
              <TR> 
                <td   >NESSUN ORDINE ARCHIVIATO</td>
                <td align="center"   >Cod. Cliente</td>
                <td align="center"   >Ragione Sociale</td>
                <td align="center"   ><%=date()%></td>
                <td align="center"   ><%=time()%></td>
                <td align="center"  ><img src='imgnew/tasto.gif' border=0></td>
              </TR>
              <%end if
					
					data=""
					tempo=""
					i=0
				 Do While Not Tbst.EOF and i<>120
					i=i+1
					if data=cstr(tbst("data")) and tempo=cstr(tbst("tempo"))  then
					'null
					else%>
					<TR> 
					<td   >LISTA ARTICOLI NEL CARRELLO ORDINATO IL </td>
					<td align="center" ><%=tbst("password1")%></td>
					<td align="center" ><%=Estr_Ragione(tbst("password1"))%></td>
					<td align="center" ><%=tbst("data")%></td>
					<td align="center" ><%=tbst("TEMPO")%></td>
					<td align="center" ><a href='adstoricolista.asp?data=<%=tbst("data")%>&tempo=<%=tbst("TEMPO")%>'><img src=imgnew/tasto.gif border=0></a></td>
					</TR>
					<%end if
					data=""
					tempo=""		       	
					data=cstr(tbst("data"))
					tempo=cstr(tbst("tempo"))
					Tbst.MoveNext
				Loop	
					'response.write(i)%>
            </TABLE> 



</body>
</html>
<!-- #include file=sqlchiudi.inc --->