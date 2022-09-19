<!--Shop Italian Genovese Marco-->
<!--#include file="_colors.inc"-->
<!--#include file="_money.inc"-->
<!--#include file="_images.inc"-->
<!--#include file="adovbs.inc"-->
<%  
	session.lcid=1040
    merchant=118


    'Variabili Connessione Db
	Dim dbc
	Dim dbcmrc 
	  
     cDBStats = "/negozi/db/scart.mdb"
     Sub Openconn
      stringdb= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Persist Security Info=False;" &_
      "Data Source=" & Server.MapPath(cDBStats)
      set dbc = Server.CreateObject("ADODB.Connection")
      dbc.open stringdb
     End Sub
     
     Sub CloseConn()
	  if isobject(dbc) then
		if dbc.State = adStateOpen then
			dbc.Close
		end if
		set dbc = nothing
	  end if
     End sub
     
     
     
     cDBStats1 = "/negozi/db/merchant.mdb"
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
     
     
     cDBStats2 = "/negozi/db/merchant.mdb"
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

	

	
	Function iscategoria(Byval codice,categoria)
	 Openconn
		If len(codice)>0 then
			'Visualizza la Sottocategoria
			Set Rs2 = Server.CreateObject("ADODB.RecordSet")
			sSQL = "select * From SubCategories where codice=" & trim(codice) & " and categoria=" & categoria
			Rs2.Open sSQL, dbc, adOpenStatic, adCmdText
			If not rs2.EOF then
				iscategoria=rs2("Descrizione")
			end if
			rs2.close
		else
			iscategoria=""
		end if
	 Closeconn	
	end function
	
	Sub InsCategorie(byval selezionata)
	 Openconn
		Set Rs2 = Server.CreateObject("ADODB.RecordSet")
		sSQL = "select * From Categories"
		Rs2.Open sSQL, dbc, adOpenStatic, adCmdText
		If not rs2.EOF then
			ncategorie=0
			Do While not rs2.eof
				'Controlla se il merchant ha la categoria
				categoria=trim(rs2("categoryID"))
				If Instr(allcc,categoria)<>0 then
					'Si posiziona sulla selezionata
					if cint(categoria)=cint(selezionata) then sel="selected " else sel=""
					Response.Write "<option " & sel & "value=" & categoria & ">"
					Response.Write rs2("catdescription")
					Response.Write "</option>"
					ncategorie=ncategorie+1
				end if
				rs2.movenext
			loop
		else
			Response.Write "<option value=0>"
			Response.Write "------------------"
			Response.Write "</option>"
		end if
		if ncategorie=0 then
			Response.Write "<option value=0>"
			Response.Write "------------------"
			Response.Write "</option>"
		end if
		Rs2.close
		Closeconn	
	End sub

	sub InsArticoliMerchant(Byval merchant)
	    Openconn
		Set Rs2 = Server.CreateObject("ADODB.RecordSet")
		sSQL = "Select products.*,merchantproducts.* from products inner join merchantproducts on products.catalogID=merchantproducts.catalogID where merchantproducts.merchantID=" & merchant
		' Apertura Recordset (Static)
		Rs2.Open sSQL, dbc, adOpenStatic, adCmdText
		If not rs2.EOF then
			Response.Write "<br>"
			Do while not rs2.EOF
				Response.Write "&nbsp;&nbsp;<a href=mearticoli.asp?prID=" & rs2("catalogID") & "&merchant=" & merchant & "&act=mod>"
				Response.Write "<font size=1>" & rs2("cname") & "</a> <br>"
				rs2.MoveNext 
			loop
		end if
			rs2.Close 
		Closeconn	
	end sub


	Openconn
	Openconnmrc
		
	
		'Controlla i valori del merchant
	Set Rs2 = Server.CreateObject("ADODB.RecordSet")
	sSQL = "Select * from merchant where IDmerchant=" & merchant
	' Apertura Recordset (Static)
	Rs2.Open sSQL,dbcmrc, adOpenStatic, adCmdText
	If not rs2.EOF then
		nmaxarticoli=rs2("maxprodotti")
		'Categorie di appartenenza
		cc1=rs2("centro1")
		cc2=rs2("centro2")
		cc3=rs2("centro3")
		cc4=rs2("centro4")
		cc5=rs2("centro5")
		cc6=rs2("centro6")
		allcc=cc1 & "|" & cc2 & "|" & cc3 & "|" & cc4 & "|" & cc5 & "|" & cc6
	else
		nmaxarticoli=0
	end if
	rs2.close
	
	
	
