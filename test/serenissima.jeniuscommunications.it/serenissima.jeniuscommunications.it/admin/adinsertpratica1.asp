<!--#include file=connessionesql.inc-->
<% 
session("titolonavigazione")="INSERIMENTO PRATICA"

if request("appuntamento")="yes" and isnumeric(request("id"))=true then
	sqlvisua="select * from appuntamenti where id=" & cdbl(request("id")) & " limit 1"
	'app fissato
	sqlupdateapp="update appuntamenti set esito=1,esitodesc='pratica inserita' where id=" & cdbl(request("id")) & " limit 1"
	conn.execute(sqlupdateapp)
	Set tbvisuaapp=Server.CreateObject("ADODB.Recordset")
	tbvisuaapp.open sqlvisua,conn
		'controllo form
		text_nome=senza_apice(tbvisuaapp("nome"))
		text_cognome=senza_apice(tbvisuaapp("cognome"))
		text_email=trim(tbvisuaapp("mail"))
		text_telefono=trim(tbvisuaapp("telefono"))
		'text_codicefiscale=tbvisuaapp("codfiscale")		
		text_indirizzo=tbvisuaapp("Indirizzo")
		text_citta=tbvisuaapp("Citta")
		'text_cap=tbvisuaapp("Cap")
		text_provincia=tbvisuaapp("Provincia")
		text_segnalatore=tbvisuaapp("provenienza")
	tbvisuaapp.close
	
else
	'controllo form
	text_nome=trim(senza_apice(Request.Form("nome")))	
	text_cognome=trim(senza_apice(Request.Form("cognome")))			
	text_tipolavoratore=trim(senza_apice(Request.Form("tipolavoratore")))	
	text_funzionario=senza_apice(Request.Form("funzionario"))
	text_segnalatore=senza_apice(Request.Form("segnalatore"))
	text_email=trim(senza_apice(Request.Form("Email")))
	text_telefono=trim(senza_apice(Request.Form("telefono")))
	text_codicefiscale=senza_apice(Request.Form("codicefiscale"))		
	text_indirizzo=senza_apice(Request.Form("Indirizzo"))
	text_citta=senza_apice(Request.Form("Citta"))
	text_cap=senza_apice(Request.Form("Cap"))
	text_provincia=senza_apice(Request.Form("Provincia"))	
end if

'controllo tipolavoratore (per il 1 inserimento)
if text_tipolavoratore="" or isnull(text_tipolavoratore)=true then text_tipolavoratore="autonomo_autonomo"

