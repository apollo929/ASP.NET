<!--#include file=connessionesql.inc-->
<%
'controllo session pratica 
if request("idpratica")<>"" and request("id")<>"" then 
 session("idpratica")=trim(request("idpratica"))
 session("idfin")=trim(request("id"))
 session("nometabella")=trim(request("nometabella"))
 session("generale")=trim(request("gen"))
end if 
if trim(session("idpratica"))="" then response.redirect "adindex.asp"
session("titolonavigazione")="INSERIMENTO FINANZIAMENTO"
'prativa
sqlcall="select * from pratiche_finanziarie where id=" & trim(session("idfin")) & " limit 1"
set tbupdrec=conn.execute(sqlcall)
text_nome=trim(tbupdrec("nome"))
text_cognome=trim(tbupdrec("cognome"))
text_tipologia=trim(tbupdrec("tipologia"))
text_debitoresiduo=tbupdrec("debitoresiduo")
text_importorata=tbupdrec("importorata")	
text_note=tbupdrec("note")
text_scadenza=trim(tbupdrec("scadenza"))
text_istituto=trim(tbupdrec("istituto"))
numeropratica_txt=cstr(session("idpratica") & "_" & session("loginprovincia"))
'response.write(sqlcall)
'response.end	
tbupdrec.close

if trim(request("tipooperazione"))="delete" then 
        'crea pratica vuota
		conn.Execute("delete from pratiche_finanziarie where id=" & request("id"))
		strsqlp3="insert into pratiche_finanziarie (idpratica,numeropratica,nome,cognome,nometabella) values (" & session("idpratica") & ",'" & numeropratica_txt & "','" & text_nome & "','" & text_cognome & "','" & session("nometabella") & "')"
		conn.Execute(lcase(strsqlp3))
		if session("generale")="gen" then response.redirect "adfinanziamenti.asp"
		if session("nometabella")="pratiche" then response.redirect "adinsertpratica3.asp"
		if session("nometabella")="pratiche_cointestatario" then response.redirect "adcointestatario.asp"
		if session("nometabella")="pratiche_cointestatario2" then response.redirect "adcointestatario2.asp"
end if
'controllo
if request("tasto")<>"" then	
		text_tipologia=trim(senza_apice(Request.Form("tipologia")))
		text_debitoresiduo=senza_apice(Request.Form("debitoresiduo"))
		text_importorata=senza_apice(Request.Form("importorata"))	
		text_note=senza_apice(Request.Form("note"))	
		text_scadenza=trim(senza_apice(Request.Form("scadenza")))
		text_istituto=trim(senza_apice(Request.Form("istituto")))
		
		errore="false"		
		verrore=" "
		rossi=""
		if isnumeric(text_debitoresiduo)=false then
			errore="true"
			rossi=rossi & "imp. Debito Residuo numerico ,"
			verrore=verrore & "imp. Debito Residuo non numerico ,"
			text_debitoresiduo=0
				else
     		text_debitoresiduo=replace(cdbl(text_debitoresiduo),",",".")
		end if
		if isnumeric(text_importorata)=false then
			errore="true"
			rossi=rossi & "imp. Imp.Rata numerico ,"
			verrore=verrore & "imp. Imp.Rata non numerico ,"
			text_importorata=0
				else
     		text_importorata=replace(cdbl(text_importorata),",",".")
		end if
		
		if verrore=" " then 
		    sqlupd="update " & trim(cstr(session("nometabella"))) & " set finanziamenti='si'"
			conn.Execute(lcase(sqlupd))
			strsqlupdateins="update pratiche_finanziarie set nometabella='" & session("nometabella") & "',tipologia='" & text_tipologia & "',debitoresiduo=" & text_debitoresiduo & ",importorata=" & text_importorata & ",scadenza='" & text_scadenza & "',istituto='" & text_istituto & "',note='" & text_note & "'  where id=" & session("idfin")                               
			conn.Execute(lcase(strsqlupdateins))
			strsqlp3="insert into pratiche_finanziarie (idpratica,numeropratica,nome,cognome,nometabella) values (" & session("idpratica") & ",'" & numeropratica_txt & "','" & text_nome & "','" & text_cognome & "','" & session("nometabella") & "')"
			conn.Execute(lcase(strsqlp3))
			'response.write(strsqlp3)
			'log
			loggaVisSchede "insert finanziamento",session("nometabella"),session("idpratica"),"inserimento finanziamento",session("loginnominativo")
			if session("generale")="gen" then response.redirect "adfinanziamenti.asp"
			if session("nometabella")="pratiche" then response.redirect "adinsertpratica3.asp"
			if session("nometabella")="pratiche_cointestatario" then response.redirect "adcointestatario.asp"
			if session("nometabella")="pratiche_cointestatario2" then response.redirect "adcointestatario2.asp"
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
                                 
								 
								 
							
							<form action="adinsertfinan.asp?tasto=invia" method="post" id="formuu" name="formuu">
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
							<td align=left>NOME COGNOME :</td>
							<td align=left><input type="text" size="35" id="nominativo"  name="nominativo" readonly="readonly" value="<%=cstr(text_nome & " " & text_cognome)%>"></td>
							</tr>	
							<tr><td colspan="2" height="5px"><hr></td></tr>	
							<tr>
							<td  align=left >Tipologia:<font color="#FF0000"></font></td>
							<td  align=left > <input type="text" size="35" id="tipologia"   name="tipologia" value="<%=text_tipologia%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Debito Residuo:<font color="#FF0000"></font></td>
							<td  align=left > <input type="text" size="35" id="debitoresiduo" size="20" name="debitoresiduo" value="<%=formatnumber(text_debitoresiduo,2)%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left >Importo Rata:<font color="#FF0000"></font></td>
							<td  align=left > <input type="text" size="35" id="importorata" size="20" name="importorata" value="<%=formatnumber(text_importorata,2)%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>							
							<%
							bg=""
							if instr(rossi,"scadenza,")>0 then
								bg="bgcolor='#ff0000'"
							end if
							%>
							<tr <%=bg%>>
							<td  align=left >Scadenza:<font color="#FF0000"></font></td>
							<td  align=left > <input type="text" size="35" id="scadenza"   name="scadenza" value="<%=text_scadenza%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<%
							bg=""
							if instr(rossi,"istituto,")>0 then
								bg="bgcolor='#ff0000'"
							end if
							%>
							<tr <%=bg%>> 
							<td  align=left >Istituto:<font color="#FF0000"></font></td>
							<td  align=left > <input  type="text" id="istituto"  name="istituto" size="58" value="<%=text_istituto%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							<tr>
							<td  align=left ><span class="bold">Note&nbsp;Pratica&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
							<td  align=left ><textarea name="note" rows="2" cols="55" ><%=text_note%></textarea></td>
							</tr> 
						
						    <tr><td colspan="2" height="25px"></td></tr>			
							<tr><td height="10px"><font color="#FF0000">*</font>campi obbligatori</td></tr>
							<tr>
							<td align="left"><button  type="submit"  border="0" class="btn btn-primary">INSERIMENTO / MODIFICA FINANZIAMENTO</button></td>
							<td align="left">&nbsp;<button type="button" onclick="javascript:history.back();" class="btn btn-primary"  >INDIETRO</button></td>
							</tr>
							<tr><td colspan="2" height="10px"></td></tr>
							</table>
							</tbody>
							</form>
					
								 
								 
								 
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