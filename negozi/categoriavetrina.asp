<!--Shop Italian Genovese Marco-->
<!--#include file="_colors.inc"-->
<!--#include file="_money.inc"-->
<!--#include file="_images.inc"-->
<!--#include file="stat/count.asp"-->
<%  
    'Variabili Connessione Db
	Dim dbc
	Dim dbcmrc 
		cDBStats = "db/scart.mdb"
     Sub Openconn
         stringdb5= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
         "Persist Security Info=False;" &_
         "Data Source=" & Server.MapPath(cDBStats)
          set dbc = Server.CreateObject("ADODB.Connection")
          dbc.open stringdb5
     End Sub
     
     Sub CloseConn()
	  if isobject(dbc) then
		if dbc.State = adStateOpen then
			dbc.Close
		end if
		set dbc = nothing
	  end if
     End sub
     
     
     
     cDBStats1 = "db/merchant.mdb"
     Sub Openconnmrc
      stringdb1= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Persist Security Info=False;" &_
      "Data Source=" & Server.MapPath(cDBStats1)
      set dbcmrc = Server.CreateObject("ADODB.Connection")
      dbcmrc.open stringdb1
     End Sub
     
     Sub closeConnmrc()
	  if isobject(dbcmrc) then
		if dbcmrc.State = adStateOpen then
			dbcmrc.Close
		end if
		set dbcmrc = nothing
	  end if
     End sub
     
     
     cDBStats2 = "db/merchant.mdb"
     Sub Openconncar
      stringdb2= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Persist Security Info=False;" &_
      "Data Source=" & Server.MapPath(cDBStats2)
      set dbcmrc = Server.CreateObject("ADODB.Connection")
      dbccar.open stringdb2
     End Sub
     
     Sub closeConncar()
	  if isobject(dbccar) then
		if dbccar.State = adStateOpen then
			dbccar.Close
		end if
		set dbccar = nothing
	  end if
     End sub
	

	Dim catid, strcat
	prodid = Request.QueryString("id")
	subcatid = Request.QueryString("subcatid")
	'Chiamata Errata Pagina
	If prodid = "" OR (isNumeric(prodid) = false) Then
		Response.Redirect "index.asp"
	End if
	

	Function Scritta(byval testo)
		arparole=split(testo & " ")
		txt=""
		for f=0 to ubound(arparole)
			txt=txt & Ucase(Left(arparole(f),1)) & lcase(mid(arparole(f),2)) & " "
		next
		Scritta=trim(txt)
	End function
	
   Function Totcarrello

		'Apertura Database Carrello
		cDBStatscar = "db/carrello.mdb"
		'Apertura Database Carrello
		strDSNcar =  "Provider=Microsoft.Jet.OLEDB.4.0;" &_
		"Persist Security Info=False;" &_
		"Data Source=" & Server.MapPath(cDBStatscar)
		Set cncar = Server.CreateObject("ADODB.Connection")
		cncar.Open strDSNcar
		'Tabelle Utilita
		Set tbcar = Server.CreateObject("ADODB.Recordset")
		Sql="Select Prezzo,Quantita from Carrello Where SessionId='" & trim(Session.SessionID) & "'"
		Tbcar.Open Sql,cncar
		Totcarrello=0
		if not Tbcar.EOF then
		 do while not Tbcar.EOF
		  Totcarrello=Totcarrello+(Tbcar("Quantita")*Tbcar("Prezzo"))
		  Tbcar.MoveNext
		 loop
		else 
		 Totcarrello=0
		end if 
	End Function	
	
	
	Sub WriteShops(byval product,byval nomenegozio,byval titolo)
		'Visualizza le Info Negozio
		OpenConn
		set rs = server.CreateObject("ADODB.Recordset")
		strSQL="Select Count(Counter) as Numprodotti From Merchantproducts where catalogID=" & Cint(product)
		rs.Open strSQL,dbc
		If rs("Numprodotti")>0 then
			'trovati
			numeronegozi= rs(0)
			rs.close
			strSQL="Select * From Merchantproducts where catalogID=" & Cint(product) & " order by cscorta DESC,cprice,cprice"
			rs.Open strSQL,dbc
			Response.Write ""
			counterfrm=1
			do while not rs.eof
						     
				idnegozio=rs("MerchantID")
				codice=rs("ccode")
				codiceid=rs("catalogid")
				scorta=rs("cscorta")
				sscorta=rs("csottoscorta")
				prezzo=rs("cprice")
				'offerta=rs("cofferta")
				vmerchantid=rs("merchantid")
				prezzoofferta=rs("cprice")
				datadisponibile=rs("cdisponibile")
				
		
				'Gestore Merchant
				Openconnmrc
				Set Rs2 = Server.CreateObject("ADODB.RecordSet")
				sSQL = "Select * from merchant where IDmerchant=" & Cint(idnegozio)
				' Apertura Recordset (Static)
				Rs2.Open sSQL, dbcmrc
				'response.write "<table width=100% border=0><tr><td class=nero10>"

				If not rs2.EOF then
					Response.Write "<br><table border=""1"" cellspacing=""1"" cellpadding=""2"" bordercolorlight=""#99CCFF"" bordercolordark=""#FFFFFF"" width=""100%""><tr><th bgcolor=#BBDDFF class=nero10><b>" & rs2("RagioneSoc1") & "</b>"
					Response.Write "</th></tr><tr><th bgcolor=#DDEEFF class=nero10 bgcolor=white>" & rs2("Cap") & "&nbsp;"
					Response.Write rs2("Citta") & ""
					Response.Write "(" & rs2("Provincia") & ")<br>"
					'Response.Write "" & "<img align=middle src=""img/filetto_or.gif"" border=0>"
					Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;<a href=mailto:info@ufficiovest.it >"
					Response.Write "<img align=middle alt=""Info Rivenditore"" src=""img/infocat.gif"" border=0></a>"
					Response.Write "<br>"
					if isscorta=true then rttxt=" Scorta Esaurita" else rttxt=" "
					'Controlla se è prenotabile
					if not isnull(datadisponibile) then
						If datediff("d",date,cdate(datadisponibile))>0 then
							'prenotabile
							rttxt=" Il Prodotto è <u>Prenotabile</u>"
							img=chr(34) & "bottoni\prenotabile.gif" & chr(34)
						end if
					end if
					Response.Write rttxt
					'Valori Form
					response.write  "<table border=0 width=100% ><tr><td align=left class=nero10 width=160>"
					response.write  "<form action=../carrello3.asp method=POST name=form" & counterfrm & " onSubmit='return checkItems(form" & counterfrm & ")'>"
					response.write  "<input type="&q&"hidden"&q&" name="&q&"ccode"&q&" value="&q & codice & q&">"
					response.write  "<input type="&q&"hidden"&q&" name="&q&"id"&q&" value="&q & prodID & q&">"
					response.write  "<input type="&q&"hidden"&q&" name="&q&"fprice"&q&" value="&q & prezzo & q&">"
					response.write  "<input type="&q&"hidden"&q&" name="&q&"titolo"&q&" value="&q & titolo & q&">"
					response.write  "<input type="&q&"hidden"&q&" name="&q&"merchid"&q&" value="&q & vmerchantid & q&">"
					if prod_offerta=-1 then
					'Prodotto in Offerta
						response.write  "<b class=rosso9>Prezzo:"  & "<br> € " & LitEuro(Prezzo) & "</b><br>" & vbcrlf
						'response.write  "<b>Offerta:</b> " & "<br> €  " & LitEuro(prezzoofferta) & "<br>" & vbcrlf
					Else
						response.write  "<b class=rosso9>Prezzo:"  & "<br> € " & LitEuro(Prezzo) & "</b><br>" & vbcrlf
					End if
					response.write  "<b></td><td align=rigth class=nero10 width=115 >"
					response.write  "Quantità: <input maxLength=1 name=fquantity size=2 value='1'></td><td align=left>" & vbcrlf
					response.write  "<input type=image alt=""Acquista il Prodotto"" src=""img/carrello.gif"" border=0 id=image1 name=image1>"
					response.write  "</td></tr></form>"
					response.write  "</table>"
										
					Response.write ""
					Response.write "</th></tr></table>"
				end if
				rs2.close
				set rs2=nothing
				closeConnmrc
				'Fine Gestione Merchant				
				'Fine Gestione Merchant				
				
				rs.movenext	
				counterfrm=counterfrm+1
			loop
			'Response.Write "</td><tr></table>"
		else
		 	
		 	    'Se non presente in merchantproducts 
		 		'Gestore Merchant
				'Gestore Merchant
				Openconnmrc
				Set Rs2 = Server.CreateObject("ADODB.RecordSet")
				Set Rsprodu = Server.CreateObject("ADODB.RecordSet")
				sSQL = "Select * from merchant where Ragionesoc1='" & Trim(Nomenegozio) & "'"
				sSQLprod = "Select * from products where Cliente='" & Trim(Nomenegozio) & "'"
				' Apertura Recordset (Static)
				
				Rs2.Open sSQL, dbcmrc, adOpenStatic, adCmdText
				Rsprodu.Open sSQLprod, dbc, adOpenStatic, adCmdText
				
				If not rs2.EOF then
					Response.Write "<br><table border=""1"" cellspacing=""1"" cellpadding=""2"" bordercolorlight=""#99CCFF"" bordercolordark=""#FFFFFF"" width=""100%""><tr><th bgcolor=#BBDDFF class=nero10><b>" & rs2("RagioneSoc1") & "</b>"
					Response.Write "" & rs2("RagioneSoc2") & "<br>"
					Response.Write "</th></tr><tr><th bgcolor=#DDEEFF class=nero10 bgcolor=white>" & rs2("Cap") & "&nbsp;"
					Response.Write rs2("Citta") & ""
					Response.Write "(" & rs2("Provincia") & ")<br><br>"
					'Response.Write "" & "<img align=middle src=""img/filetto_or.gif"" border=0>"
					Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;<a href=categoriashop.asp?id=" & PRODID & "&me=" & Rs2("idmerchant") & ">"
					Response.Write "<img align=middle alt=""Info Rivenditore"" src=""img/infocat.gif"" border=0></a>"
					Response.Write "<br>"
					'if isscorta=true then rttxt=" Scorta Esaurita" else rttxt=" "
					'Controlla se è prenotabile
					'if not isnull(datadisponibile) then
					'	If datediff("d",date,cdate(datadisponibile))>0 then
							'prenotabile
					'		rttxt=" Il Prodotto è <u>Prenotabile</u>"
					'		img=chr(34) & "bottoni\prenotabile.gif" & chr(34)
					'	end if
					'end if
					'Response.Write rttxt
					'Valori Form
					response.write  "<form action=../carrello3.asp method=POST name=form" & counterfrm & " onSubmit='return checkItems(form" & counterfrm & ")'>"
					response.write  "<input type="&q&"hidden"&q&" name="&q&"id"&q&" value="&q & Rsprodu("catalogID") & q&">"
					response.write  "<input type="&q&"hidden"&q&" name="&q&"merchid"&q&" value="&q & Rs2("idmerchant") & q&">"
					response.write  "<input type="&q&"hidden"&q&" name="&q&"ccode"&q&" value="&q & codice & q&">"
					response.write  "<table border=0 width=100% >"
					response.write  "<tr><td align=left class=nero10 width=160>"
					
					if Rsprodu("cofferta")=-1 then
					'Prodotto in Offerta
						response.write  "<b>Prezzo:</b>   €  " & LitEuro(Rsprodu("cprice")) & "<br>" 
						response.write  "<b>Offerta:</b> " & " €  " & LitEuro(Rsprodu("cprice")) & "<br>" 
						response.write  "<input type="&q&"hidden"&q&" name="&q&"fprice"&q&" value="&q & Rsprodu("cprice") & q&">"
					Else
						response.write  "<b>Prezzo:</b> "  & "<br> € " & LitEuro(Rsprodu("cprice")) & "<br>" 
						response.write  "<input type="&q&"hidden"&q&" name="&q&"fprice"&q&" value="&q & Rsprodu("cprice") & q&">"
					End if
					
					response.write  "<b></td>"
					response.write  "<td align=rigth class=nero10 width=115 >"
					response.write  "Quantità: <input maxLength=1 name=fquantity size=2 value='1'></td>"
					response.write  "<td align=left>" & vbcrlf
					response.write  "<input type=image alt=""Acquista il Prodotto"" src=""img/carrello.gif"" border=0 id=image1 name=image1>"
					response.write  "</td></tr>"
					response.write  "</table>"
					Response.write "</th></tr></table>"
				end if
				rs2.close
				set rs2=nothing
				closeConnmrc
		 	    'Se non presente in merchantproducts 
		 		'Gestore Merchant
				'Gestore Merchant
				
		end if
		rs.close
		'response.end
	End sub
	
	
	Sub WriteSubCategories
		'Apertura Connessione
		OpenConn
		set rs = server.CreateObject("ADODB.Recordset")
		strSQL = "Select * from subcategories where categoria="+trim(subcatid)
		rs.Open strSQL,dbc
		ihtml=""
		ihtml="<table border=0 width=230>"
		flipflop=1
		ihtml=ihtml+"<tr><td class=bianco11 align=center colspan=2>"
		ihtml=ihtml & "<a class=""bianco11"" href=""categoria.asp?id="& trim(subcatid) & chr(34) & ">"
		ihtml=ihtml & "<img border=""0"" height=""8"" src=""Images\spacer.gif"" width=""10"">"
		ihtml=ihtml & "<b>Tutto il Settore "+catname+ "</b>"
		ihtml=ihtml & "</a><br><br>"
		ihtml=ihtml+"</td></tr>"
		ihtml=ihtml+"<tr><td valign=right>"
		Do while not rs.eof	
			if flipflop=1 then
					ihtml=ihtml & "<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" bgcolor="&color3&">"
					ihtml=ihtml+"<tr><td valign=middle>"
					ihtml=ihtml & "<a class=""menuprod1"" href=""categoria.asp?id="& trim(subcatid) & "&subid=" & trim(rs("Codice")) & chr(34) & ">"
					ihtml=ihtml & "<b>&nbsp;&nbsp;&nbsp;&nbsp;" & Scritta(trim(rs("Descrizione"))) & "</b>"
					ihtml=ihtml & "</a>"
					ihtml=ihtml+"</td></tr>"
					ihtml=ihtml & "</table>"
			
			else	  
					ihtml=ihtml & "<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" bgcolor="&color3&">"
					ihtml=ihtml+"<tr><td valign=middle>"
					ihtml=ihtml & "<a class=""menuprod2"" href=""categoria.asp?id="& trim(subcatid) & "&subid=" & trim(rs("Codice")) & chr(34) & ">"
					ihtml=ihtml & "<b>&nbsp;&nbsp;&nbsp;&nbsp;" & Scritta(trim(rs("Descrizione"))) & "</b>"
					ihtml=ihtml & "</a>"
					ihtml=ihtml+"</td></tr>"
					ihtml=ihtml & "</table>"
			end if	  
			flipflop=-flipflop
			rs.movenext
		Loop
		
		ihtml=ihtml+"</td></tr></table>"
		Response.Write ihtml
		'Response.end
		CloseConn
	end Sub
