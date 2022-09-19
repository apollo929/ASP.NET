<!--#include file=connessionesql.inc-->
<% 
session("titolonavigazione")="MODIFICA PRATICA"
if request("tasto")<>"" then
	'controllo form
	text_nome=trim(senza_apice(Request.Form("nome")))	
	text_cognome=trim(senza_apice(Request.Form("cognome")))	
	text_segnalatore=senza_apice(Request.Form("segnalatore"))
	text_funzionario=senza_apice(Request.Form("funzionario"))
	text_tipolavoratore=senza_apice(Request.Form("tipolavoratore"))
else
	sqlvisua="select * from pratiche where idpratica=" & trim(request("idpratica")) & " limit 1"
	Set tbvisuaapp=Server.CreateObject("ADODB.Recordset")
	tbvisuaapp.open sqlvisua,conn
	'controllo form	
	text_nome=tbvisuaapp("nome")
	text_segnalatore=tbvisuaapp("segnalatore")
	text_funzionario=tbvisuaapp("funzionario")
	text_cognome=tbvisuaapp("cognome")
	text_email=tbvisuaapp("mail")
	text_telefono=tbvisuaapp("mobile")		
	text_codicefiscale=tbvisuaapp("codfiscale")	
	text_indirizzo=tbvisuaapp("indirizzo")
	text_citta=tbvisuaapp("citta")
	text_cap=tbvisuaapp("cap")
	text_provincia=tbvisuaapp("provincia")
	text_tipolavoratore=tbvisuaapp("tipocliente")
	session("idpratica")=tbvisuaapp("idpratica")
	session("datapratica")=tbvisuaapp("data")
	tbvisuaapp.close
end if	
	
	
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

		strsql="update pratiche set nome='" & text_nome & "',cognome='" & text_cognome & "',segnalatore='" & text_segnalatore & "',funzionario='" & text_funzionario & "',tipocliente='" & text_tipolavoratore & "' where idpratica=" & trim(request("idpratica")) 
		conn.Execute(lcase(strsql))				
        '1
		strsql1="update pratiche_persona1 set segnalatore='" & text_segnalatore & "',funzionario='" & text_funzionario & "' where idpratica=" & trim(request("idpratica")) 
		conn.Execute(lcase(strsql1))
		'2
		strsql2="update pratiche_persona2 set segnalatore='" & text_segnalatore & "',funzionario='" & text_funzionario & "' where idpratica=" & trim(request("idpratica")) 
		conn.Execute(lcase(strsql2))
		'3 fin NON ESEGUITA NON NECESSARIA
		'strsqlfin="update pratiche_finanziarie set funzionario='" & text_funzionario & "' where idpratica=" & trim(request("idpratica")) 
		'conn.Execute(lcase(strsqlfin))
		
		'response.write(strsql)
		'response.write(strsql1)
		'response.write(strsql2)
		'response.write(strsqlfin)	
		'response.end
		response.redirect "adinsertpratica2.asp"
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
								
								
								
							<form action="admodificapratica.asp?tasto=invia&idpratica=<%=trim(request("idpratica"))%>" method="post" id="formuu" name="formuu">
							<table cellspacing="0" cellpadding="0" width="40%" align="left">						
							
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
							<td align=left>N PRATICA :</td>
							<td align=left><input type="text" size="35" id="numeropratica"  name="numeropratica" readonly="readonly" value="<%=session("idpratica")%>_<%=session("loginprovincia")%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>		
							<tr> 
							<td align=left>DATA PRATICA :</td>
							<td align=left><input type="text" size="35" id="datapratica"  name="datapratica" readonly="readonly" value="<%=session("datapratica")%>"></td>
							</tr>
							<tr><td colspan="2" ><hr></td></tr>	
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