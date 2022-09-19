<%
     
    session.lcid=1040
    
    'Variabili Connessione Db
	Dim Mprezzo
	Dim Nome_foto
	  
     
    
Function Tagliatesto(Byval txt,byval qty)
	'Funzione per tagliare il testo a qty x riga
	 lt=len(txt)
	 counter=0
	 parola=0
	 tx=""
	 for f=1 to lt
	    c=mid(txt,f,1)
	    if c=chr(13) or c=" " then
		 parola=0
		 counter=0
		 tx=tx+c
		else
		 parola=parola+1 
		    if  counter>=qty and parola>=20 then
				tx=tx+c+"<br>"
				counter=0
			else
			    tx=tx+c
				counter=counter+1
			end if
	    end if
	 next
	 Tagliatesto=tx
End function

Function Fotoimg(Byval Cod)
		Set Tbf = Server.CreateObject("ADODB.RecordSet")
		sSql="select * from Spicersdett2007 where Spicers='" & Trim(Cod) & "'"
		Tbf.Open sSql, conn
		Nome_foto=""
		Fotoimg=Trim(Tbf("foto")) & " "
		Tbf.Close
End function


Function Originale(Byval txt)
	'Funzione trovare origina
	    c=mid(txt,1,3)
		if c="INK" or c="RIC" OR c="INC" OR c="RIB" OR c="FTR" then
		 Originale="<br>Compatibile"
		else
		 Originale="<br>Originale" 
		end if 
End function


'gestione offerte
Set Tbpro = Server.CreateObject("ADODB.RecordSet")
Set Tbsp = Server.CreateObject("ADODB.RecordSet")
sSql="select * from Profilo where Password1='offerte' ORDER BY RAND() LIMIT 10"
Tbpro.Open sSql, connm