%>

<html>
	<head>
		<title>Gestione Negozio</title>
		<!--#include file="_marketing.inc" -->
		<link rel="stylesheet" href="_styles.inc">
		<script language="javascript">
			function sottocategorie(formname) {
				pos = eval("document." + formname + ".categorie.selectedIndex");
				val = eval("document." + formname + ".categorie.options["+ pos + "].value");
				asp = "selsottocategoria.asp?id="+val;
				w=window.open(asp,"SottoCategoria","width=550,height=250,menubar=no,scrollbar=auto,resizable=no");
			}
			function articoli(formname) {
				pos   = eval("document." + formname + ".categorie.selectedIndex");
				val   = eval("document." + formname + ".categorie.options["+ pos + "].value");
				valsc = eval("document." + formname + ".sottocategoriaid.value");
				asp = "selarticolo.asp?id="+val+"&sid="+valsc;
				w=window.open(asp,"Articoli","width=700,height=650,menubar=no,scrollbar=auto,resizable=no");
			}
			function visuaimg(formname) {
			   	idsc = eval("document." + formname + ".codarticolo.value");
				asp = "visuarticolo.asp?id=" + idsc;
				w=window.open(asp,"Visualizzazione","width=400,height=350,menubar=no,scrollbar=auto,resizable=no");
			}
			function immagine(formname) {
				asp = "selimmagine.asp";
				w=window.open(asp,"Immagine","width=900,height=700,menubar=no,scrollbar=auto,resizable=yes");
			}
			function checkart(formobj)
			   
			    {
			    nome = formobj.categorie.value;
				if (nome =="" )
				{
					alert(" categorie ");
					formobj.categorie.focus();
					return false
				}else
				{
				cognome = formobj.sottocategoria.value;
				if (cognome == "")
				{	alert("sottocategoria");
					return false
				}else
				{
				cap = formobj.desarticolo.value;
				if (cap == "")
				{	alert("Descrizione Obbligatoria");
					formobj.desarticolo.focus();
					return false
				}else
				{
					Prezzo = formobj.prezzo.value;
				if (isNaN(Prezzo)== true)
				{	alert("Inserisci il Prezzo");
					formobj.prezzo.focus();
					return false
				}else	
					return true
					}}
				}
			
			}
		</script>
		</head>
