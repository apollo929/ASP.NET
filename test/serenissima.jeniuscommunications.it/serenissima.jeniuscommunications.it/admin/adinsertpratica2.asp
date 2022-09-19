<!--#include file=connessionesql.inc-->
<%  
    'controllo session pratica   
    if request("idpratica")<>"" and request("update")="modifica"  then  session("idpratica")=trim(request("idpratica"))
	if trim(session("idpratica"))="" then response.redirect "adindex.asp"
	session("titolonavigazione")="INSERIMENTO PRATICA"
	
	'controllo form
	sqlcall="select idpratica,data,mail,mobile,codfiscale,indirizzo,citta,cap,provincia,nome,cognome,tipocliente,statocivile,cittadinanza,reddito,professione from pratiche where idpratica=" & trim(session("idpratica")) & " limit 1"
	set tbupdrec=conn.execute(sqlcall)
    session("idpratica")=tbupdrec("idpratica")
	session("datapratica")=tbupdrec("data")	
	'response.write(sqlcall)
	'response.end	
	text_nome=trim(tbupdrec("nome"))
	text_cognome=trim(tbupdrec("cognome"))
	text_segnalatore=trim(tbupdrec("segnalatore"))
	text_tipocliente=trim(tbupdrec("tipocliente"))
	text_tipolavoratore=trim(tbupdrec("tipocliente"))
	text_email=trim(tbupdrec("mail"))
	text_telefono=trim(tbupdrec("mobile"))
	text_codicefiscale=tbupdrec("codfiscale")		
	text_indirizzo=tbupdrec("indirizzo")
	text_citta=tbupdrec("citta")
	text_cap=tbupdrec("cap")
	text_provincia=tbupdrec("provincia")	
	text_statocivile=tbupdrec("statocivile")
	text_professione=tbupdrec("professione")
	text_reddito=tbupdrec("reddito")
	text_cittadinanza=tbupdrec("cittadinanza")
	tbupdrec.close


		
