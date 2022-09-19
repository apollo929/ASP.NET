<!--Shop Italian Genovese Marco-->
<!--#include file="_colors.inc"-->
<!--#include file="_money.inc"-->
<!--#include file="_images.inc"-->
<!--#include file="stat/count.asp"-->
<%  

	

	
    'Variabili Connessione Db
	Dim dbc
	Dim catname, productslist
	
	
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
	
	catid = Request.QueryString("id")
	Max=Cint(Request("next"))
			

	
	Function Totcarrello
	 'Apertura Database Carrello
	 cDBStatscar = "db/carrello.mdb"
    'Apertura Database Carrello
	 strDSNcar =  "Provider=Microsoft.Jet.OLEDB.4.0;" &_
     "Persist Security Info=False;" &_
     "Data Source=" & Server.MapPath(cDBStatscar)
     'Response.Write (Server.MapPath(cDBStatscar))
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
	
	Function Scritta(byval testo)
		arparole=split(testo & " ")
		txt=""
		for f=0 to ubound(arparole)
		txt=txt & Ucase(Left(arparole(f),1)) & lcase(mid(arparole(f),2)) & " "
		next
		Scritta=trim(txt)
	End function
	
	Sub WriteSubCategories
		'Apertura Connessione
		OpenConn
		strSQL = "Select * from subcategories where categoria="+trim(catid) & " order by Descrizione"
		Set rs=dbc.Execute(strSQL)
		ihtml="<table border=0 width=230>"
		flipflop=1
		ihtml=ihtml+"<tr><td colspan=2 align=center>"
		ihtml=ihtml & "<a class=""bianco10"" href=""categoriaall.asp?" & chr(34) & ">"
		ihtml=ihtml & "<img border=""0"" height=""8"" src=""Images\spacer.gif"" width=""10"">"
		ihtml=ihtml & "<b>Tutto il Settore "+catname+ "</b>"
		ihtml=ihtml & "</a><br><br>"
		ihtml=ihtml+"</td></tr>"
		ihtml=ihtml+"<tr><td valign=right>"
		Do while not rs.eof	
			if flipflop=1 then
					ihtml=ihtml & "<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" bgcolor="&color3&">"
					ihtml=ihtml+"<tr><td valign=middle>"
					ihtml=ihtml & "<a class=""menuprod1"" href=""categoria.asp?id="& trim(catid) & "&subid=" & trim(rs("Codice")) & chr(34) & ">"
					ihtml=ihtml & "<b>&nbsp;&nbsp;&nbsp;&nbsp;" & Scritta(trim(rs("Descrizione"))) & "</b>"
					ihtml=ihtml & "</a>"
					ihtml=ihtml+"</td></tr>"
					ihtml=ihtml & "</table>"
			
			else	  
					ihtml=ihtml & "<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" bgcolor="&color3&">"
					ihtml=ihtml+"<tr><td valign=middle>"
					ihtml=ihtml & "<a class=""menuprod2"" href=""categoria.asp?id="& trim(catid) & "&subid=" & trim(rs("Codice")) & chr(34) & ">"
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
		CloseConn
	end Sub
	
	'Gestione Prodotti
	Dim catid, strcat
	catid = Request.QueryString("id")
	subcatid = Request.QueryString("subid")
	strcat = Request.QueryString ("cat")
	'Controlla se è stata selezionata la sottocategoria
	if len(trim(subcatid))>0 then 
		scategoria=true 
		'Legge la Descrizione della sottocategoria
		openconn
		strSQL = "Select * from subcategories where codice="+trim(subcatid)+" and categoria=" & trim(catid)
		Set rs=dbc.Execute(strSQL)
		
		if not rs.eof then
			descrizione_sottocategoria=rs("Descrizione")
		end if
		rs.close
		closeconn
	else 
		scategoria=false
		descrizione_sottocategoria=""
		
	end if
	