errore="false"
'controllo
if request("tasto")<>"" then				
	verrore=" "
	rossi=""
	if text_nome="" then
	 errore="true"
	 rossi=rossi & "nome,"
	 verrore=verrore & "Nome  ,"
	end if  
	if text_cognome="" then
	 errore="true"
	 rossi=rossi & "cognome,"
	 verrore=verrore & "Cognome ,"
	end if  
	session.lcid=1040    
	t_data=date()
    
	if verrore=" " then 
		strsql="insert into pratiche (nome,cognome,agente,segnalatore,funzionario,tipocliente,data) values ('" & text_nome & "','" & text_cognome & "','" & session("loginnominativo") & "','" & text_segnalatore & "','" & text_funzionario & "','" & text_tipolavoratore & "',current_date)"
		conn.Execute(lcase(strsql))		
		'trova ultimo id
		set tblast=conn.execute("select idpratica,data from pratiche order by idpratica desc limit 1")
		session("idpratica")=tblast("idpratica")
		session("datapratica")=tblast("data")
		tblast.close
		'setta update id treviso
		strsqlupdate="update pratiche set numeropratica=concat(idpratica,'_" & session("loginprovincia") & "') where idpratica=" & session("idpratica") & " limit 1"
		conn.Execute(lcase(strsqlupdate))
		'response.write(strsqlupdate)
		'response.end
		'pratica1
		numeropratica_txt=cstr(session("idpratica") & "_" & session("loginprovincia"))
		strsqlpcoi="insert into pratiche_cointestatario (idpratica,numeropratica,agente,segnalatore,funzionario,data) values (" & session("idpratica") & ",'" & numeropratica_txt & "','" & session("loginnominativo") & "','" & text_segnalatore & "','" & text_funzionario & "',current_date)"
		conn.Execute(lcase(strsqlpcoi))
		strsqlpcoi="insert into pratiche_cointestatario2 (idpratica,numeropratica,agente,segnalatore,funzionario,data) values (" & session("idpratica") & ",'" & numeropratica_txt & "','" & session("loginnominativo") & "','" & text_segnalatore & "','" & text_funzionario & "',current_date)"
		conn.Execute(lcase(strsqlpcoi))
		strsqlpcoi="insert into pratiche_cointestatario3 (idpratica,numeropratica,agente,segnalatore,funzionario,data) values (" & session("idpratica") & ",'" & numeropratica_txt & "','" & session("loginnominativo") & "','" & text_segnalatore & "','" & text_funzionario & "',current_date)"
		conn.Execute(lcase(strsqlpcoi))
		strsqlpcoi="insert into pratiche_cointestatario4 (idpratica,numeropratica,agente,segnalatore,funzionario,data) values (" & session("idpratica") & ",'" & numeropratica_txt & "','" & session("loginnominativo") & "','" & text_segnalatore & "','" & text_funzionario & "',current_date)"
		conn.Execute(lcase(strsqlpcoi))		
		strsqlp1="insert into pratiche_persona1 (idpratica,numeropratica,agente,segnalatore,funzionario,data) values (" & session("idpratica") & ",'" & numeropratica_txt & "','" & session("loginnominativo") & "','" & text_segnalatore & "','" & text_funzionario & "',current_date)"
		conn.Execute(lcase(strsqlp1))
		strsqlp2="insert into pratiche_persona2 (idpratica,numeropratica,agente,segnalatore,funzionario,data) values (" & session("idpratica") & ",'" & numeropratica_txt & "','" & session("loginnominativo") & "','" & text_segnalatore & "','" & text_funzionario & "',current_date)"
		conn.Execute(lcase(strsqlp2))
		'pratiche		
		strsqlp="insert into pratiche_finanziarie (idpratica,numeropratica,nome,cognome) values (" & session("idpratica") & ",'" & numeropratica_txt & "','" & text_nome & "','" & text_cognome & "')"
		conn.Execute(lcase(strsqlp))
		'pratiche cointestatario 1/4
		'pratiche cointestatario 1/4
		'pratiche cointestatario 1/4
		strsqlpcoi1="insert into pratiche_finanziarie (idpratica,numeropratica,nome,cognome,nometabella) values (" & session("idpratica") & ",'" & numeropratica_txt & "','','','pratiche_cointestatario')"
		conn.Execute(lcase(strsqlpcoi1))
		strsqlpcoi2="insert into pratiche_finanziarie (idpratica,numeropratica,nome,cognome,nometabella) values (" & session("idpratica") & ",'" & numeropratica_txt & "','','','pratiche_cointestatario2')"
		conn.Execute(lcase(strsqlpcoi2))						
		strsqlpcoi3="insert into pratiche_finanziarie (idpratica,numeropratica,nome,cognome,nometabella) values (" & session("idpratica") & ",'" & numeropratica_txt & "','','','pratiche_cointestatario3')"
		conn.Execute(lcase(strsqlpcoi3))
		strsqlpcoi4="insert into pratiche_finanziarie (idpratica,numeropratica,nome,cognome,nometabella) values (" & session("idpratica") & ",'" & numeropratica_txt & "','','','pratiche_cointestatario4')"
		conn.Execute(lcase(strsqlpcoi4))
		'pratiche cointestatario 1/4
		'pratiche cointestatario 1/4
		'pratiche cointestatario 1/4
		'update pratiche
		strsqlupdate="update pratiche set provincia='" & text_provincia & "',mail='" & text_email & "',codfiscale='" & text_codicefiscale & "',cap='" & text_cap & "',citta='" & text_citta & "',indirizzo='" & text_indirizzo & "',mobile='" & text_telefono & "' where idpratica=" & session("idpratica")
		conn.Execute(lcase(strsqlupdate))
		'log
		loggaVisSchede "insert pratica","insert pratica",session("idpratica"),"inserimento pratica",session("loginnominativo")
	    '------------------CREA CARTELLA ERRORE SU CREAZIONE CARTELLA -----------------
		'ind = "upload"
		'var =  cstr(session("idpratica"))		
		'SET FSO = Server.CreateObject("Scripting.FileSystemObject" )
		'response.end
		'response.write(Server.MapPath(ind & "\" & var))
		'FSO.CreateFolder(Server.MapPath(ind & " \" & var)
		'SET FSO = NOTHING
		'-----------------------------------
		response.redirect "adinsertpratica2.asp"
		'response.end
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
				<!--#include file=top_menu_sotto.inc-->

                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
								
								
								
							<form action="adinsertpratica1.asp?tasto=invia" method="post" id="formuu" name="formuu">
							<table cellspacing="0" cellpadding="0" width="40%" align="left">
							
							<input type="hidden" name="cognome1"  id="cognome1" value="<%=text_cognome1%>" >
							<input type="hidden" name="nome1"  id="nome1" value="<%=text_nome1%>" >
							<input type="hidden" name="email" id="email" value="<%=text_email%>" >
							<input type="hidden" name="telefono"  id="telefono" value="<%=text_telefono%>" >
							<input type="hidden" name="indirizzo"  id="indirizzo" value="<%=text_indirizzo%>" >
							<input type="hidden" name="citta"  id="citta" value="<%=text_citta%>" >
							<input type="hidden" name="provincia"  id="provincia" value="<%=text_provincia%>" >
							
							<tr> 
							<td colspan="2" align="center">
							<%if request("tasto")<>"" then%>
									<font color="red"><b><center class=nero10>Errori >>>><% Response.write(verrore)%>    </center></b></font>
							<%end if%>
							</td>
							</tr>
							<tr> 
							<td align=left>AGENTE KIRON:</td>
							<td align=left><input type="text" size="35" id="agente" readonly="readonly" name="agente" value="<%=session("loginnominativo")%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr> 
							<td align=left>Segnalatore:</td>
							<td align=left><input type="text" size="35" id="segnalatore"  name="segnalatore" value="<%=text_segnalatore%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>		
							<tr> 
							<td align=left>Funzionario:</td>
							<td align=left><input type="text" size="35" id="funzionario"  name="funzionario" value="<%=text_funzionario%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>		
							
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
							<%
							bg=""
							if instr(rossi,"cognome,")>0 then
								bg="bgcolor='#ff0000'"
							end if
							%>
							<tr <%=bg%>> 
							<td align=left>Cognome Richiedente:<font color="#FF0000">*</font></td>
							<td align=left><input type="text" size="35" id="cognome" maxlength="125" name="cognome" value="<%=text_Cognome%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<%
							bg=""
							if instr(rossi,"nome,")>0 then
								bg="bgcolor='#ff0000'"
							end if
							%>
							<tr <%=bg%>> 
							<td align="left">Nome:<font color="#FF0000">*</font></td>
							<td align="left"> <input  type="text" size="35" id="nome" maxlength="125" name="nome" value="<%=text_Nome%>"></td>
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