<!--#include file=connessionesql.inc-->
<%      
    'controllo session pratica   
	if trim(session("idpratica"))="" then response.redirect "adindex.asp"
	session("titolonavigazione")="INSERIMENTO PRATICA"

	'controllo form
	sqlcall="select * from pratiche where idpratica=" & trim(session("idpratica")) & " limit 1"
	set tbupdrec=conn.execute(sqlcall)
    session("idpratica")=tbupdrec("idpratica")
	session("datapratica")=tbupdrec("data")	
	'response.write(sqlcall)
	'response.end	
	text_nome=trim(tbupdrec("nome"))
	text_cognome=trim(tbupdrec("cognome"))
	text_segnalatore=trim(tbupdrec("segnalatore"))
	text_tipocliente=trim(tbupdrec("tipocliente"))
	text_tipocliente=trim(tbupdrec("tipocliente"))
	text_primacasa=tbupdrec("primacasa")
	text_annimutuo=tbupdrec("anni")
	text_impimmobile=tbupdrec("impimmobile")
	text_valimmobile=tbupdrec("impvaloreimmobile")	
	text_impmutuo=tbupdrec("impmutuo")
	text_tasso=tbupdrec("tasso")
	text_lvtltc=tbupdrec("ltvltc")
	text_lvt=tbupdrec("ltv")
	text_impratades=tbupdrec("ratadesiderata")
	text_nfiglis=tbupdrec("numfigli")
	text_attualeabitazione=tbupdrec("affittoproprieta")	
	text_impaffitto=tbupdrec("impaffitto")
	text_impalimenti=tbupdrec("alimenti")
	text_appbanca=tbupdrec("appbancario")
	text_finanziamenti=tbupdrec("finanziamenti")
	text_garanti=tbupdrec("garanti")
	text_compenso=tbupdrec("compenso")
	text_note=tbupdrec("note")	
	text_disponibilita=tbupdrec("disponibilita")
	text_cointestatario=tbupdrec("cointestatario")
	tbupdrec.close
	errore="false"
	