%>
<html>
	<head>
		<title>Gestione Negozio</title>
		<link rel="stylesheet" href="_styles.inc">
		<script language="JavaScript">
			function checkItems(formobj)
			{
				quant = formobj.fquantity.value;
				if (isNaN(quant) == true || quant < 1 || quant > 9)
				{
					alert("Inserisci un numero da 1 a 9");
					formobj.fquantity.focus();
					return false
				}else
				{
					return true;
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
									<td class="nero8">
												<iframe valign=top src=../vcarrell.asp scrolling=no marginwidth=0
 marginheight=0 border=0 align="left" height=23 width=250 scrolltop=0
 scrollleft=0 frameborder=0 framespacing=0 >
</iframe>
		<%
		'Connessione scart
		q = chr(34)
		
		Openconn
		if trim(request("subid"))="" then
			Sql= "SELECT products.*, products.ccategory, categories.catdescription FROM categories INNER JOIN products ON categories.categoryID = products.ccategory WHERE (products.ccategory)=" & Cint(request("id")) & " order by products.catalogid desc "
		else	
		    Sql= "SELECT products.*, products.ccategory, categories.catdescription FROM categories INNER JOIN products ON categories.categoryID = products.ccategory WHERE (products.ccategory)=" & Cint(request("id")) & " and (products.cscategory)=" & Cint(request("subid")) & " order by products.catalogid desc "
		end if    
		Set rs=dbc.Execute(Sql)
		
		if not rs.EOF then
			catname = rs("catdescription")%>
			<center><br><b><%=catname%></b><br>
			<i><U><%=descrizione_sottocategoria%></U></i>
			</center><br>
			<table border=0 cellPadding=4 cellSpacing=2 width='100%'>
			<%
			i = 1
			'Controllo Avanzamento
			y=0
            Do While Not rs.Eof AND y<>MAX
				y=y+1
				rs.movenext
            Loop
            'Response.Write(y)
            countpr=0%>
			<tr>
		<%	While not rs.EOF and countpr<>4
				
						subid=rs("cscategory")
						'prod_offerta=rs("cofferta")   %>
						
						<td width="3"><img src="img/filetto_ve.gif"></td>
						<td valign="top">
						
						<table height=200 border=0 width="155">
						<tr>
						<!---Immagine Prodotto--->
						<td height=105 valign="top" width="100">
						<a  href='categoriavetrina.asp?id=<%=rs("catalogID")%>&subcatid=<%=catid%>'>
					<%	'newimmagine=chkimg("e:\users\shopital\shopitalian.it\images\negozio\" & Trim(rs("cimageurl")))
						'newimmagine=replace(newimmagine," ","%20")
						newimmagine=replace(rs("cimageurl")," ","%20")
						%></a>
						<img height='100' width='100' src='articoli/<%=newimmagine%>' align='left'></td>
												
						<!--Informazioni Prodotto--->
						 <td align="right">
						 
	 
						 <a  href='categoriavetrina.asp?id=<%=rs("catalogID")%>&subcatid=<%=catid%>'>
						 <img src=img/info.gif align="absmiddle" alt="Informazioni Prodotto" border="0"></a>
						 </td>
												
						<!--Nuova Riga--->
						 </tr>
						 <tr>
												
						<!---Descrizione Prodotto--->
						 <td class="nero8" height="40" colspan="2" valign="top">
						 <p align="justify">
						 <%=rs("cname")%>
						 </p>
						 </td>
											
						
						 </tr>
						 <tr>
											
						
						 </tr>
						 <tr>
						 <td height="10" colspan="2">
						 
						<% 'Prezzo
						   alink2="a class=""rosso9"" href=categoriavetrina.asp?id="& rs("catalogID") & "&subcatid=" & catid
						   Response.Write "<b class=navy11n>"
					       Response.Write "Prezzo €. " & formatnumber(rs("cprice"),2) & "</b></a><br>"
					       'Zoom
					       alink3="a class=""navy11n"" href=categoriavetrina.asp?id="& rs("catalogID") & "&subcatid=" & catid
						   Response.Write "<" & alink3 & "><b>"
					       Response.Write "<img border='0'  src='img/fastname.gif'>Foto Reale</b></a>"
					       		   %>
					    
						 </td>
						 </tr>
						 <tr>
						<%						
						'Controlla se il prodotto è venduto dai negozi o dalla primatist
						MSql="Select Count([Counter]) From Merchantproducts where catalogID=" & rs("CatalogID")
						Set rs2=dbc.Execute(MSQL)

						If not rs2.EOF then
							'Trovato negozianti che vendono
							NumeroNegozi=rs2(0)
							If NumeroNegozi>0 then
								If NumeroNegozi=1 then 
								txtnegozio="Acquisto possibile da 1 negozio"
								elseif NumeroNegozi>1 then
								txtnegozio="Acquisto possibile da "&NumeroNegozi&" negozi"
								end if
								istitut=false
							Else
								'Prodotto Istituzionale
								txtnegozio="Acquisto possibile da 1 negozio"
								If prod_offerta=true then
									'Prodotto in Offerta
									oo_Prezzo=FormatCurrency(rs("cprice"),0)
									oo_Offerta=FormatCurrency(rs("cpriceofferta"),0)
									Else
									oo_Prezzo=FormatCurrency(rs("cprice"),0)
								end if
								istitut=true
							End if
						Else
							'Prodotto Istituzionale				
							txtnegozio="Acquisto possibile da 1 negozio"
							If prod_offerta=true then
							'Prodotto in Offerta
							oo_Prezzo=FormatCurrency(rs("cprice"),0)
							oo_Offerta=FormatCurrency(rs("cpriceofferta"),0)
							Else
							oo_Prezzo=FormatCurrency(rs("cprice"),0)
							End if
						istitut=true
						End If
												
						'Chiusura Recordset
						rs2.Close%>
						
						<!---'Prodotto venduto da 1 o più negozi--->
						 <td height="10" colspan="2">
						 <table border="1" cellspacing="0" cellpadding="0" bordercolorlight="#99CCFF" bordercolordark="#FFFFFF" width='100%' >
						 <tr height=1>
						 </tr>
						 </table>
						 </td>
																								
						<!---Nuova Riga (Spazio tra Prezzo e Ordine)--->
						 </tr>
						 <tr>
						 <td height="1" colspan="2">
						 </td>
						 </tr>
						 <tr>
																			
					
						 </tr>
						 <tr>
						 <td colspan=2 align=right><a  href='categoriavetrina.asp?id=<%=rs("catalogID")%>&subcatid=<%=catid%>'>
						 <img border=0  alt="Acquisto Possibile" src="img/buy.gif"></a>
						 </td>
																															
						<!--'Nuova Riga (Spazio tra Prezzo e Ordine)--->
						 </tr>
						 <tr>
						 <td colspan="2">
						 </td>
						 </tr>
						 <tr>
																			
						<!---'Filetto Orizzontale-->
						 <tr>
						 <td align="middle" colspan="2" height="3">
						 <img src="img/filetto_3_or.gif">
						 </td>
						 </tr>
																			
						
						 </tr>
						 </table>
						
						
						 </td>
						
						<%						
					if (i mod 2) = 0 then%>
						 </tr><tr>  
				<%	end if
					i = i + 1		
				
				rs.MoveNext
				countpr=countpr+1	
			wend
			
			if i=2 then 
				'Correzione quando visualizzato solo un prodotto%>
				 <td>&nbsp;</td><td width="250">&nbsp;</td>  
			<%	end if
			'Chiusura Table%>
			 </tr><tr><td colspan=5 align=right>
			<%	If MAX>=4  then  %>
				 <A HREF='categoria.asp?subid=<%=trim(subcatid)%>&id=<%=trim(catid)%>&next=<%=(Max-4)%>'>
				 <IMG BORDER=0 SRC=img/_PREV.GIF></A>&nbsp;
			<%	End if
			If countpr>=4 and not rs.Eof Then  %>
			    <A HREF='categoria.asp?subid=<%=trim(subcatid)%>&id=<%=trim(catid)%>&next=<%=(countpr+Max)%>'><IMG BORDER=0 SRC=img/_next.GIF></A>      
			<%	End if%>
			</td></tr></table>
			<%	else%>
			<b class=navy11><br>Nessuna Informazione sui Prodotti.</b>
			<%		
			end if
			
			rs.Close
			set rs = nothing
			CloseConn
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
