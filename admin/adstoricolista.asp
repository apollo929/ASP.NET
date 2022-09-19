<!--#include file="connessionesql.asp" -->

<%  on error resume next
Function Estr_Ragione(Byval Rif_cody)
	Set tbreg= Server.CreateObject("ADODB.Recordset")
	SQL="Select * From Registrazione where Password1='" & Rif_cody & "' UNION " & _
	"Select * From Registrazioneint where Password1='" & Rif_cody & "'"
	tbreg.Open SQL,connm
	if not tbreg.EOF then
	 Estr_Ragione=tbreg("Ragione")
	else
	 Estr_Ragione="non trovata"
	end if
End function

session.lcid=1040
'Tabelle Utilita
Set tbst = Server.CreateObject("ADODB.Recordset")
Sql="Select * from Ordine where tempo='" &  Trim(request("tempo")) & "' and data='" &  year((request("data"))) & "-" &  month((request("data"))) & "-" &  day((request("data")))  & "' order by data desc"
tbst.Open Sql,connm
            
   %>
<html>
<head>
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body  bgcolor=white onload="window.print()">
<br>
<!--#include file="_menu.inc"-->

            <TABLE WIDTH=800 name=documento BORDER=0 CELLSPACING=0 CELLPADDING=0 align=left>
              <TR> 
                <TD valign=top align=center> <br> <br> 
                
                  <%if not Tbst.Eof then %>
							<TABLE BORDER="1" CELLSPACING="0" CELLPADDING="2">
							<TR> 
							<TH >Codice Articolo</TH>
							<TH >Descrizione</TH>
							<TH  colspan="2">Quantità</TH>
							<TH  colspan="2">Prezzo</TH>
							<TH  colspan="2">Fornitore</TH>
							</TR>
							<%
							tot=0
							counterfrm=0
							Do While not Tbst.eof
								Descrizione=Trim(replace(replace(replace(Tbst("Descrizione"),"'","`"),"*"," "),"&"," "))
								Mprezzo=Tbst("Prezzo")
								%>
								<TR> 
								<td ><%=Tbst("codice_isp")%></td>
								<!---TH >€.&nbsp;<%=FormatNumber(Mprezzo,2)%></TH>-------->
								<%counterfrm=counterfrm+1%>
								<td align=left   > <%=Descrizione%></td>
								<td align="center" colspan=2><%=Tbst("Quantita")%></td>
								<td align="center" colspan=2><%=Tbst("PrezzoUnita")%></td>
								<td align="center" colspan=2><%=Tbst("Fornitore")%></td>
								</TR>
								<%
								Tot=Tot+Tbst("Prezzototale")
								Tbst.movenext
							Loop
							%>
							</TABLE>
						<%
					else
						response.write("vuoto")
					end if%>
						<TABLE WIDTH=300 BORDER=0 CELLSPACING=0 CELLPADDING=0 align=right>
						<TR><TD valign=top align=right>
						<%
						response.write("<hr>")
						response.write("Totale €." & Tot & "  ------------ Totale Ivato " & " €." & (Tot*1.22))
						%>
						</TD></TR>
						</TABLE>
                  <br> <br> </TD>
              </TR>
            </TABLE> 


</body>
</html>
<!-- #include file=sqlchiudi.inc --->