'controllo
if request("tasto")<>"" then	


		text_primacasa=trim(senza_apice(Request.Form("primacasa")))
		text_annimutuo=trim(senza_apice(Request.Form("annimutuo")))
		text_impimmobile=senza_apice(Request.Form("impimmobile"))
		text_valimmobile=senza_apice(Request.Form("valimmobile"))		
		text_impmutuo=senza_apice(Request.Form("impmutuo"))
		text_tasso=senza_apice(Request.Form("tasso"))
		text_lvtltc=senza_apice(Request.Form("lvtltc"))
		text_lvt=senza_apice(Request.Form("lvt"))
		text_impratades=senza_apice(Request.Form("impratades"))	
		text_nfiglis=senza_apice(Request.Form("nfiglis"))
		text_attualeabitazione=senza_apice(Request.Form("attualeabitazione"))	
		text_impaffitto=senza_apice(Request.Form("impaffitto"))
		text_impalimenti=senza_apice(Request.Form("impalimenti"))
		text_appbanca=senza_apice(Request.Form("appbanca"))	
		text_finanziamenti=senza_apice(Request.Form("finanziamenti"))	
		text_garanti=senza_apice(Request.Form("garanti"))	
		text_compenso=senza_apice(Request.Form("compenso"))	
		text_note=senza_apice(Request.Form("note"))	
		text_disponibilita=trim(senza_apice(Request.Form("disponibilita")))
		text_cointestatario=trim(senza_apice(Request.Form("cointestatario")))
		errore="false"		
		verrore=" "
		rossi=""
		if isnumeric(text_disponibilita)=false then
			errore="true"
			rossi=rossi & "imp. disponibilita' non numerico ,"
			verrore=verrore & "imp. disponibilita' non numerico ,"
						else
     		text_disponibilita=replace(cdbl(text_disponibilita),",",".")
		end if 
		if isnumeric(text_valimmobile)=false then
			errore="true"
			rossi=rossi & "imp. imm. numerico ,"
			verrore=verrore & "imp. imm. non numerico ,"
						else
     		text_valimmobile=replace(cdbl(text_valimmobile),",",".")
		end if
		if isnumeric(text_impimmobile)=false then
			errore="true"
			rossi=rossi & "imp. imm. numerico ,"
			verrore=verrore & "imp. imm. non numerico ,"
						else
     		text_impimmobile=replace(cdbl(text_impimmobile),",",".")
		end if  
		if isnumeric(text_impmutuo)=false then
			errore="true"
			rossi=rossi & "imp. mutuo numerico ,"
			verrore=verrore & "imp. mutuo non numerico ,"
						else
     		text_impmutuo=replace(cdbl(text_impmutuo),",",".")
		end if  
		if isnumeric(text_impaffitto)=false then
			errore="true"
			rossi=rossi & "imp. affitto numerico ,"
			verrore=verrore & "imp. affitto non numerico ,"
						else
     		text_impaffitto=replace(cdbl(text_impaffitto),",",".")
		end if 

		if isnumeric(text_impalimenti)=false then
			errore="true"
			rossi=rossi & "imp. alimenti numerico ,"
			verrore=verrore & "imp. alimenti non numerico ,"
						else
     		text_impalimenti=replace(cdbl(text_impalimenti),",",".")
		end if 
		
		if isnumeric(text_impratades)=false then
			errore="true"
			rossi=rossi & "imp. rata des. numerico ,"
			verrore=verrore & "imp. rata non numerico ,"
						else
     		text_impratades=replace(cdbl(text_impratadesc),",",".")
		end if
		if isnumeric(text_lvtltc)=false then
			errore="true"
			rossi=rossi & "imp. LTC numerico ,"
			verrore=verrore & "imp. LTC non numerico ,"
			'text_lvtltc=0
				else
     		text_lvtltc=replace(cdbl(text_lvtltc),",",".")
		end if
		if isnumeric(text_lvt)=false then
			errore="true"
			rossi=rossi & "imp. LTV numerico ,"
			verrore=verrore & "imp. LTV non numerico ,"
			'text_lvt=0
				else
     		text_lvt=replace(cdbl(text_lvt),",",".")
		end if


		session.lcid=1040    
		t_data=date()

		if verrore=" " then 
			strsqlupdate="update pratiche set primacasa='" & text_primacasa & "',anni='" & text_annimutuo & "',impvaloreimmobile=" & text_valimmobile & ",impimmobile=" & text_impimmobile & ",impmutuo=" & text_impmutuo & ",tasso='" & text_tasso & "',ltv=" & text_lvt & ",ltvltc=" & text_lvtltc & ",ratadesiderata=" & text_impratades & ",impaffitto=" & text_impaffitto & ",alimenti=" & text_impalimenti & ",affittoproprieta='" & text_attualeabitazione & "',appbancario='" & text_appbanca & "',numfigli='" & text_nfiglis & "',garanti='" & text_garanti & "',finanziamenti='" & text_finanziamenti & "',note='" & text_note & "',compenso=" & text_compenso & ",disponibilita=" & text_disponibilita & ",cointestatario='" & text_cointestatario & "'   where idpratica=" & session("idpratica")                               
			conn.Execute(lcase(strsqlupdate))
			if ucase(text_finanziamenti)="NO" and ucase(text_garanti)="NESSUNO" then
				strsqlupdate_dati="update pratiche set dati='1' where idpratica=" & session("idpratica")
				conn.Execute(lcase(strsqlupdate_dati))	
			else	
				strsqlupdate_dati="update pratiche set dati='2' where idpratica=" & session("idpratica")
				conn.Execute(lcase(strsqlupdate_dati))	
			end if
			'response.write(strsqlupdate)
			'response.end
			'log
			loggaVisSchede "modifica pratica","modifica pratica",session("idpratica"),"modifica pratica",session("loginnominativo")
			text_garanti=senza_apice(Request.Form("garanti"))	
			text_finanziamenti=senza_apice(Request.Form("finanziamenti"))	
			response.redirect "adinsertpratica4.asp?garanti=" & text_garanti & "&finanziamenti&" & text_finanziamenti
		end if