%>
<html>
	<head>
				<title>Gestione Negozio</title>
		<link rel="stylesheet" href="_styles.inc">
		<script language="JavaScript">
			function checkItems(formobj)
			{	quant = formobj.fquantity.value;
				if (isNaN(quant) == true || quant < 1 || quant > 9)
				{
					alert("Inserisci un numero da 1 a 9");
					formobj.fquantity.focus();
					return false
				}else
				
				{
					price = formobj.fprice.value;
					if (price == 0)
					{	alert("ARTICOLO NON ACQUISTABILE!");
						return false
					}else
					{
						return true;
					}
				}
			
			}
		</script>
	</head>
	<body bgcolor="<%=color1%>" link="<%=color1%>" vlink="<%=color1%>">
		<!--#include file="_menutop.inc" -->
			<tr valign="top">
				<!--I: Parte Centrale-->					

				<td width="100%" bgcolor="<%=color1%>">
					<font size="1">
					<table valign="top" width="100%"  cellpadding="0" cellspacing="0">
						<tr>
							<td align=center class=bianco14 valign="middle" height="48" bgcolor="<%=color2%>">
							&nbsp;&nbsp;&nbsp;&nbsp; <STRONG>Shopping Ufficiovest E-Commerce</STRONG> 
							</td>
						</tr>
						<tr>
							<td>
							<table name="documento" width="350" align=center>
								<tr>
									<td class="nero10">
																					<iframe valign=top src=../vcarrell.asp scrolling=no marginwidth=0
 marginheight=0 border=0 align="left" height=23 width=250 scrolltop=0
 scrollleft=0 frameborder=0 framespacing=0 >
