<!--#include file=connessionesql.inc-->
<%
'controllo session pratica   
if request("idpratica")<>"" and request("doc")="doc"  then  session("idpratica")=trim(request("idpratica"))
if trim(session("idpratica"))="" then response.redirect "adindex.asp"
session("titolonavigazione")="DETTAGLIO PRATICA"

'controllo form
sqlcall="select * from pratiche where idpratica=" & trim(session("idpratica")) & " limit 1"
set tbupdrec=conn.execute(sqlcall)
session("idpratica")=tbupdrec("idpratica")
session("datapratica")=tbupdrec("data")	
text_nome=trim(tbupdrec("nome"))
text_cognome=trim(tbupdrec("cognome"))
text_funzionario=trim(tbupdrec("funzionario"))
text_segnalatore=trim(tbupdrec("segnalatore"))
text_tipocliente=trim(tbupdrec("tipocliente"))
text_email=trim(tbupdrec("mail"))
text_telefono=trim(tbupdrec("mobile"))
text_codicefiscale=tbupdrec("codfiscale")		
text_indirizzo=tbupdrec("Indirizzo")
text_citta=tbupdrec("Citta")
text_cap=tbupdrec("Cap")
text_provincia=tbupdrec("Provincia")	
text_statocivile=tbupdrec("statocivile")
text_professione=tbupdrec("professione")
text_reddito=tbupdrec("reddito")
text_cittadinanza=tbupdrec("cittadinanza")
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

if text_cittadinanza="italiana" then
 filtro=" and varianti<>'estero'"
else
 filtro=" or varianti='estero' " 