<html>
	<head>
				<title>Gestione Negozio</title>
	
		<link rel="stylesheet" href="/style.css">
	</head>
	<body bgcolor=white>
		<!--#include file="_menutop.inc" -->
			<tr valign="top">
				<td width="200" height=900 bgcolor="white">
					<!--#include file="_menusxme.inc" -->
				</td>
				<!--I: Parte Centrale-->				
				<td width="540" bgcolor="white">
					<font size="1">
					<table valign="top" width="100%"  cellpadding="0" cellspacing="0">
						<tr>
							<td class=orange14 align=center valign="middle" height="48" bgcolor="white">
							 <img border=0 src='/admin/imgnew/testapiccolo.jpg'>
							</td>
						</tr>
						<tr>
							<td>
							<table border=0 cellPadding="0" cellSpacing="0" name="documento" width="500" valign="top">
								<tr>
									<td class=navy10n >
										<%
										rt=lcase(request("act"))
										select case rt
										case "mod"
													insnewprodotto=true
													modifica=true
													id=request("prID")
													Set Rs2 = Server.CreateObject("ADODB.RecordSet")
													sSQL = "Select products.*, merchantproducts.* from products inner join merchantproducts on products.catalogID= merchantproducts.catalogID where merchantproducts.merchantID=" & merchant & " and products.CatalogID=" & ID
													' Apertura Recordset (Static)
      												Rs2.Open sSQL, dbc, adOpenStatic, adCmdText
													 If not rs2.EOF then
														'Query Articolo																						
														t_codarticolo=Rs2("products.catalogID")
														t_desarticolo=Rs2("cname")
														t_artdettagli=Rs2("cdescription")
														'Categoria e SottoCategoria
														t_categoria=Rs2("ccategory")
														t_sottocategoria=Rs2("cscategory")
														t_immagine=Rs2("cimageurl")
														t_rifarticolo=Rs2("products.ccode")
														t_prezzo=Rs2("products.cprice")
														t_prezzoofferta=Rs2("products.cpriceofferta")
														t_scorta=Rs2("cscorta")
														t_sottoscorta=Rs2("csottoscorta")
														proprietario=rs2("owner")
													 	Rs2.Close
	
													end if
										end select
										if lcase(request("CMD"))="new" then
										 	't_categoria=1
											't_sottocategoria=0
										end if
										
										%>
										
										<!---- Parte Centrale ------->
										<br>

										<FORM name="form" method="post" action="mearticoliins.asp?<%=Request.ServerVariables("QUERY_STRING")%>&owner=<%=owner%>" onSubmit='return checkart(form)'>
											<table width=100% border=0 cellpadding=0 cellspacing=0>
												<tr>
													<td class=navy10n >
														 Categoria: 
													</td>
													<td class=navy10n ><SELECT class=navy10n  id=categorie name=categorie onchange="sottocategorie('form')"><%inscategorie t_categoria%></SELECT>
													</td>
												</tr>
												
												<tr>
													<td class=navy10n >
														 Sottocategoria: 
													</td>
													<td class=navy10n >
													    <INPUT class=navy10n type="text" name="sottocategoria" disabled value="<%=iscategoria(t_sottocategoria,t_categoria)%>" maxlength=50 size=30>		
														<a href=javascript:sottocategorie('form')><img src='img/sottocategoria.gif' border=0 alt="Seleziona SottoCategoria"></a>
														<INPUT  size=60 type="hidden" name="sottocategoriaid" value=<%=t_sottocategoria%>>
														<INPUT  type="hidden" name="insdb" value="">

													</td>
												</tr>
												
												<tr>
													<td height=10></td>
													<td class=navy10n ></td>
												</tr>
												<tr>
													<td class=navy8n >
														 Codice Articolo: 
														 (Facoltativo)
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="text" name="codarticolo"  value="<%=t_codarticolo%>" maxlength=10 size=10>
														<INPUT class=navy10n type="hidden" name="hcodarticolo" value="<%=t_codarticolo%>">
														<a href=javascript:articoli('form')><img src=img/fotopresenti.gif border=0 alt="Seleziona Articolo" name="imgselart"></a>
													</td>
												</tr>
												<tr>
													<td class=navy10n >
														 Descrizione: 
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="text" name="desarticolo" value="<%=Cstr(t_desarticolo)%>" maxlength=150 size=50>
														<INPUT class=navy10n type="hidden" name="hidden" value="<%=eni2%>">
													</td>
												</tr>
												<tr>
													<td class=navy10n valign=top>
														 Dettagli: 
													</td>
													<td class=navy10n >
														<TEXTAREA class=navy10n rows=8 cols=45 name="artdettagli"><%=t_artdettagli%></TEXTAREA>
													</td>
												</tr>
												<tr>
													<td height=10></td>
													<td class=navy10n ></td>
												</tr>
												<tr><td class=navy10n ></td><td class=navy10n >
															<table border=0  bordercolor=Navy cellpadding=0 cellspacing=0>
															<tr>
																<td class=navy10n ><br> Immagine: 
																	<br>
																											
																	<%'if modifica=false or owner="true" then%>
																	<a href=javascript:immagine('form')><img src=img/seleziona.gif border=0 alt="Seleziona Immagine"></a>
																	<%'end If%>
																	<a href=javascript:visuaimg('form')><img src=img/visualizza.gif border=0 alt="Visualizza Immagine"></a><br><br>
																	<INPUT class=navy10n type="text" name="immagine" value="<%=t_immagine%>" maxlength=100 size=30><br>
																	<br><br>
												                 
																</td>
															</tr>
															</table>
												</td></tr>			
												<!---tr>
													<td class=navy10n >
														 Immagine Dett: 
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="text" name="immaginebig" value="<%=t_immagine2%>" maxlength=100 size=30 disabled>
													</td>
												</tr-->
												<!---tr>
													<td class=navy10n >
														 Modulo di Input: 
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="text" name="modinput" value="Standard" maxlength=100 size=30 disabled>
													</td>
												</tr-->
												<tr>
													<td height=10></td>
													<td class=navy10n ></td>
												</tr>
												<tr>
													<td class=navy10n >
														 Codice Proprio<br>Prodotto: 
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="text" name="rifarticolo" value="<%=t_rifarticolo%>" maxlength=10 size=10>
													</td>
												</tr>
												<tr>
													<td class=navy8n >
														 Prezzo in €uro <br>
														 Utilizza il punto per i decimali: 
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="text" name="prezzo" value="<%=Replace(Formatnumber(t_prezzo,2),",",".")%>" maxlength=10 size=10>
													</td>
												</tr>
												<!---tr>
													<td class=navy10n >
														 Prezzo Offerta: 
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="text" name="prezzoofferta" value="<%=replace(t_prezzoofferta,",",".")%>" maxlength=10 size=10>
													</td>
												</tr>
												<tr>
													<td class=navy10n >
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="checkbox" name="articoloofferta" <%=t_articoloofferta%>> Articolo in Offerta 
													</td>
												</tr--->
												<tr>
													<td height=10></td>
													<td class=navy10n ></td>
												</tr>
											            <INPUT class=navy10n type="Hidden" name="scorta" value="1000" maxlength=10 size=10>
														<INPUT class=navy10n type="Hidden" name="sottoscorta" value="1000" maxlength=10 size=10>
														<INPUT class=navy10n type="Hidden" name="disponibile" value="<%=Date()%>" maxlength=10 size=10>
														
											</table>
											<br>
											<p align=right>
											<%if lcase(request("CMD"))="new" then%>
												<INPUT  type="image" border="0" name="imgsave" src="/admin/imgnew/salva.gif">Salva -
												<a href=mearticoli.asp?cmd=new&merchant=<%=merchant%>><img border="0" name="imgsave" src="/admin/imgnew/nuovo.gif">nuovo articolo - </a>
											<%end if
											  If lcase(request("act"))="mod" Then%>
											    <a href=mearticoli.asp?cmd=new&merchant=<%=merchant%>><img border="0" name="imgsave" src="/admin/imgnew/nuovo.gif">nuovo articolo - </a>
												<INPUT type="image" border="0" name="imgsave" src="/admin/imgnew/salva.gif">Salva -
												<a href="mearticoliins.asp?owner=<%=owner%>&merchant=<%=merchant%>&cmd=del&prID=<%=request("prID")%>"><img border="0" name="imgsave" src="/admin/imgnew/elimina.gif">elimina articolo - </a>
											<%end if%>
											
										</FORM>
										
											</p><p align=left>
											<form>cerca l'articolo da modificare : <br>
											<INPUT type="text"  size=55 name=trova id=trova>&nbsp;&nbsp;<INPUT type="image" border="0"  src="/admin/imgnew/find.jpg">
											</form>
											</p>
										
										<!---- Parte Centrale ------->
									</td>
								</tr>
							</table>
						
							</td>
						</tr>
					</table>
					 
				<!--F: Parte Centrale-->					
				</td>
				<td height="172" bgcolor="white" width="400">
				            <img src='img/space.gif' width=400 height=0.01>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" id=TABLE1>
							<!--#include file="_menusearch.inc" -->
							<tr>
							<td colspan="2">
							</td>
							</tr>
							</table>
				<!--I: Parte Destra-->
				<br>
				<b>&nbsp;Elenco Prodotti</b><br> 
				<%
				   	Openconn
					Set Rs2 = Server.CreateObject("ADODB.RecordSet")
					sSQL = "Select products.*, merchantproducts.* from products inner join merchantproducts on products.catalogID= merchantproducts.catalogID where merchantproducts.merchantID=" & merchant 
					'response.write(sSQL)
					' Apertura Recordset (Static)
					Rs2.Open sSQL, dbc, adOpenStatic, adCmdText
					If not rs2.EOF then
					Do while not rs2.EOF
					
					if Trim(rs2("cname"))<>"" then
					%>
					&nbsp;&nbsp;&nbsp;<a class=nero10 href="mearticoli.asp?prID=<%=rs2("products.catalogID")%>&merchant=<%=merchant%>&act=mod"><%=Trim(rs2("products.ccode"))%> - <%=Trim(rs2("cname"))%></a><br>
					<%else%>
					&nbsp;&nbsp;&nbsp;<a class=nero10 href="mearticoli.asp?prID=<%=rs2("products.catalogID")%>&merchant=<%=merchant%>&act=mod">Descrizione vuota</a><br>
					<%
					End if
					'response.write(rs2("products.catalogID"))
					rs2.MoveNext 
					Loop
					End if
					rs2.Close 
					Closeconn
				%>
				<!--F: Parte Destra-->
			</TD>
			</TR>
</TABLE>

</body>
</html>