errore="false"
'controllo
if request("tasto")<>"" then	
		text_tipolavoratore=senza_apice(Request.Form("tipolavoratore"))			
		verrore=" "
		rossi=""
		if text_nome="" then
		 errore="true"
		 rossi=rossi & "nome,"
		 verrore=verrore & "Nome  ,"
		end if  
		if text_tipolavoratore="" then
		 errore="true"
		 rossi=rossi & "inserire il tipo di lavoro,"
		 verrore=verrore & "inserire il tipo di Lavoro  ,"
		end if  
			
		text_email=trim(senza_apice(Request.Form("Email")))
		text_telefono=trim(senza_apice(Request.Form("telefono")))
		text_codicefiscale=senza_apice(Request.Form("codicefiscale"))		
		text_indirizzo=senza_apice(Request.Form("Indirizzo"))
		text_citta=senza_apice(Request.Form("Citta"))
		text_cap=senza_apice(Request.Form("Cap"))
		text_provincia=senza_apice(Request.Form("Provincia"))		
		text_statocivile=senza_apice(Request.Form("statocivile"))
		text_professione=senza_apice(Request.Form("professione"))
		text_reddito=senza_apice(Request.Form("reddito"))
		text_cittadinanza=senza_apice(Request.Form("cittadinanza"))
		'controllo reddito
		if isnumeric(text_reddito)=false then
			text_reddito=0
		else
     		text_reddito=replace(cdbl(text_reddito),",",".")
		end if	
		verrore=" "
		rossi=""



		session.lcid=1040    
		t_data=date()

		if verrore=" " then 
			strsqlupdate="update pratiche set provincia='" & text_provincia & "',tipocliente='" & text_tipolavoratore & "',mail='" & text_email & "',codfiscale='" & text_codicefiscale & "',cap='" & text_cap & "',citta='" & text_citta & "',indirizzo='" & text_indirizzo & "',mobile='" & text_telefono & "',cittadinanza='" & text_cittadinanza & "',statocivile='" & text_statocivile & "',professione='" & text_professione & "',reddito=" & text_reddito & " where idpratica=" & session("idpratica")
			conn.Execute(lcase(strsqlupdate))
			'response.write(strsqlupdate)
			'response.end
			response.redirect "adinsertpratica3.asp"
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
                                 
								 
								 
							<form action="adinsertpratica2.asp?tasto=invia" method="post" id="formuu" name="formuu">
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
							
							<tr><td colspan="2" height="5px"><hr></td></tr>	
							
							<tr> 
							<td align=left>Tipologia Lavoratore:</td>							
							<td align=left><select  type="select" id="tipolavoratore" name="tipolavoratore" >
							<%
							if trim(text_tipolavoratore)<>"" then							
									num=instr(trim(text_tipolavoratore),"_")-1
									%>
									<option  selected="selected" value="<%=ucase(trim(text_tipolavoratore))%>"><%=ucase(mid(trim(text_tipolavoratore),1,num))%></option>
								<%						
							end if
							sqltl="select distinct descrizione,categoria from tipolavoratore order by descrizione"
							set tbtl=conn.execute(sqltl)									
							do while not tbtl.eof%>	
							<option value="<%response.write(ucase(tbtl("descrizione")) & "_" & ucase(tbtl("categoria")))%>"><%=ucase(tbtl("descrizione"))%></option>								
							<%tbtl.movenext
							loop
							tbtl.close%>							
							</select>
							</td>
							</tr>
							
							<tr><td colspan="2" ><hr></td></tr>
							<tr>
							<td  align=left >Stato Civile:</td><td>
							<select  type="select" id="statocivile" name="statocivile">
									<%if trim(text_statocivile)<>"" then%>
									<option  selected="selected" value="<%=text_statocivile%>"><%=ucase(text_statocivile)%></option>					
									<%end if%>	
									<option value="CELIBE">CELIBE</option>	
									<option value="NUBILE">NUBILE</option>
									<option value="CONIUGATA">CONIUGATA</option>
									<option value="CONIUGATO">CONIUGATO</option>
									<option value="DIVORZIATA">DIVORZIATA</option>
									<option value="DIVORZIATO">DIVORZIATO</option>
									<option value="SEPARATA">SEPARATA</option>
									<option value="SEPARATO">SEPARATO</option>
									<option value="VEDOVA">VEDOVA</option>
									<option value="VEDOVO">VEDOVO</option>
									</select></td></tr>
									<tr><td colspan="2" height="5px"></td></tr>												
							<tr>
							<td  align=left >Professione:<font color="#FF0000"></font></td>
							<td  align=left > <input type="text" size="35" id="professione"   name="professione" value="<%=text_professione%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Reddito:<font color="#FF0000"></font></td>
							<td  align=left > <input type="text" size="35" id="reddito" size="20" name="reddito" value="<%=formatnumber(text_reddito,2)%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Cittadinanza:</td><td>
							<select  type="select" id="cittadinanza" name="cittadinanza">
									<%if trim(text_cittadinanza)<>"" then%>
									<option  selected="selected" value="<%=text_cittadinanza%>"><%=ucase(text_cittadinanza)%></option>					
									<%end if%>	
									<option value="ITALIANA">ITALIANA</option>	
									<option value="EUROPEA">EUROPEA</option>
									<option value="EXTRA EUROPEA">EXTRA EUROPEA</option>
									<option value="EXTRA EUROPEA OCCIDENTALE">EXTRA EUROPEA OCCIDENTALE</option>
									</select></td></tr>
									<tr><td colspan="2" height="5px"></td></tr>												
							<tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>							
							<%
							bg=""
							if instr(rossi,"codicefiscale,")>0 then
								bg="bgcolor='#ff0000'"
							end if
							%>
							<tr <%=bg%>>
							<td  align=left >Cod.Fiscale:<font color="#FF0000"></font></td>
							<td  align=left > <input type="text" size="35" id="Codicefiscale"   name="Codicefiscale" value="<%=text_codicefiscale%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
								
											
							<%
							bg=""
							if instr(rossi,"indirizzo,")>0 then
								bg="bgcolor='#ff0000'"
							end if
							%>
							<tr <%=bg%>> 
							<td  align=left >Indirizzo:<font color="#FF0000"></font></td>
							<td  align=left > <input  type="text" id="text_3" maxlength="245" name="indirizzo" size="55" value="<%=text_Indirizzo%>"></td>
							</tr>
								<tr><td colspan="2" height="5px"></td></tr>
							<%
							bg=""
							if instr(rossi,"citta,")>0 then
								bg="bgcolor='#ff0000'"
							end if
							%>
							<tr <%=bg%>>
							<td  align=left >Citta'/Comune:<font color="#FF0000"></font></td>
							<td  align=left > <input  type="text" size="55" id="citta" name="citta" maxlength="245" value="<%=text_Citta%>"></td>
							</tr>
								<tr><td colspan="2" height="5px"></td></tr>
							<%
							bg=""
							if instr(rossi,"cap,")>0 then
								bg="bgcolor='#ff0000'"
							end if
							%>
							<tr <%=bg%>>
							<td  align=left >Cap:<font color="#FF0000"></font></td>
							<td  align=left > <input  type="text" size="8" id="cap" name="cap" maxlength="15" value="<%=text_Cap%>"></td>
							</tr>
								<tr><td colspan="2" height="5px"></td></tr>
							<%
							bg=""
							if instr(rossi,"provincia,")>0 then
								bg="bgcolor='#ff0000'"
							end if
							%>
							<tr <%=bg%>>
							<td align="left">Provincia:<font color="#FF0000"></font></td>
							<td align="left"> 
								<select  type="select" id="Provincia" name="Provincia">
									<%if trim(text_provincia)<>"" then%>
									<option  selected="selected" value="<%=text_provincia%>"><%=ucase(text_provincia)%></option>						
									<%end if%>									
									<option value="AGRIGENTO">AGRIGENTO</option>							
									<option value="ALESSANDRIA">ALESSANDRIA</option>							
									<option value="ANCONA">ANCONA</option>							
									<option value="AOSTA">AOSTA</option>							
									<option value="AREZZO">AREZZO</option>							
									<option value="ASCOLI PICENO">ASCOLI PICENO</option>							
									<option value="ASTI">ASTI</option>							
									<option value="AVELLINO">AVELLINO</option>							
									<option value="BARI">BARI</option>							
									<option value="BARLETTA-ANDRIA-TRANI">BARLETTA-ANDRIA-TRANI</option>							
									<option value="BELLUNO">BELLUNO</option>							
									<option value="BENEVENTO">BENEVENTO</option>							
									<option value="BERGAMO">BERGAMO</option>							
									<option value="BIELLA">BIELLA</option>							
									<option value="BOLOGNA">BOLOGNA</option>							
									<option value="BOLZANO">BOLZANO</option>							
									<option value="BRESCIA">BRESCIA</option>							
									<option value="BRINDISI">BRINDISI</option>							
									<option value="CAGLIARI">CAGLIARI</option>							
									<option value="CALTANISSETTA">CALTANISSETTA</option>							
									<option value="CAMPOBASSO">CAMPOBASSO</option>							
									<option value="CARBONIA-IGLESIAS">CARBONIA-IGLESIAS</option>							
									<option value="CASERTA">CASERTA</option>							
									<option value="CATANIA">CATANIA</option>							
									<option value="CATANZARO">CATANZARO</option>							
									<option value="CHIETI">CHIETI</option>							
									<option value="COMO">COMO</option>							
									<option value="COSENZA">COSENZA</option>							
									<option value="CREMONA">CREMONA</option>							
									<option value="CROTONE">CROTONE</option>							
									<option value="CUNEO">CUNEO</option>							
									<option value="ENNA">ENNA</option>							
									<option value="FERMO">FERMO</option>							
									<option value="FERRARA">FERRARA</option>							
									<option value="FIRENZE">FIRENZE</option>							
									<option value="FOGGIA">FOGGIA</option>							
									<option value="FORLI">FORLI</option>							
									<option value="FROSINONE">FROSINONE</option>							
									<option value="GENOVA">GENOVA</option>							
									<option value="GORIZIA">GORIZIA</option>							
									<option value="GROSSETO">GROSSETO</option>							
									<option value="IMPERIA">IMPERIA</option>							
									<option value="ISERNIA">ISERNIA</option>							
									<option value="LA SPEZIA">LA SPEZIA</option>							
									<option value="LATINA">LATINA</option>							
									<option value="LECCE">LECCE</option>							
									<option value="LECCO">LECCO</option>							
									<option value="LIVORNO">LIVORNO</option>							
									<option value="LODI">LODI</option>							
									<option value="LUCCA">LUCCA</option>							
									<option value="L`AQUILA">L`AQUILA</option>							
									<option value="MACERATA">MACERATA</option>							
									<option value="MANTOVA">MANTOVA</option>							
									<option value="MASSA CARRARA">MASSA CARRARA</option>							
									<option value="MATERA">MATERA</option>							
									<option value="MEDIO CAMPIDANO">MEDIO CAMPIDANO</option>							
									<option value="MESSINA">MESSINA</option>							
									<option value="MILANO">MILANO</option>							
									<option value="MODENA">MODENA</option>							
									<option value="MONZA - BRIANZA">MONZA - BRIANZA</option>							
									<option value="NAPOLI">NAPOLI</option>							
									<option value="NOVARA">NOVARA</option>							
									<option value="NUORO">NUORO</option>							
									<option value="OGLIASTRA">OGLIASTRA</option>							
									<option value="OLBIA-TEMPIO">OLBIA-TEMPIO</option>							
									<option value="ORISTANO">ORISTANO</option>							
									<option value="PADOVA">PADOVA</option>							
									<option value="PALERMO">PALERMO</option>							
									<option value="PARMA">PARMA</option>							
									<option value="PAVIA">PAVIA</option>							
									<option value="PERUGIA">PERUGIA</option>							
									<option value="PESARO">PESARO</option>							
									<option value="PESARO URBINO">PESARO URBINO</option>							
									<option value="PESCARA">PESCARA</option>							
									<option value="PIACENZA">PIACENZA</option>							
									<option value="PISA">PISA</option>							
									<option value="PISTOIA">PISTOIA</option>							
									<option value="PORDENONE">PORDENONE</option>							
									<option value="POTENZA">POTENZA</option>							
									<option value="PRATO">PRATO</option>							
									<option value="RAGUSA">RAGUSA</option>							
									<option value="RAVENNA">RAVENNA</option>							
									<option value="REGGIO CALABRIA">REGGIO CALABRIA</option>							
									<option value="REGGIO EMILIA">REGGIO EMILIA</option>							
									<option value="RIETI">RIETI</option>							
									<option value="RIMINI">RIMINI</option>							
									<option value="ROMA">ROMA</option>							
									<option value="ROVIGO">ROVIGO</option>							
									<option value="SALERNO">SALERNO</option>							
									<option value="SASSARI">SASSARI</option>							
									<option value="SAVONA">SAVONA</option>							
									<option value="SIENA">SIENA</option>							
									<option value="SIRACUSA">SIRACUSA</option>							
									<option value="SONDRIO">SONDRIO</option>							
									<option value="TARANTO">TARANTO</option>							
									<option value="TERAMO">TERAMO</option>							
									<option value="TERNI">TERNI</option>							
									<option value="TORINO">TORINO</option>							
									<option value="TRAPANI">TRAPANI</option>							
									<option value="TRENTO">TRENTO</option>							
									<option value="TREVISO">TREVISO</option>							
									<option value="TRIESTE">TRIESTE</option>							
									<option value="UDINE">UDINE</option>							
									<option value="VARESE">VARESE</option>							
									<option value="VENEZIA">VENEZIA</option>							
									<option value="VERBANIA">VERBANIA</option>							
									<option value="VERBANO-CUSIO-OSSOLA">VERBANO-CUSIO-OSSOLA</option>							
									<option value="VERCELLI">VERCELLI</option>							
									<option value="VERONA">VERONA</option>							
									<option value="VIBO VALENTIA">VIBO VALENTIA</option>							
									<option value="VICENZA">VICENZA</option>							
									<option value="VITERBO">VITERBO</option>
								</select>
							</td>
							</tr>
								<tr><td colspan="2" height="5px"></td></tr>
							<%
							bg=""
							if instr(rossi,"email,")>0 then
							bg="bgcolor='#ff0000'"
							end if
							%>
							<tr <%=bg%>>
							<td align="left">E-Mail:<font color="#FF0000"></font></td>
							<td align="left"> <input  type="text" id="text_6" maxlength="130" name="email" size=35 value="<%=text_Email%>"></td>
							</tr>
								<tr><td colspan="2" height="5px"></td></tr>
							<%
							bg=""
							if instr(rossi,"telefono,")>0 then
							bg="bgcolor='#ff0000'"
							end if
							%>
							<tr <%=bg%>>
							<td  align=left >Telefono/Cellulare:<font color="#FF0000"></font></td>
							<td  align=left > <input  type="text" id="telefono" maxlength="130" name="telefono" size=35 value="<%=text_telefono%>"></td>
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