</iframe>
										<br>
										<%
										OpenConn
										'Controlla se è un prodotto istituzionale
										set rs = server.CreateObject("ADODB.Recordset")
										strSQL="Select Count([Counter]) From Merchantproducts where catalogID=" & Cint(prodid)
										rs.Open strSQL,dbc
										If not rs.eof then
											if rs(0)=0 then
												NoPrice=false
											else
												NoPrice=true
											end if
										else
											NoPrice=false
										end if
										rs.close
										q = chr(34)
										Sql="SELECT products.*, products.catalogID, products.catalogID AS shownID " &_
										    " FROM products WHERE products.catalogID= " & Cint(prodid)
										set rsprod = server.CreateObject("ADODB.Recordset")
										rsprod.open Sql,dbc
										'Response.Write(Sql)
										if not rsprod.EOF then
											'prod_offerta=rsprod("cofferta")
											response.write  "<center><b>"
											response.write  rsprod("cname")
											Titolo=rsprod("cname")
											response.write  "</b></center>"
											response.write  "<table border=0 width='100%'>"
											response.write  "<tr>"
											response.write  "<td align=center class=""nero10"" valign=top>"
											'newimmagine=chkimg("e:\users\shopital\shopitalian.it\images\negozio\" & Trim(rs("cimageurl")))
											'newimmagine=replace(newimmagine," ","%20")
											newimmagine=replace(rsprod("cimageurl")," ","%20")
											Response.write "<img align='center' src='articoli/" & newimmagine & "' > " 
											response.write  "</td></tr><tr><td><p class=""nero10"" align=""justify"">" & rsprod("cdescription") & "</p>"
											response.write  "</form></td></tr>"
											response.write  "</table>"
											'Nomenegozio
											Nomenegozio=Trim(rsprod("Cliente"))
																
										else
											strHTML = "Informazione non Disponibile."
										end if
										rsprod.Close
										set rsprod = nothing
										set cmd = nothing
				
										closeConn
										%><br><br>
										<%
										call WriteShops(prodid,Nomenegozio,Titolo)
										%>
										
																			
										
									</td>
								</tr>
							</table>
						
							</td>
						</tr>
					</table>
					</font>
				
				<!--F: Parte Centrale-->					
				</td>
				<td height="172" bgcolor="<%=color3%>" width="284">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id=TABLE1>
					<tr>
						<td colspan="2">
						</td>
					</tr>
				</table>
				<!--I: Parte Destra-->
				<table  border=0 cellpadding=0 cellspacing=0>
				<tr><td width=100% align=middle valign=top class="bianco11" height=900>
				<br>
				<%
				
			    Response.Write "<table cellspacing=""0"" cellpadding=""0"" width='100%' border=0><tr><td >"
			    Response.Write "<a  HREF=../contattaci.asp class=menuprod1 >&nbsp;&nbsp;&nbsp;&nbsp;RICHIESTA ARTICOLI</a><br><br>"
			    Response.Write "</td></tr></table>"
				
				WriteSubCategories%>	
				</td></tr>
				</table>		
				<!--F: Parte Destra-->
			</TD>
			</TR>

</TABLE>
<!--#include file="_menubot.inc" -->
</body>
</html>