end if 
'if text_tipocliente="" then response.redirect "admodificapratica.asp?oper=modifica&idpratica=" & trim(session("idpratica"))
text_finanziamenti=tbupdrec("finanziamenti")
text_garanti=tbupdrec("garanti")	
tbupdrec.close	

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
                                 
								 
								 
							
							<table cellspacing="0" cellpadding="0" width="60%" align="left">
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
							<td align=left>NOME COGNOME :</td>
							<td align=left><input type="text" size="35" id="nominativo"  name="nominativo" readonly="readonly" value="<%=cstr(text_nome & " " & text_cognome)%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr> 
							<td align=left>TIPO CLIENTE :</td>
							<%num=instr(trim(text_tipocliente),"_")-1%>
							<td align=left><input type="text" size="35" id="tipocliente"  name="tipocliente" readonly="readonly" value="<%=lcase(mid(trim(text_tipocliente),1,num))%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>		
							<tr> 
							<td align=left>DATA PRATICA :</td>
							<td align=left><input type="text" size="35" id="datapratica"  name="datapratica" readonly="readonly" value="<%=session("datapratica")%>"></td>
							</tr>		
							<tr><td colspan=2><hr></td></tr>							
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td colspan=2>INSERIMENTO / MODIFICA ESEGUITA CON SUCCESSO <img src='images/check.png'></td>
							<td width="15px"><br><br><br></td>
							</tr>
							<tr> 
							<td align=left valign="top">VERIFICA BANCA .....</td>
							<td align=left>
								<%
								response.write("LTC " & text_lvtltc & "   -------   ")
								response.write("LTV " & text_lvt & " ------- ANNI MUTUO " & text_annimutuo & "<br><br>" )
								

								
								'conversione numerica
								if isnumeric(text_lvtltc)=true then v_lvtltc=cdbl(text_lvtltc)
								if isnumeric(text_lvt)=true then v_lvt=cdbl(text_lvt)
								if isnumeric(text_annimutuo)=true then v_annimutuo=cdbl(text_annimutuo)

								'DB banca_agricole_fisso
								sqldbbf="select * from banca_agricole_fisso where mutuo>=" & v_annimutuo & " order by mutuo asc   "
								set tbdbbf=conn.execute(sqldbbf)
								response.write("<br>CREDIT AGRICOLE FISSO<br> ")
								response.write(sqldbbf & "<br>")
								response.write("LTV FISSO : " & tbdbbf("ltv%")  & " MUTUO ANNI : " & tbdbbf("mutuo")  & " SPREAD : " & tbdbbf("spread%") & "<br>")
								'DB banca_agricole_var
								sqldbbv="select * from banca_agricole_var where mutuo>=" & v_annimutuo & " order by mutuo asc   "
								set tbdbbv=conn.execute(sqldbbv)
								response.write("<br>CREDIT AGRICOLE VAR<br> ")
								response.write(sqldbbv & "<br>")
								response.write("LTV VARIABILE : " & tbdbbv("ltv%") & " MUTUO ANNI : " & tbdbbv("mutuo")  & " SPREAD : " & tbdbbv("spread%") & " CAPITALE : " & tbdbbv("cap%") & "<br>")
								
								%>

							
							
							</td>
							</tr>	
							<tr><td colspan=2><hr></td></tr>
							<tr><td colspan="2" height="5px">					
							<button class="btn btn-primary" type="button" onclick="stampa('corpo_articolo');" >
							<i class="fa fa-table fa-fw"></i>STAMPA SCHEDA APPUNTAMENTO
							</button>	
							</form>
							</td></tr>
							<tr><td colspan=2><hr></td></tr>							
							<tr><td colspan="2" height="5px">
							<form action="addocumentiupload.asp?idpratica=<%=session("idpratica")%>" method="post" id="formgg" name="formgg">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-table fa-fw"></i>LISTA DOCUMENTI DA SCARICARE
							</button>	
							</form>
							</td></tr>	
							<tr><td colspan=2><hr></td></tr>							
							<tr><td colspan="2" height="5px">
							<form action="addocumentiimmobileupload.asp?idpratica=<%=session("idpratica")%>" method="post" id="formgg" name="formgg">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-table fa-fw"></i>LISTA DOCUMENTI IMMOBILE (PLANIMETRIE APE ETC.) DA SCARICARE
							</button>	
							</form>
							</td></tr>
	
							<%if lcase(text_cointestatario)<>"nessuno" then%>
							<tr><td colspan=2><hr></td></tr>
							<tr> 
							<td align=left>
							<form action="adcointestatario.asp?idpratica=<%=session("idpratica")%>" method="post" id="formgg" name="formgg">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-user fa-fw"></i>COINTESTATARIO 
							</button>	
							</form></td>
							<td align=left>
							<form action="addocumentiuploadcointestatario.asp?idpratica=<%=session("idpratica")%>&tipocliente=<%=text_tipocliente%>" method="post" id="formgg" name="formgg">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-user fa-fw"></i>COINTESTATARIO LISTA DOCUMENTI DA SCARICARE
							</button>	
							</form></td>
							</tr>
								<%if lcase(text_cointestatario)="si (2)" or lcase(text_cointestatario)="si (3)" or lcase(text_cointestatario)="si (4)" then%>
							<tr><td colspan="2" height="5px"></td></tr>	
							<tr> 
							<td align=left>
							<form action="adcointestatario2.asp?idpratica=<%=session("idpratica")%>" method="post" id="formgg" name="formgg">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-user fa-fw"></i>COINTESTATARIO (2)
							</button>	
							</form></td>
							<td align=left>
							<form action="addocumentiuploadcointestatario2.asp?idpratica=<%=session("idpratica")%>&tipocliente=<%=text_tipocliente%>" method="post" id="formgg" name="formgg">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-user fa-fw"></i>COINTESTATARIO (2) LISTA DOCUMENTI DA SCARICARE
							</button>	
							</form></td>
							</tr>
							   <%end if
							   if lcase(text_cointestatario)="si (3)" or lcase(text_cointestatario)="si (4)" then%>
							<tr><td colspan="2" height="5px"></td></tr>	
							<tr> 
							<td align=left>
							<form action="#" method="post" id="formgg" name="formgg">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-user fa-fw"></i>COINTESTATARIO (3)
							</button>	
							</form></td>
							<td align=left>
							<form action="#" method="post" id="formgg" name="formgg">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-user fa-fw"></i>COINTESTATARIO (3) LISTA DOCUMENTI DA SCARICARE
							</button>	
							</form></td>
							</tr>
							 <%end if
							  if lcase(text_cointestatario)="si (4)" then%>
							<tr><td colspan="2" height="5px"></td></tr>	
							<tr> 
							<td align=left>
							<form action="#" method="post" id="formgg" name="formgg">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-user fa-fw"></i>COINTESTATARIO (4)
							</button>	
							</form></td>
							<td align=left>
							<form action="#" method="post" id="formgg" name="formgg">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-user fa-fw"></i>COINTESTATARIO (4) LISTA DOCUMENTI DA SCARICARE
							</button>	
							</form></td>
							</tr>
							<% end if
							end if	%>
							
							<%if lcase(text_garanti)<>"nessuno"  then							
								if lcase(text_garanti)="si (1)" or lcase(text_garanti)="si (2)" then%>
								<tr><td colspan=2><hr></td></tr>
								<tr> 
								<td align=left>
								<form action="#" method="post" id="formgg" name="formgg">
								<button class="btn btn-primary" type="submit">
								<i class="fa fa-user fa-fw"></i>GARANTI (1)
								</button>	
								</form></td>
								<td align=left>
								<form action="#" method="post" id="formgg" name="formgg">
								<button class="btn btn-primary" type="submit">
								<i class="fa fa-user fa-fw"></i>GARANTI (1) LISTA DOCUMENTI DA SCARICARE
								</button>	
								</form></td>
								</tr>
								 <%end if
								if lcase(text_garanti)="si (2)" then%>
								<tr><td colspan="2" height="5px"></td></tr>	
								<tr> 
								<td align=left>
								<form action="#" method="post" id="formgg" name="formgg">
								<button class="btn btn-primary" type="submit">
								<i class="fa fa-user fa-fw"></i>GARANTI (2)
								</button>	
								</form></td>
								<td align=left>
								<form action="#" method="post" id="formgg" name="formgg">
								<button class="btn btn-primary" type="submit">
								<i class="fa fa-user fa-fw"></i>GARANTI (2) LISTA DOCUMENTI DA SCARICARE
								</button>	
								</form></td>
								</tr>
								<%end if
							end if	%>
							<tr><td colspan=2><hr></td></tr>
							<tr>
							<td align=left colspan=2>							
							<form action="adfinanziamenti.asp?idpratica=<%=session("idpratica")%>" method="post" id="formff" name="formff">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-bar-chart-o fa-fw"></i>FINANZIAMENTI IN CORSO DI TUTTI GLI INTESTATARI
							</button></form>
							</td>
							</tr>
							<tr><td colspan=2><hr></td></tr>														
							<tr>
							<td align=left colspan=2>							
							<form action="#" method="post" id="formff" name="formff">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-bar-chart-o fa-fw"></i>PERIZIA BANCA
							</button></form>
							</td>
							</tr>
							<tr><td colspan=2><hr></td></tr>														
							<tr>
							<td align=left colspan=2>							
							<form action="adinsertpraticasave2.asp" method="post" id="formff" name="formff">
							<button class="btn btn-primary" type="submit">
							<i class="fa fa-bar-chart-o fa-fw"></i>STATUS PRATICA (AGG. DOCUMENTAZIONE TOTALE & ROGITO)
							</button></form>
							</td>
							</tr>
							<tr><td colspan=2><hr></td></tr>
							<tr>		
							<td align="left">&nbsp;<button type="button" onclick="javascript:history.back();" class="btn btn-primary"  >INDIETRO</button></td>
							</tr>
							</table>
							
							<br>

							<!--#include file=adstampapratica.asp-->
							
							<br>	
							
							<%
							'----------------insert doc. generali--------------------------------
							'tipolavoratore /cliente					
							text_doc=trim(lcase(mid(trim(text_tipocliente),num+2)))							
							'controlllo cambio tipocliente/lavoratore		
							sqlinfo="select tipodocumento,nometabella,idpratica from pratiche_documenti where nometabella='pratiche' and tipodocumento<>'generale' and idpratica=" & session("idpratica") & " limit 1"
							set tbinfo=conn.execute(sqlinfo)
							if not tbinfo.eof then 
								text_doc_pra=tbinfo("tipodocumento")
								tbinfo.close
								valore=instr(text_doc_pra,text_doc)			
							else
                                valore=0
							end if		
							if valore=0 then
								'1 fase
								'documenti immobile	pratica						
								sqltd="select * from tipodocumenti where (tipodocumento='generale' or tipodocumento like '%" & text_doc & "%') " & filtro & " order by iddoc asc "
								'response.write(sqltd)
								conn.execute("delete from pratiche_documenti where nometabella='pratiche' and nomefile='' and idpratica='" & session("idpratica") & "'")
								Set tbtd=Server.CreateObject("ADODB.Recordset")
								tbtd.open sqltd,conn	
								do while not tbtd.eof
								conn.execute("insert into pratiche_documenti (idpratica,nomedocumento,tipodocumento,nometabella) values ('" & session("idpratica") & "','" & senza_apice(tbtd("nomedocumento")) & "','" & senza_apice(tbtd("tipodocumento")) & "','pratiche')")
								tbtd.movenext
								loop
								tbtd.close
							end if
							'response.end
							'------------fine----insert doc. generali--------------------------------	
							
							'2 fase
							'documenti immobile
							'documenti immobile
							'documenti immobile
							sqlverifica="select idpratica from pratiche_documentiimmobile where idpratica=" & session("idpratica") & " limit 1"
							set tbverifica=conn.execute(sqlverifica)
							if tbverifica.eof then
								conn.execute("delete from pratiche_documentiimmobile where nomefile='' and idpratica='" & session("idpratica") & "'")							
								Set tbtd=Server.CreateObject("ADODB.Recordset")
								sqltd=""
								sqltd="select * from tipodocimmobile order by id asc "
								tbtd.open sqltd,conn							
								do while not tbtd.eof
									conn.execute("insert into pratiche_documentiimmobile (idpratica,nomedocumento) values ('" & session("idpratica") & "','" & senza_apice(tbtd("descrizione")) & "')")
									tbtd.movenext
								loop
								tbtd.close
							end if
						    tbverifica.close
							'documenti immobile
							'documenti immobile
							'documenti immobile

							

							

							%>
								 
								 
								 
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