%>
           		<table WIDTH="100%" border=0 align=center>
				<tr>
				<td class=gray11 align=center>
					<script language="JavaScript">
					function opensn(url) {
					popupWin = window.open(url, 'new_page', 'width=720,height=520,scrollbars=yes,resizable=yes')
					}
					</script>
				                <%
				                counterfrm=100
				                i=0		                
				                Do while not Tbpro.EOF and i<>6
				                    i=i+2
									sSqls=""
									sSqls="select * from Spicers where Spicers='" & Trim(Tbpro("codice_isp"))	& "'"			                
									Tbsp.open sSqls,connm
									counterfrm=counterfrm+1	               
					               				%>                
									                <table WIDTH="650" border=0 align=center>
									                <TR><TD>
													<table WIDTH="325" border=0>
													<TR height=3><TD colspan=6 class=nero8><b>OFFERTE DELLA SETTIMANA</b></Td></TR>
													<TR><TD class=nero8 align=center height=98 rowspan=2>
													<% Nome_foto=Fotoimg(Tbsp("Spicers"))
													if Len(Trim(Nome_foto))=0 then %>
													    <img src=img/vuo.gif >
													<%else%>
													    <a HREF="javascript:opensn('dettagli.asp?cod=<%=Tbsp("Spicers")%>','Dettagli');"><img  src='foto.asp?cat=catalogospicerpiccole&img=<%=Nome_foto%>' border=0></a>													
													<%end if%>	
													</TD>													
													<TD class=nero8 align=center>	
													<%=Tbsp("Marchio")%><br>
													<%=Tbsp("Spicers")%><br>
													<a class=txt_marco1 HREF="javascript:opensn('dettagli.asp?cod=<%=Tbsp("Spicers")%>','Dettagli');"><img src=img/cookie_04.gif border=0></a>
													</TD>																
													<TD align=right class=nero8>
													<strike>€.&nbsp;<%=FormatNumber(Tbsp("prezzo1"),2)%></strike>
													<br>			
													<b class=NERO8>Scontato<br>
													€.&nbsp;<%=FormatNumber(Tbpro("prezzo"),2)%>
													<br>prezzo iva esclusa
													</b>															
													</TD>
													</TR>	
													<TR><TD class=nero8 align=left colspan=7><b>Descrizione : </b><br><%=Tbpro("Descrizione")%>
													<br>
													<form action=carrello7.asp?cod=<%=Tbsp("Spicers")%> method=POST name=form<%=counterfrm%> >
													<input type=hidden name=blocco id=blocco value="OFFERTA HOMEPAGE">
													<input type=hidden name=prezzo id=prezzo value="<%=FormatNumber(Tbpro("prezzo"),2)%>">
													</td></tr>
													<tr><td align=right>
													<input maxLength=3 name=fquantity size=3 value='1'></td>													
													<td colspan=3 align=left>												
													&nbsp;&nbsp;<input type=image align=center border=0 src='img2/icon_shoppingcart4.gif' id=image1 name=image1>
													</TD></TR>
													<TR height=3><TD colspan=6 align=center bgcolor=white><img src=img/filetto_or.gif border=0></TD></TR>
													</TABLE>
													</form>
													</TD><TD valign=top><img  align=top src=img/filetto_ve.gif border=0></TD>
													<TD WIDTH="250">
													<%
													'Aumento di un record in avanti
													Tbpro.MoveNext
													Tbsp.Close
													sSqls=""
													sSqls="select * from Spicers where Spicers='" & Trim(Tbpro("codice_isp"))	& "'"			                
													Tbsp.open sSqls,connm
													counterfrm=counterfrm+1	    																										
													%>
													<table WIDTH="325" border=0>
													<TR height=3><TD colspan=6 class=nero8><b>OFFERTE DELLA SETTIMANA</b></Td></TR>
													<TR><TD class=nero8 align=center height=98 rowspan=2>
													<% Nome_foto=Fotoimg(Tbsp("Spicers"))
													if Len(Trim(Nome_foto))=0 then %>
													    <img src=img/vuo.gif >
													<%else%>
													    <a HREF="javascript:opensn('dettagli.asp?cod=<%=Tbsp("Spicers")%>','Dettagli');"><img  src='foto.asp?cat=catalogospicerpiccole&img=<%=Nome_foto%>' border=0></a>													
													<%end if%>	
													</TD>													
													<TD class=nero8 align=center>	
													<%=Tbsp("Marchio")%><br>
													<%=Tbsp("Spicers")%><br>
													<a class=txt_marco1 HREF="javascript:opensn('dettagli.asp?cod=<%=Tbsp("Spicers")%>','Dettagli');"><img src=img/cookie_04.gif border=0></a>
													</TD>																
													<TD align=right class=nero8>
													<strike>€.&nbsp;<%=FormatNumber(Tbsp("prezzo1"),2)%></strike>
													<br>			
													<b class=NERO8>Scontato<br>
													€.&nbsp;<%=FormatNumber(Tbpro("prezzo"),2)%>
													<br>prezzo iva esclusa	
													</b>																											
													</TD>
													</TR>	
													<TR><TD class=nero8 align=left valign=center colspan=3><b>Descrizione : </b><br><%=Tbpro("Descrizione")%>
													<br>
													<form action=carrello7.asp?cod=<%=Tbsp("Spicers")%> method=POST name=form<%=counterfrm%> >
													<input type=hidden name=blocco id=blocco value="OFFERTA HOMEPAGE">
													<input type=hidden name=prezzo id=prezzo value="<%=FormatNumber(Tbpro("prezzo"),2)%>">
													</td></tr>
													<tr><td align=right>
													<input maxLength=3 name=fquantity size=3 value='1'></td>													
													<td colspan=3 align=left>												
													&nbsp;&nbsp;<input type=image align=center border=0 src='img2/icon_shoppingcart4.gif' id=image1 name=image1>
													</TD></TR>
													<TR height=3><TD colspan=6 align=center bgcolor=white><img src=img/filetto_or.gif border=0></TD></TR>
													</TABLE>
													</form>
													</TD></TR></TABLE>
									<%
									Tbpro.MoveNext
									Tbsp.Close
																		
				                Loop%>
				</td>
				</tr>
				</table>
