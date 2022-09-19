<!--Shop Manuale -->
<!--#include virtual="/connessionesql.inc"-->
<%  
	session.lcid=1040
    merchant=118

	Function iscategoria(Byval codice,categoria)
		If len(codice)>0 then
			'Visualizza la Sottocategoria
			Set tbshop = Server.CreateObject("ADODB.RecordSet")
			sSQL = "select * from shop_SubCategories where codice=" & trim(codice) & " and categoria=" & categoria
			tbshop.Open sSQL, connm
			If not tbshop.EOF then
				iscategoria=tbshop("Descrizione")
			end if
			tbshop.close
		else
			iscategoria=""
		end if
	end function
	
	Sub InsCategorie(byval selezionata)
		Set tbshop = Server.CreateObject("ADODB.RecordSet")
		sSQL = "select * from shop_Categories"
		tbshop.Open sSQL, connm
		If not tbshop.EOF then
			ncategorie=0
			Do While not tbshop.eof
				'Controlla se il merchant ha la categoria
				categoria=trim(tbshop("categoryID"))
				'Si posiziona sulla selezionata
				if cint(categoria)=cint(selezionata) then sel="selected " else sel=""
				Response.Write "<option " & sel & "value=" & categoria & ">"
				Response.Write tbshop("catdescription")
				Response.Write "</option>"
				ncategorie=ncategorie+1
			 tbshop.movenext
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
		tbshop.close
	End sub

	sub InsArticoliMerchant(Byval merchant)
		Set tbshop = Server.CreateObject("ADODB.RecordSet")
		sSQL = "Select shop_products.*,shop_merchantproducts.* from shop_products inner join shop_merchantproducts on products.catalogID=merchantproducts.catalogID where merchantproducts.merchantID=" & merchant
		' Apertura Recordset (Static)
		tbshop.Open sSQL, connm
		if not tbshop.EOF then
			Response.Write "<br>"
			Do while not tbshop.EOF
				Response.Write "&nbsp;&nbsp;<a href=mearticoli.asp?prID=" & tbshop("catalogID") & "&merchant=" & merchant & "&act=mod>"
				Response.Write "<font size=1>" & tbshop("cname") & "</a> <br>"
				tbshop.MoveNext 
			loop
		end if
		tbshop.Close 
	end sub

	
%>

