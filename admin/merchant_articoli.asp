<!--#include file=connessionesql.inc-->
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
categoriatxt = formobj.categorie.value;
if (categoriatxt =="" )
{
	alert(" categorie ");
	formobj.categorie.focus();
	return false
}else
{
sottocat = formobj.sottocategoria.value;
if (sottocat == "")
{	alert("sottocategoria");
	return false
}else
{
codiceprodotto= formobj.rifarticolo.value;
if (codiceprodotto == "")
{	alert("codice prodotto obbligatorio ");
	formobj.rifarticolo.focus();
	return false
}else
				{
descri_artic = formobj.desarticolo.value;
if (descri_artic == "")
{	alert("descrizione obbligatoria");
	formobj.desarticolo.focus();
	return false
}else
	return true
	}}
}

}
</script>
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
<!DOCTYPE html>
<html lang="en">
    <head>
		<TITLE>JENIUS COMMUNICATIONS - MARCO GENOVESE</TITLE>
		<meta name="keywords" content="JENIUS">
		<meta name="description" content="JENIUS">
		<link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Backoffice JENIUS</title>
        <<!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="wrapper">

            <!-- Navigation -->
				<!--#include file=topmenu.inc-->
				<!--#include file=navbarback.inc-->
				<!--#include file=top_menu_sotto.inc-->
                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
															<HR>
															<b>GESTIONE ECOMMERCE MANUALE</b>
															<HR>
															<table valign="top" width="100%" height="100%" cellpadding="0" cellspacing="0">
																<tr>
																	<td valign="top">
																		<form name="formricerca" method="post" action="merchant_articoli.asp?merchant=118&act=mod">
																		<table border=0><tr><td>
																		cerca l'articolo da modificare : <br>
																		<INPUT type="text"  size=55 name=trova id=trova></td><td width=20px></td><td><br><INPUT type="image" border="0"  src="images/cerca.png">
																		</td></tr></table></form>
																		<br> 
																	<table border=0 cellPadding="0" valign="top" cellSpacing="0" name="documento" width="550" valign="top">
																		<tr>
																			<td   valign="top">
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
																								'prezzo xqta
																								t_prezzoqta1=tbshop("cprice1")
																								t_prezzoqta2=tbshop("cprice2")
																								t_prezzoqta3=tbshop("cprice3")
																								'qta
																								t_qta1=tbshop("qta1")
																								t_qta2=tbshop("qta2")
																								t_qta3=tbshop("qta3")
																								'aliqiva
																								t_aliqiva=tbshop("aliqiva")
																								'homepage
																								if trim(tbshop("homepage"))=1 then t_homepage="checked"
																								
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
																				
																				if lcase(request("err"))="si" then	%>
																							<script language="javascript">
																							window.onload = function(){
																							alert('inserire codice prodotto obbligatorio')
																							};	
																							</script>	
																				<%
																				end if
																				
																				if lcase(request("CMD"))="new" then
																					't_categoria=1
																					't_sottocategoria=0
																				end if
																				
																			%>
																				
																				<!---- Parte Centrale ------->
																				<br>
																			<table valign="top" width="100%"  cellpadding="0" cellspacing="0">
																			<tr>
																			<td>

																				<FORM name="form" method="post" action="mearticoliins.asp?<%=Request.ServerVariables("QUERY_STRING")%>&owner=<%=owner%>" onSubmit='return checkart(form)'>
																					<table width=100% border=0 cellpadding=0 cellspacing=0>
																						<tr>
																							<td   >
																								 Categoria: 
																							</td>
																							<td   ><SELECT    id=categorie name=categorie onchange="sottocategorie('form')"><%inscategorie t_categoria%></SELECT>
																							</td>
																						</tr>
																						
																						<tr>
																							<td   >
																								 Sottocategoria: 
																							</td>
																							<td   >
																								<INPUT   type="text" name="sottocategoria" disabled value="<%=iscategoria(t_sottocategoria,t_categoria)%>" maxlength=50 size=30>		
																								<a href=javascript:sottocategorie('form')><img src='img/sottocategoria.gif' border=0 alt="Seleziona SottoCategoria"></a>
																								<INPUT  size=60 type="hidden" name="sottocategoriaid" value=<%=t_sottocategoria%>>
																								<INPUT  type="hidden" name="insdb" value="">

																							</td>
																						</tr>
																						
																						<tr>
																							<td height=10></td>
																							<td   ></td>
																						</tr>
																						<tr>
																							<td   >
																								 rif. articolo: 
																								 (Facoltativo)
																							</td>
																							<td   >
																								<INPUT   type="text" name="codarticolo"  value="<%=t_codarticolo%>" maxlength=10 size=10>
																								<INPUT   type="hidden" name="hcodarticolo" value="<%=t_codarticolo%>">													
																							</td>
																						</tr>
																						<tr>
																							<td   >
																								 DESCRIZIONE: 
																								 (obbligatoria)
																							</td>
																							<td   >
																								<INPUT   type="text" name="desarticolo" value="<%=Cstr(t_desarticolo)%>" maxlength=150 size=50>
																								<INPUT   type="hidden" name="hidden" value="<%=eni2%>">
																							</td>
																						</tr>
																						<tr>
																							<td   valign="middle">
																								 DETTAGLI / DATI TECNICI : 
																							</td>
																							<td   >
																								<TEXTAREA   rows=8 cols=45 name="artdettagli"><%=t_artdettagli%></TEXTAREA>
																							</td>
																						</tr>
																						<tr><td   ></td><td   >
																							<a href=javascript:articoli('form')><img src=img/fotopresenti.gif border=0 alt="Seleziona Articolo" name="imgselart"></a>
																						</td></tr>
																						<tr>
																							<td height=10></td>
																							<td   ></td>
																						</tr>
																						<tr><td   ></td><td   >
																									<table border=0  cellpadding=0 cellspacing=0>
																									<tr>
																										<td   ><br>					
																											<a href=javascript:immagine('form','1')><img src=img/seleziona.gif border=0 alt="Seleziona Immagine"></a>
																											</td><td>
																											<INPUT   type="text" name="immagine" value="<%=t_immagine%>" maxlength=100 size=30><br>
																										</td>
																										<td valign="center">
																										<%if trim(t_immagine)<>"" then %><img width=50px  src='articoli/<%=t_immagine%>'><%end if%>
																										</td>
																									</tr>
																									</table>
																						</td></tr>			
																						<tr><td   ></td><td   >
																									<table border=0    cellpadding=0 cellspacing=0>
																									<tr>
																										<td   ><br>					
																											<a href=javascript:immagine('form','2')><img src=img/seleziona.gif border=0 alt="Seleziona Immagine"></a>
																											</td><td>
																											<INPUT   type="text" name="immagine1" value="<%=t_immagine1%>" maxlength=100 size=30><br>
																										</td>
																										<td valign="center">
																										<%if trim(t_immagine1)<>"" then %><img width=50px  src='articoli/<%=t_immagine1%>'><%end if%>
																										</td>
																									</tr>
																									</table>
																						</td></tr>	
																						<tr><td   ></td><td   >
																									<table border=0  bordercolor=Navy cellpadding=0 cellspacing=0>
																									<tr>
																										<td   ><br>					
																											<a href=javascript:immagine('form','3')><img src=img/seleziona.gif border=0 alt="Seleziona Immagine"></a>
																											</td><td>
																											<INPUT   type="text" name="immagine2" value="<%=t_immagine2%>" maxlength=100 size=30><br>
																										</td>
																										<td valign="center">
																										<%if trim(t_immagine2)<>"" then %><img width=50px  src='articoli/<%=t_immagine2%>'><%end if%>
																										</td>
																									</tr>
																									</table>
																						</td></tr>		
																						<tr><td   ></td><td   >
																									<table border=0  cellpadding=0 cellspacing=0>
																									<tr>
																										<td   ><br> 				
																											<a href=javascript:immagine('form','4')><img src=img/seleziona.gif border=0 alt="Seleziona Immagine"></a>
																											</td><td>
																											<INPUT   type="text" name="immagine3" value="<%=t_immagine3%>" maxlength=100 size=30><br>
																										</td>
																										<td valign="center">
																										<%if trim(t_immagine3)<>"" then %><img width=50px  src='articoli/<%=t_immagine3%>'><%end if%>
																										</td>
																									</tr>
																									</table>
																						</td></tr>		
																						<tr><td   ></td><td   >
																									<table border=0  cellpadding=0 cellspacing=0>
																									<tr>
																										<td   ><br>																											
																											<a href=javascript:immagine('form','5')><img src=img/seleziona.gif border=0 alt="Seleziona Immagine"></a>
																											</td><td>
																											<INPUT   type="text" name="immagine4" value="<%=t_immagine4%>" maxlength=100 size=30><br>
																										</td>
																										<td valign="center">
																										<%if trim(t_immagine4)<>"" then %><img width=50px  src='articoli/<%=t_immagine4%>'><%end if%>
																										</td>
																									</tr>
																									</table>
																						</td></tr>		
																						<tr><td   ></td><td   >
																									<table border=0  cellpadding=0 cellspacing=0>
																									<tr>
																										<td   ><br>																											
																											<a href=javascript:selpdfjava('form');><img src='img/selezionapdf.gif' border=0 alt="Seleziona PDF"></a>
																											</td><td>
																											<INPUT   type="text" name="immaginepdf" value="<%=t_immaginepdf%>" maxlength=100 size=30><br>
																										</td>
																										<td valign="center">
																										<a target="_blank" href="articoli/<%=t_immaginepdf%>"><img width=30px  src='images/pdf.jpg'></a>
																										</td>
																									</tr>
																									</table>
																						</td></tr>													
																													<tr>
																							<td height=30></td>
																							<td   ></td>
																						</tr>
																						<tr>
																							<td   >
																								 <font color="#ff000">CODICE PROPRIO<br>PRODOTTO (obbligatorio) :</font> 
																							</td>
																							<td   >
																								<INPUT   type="text" name="rifarticolo" value="<%=t_rifarticolo%>" maxlength=40 size=40>
																							</td>
																						</tr>
																						<tr>
																						<td colspan=2 ><hr></td>
																						</tr>
																						<tr>
																							<td   >TAGLIE
																							</td>
																							<td   >
																								<INPUT   type="checkbox" name="taglia1" <%=t_taglia1%>>XS
																								<INPUT   type="checkbox" name="taglia2" <%=t_taglia2%>>S
																								<INPUT   type="checkbox" name="taglia3" <%=t_taglia3%>>M
																								<INPUT   type="checkbox" name="taglia4" <%=t_taglia4%>>L
																								<INPUT   type="checkbox" name="taglia5" <%=t_taglia5%>>XL
																								<INPUT   type="checkbox" name="taglia6" <%=t_taglia6%>>XXL
																							</td>
																						</tr>
																						<tr>
																						<td colspan=2 ><hr></td>
																						</tr>
																						<tr>
																							<td   >COLORI
																							</td>
																							<td   >
																								<INPUT   type="checkbox" name="colore1" <%=t_colore1%>>BLU
																								<INPUT   type="checkbox" name="colore2" <%=t_colore2%>>AZZURRO
																								<INPUT   type="checkbox" name="colore3" <%=t_colore3%>>NERO
																								<INPUT   type="checkbox" name="colore4" <%=t_colore4%>>BIANCO
																								<INPUT   type="checkbox" name="colore5" <%=t_colore5%>>ROSSO
																								<INPUT   type="checkbox" name="colore6" <%=t_colore6%>>GIALLO
																								<INPUT   type="checkbox" name="colore7" <%=t_colore7%>>ARANCIONE
																								<INPUT   type="checkbox" name="colore8" <%=t_colore8%>>VERDE
																								<INPUT   type="checkbox" name="colore9" <%=t_colore9%>>MARRONE
																							</td>
																						</tr>
																						<tr><td colspan=2 ><hr></td></tr>
																						<tr><td colspan=2 >
																							<table border=0>
																							<tr>
																								<td width="50%"  >
																								Prezzo in €uro LISTINO :<br>
																									 (utilizza il punto per i decimali) 
																								</td>
																								<td>																								 
																									<INPUT   type="text" name="prezzo" value="<%=Replace(Formatnumber(t_prezzo,2),",",".")%>" maxlength=10 size=10>
																								</td>
																								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																								<td width="50%"  >
																									 Prezzo in €uro OFFERTA : <br>
																									 (utilizza il punto per i decimali)
																								</td>
																								<td>
																									<INPUT type="text" name="prezzoofferta" value="<%=replace(Formatnumber(t_prezzoofferta,2),",",".")%>" maxlength=10 size=10>
																								</td>
																							</tr>
																							<tr><td colspan="4" ><hr></td></tr>
																							<tr>
																								<td width="50%"  >
																								Prezzo della quantita'(1) :<br>
																									 (utilizza il punto per i decimali) 
																								</td>
																								<td>																								 
																									<INPUT   type="text" name="prezzoqta1" value="<%=Replace(Formatnumber(t_prezzoqta1,2),",",".")%>" maxlength=10 size=10>
																								</td>
																								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																								<td width="50%"  >
																									 quantita'(1) : <br>
																									 (solo numeri interi)
																								</td>
																								<td>
																									<INPUT type="text" name="qta1" value="<%=replace(Formatnumber(t_qta1,0),",",".")%>" maxlength=10 size=10>
																								</td>
																							</tr>
																							<tr>
																								<td width="50%"  >
																								Prezzo della quantita'(2) :<br>
																									 (utilizza il punto per i decimali) 
																								</td>
																								<td>																								 
																									<INPUT   type="text" name="prezzoqta2" value="<%=Replace(Formatnumber(t_prezzoqta2,2),",",".")%>" maxlength=10 size=10>
																								</td>
																								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																								<td width="50%"  >
																									 quantita'(2) : <br>
																									 (solo numeri interi)
																								</td>
																								<td>
																									<INPUT type="text" name="qta2" value="<%=replace(Formatnumber(t_qta2,0),",",".")%>" maxlength=10 size=10>
																								</td>
																							</tr>
																							<tr>
																								<td width="50%"  >
																								Prezzo della quantita'(3) :<br>
																									 (utilizza il punto per i decimali) 
																								</td>
																								<td>																								 
																									<INPUT   type="text" name="prezzoqta3" value="<%=Replace(Formatnumber(t_prezzoqta3,2),",",".")%>" maxlength=10 size=10>
																								</td>
																								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																								<td width="50%"  >
																									 quantita'(3) : <br>
																									 (solo numeri interi)
																								</td>
																								<td>
																									<INPUT type="text" name="qta3" value="<%=replace(Formatnumber(t_qta3,0),",",".")%>" maxlength=10 size=10>
																								</td>
																							</tr>																							
																							</table>
																						</td></tr>
																						<tr><td colspan=2 ><hr></td></tr>
																						<tr>
																							<td   >
																							</td>
																							<td   >
																								<INPUT type="checkbox" name="homepage" <%=t_homepage%>>&nbsp;&nbspPresenza HOMEPAGE 
																							</td>
																						</tr>																						
																						<tr>
																							<td   >
																							</td>
																							<td   >
																								<INPUT type="checkbox" name="articoloofferta" <%=t_coffmag%>>&nbsp;&nbsp;Articolo in Offerta 
																							</td>
																						</tr>
																						<tr>
																							<td   >
																							</td>
																							<td   >
																								<INPUT type="checkbox" name="stock" <%=t_stock%>>&nbsp;&nbsp;Presente a Magazzino 
																							</td>
																						</tr>
																						<tr>
																							<td   >
																							</td>
																							<td   >
																								<INPUT  type="checkbox" name="esenteiva" <%=t_esenteiva%>>&nbsp;&nbsp;Esente Iva&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Aliq.Iva<INPUT type="text" name="aliqiva" value="<%=replace(Formatnumber(t_aliqiva,2),",",".")%>" maxlength=10 size=10>
																							</td>
																						</tr>
																						<tr>
																						<td colspan=2 ><hr></td>
																						</tr>
																						
																						<tr>
																							<td height=10></td>
																							<td   ></td>
																						</tr>
																								<INPUT type="hidden" name="scorta" value="1000" maxlength=10 size=10>
																								<INPUT type="hidden" name="sottoscorta" value="1000" maxlength=10 size=10>
																								<INPUT type="hidden" name="disponibile" value="<%=Date()%>" maxlength=10 size=10>
																								
																					</table>
																					<table border=0><tr><td>
				   																<%if lcase(request("CMD"))="new" then%>
																						<INPUT  type="image" border="0" name="imgsave" src="images/save.png"></td><td>Salva </td><td width=20px></td><td>
																						<a href=merchant_articoli.asp?cmd=new&merchant=<%=merchant%>><img border="0" name="imgsave" src="images/nuovo.png">nuovo articolo </a>
																					<%end if
																					  If lcase(request("act"))="mod" Then%>
																						<INPUT type="image" border="0" name="imgsave" src="images/save.png"></td><td>Salva </td><td width=20px></td><td>
																						<a href=merchant_articoli.asp?cmd=new&merchant=<%=merchant%>><img border="0" name="imgsave" src="images/nuovo.png">nuovo articolo </a></td><td width=20px></td><td>
																						<a href="mearticoliins.asp?owner=<%=owner%>&merchant=<%=merchant%>&cmd=del&prID=<%=request("prID")%>"><img border="0" name="imgsave" src="images/elimina.png">elimina articolo</a>
																					<%end if%>
																					
																				</FORM>
																					</td></tr></table>
																				
																				<!---- Parte Centrale ------->
																			</td>
																		</tr>
																	</table>
																
																	</td>
																</tr>
															</table>														 
										
														</td>
														<td  bgcolor="white" width="900px" valign=top>
														
																	<!--I: Parte Destra-->
																	<br>
																	<b>&nbsp;Elenco Prodotti</b><br>
																		<table align=left width="70%" border="0" cellspacing="0" cellpadding="0" >				
																		<%
																		Set tbshop = Server.CreateObject("ADODB.RecordSet")
																		if trim(request("trova"))="" then 
																		sSQL = "Select * from shop_products order by ccode asc"
																		else
																		sSQL = "Select * from shop_products where ccode like '%" & trim(request("trova"))  & "%' order by ccode asc"
																		end if
																		' Apertura Recordset
																		tbshop.Open sSQL,connm
																		if not tbshop.EOF then
																			do while not tbshop.EOF					
																			%>
																			<tr><td valign=middle width=100px>&nbsp;&nbsp;&nbsp;<a class=gray10 href="merchant_articoli.asp?prID=<%=tbshop("catalogID")%>&merchant=<%=merchant%>&act=mod"><%if trim(tbshop("cimageurl"))<>"" then %><img width=45px height=45px  src='articoli/<%=tbshop("cimageurl")%>'><%end if%></a></td><td valign=middle><a class=gray10 href="merchant_articoli.asp?prID=<%=tbshop("catalogID")%>&merchant=<%=merchant%>&act=mod"><%=Trim(tbshop("ccode"))%> - <%=Trim(tbshop("cname"))%></a><br></td></tr>
																			<%
																			tbshop.MoveNext 
																			loop
																		end if
																		tbshop.Close 
																		if trim(request("errore"))="errore" then%>
																				<script>
																				window.onload = function(){
																				alert('presenza errori VERIFICA');		
																								}
																				</script>
																				<%end if
																				
																				%>
																		</table>
													</td>
													</tr>
													</table>

												
																						
                                    </div>							
                                </div>
                            </div>
                            <!-- .panel-body -->
                        					
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                
                <!-- /.row -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="js/startmin.js"></script>
    </body>
</html>