end if

			
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
<TITLE>KIRON S.p.A</TITLE>
<meta name="keywords" content="KIRON S.p.A">
<meta name="description" content="KIRON S.p.A">
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Backoffice Kiron S.p.A.</title>
<!-- Bootstrap Core CSS -->
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
				<!-- /.navbar-top-links -->
				<!--#include file=navbarback.inc--><br>
				<!--#include file=top_menu_pratica.inc-->

                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
   							
							
								<script type="text/javascript">
								function calcola(){
								// alert('operazione');
								var iv=document.getElementById('impimmobile').value;
								var iv = iv.replace('.',''); 
								var iv = iv.replace(',','.'); 
								var im=document.getElementById('impmutuo').value;
								var im = im.replace('.',''); 
								var im = im.replace(',','.'); 
								// alert(im);
								// alert(iv);								
								if (!isNaN(iv) && !isNaN(im) ){
								var preventivo =(im*100)/iv;
								// alert(preventivo);
								}
								else{
								alert('inserisci valori numerici!');
								}
								var risultato = preventivo.toFixed(2);
								var risultato = risultato.replace('.',',');					
								document.formuu.lvtltc.value=risultato;
								}
								function calcolaltv(){
								// alert('operazione');
								var iv=document.getElementById('valimmobile').value;
								var iv = iv.replace('.',''); 
								var iv = iv.replace(',','.'); 
								var im=document.getElementById('impmutuo').value;
								var im = im.replace('.',''); 
								var im = im.replace(',','.'); 
								// alert(im);
								// alert(iv);								
								if (!isNaN(iv) && !isNaN(im) ){
								var preventivo =(im*100)/iv;
								// alert(preventivo);
								}
								else{
								alert('inserisci valori numerici!');
								}
								var risultato = preventivo.toFixed(2);
								var risultato = risultato.replace('.',',');					
								document.formuu.lvt.value=risultato;
								}
								</script>
							                              
								 
								 
							<form action="adinsertpratica3.asp?tasto=invia" method="post" id="formuu" name="formuu">
							<table cellspacing="0" cellpadding="0" width="60%" align="left">

							<tr> 
							<td colspan="2" align="center">
							<%if request("tasto")<>"" then%>
									<font color="red"><b><center class=nero10>Errori >>>><% Response.write(verrore)%>    </center></b></font>
							<%end if%>
							</td>
							</tr>
							<tr> 
							<td align=left>AGENTE KIRON:</td>
							<td align=left><input type="text" size="35" id="agente" name="agente" readonly="readonly" value="<%=session("loginnominativo")%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr> 
							<td align=left>N PRATICA :</td>
							<td align=left><input type="text" size="35" id="numeropratica"  name="numeropratica" readonly="readonly" value="<%=session("idpratica")%>_<%=session("loginprovincia")%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>		
							<tr> 
							<td align=left>DATA PRATICA :</td>
							<td align=left><input type="text" size="35" id="datapratica"  name="datapratica" readonly="readonly" value="<%=session("datapratica")%>"></td>
							</tr>		
							<tr><td colspan="2" height="5px"></td></tr>
							<tr> 
							<td align=left>NOME COGNOME :</td>
							<td align=left><input type="text" size="35" id="nominativo"  name="nominativo" readonly="readonly" value="<%=cstr(text_nome & " " & text_cognome)%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr> 
							<td align=left>TIPO CLIENTE :</td>
							<%num=instr(trim(text_tipocliente),"_")-1%>
							<td align=left><input type="text" size="35" id="tipocliente"  name="tipocliente" readonly="readonly" value="<%=lcase(mid(trim(text_tipocliente),1,num))%>"></td>
							</tr>
	
							<tr><td colspan=2><hr>
							
							<table cellpadding="0" cellspacing="0" border="0">																
							<tr>
							<td  align=left >Disponibilità Economica :</td>
							<td  align=left > 					
							<input  type="text"  id="disponibilita"  name="disponibilita"  size="20" value="<%=formatnumber(text_disponibilita,2)%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Prima Casa:</td><td>
							<select  type="select" id="primacasa" name="primacasa">
								    <%if trim(text_primacasa)<>"" then%>
									<option  selected="selected" value="<%=text_primacasa%>"><%=ucase(text_primacasa)%></option>			
									<%end if%>	
									<option value="si">SI</option>	
									<option value="no">NO</option>
									</select></td>
							<td width="15px"></td>
							<td  align=left >Anni Mutuo:</td><td>
							<select  type="select" id="annimutuo" name="annimutuo">
									<%if trim(text_annimutuo)<>"" then%>
									<option  selected="selected" value="<%=text_annimutuo%>"><%=ucase(text_annimutuo)%></option>					
									<%end if
									for i=1 to 40
									%>	
									<option  value="<%=i%>"><%=i%></option>	
								    <%next %>
							</select>
							</td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
														<tr>
							<td  align=left >Valore Immobile:<font color="#FF0000">*</font></td><td><input  type="text" id="valimmobile"  size="20" name="valimmobile" value="<%=formatnumber(text_valimmobile,2)%>"></td>
							<td width="15px"></td>
							<td  align=left ></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Prezzo Immobile:<font color="#FF0000">*</font></td><td><input  type="text" id="impimmobile"  size="20" name="impimmobile" value="<%=formatnumber(text_impimmobile,2)%>"></td>
							<td width="15px"></td>
							<td  align=left >Importo Mutuo:<font color="#FF0000">*</font></td><td><input  type="text" id="impmutuo"  name="impmutuo" value="<%=formatnumber(text_impmutuo,2)%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>							
							<td  align=left >LTC:<font color="#FF0000">*</font></td><td><input type="text" id="lvtltc"  name="lvtltc"  value="<%=formatnumber(text_lvtltc,2)%>"></td>
							<td colspan="3" align="left"><a href='#' onclick='javascript:calcola();'>calcola LTC</a></td>
							</tr>
														<tr><td colspan="2" height="5px"></td></tr>
							<tr>							
							<td  align=left >LTV:<font color="#FF0000">*</font></td><td><input type="text" id="lvt"  name="lvt"  value="<%=formatnumber(text_lvt,2)%>"></td>
							<td colspan="3" align="left"><a href='#' onclick='javascript:calcolaltv();'>calcola LTV</a></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Tasso:</td><td>
							<select  type="select" id="tasso" name="tasso">
									<%if trim(text_tasso)<>"" then%>
									<option  selected="selected" value="<%=text_tasso%>"><%=ucase(text_tasso)%></option>			
									<%end if
										sqlmutuo="select distinct descrizione from tipomutuo order by descrizione"
										set tbm=conn.execute(sqlmutuo)									
									do while not tbm.eof%>	
									<option value="<%=ucase(tbm("descrizione"))%>"><%=ucase(tbm("descrizione"))%></option>								
									<%tbm.movenext
									loop
									tbm.close%>									
									</select></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Importo Rata Desiderata</td><td><input   size="20" type="text" id="impratades" name="impratades"  value="<%=formatnumber(text_impratades,2)%>"></td>
							</tr>
							</table>
							
							
							
							</td></tr>
							
							<tr><td colspan="2" ><hr></td></tr>
							<tr>
							<td  align=left >Numero Figli:</td><td>
							<select  type="select" id="nfiglis" name="nfiglis">
								<%if trim(text_nfiglis)<>"" then%>
								<option  selected="selected" value="<%=text_nfiglis%>"><%=ucase(text_nfiglis)%></option>	
								<%end if%>		
								<option  value="0">0</option>
								<option  value="1">1</option>	
								<option  value="2">2</option>	
								<option  value="3">3</option>	
								<option  value="4">4</option>	
								<option  value="5">5</option>	
								<option  value="6">6</option>
								<option  value="7">7</option>
								<option  value="8">8</option>
								<option  value="9">9</option>
								<option  value="10">10</option>								
								</select></td></tr>
								<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Attuale Abitazione:</td><td>
							<select  type="select" id="attualeabitazione" name="attualeabitazione">							
									<%if trim(text_attualeabitazione)<>"" then%>
									<option  selected="selected" value="<%=text_attualeabitazione%>"><%=ucase(text_attualeabitazione)%></option>					
									<%end if%>	
									<option  value="AFFITTO">AFFITTO</option>										
									<option value="PROPRIETA">PROPRIETA</option>
									<option value="PRES. FAM NON ONEROSO">PRES. FAM NON ONEROSO</option>
									<option value="OSPITE NON ONEROSO">OSPITE NON ONEROSO</option>
									</select></td></tr>
									<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Se affitto indicare importo mensile:</td>
							<td  align=left > <input  type="text" id="impaffitto"   size="20" name="impaffitto"  value="<%=formatnumber(text_impaffitto,2)%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
														<tr>
							<td  align=left >Se alimenti importo mensile:</td>
							<td  align=left > <input  type="text" id="impalimenti"  size="20" name="impalimenti"  value="<%=formatnumber(text_impalimenti,2)%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Appoggio Bancario:</td>
							<td  align=left > <input  type="text" id="appbanca"   name="appbanca" size=65 value="<%=text_appbanca%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"><hr></td></tr>
							<tr>
							<td  align=left >Finanziamenti in Corso :</td><td>
							
							<%if trim(text_finanziamenti)<>"si" then%>
							<div id="var_1"  style="display:none;">	
							<%else%>
							<div id="var_1"  style="display:block;">										
							<%end if%>
														
					<% 
                                                    session.lcid=1040    
													'DB TIPO DOCUMENTI
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "select id,idpratica,idpratica as idcanc,nometabella,tipologia,debitoresiduo,importorata,scadenza,istituto,note from pratiche_finanziarie where nometabella='pratiche' and idpratica=" & session("idpratica") & " group by importorata order by importorata desc"
													Grid.Cols("idpratica").AttachExpression "<a class=navy11 HREF=""adinsertfinan.asp?nometabella=pratiche&tipooperazione=insert&idpratica={{idpratica}}&id={{id}}""><center><img src='images/edit.gif' border='0'></center></a>"
													Grid.Cols("idcanc").AttachExpression "<a class=navy11 HREF=""adinsertfinan.asp?nometabella=pratiche&tipooperazione=delete&idpratica={{idpratica}}&id={{id}}""><center><img src='images/elimina.png' border='0'></center></a>"
													Grid.Cols("id").hidden = True
													'Grid.Cols("nometabella").value="pratiche"													
													Grid.Cols("nometabella").hidden = True
													Grid.Cols("idpratica").readonly = True											
												    Grid.Cols("idpratica").Caption="&nbsp;"
													Grid.Cols("idcanc").readonly = True											
												    Grid.Cols("idcanc").Caption="&nbsp;"
													Grid.Cols("tipologia").Caption="&nbsp;&nbsp;&nbsp;&nbsp;tipologia&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("istituto").Caption="&nbsp;&nbsp;&nbsp;&nbsp;istituto&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("note").Caption="&nbsp;&nbsp;&nbsp;&nbsp;note&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("importorata").Caption="&nbsp;imp.&nbsp;rata&nbsp;"
													Grid.Cols("debitoresiduo").Caption="&nbsp;deb.&nbsp;residuo&nbsp;"											
													'MAX RECORD
													Grid.MaxRows=40									
											
													
													' Enable sorting
													Grid.ColRange(1,33).CanSort = False
													Grid.ColRange(1,33).Cell.Align = "left"
													'Grid.Cols("utentetipo").Cell.Align = "center"
													'Grid.Cols("email").Cell.Align = "center"
													' Set Colors
													Grid.ColRange(1,33).Header.BGColor = "#f6f6f6"
													Grid.ColRange(1,33).Header.Font.Face = "sans-serif"
													Grid.ColRange(1,33).Cell.Font.Face = "sans-serif"
													Grid.ColRange(1,33).Cell.Font.Size = par_font_size
													Grid.ColRange(1,33).Header.Font.Size = par_font_size
													Grid(0).Header.BGColor = "#f6f6f6"
													Grid(999).Header.BGColor = "#f6f6f6"
															
													' Specify location of button images
													Grid.ImagePath = "images/"
													' Set <TABLE> attributes
													Grid.Table.Border = 1
													Grid.Table.CellSpacing = 0
													Grid.Table.CellPadding =0
														
													Grid.readonly = true
													Grid.Display
													Grid.Disconnect

													Set Grid = Nothing
													
												%>
							</div>
							
							<script language="javascript">
								function mostra(name)
								{	// alert(document.getElementById('finanziamenti').value);
									if(document.getElementById('finanziamenti').value == "no"){
										document.getElementById(name).style.display = "none";
									}else{
										document.getElementById(name).style.display = "block"
									}
								}
							</script>	
							
							<br>	
							<select  type="select" id="finanziamenti" name="finanziamenti" onchange="mostra('var_1');">
									<%if trim(text_finanziamenti)<>"" then%>
									<option  selected="selected" value="<%=text_finanziamenti%>"><%=ucase(text_finanziamenti)%></option>	
									<%end if%>
									<option value="no">NO</option>										
									<option value="si">SI</option>	
									</select></td>
							</tr>
							<tr><td colspan="2" height="5px"><hr></td></tr>
							<tr>
							<td  align=left >Garanti :</td><td>
							<select  type="select" id="garanti" name="garanti">
									<%if trim(text_garanti)<>"" then%>
									<option  selected="selected" value="<%=text_garanti%>"><%=ucase(text_garanti)%></option>
									<%end if%>	
									<option value="NESSUNO">NESSUNO</option>	
									<option value="SI (1)">SI (1)</option>
									<option value="SI (2)">SI (2)</option>
									</select></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Cointestatario :</td><td>
							<select  type="select" id="cointestatario" name="cointestatario">
									<%if trim(text_cointestatario)<>"" then%>
									<option  selected="selected" value="<%=text_cointestatario%>"><%=ucase(text_cointestatario)%></option>
									<%end if%>	
									<option value="NESSUNO">NESSUNO</option>
									<option value="SI (1)">SI (1)</option>
									<option value="SI (2)">SI (2)</option>
									<option value="SI (3)">SI (3)</option>
									<option value="SI (4)">SI (4)</option>
									</select></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Compenso Kiron:<font color="#FF0000"></font></td>
							<td  align=left > <input type="text" id="compenso"  size="5" name="compenso" value="<%=text_compenso%>">%</td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left ><span class="bold">Note&nbsp;Pratica&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
							<td  align=left ><textarea name="note" rows="2" cols="55" ><%=text_note%></textarea></td>
							</tr>   
			
						    <tr><td colspan="2" height="25px"></td></tr>			
							<tr><td height="10px"><font color="#FF0000">*</font>campi obbligatori</td></tr>
														<tr>
							<td align="left"><button  type="submit"  border="0" class="btn btn-primary">INSERIMENTO PRATICA >>> PROSEGUI</button></td>
							<td align="left">&nbsp;<button type="button" onclick="javascript:history.back();" class="btn btn-primary"  >INDIETRO</button></td>
							</tr>
							<tr><td colspan="2" height="10px"></td></tr>
							</table>
							</tbody>
							</form>
							<br>	
								 
								 
								 
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
<!--#include file=closesql.inc-->