<html>
	<head>
		<title>Gestione Negozio</title>
		<link href="/admin/style.css" rel="stylesheet" type="text/css">
		<script language="javascript">
			function selpdfjava(formname) {
				asp = "selpdf.asp?";
				w=window.open(asp,"Immagine","width=900,height=700,menubar=no,scrollbar=auto,resizable=yes");
			}
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
				asp = "selarticolo.asp?id="+val;
				w=window.open(asp,"Articoli","width=700,height=650,menubar=no,scrollbar=auto,resizable=no");
			}
			function visuaimg(formname,i) {
			   	idsc = eval("document." + formname + ".codarticolo.value");
				asp = "visuarticolo.asp?id=" + idsc;
				w=window.open(asp,"Visualizzazione","width=400,height=350,menubar=no,scrollbar=auto,resizable=no");
			}
			function immagine(formname,i) {
				asp = "selimmagine.asp?id=" + i;
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
			<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left" id=TABLE2>
			<tr valign="top" >
			<td colspan="3">

			</td>
			</tr>
			<tr valign="top">
				<td width="200" height=900 bgcolor="white">
					<!--#include file="_menusxme.inc" -->
				</td>
				<!--I: Parte Centrale-->				
				<td width="800" bgcolor="white">
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
													Set tbshop = Server.CreateObject("ADODB.RecordSet")
													sSQL = "Select shop_products.*, shop_merchantproducts.* from shop_products inner join shop_merchantproducts on shop_products.catalogID= shop_merchantproducts.catalogID where shop_merchantproducts.merchantID=" & merchant & " and shop_products.CatalogID=" & ID
													' Apertura Recordset (Static)
													'response.write(sSQL)
      												tbshop.Open sSQL,connm
													 If not tbshop.EOF then
														'Query Articolo				
														t_stock=tbshop("cstock")
														t_coffmag=tbshop("coffmag")
														t_esenteiva=tbshop("iva")
														'response.write("---offerta---" & t_coffmag)
														'response.write("------" & tbshop("cstock"))														
														t_codarticolo=tbshop("catalogID")
														t_desarticolo=tbshop("cname")
														t_artdettagli=tbshop("cdescription")
														'Categoria e SottoCategoria
														t_categoria=tbshop("ccategory")
														t_sottocategoria=tbshop("cscategory")
														t_immagine=tbshop("cimageurl")
														t_immagine1=tbshop("cimageurl1")
														t_immagine2=tbshop("cimageurl2")
														t_immagine3=tbshop("cimageurl3")
														t_immagine4=tbshop("cimageurl4")
														t_immaginepdf=tbshop("filepdf")
														t_rifarticolo=tbshop("ccode")
														t_prezzo=tbshop("cprice")
														t_prezzoofferta=tbshop("cpriceofferta")
														t_scorta=tbshop("cscorta")
														t_sottoscorta=tbshop("csottoscorta")
														proprietario=tbshop("owner")
														t_colore=tbshop("colore")
														t_taglia=tbshop("taglia")
													 	tbshop.Close
														if trim(t_coffmag)="on" then t_coffmag="checked"
														if trim(t_stock)="on" then t_stock="checked"
														if trim(t_esenteiva)="no" then t_esenteiva="checked"
														'taglie
														'response.write("----" & t_taglia)
														if instr(t_taglia," xs ")>0 then t_taglia1="checked"		
														if instr(t_taglia," s ")>0 then t_taglia2="checked"	
														if instr(t_taglia," m ")>0 then t_taglia3="checked"	
														if instr(t_taglia," l ")>0 then t_taglia4="checked"	
														if instr(t_taglia," xl ")>0 then t_taglia5="checked"	
														if instr(t_taglia," xxl ")>0 then t_taglia6="checked"	
														'colore
														'response.write("----" & t_colore)
														if instr(t_colore,"blu")>0 then t_colore1="checked"			
														if instr(t_colore,"azzurro")>0 then t_colore2="checked"		
														if instr(t_colore,"nero")>0 then t_colore3="checked"		
														if instr(t_colore,"bianco")>0 then t_colore4="checked"		
														if instr(t_colore,"rosso")>0 then t_colore5="checked"		
														if instr(t_colore,"giallo")>0 then t_colore6="checked"		
														if instr(t_colore,"arancione")>0 then t_colore7="checked"		
														if instr(t_colore,"verde")>0 then t_colore8="checked"		
														if instr(t_colore,"marrone")>0 then t_colore9="checked"		
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
												<tr><td class=navy10n ></td><td class=navy10n >
													<a href=javascript:articoli('form')><img src=img/fotopresenti.gif border=0 alt="Seleziona Articolo" name="imgselart"></a>
												</td></tr>
												<tr>
													<td height=10></td>
													<td class=navy10n ></td>
												</tr>
												<tr><td class=navy10n ></td><td class=navy10n >
															<table border=0  bordercolor=Navy cellpadding=0 cellspacing=0>
															<tr>
																<td class=navy10n ><br>					
																	<a href=javascript:immagine('form','1')><img src=img/seleziona.gif border=0 alt="Seleziona Immagine"></a>
																	</td><td>
																	<INPUT class=navy10n type="text" name="immagine" value="<%=t_immagine%>" maxlength=100 size=30><br>
																</td>
																<td valign="center">
																<%if trim(t_immagine)<>"" then %><img width=50px  src='../negozi/articoli/<%=t_immagine%>'><%end if%>
																</td>
															</tr>
															</table>
												</td></tr>			
												<tr><td class=navy10n ></td><td class=navy10n >
															<table border=0  bordercolor=Navy cellpadding=0 cellspacing=0>
															<tr>
																<td class=navy10n ><br>					
																	<a href=javascript:immagine('form','2')><img src=img/seleziona.gif border=0 alt="Seleziona Immagine"></a>
																	</td><td>
																	<INPUT class=navy10n type="text" name="immagine1" value="<%=t_immagine1%>" maxlength=100 size=30><br>
																</td>
																<td valign="center">
																<%if trim(t_immagine1)<>"" then %><img width=50px  src='../negozi/articoli/<%=t_immagine1%>'><%end if%>
																</td>
															</tr>
															</table>
												</td></tr>	
												<tr><td class=navy10n ></td><td class=navy10n >
															<table border=0  bordercolor=Navy cellpadding=0 cellspacing=0>
															<tr>
																<td class=navy10n ><br>					
																	<a href=javascript:immagine('form','3')><img src=img/seleziona.gif border=0 alt="Seleziona Immagine"></a>
																	</td><td>
																	<INPUT class=navy10n type="text" name="immagine2" value="<%=t_immagine2%>" maxlength=100 size=30><br>
																</td>
																<td valign="center">
																<%if trim(t_immagine2)<>"" then %><img width=50px  src='../negozi/articoli/<%=t_immagine2%>'><%end if%>
																</td>
															</tr>
															</table>
												</td></tr>		
												<tr><td class=navy10n ></td><td class=navy10n >
															<table border=0  bordercolor=Navy cellpadding=0 cellspacing=0>
															<tr>
																<td class=navy10n ><br> 				
																	<a href=javascript:immagine('form','4')><img src=img/seleziona.gif border=0 alt="Seleziona Immagine"></a>
																	</td><td>
										        					<INPUT class=navy10n type="text" name="immagine3" value="<%=t_immagine3%>" maxlength=100 size=30><br>
																</td>
																<td valign="center">
																<%if trim(t_immagine3)<>"" then %><img width=50px  src='../negozi/articoli/<%=t_immagine3%>'><%end if%>
																</td>
															</tr>
															</table>
												</td></tr>		
												<tr><td class=navy10n ></td><td class=navy10n >
															<table border=0  bordercolor=Navy cellpadding=0 cellspacing=0>
															<tr>
																<td class=navy10n ><br>																											
																	<a href=javascript:immagine('form','5')><img src=img/seleziona.gif border=0 alt="Seleziona Immagine"></a>
																	</td><td>
																	<INPUT class=navy10n type="text" name="immagine4" value="<%=t_immagine4%>" maxlength=100 size=30><br>
																</td>
																<td valign="center">
																<%if trim(t_immagine4)<>"" then %><img width=50px  src='../negozi/articoli/<%=t_immagine4%>'><%end if%>
																</td>
															</tr>
															</table>
												</td></tr>		
												<tr><td class=navy10n ></td><td class=navy10n >
															<table border=0  bordercolor=Navy cellpadding=0 cellspacing=0>
															<tr>
																<td class=navy10n ><br>																											
																	<a href=javascript:selpdfjava('form');><img src='img/selezionapdf.gif' width='125px' height='34px' border=0 alt="Seleziona PDF"></a>
																	</td><td>
																	<INPUT class=navy10n type="text" name="immaginepdf" value="<%=t_immaginepdf%>" maxlength=100 size=30><br>
																</td>
																<td valign="center">
																<a href="../negozi/articoli/<%=t_immaginepdf%>"><img width='100px'  src='../negozi/img/pdf.jpg'></a>
																</td>
															</tr>
															</table>
												</td></tr>													
																			<tr>
													<td height=30></td>
													<td class=navy10n ></td>
												</tr>
												<tr>
													<td class=navy10n >
														 Codice Proprio<br>Prodotto: 
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="text" name="rifarticolo" value="<%=t_rifarticolo%>" maxlength=40 size=40>
													</td>
												</tr>
												<tr>
												<td colspan=2 ><hr></td>
												</tr>
												<tr>
													<td class=navy10n >TAGLIE
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="checkbox" name="taglia1" <%=t_taglia1%>>XS
														<INPUT class=navy10n type="checkbox" name="taglia2" <%=t_taglia2%>>S
														<INPUT class=navy10n type="checkbox" name="taglia3" <%=t_taglia3%>>M
														<INPUT class=navy10n type="checkbox" name="taglia4" <%=t_taglia4%>>L
														<INPUT class=navy10n type="checkbox" name="taglia5" <%=t_taglia5%>>XL
														<INPUT class=navy10n type="checkbox" name="taglia6" <%=t_taglia6%>>XXL
													</td>
												</tr>
												<tr>
												<td colspan=2 ><hr></td>
												</tr>
												<tr>
													<td class=navy10n >COLORI
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="checkbox" name="colore1" <%=t_colore1%>>BLU
														<INPUT class=navy10n type="checkbox" name="colore2" <%=t_colore2%>>AZZURRO
														<INPUT class=navy10n type="checkbox" name="colore3" <%=t_colore3%>>NERO
														<INPUT class=navy10n type="checkbox" name="colore4" <%=t_colore4%>>BIANCO
														<INPUT class=navy10n type="checkbox" name="colore5" <%=t_colore5%>>ROSSO
														<INPUT class=navy10n type="checkbox" name="colore6" <%=t_colore6%>>GIALLO
														<INPUT class=navy10n type="checkbox" name="colore7" <%=t_colore7%>>ARANCIONE
														<INPUT class=navy10n type="checkbox" name="colore8" <%=t_colore8%>>VERDE
														<INPUT class=navy10n type="checkbox" name="colore9" <%=t_colore9%>>MARRONE
													</td>
												</tr>
																								<tr>
												<td colspan=2 ><hr></td>
												</tr>
												<tr>
													<td class=navy8n >
														 Prezzo in €uro OFFERTA<br>
														 Utilizza il punto per i decimali: 
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="text" name="prezzo" value="<%=Replace(Formatnumber(t_prezzo,2),",",".")%>" maxlength=10 size=10>
													</td>
												</tr>
												<tr>
													<td class=navy8n >
														 Prezzo in €uro LISTINO: 
														 Utilizza il punto per i decimali: 
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="text" name="prezzoofferta" value="<%=replace(Formatnumber(t_prezzoofferta,2),",",".")%>" maxlength=10 size=10>
													</td>
												</tr>
											    <!---tr>
													<td class=navy8n >
														 Prezzo in €uro PER Quantita': 
														 Utilizza il punto per i decimali: 
													</td>
													<td class=navy10n >
														N pezzi : <INPUT class=navy10n type="text" name="q_pezzi" value="<%=Formatnumber(q_t_pezzi,0)%>" maxlength=10 size=10>Prezzo : <INPUT class=navy10n type="text" name="q_prezzoofferta" value="<%=replace(Formatnumber(q_t_prezzoofferta,2),",",".")%>" maxlength=10 size=10>
													</td>
												</tr---->
												<tr>
													<td class=navy10n >
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="checkbox" name="articoloofferta" <%=t_coffmag%>> Articolo in Offerta 
													</td>
												</tr>
												<tr>
													<td class=navy10n >
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="checkbox" name="stock" <%=t_stock%>> Presente a Magazzino 
													</td>
												</tr>
												<tr>
													<td class=navy10n >
													</td>
													<td class=navy10n >
														<INPUT class=navy10n type="checkbox" name="esenteiva" <%=t_esenteiva%>> Esente Iva
													</td>
												</tr>
												<tr>
												<td colspan=2 ><hr></td>
												</tr>
												
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
												<a href=merchant_articoli.asp?cmd=new&merchant=<%=merchant%>><img border="0" name="imgsave" src="/admin/imgnew/nuovo.gif">nuovo articolo - </a>
											<%end if
											  If lcase(request("act"))="mod" Then%>
											    <a href=merchant_articoli.asp?cmd=new&merchant=<%=merchant%>><img border="0" name="imgsave" src="/admin/imgnew/nuovo.gif">nuovo articolo - </a>
												<INPUT type="image" border="0" name="imgsave" src="/admin/imgnew/salva.gif">Salva -
												<a href="mearticoliins.asp?owner=<%=owner%>&merchant=<%=merchant%>&cmd=del&prID=<%=request("prID")%>"><img border="0" name="imgsave" src="/admin/imgnew/elimina.gif">elimina articolo - </a>
											<%end if%>
											
										</FORM>
										
											</p><p align=left>
											<form>cerca l'articolo (anche con descrizione) da modificare  : <br>
											<INPUT type="text"  size=55 name=trova id=trova>&nbsp;&nbsp;<INPUT type="image" border="0"  src="/admin/imgnew/find.jpg">
											</form><br><br><br><br>
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
				<td  bgcolor="white" width="700px">
				         
							<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							<tr><td colspan="2">
							</td></tr>
							</table>
				<!--I: Parte Destra-->
				<br>
				<b>&nbsp;Elenco Prodotti</b><br>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" >				
					<%
					Set tbshop = Server.CreateObject("ADODB.RecordSet")
					if trim(request("trova"))="" then 
					sSQL = "Select * from shop_products order by ccode asc"
					else
					sSQL = "Select * from shop_products where ccode like '%" & trim(request("trova"))  & "%' or cdescription like '%" & trim(request("trova"))  & "%' order by ccode asc"
					end if
					' Apertura Recordset
					tbshop.Open sSQL,connm
					if not tbshop.EOF then
						do while not tbshop.EOF					
						%>
						<tr><td valign=middle>&nbsp;&nbsp;&nbsp;<a class=gray10 href="merchant_articoli.asp?prID=<%=tbshop("catalogID")%>&merchant=<%=merchant%>&act=mod"><%if trim(tbshop("cimageurl"))<>"" then %><img width=25px height=25px  src='../negozi/articoli/<%=tbshop("cimageurl")%>'><%end if%></a></td><td valign=middle><a class=gray10 href="merchant_articoli.asp?prID=<%=tbshop("catalogID")%>&merchant=<%=merchant%>&act=mod"><%=Trim(tbshop("ccode"))%> - <%=Trim(tbshop("cname"))%></a><br></td></tr>
						<%
						tbshop.MoveNext 
						loop
					end if
					tbshop.Close 
					%>
					</table>
				<!--F: Parte Destra-->
			</TD>
			</TR>
</TABLE>

</body>
</html>
