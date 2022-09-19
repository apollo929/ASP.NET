<!--#include file=connessionesql.inc-->
<%   
'controllo session pratica   
if request("idpratica")<>"" then  session("idpratica")=trim(request("idpratica"))
session("titolonavigazione")="INSERIMENTO DOCUMENTI ALLA PRATICA"
if trim(session("idpratica"))="" then response.redirect "adindex.asp"

'cambio nome campo
if lcase(trim(request("cambionome")))="si" then 
sqlupdnome="update pratiche_documenti set nomedocumento='" & senza_apice(trim(request("testonuovo"))) & "' where id=" & lcase(trim(request("iddoc"))) & " limit 1"
conn.execute(sqlupdnome)
end if

'controllo form
sqlcall="select idpratica,data,nome,cognome from pratiche where idpratica=" & trim(session("idpratica")) & " limit 1"
set tbupdrec=conn.execute(sqlcall)
session("idpratica")=tbupdrec("idpratica")
session("datapratica")=tbupdrec("data")	
text_nome=trim(tbupdrec("nome"))
text_cognome=trim(tbupdrec("cognome"))	
tbupdrec.close	

if lcase(trim(request("promemoria")))="si" then 
	'aggiunta premomoria
	 session("colore_promemoria")="#ff0000"
	text_note="consegna documenti " & replace(senza_apice(Request.Form("note")),"%20"," ") & " " & text_cognome & " " & text_nome
	text_dataapp=cdate(senza_apice(Request.Form("dataapp")))
	session("datapratica")=text_dataapp
	text_dataapp=year(text_dataapp) & "/"  & month(text_dataapp) &  "/" & day(text_dataapp)

	sql="insert into promemoria (data,note,nominativo,idpratica) values ('"+text_dataapp+"','"+text_note+"','"+session("loginnominativo")+"'," & session("idpratica") & ")"
	conn.execute(lcase(sql))	%>
	<div id="ciao" class="well" style="max-width:44em;"> 
      <a href=""> <img src="images/promemoriaok.jpg" border=0></a><br>
    <button class="ciao_close btn btn-default">Chiudi</button>
</div>
<%	
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
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- jQuery Popup Overlay -->
<script src="jquery.popupoverlay.js"></script>
<!-- Set defaults -->
<script language="javascript">
function stampa(divName) {
	 document.getElementById(divName).style.display = "none"; 
	 var printContents = document.getElementById(divName).innerHTML;
	 var originalContents = document.body.innerHTML;
	 document.body.innerHTML = printContents;
	 window.print();
	 document.body.innerHTML = originalContents;
}
function openpopup(divName) {
// Initialize the plugin
$('#basic').popup({
autoopen: true, /* per non far aprire al caricamento impostare su false */
transition: 'all 0.3s',
scrolllock: true
});
}
function subform() {
document.formpromo.submit();
}
$(document).ready(function () {
  $('#ciao').popup({
    autoopen: true, /* per non far aprire al caricamento impostare su false */
    transition: 'all 0.3s',
    scrolllock: true
  });
});
</script>
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
                                 
							
							
								 
							<div id="basic" style="width:400px;height:300px;display:none;background-color:white;font-size:12px;"> 
							<form action="addocumentiupload.asp?promemoria=si" method="post" id="formpromo" name="formpromo" >
							<table border="0" style="width:400px;height:300px;background-color:white;font-size:12px;" align="center" >
							<tr><td colspan="2" align="center" height="35px"><button class="btn btn-primary">PROMEMORIA</button></td></tr>
							<tr><td colspan="2" height="1px"><hr></td></tr>
							<tr>
							<td style="width:150px; text-align:right;" >
							<span class="bold">DATA&nbsp;CONSEGNA&nbsp;:<font color="#FF0000">*</font>&nbsp;&nbsp;</span>
							</td><td>
							<input type="date" id="dataapp" name="dataapp" style="border:1px solid #abadb3;" value="<%=(year(date) & "-"  & right("0" & month(date),2) &  "-" & right("0" & day(date),2))%>" size="30">
							</td>
							</tr>
							<tr><td colspan="2" height="1px"><hr></td></tr>
							<tr>
							<td style="width:150px; text-align:right;" >
							<span class="bold">CONSEGNA&nbsp;DOCUMENTI:<font color="#FF0000">*</font>&nbsp;&nbsp;</span>
							</td><td>
							<select  type="select" id="note" name="note">
									<option selected value="PRATICA N <%=session("idpratica")%> (INTESTATARIO)">PRATICA N <%=session("idpratica")%> (INTESTATARIO)</option>
							</select>
							</td>
							</tr>
							<tr><td colspan="2" height="1px"><hr></td></tr>
							<tr>
							<td align="center" colspan="2">
							<button type="button" onclick="subform();" class="btn btn-primary"  >INSER. PROMEMORIA</button>&nbsp;<button class="basic_close btn btn-default">CHIUDI</button>
							</td></tr>
							</table>
							</form>
							</div>
							
							
												<script>
												function changeok(testo,id) 		{
													swal("vuoi modificare il nome del campo ? "+testo+" .... ATTENZIONE!!! non si puo' piu ricambiare!!", {
												  buttons: {
												    
													cancel: "non modificare",
													defeat: "sii voglio modificare",
												  },icon: "warning",
												})
												.then((value) => {
												  switch (value) {
												 
													case "defeat":													
													var varnuovonome=document.getElementById('nuovonome').value;
													// alert(document.getElementById('nuovonome').value);
													location.href = 'addocumentiupload.asp?cambionome=si&iddoc='+id+'&testonuovo='+varnuovonome; 
													return true;
													//return false;
													
													default:
													return false;												
													
												  }
												});}
												</script>	
							
							<table cellspacing="0" border="0" cellpadding="0" align="left" style=<%=par_table_upload%>>	
							<form action="uploadallfile.asp" method="post" name="formupload" id="formupload"  enctype="multipart/form-data">							
							<%
							
						    sqltd="select * from pratiche_documenti where nometabella='pratiche' and idpratica='" & session("idpratica") & "' group by nomedocumento order by id asc "
							'response.write(sqltd)
							'response.end
							Set tbtd=Server.CreateObject("ADODB.Recordset")
							tbtd.open sqltd,conn	
							do while not tbtd.eof
							  %>							
									<tr> 
									<td align=left>
										<%if instr(lcase(trim(tbtd("nomedocumento"))),"altr")>0 then%>								
										<table cellspacing="0" border="0" cellpadding="0" width="100%"><tr>
										<td><b><%=senza_apice(tbtd("nomedocumento"))%></b></td>
										<td align=center><input type="text" placeholder="inserisci nome nuovo..." id="nuovonome" name="nuovonome"></td>
										<td style="color:#ffffff;" align="left"><button onclick="changeok('<%=senza_apice(tbtd("nomedocumento"))%>','<%=tbtd("id")%>');" style="background-color:#ffffff;color:#ffffff;"  type="button"><img src="images/assmioupload.png"></button></td>
										</tr></table>	
										<%else%>
										<b><%=senza_apice(tbtd("nomedocumento"))%></b><br>
										<%end if%>									
									<%=senza_apice(tbtd("tipodocumento"))%>
									</td>
									<%if tbtd("tipodocumento")<>"" then%>
										<td align=left><input type="file" name="<%=senza_apice(tbtd("nomedocumento"))%>"></td>
									<%end if%>
									<td align=left>&nbsp;&nbsp;</td>
									<%if tbtd("nomefile")<>"" then%>
									<td align=left>
									<a href="upload/<%=senza_apice(tbtd("nomefile"))%>">file presente (clicca)<br><%=mid(tbtd("nomefile"),40)%></a>
									</td>
									<%end if%>
									</tr>
									<tr><td colspan="4" height="15px"></td></tr>
							<% 
							 tbtd.movenext
							loop
							tbtd.close
							%>
								<tr> 
								<td align=left></td>
								<td align=left><input type="submit" class="btn btn-primary" value="upload"></td>
								<td align=left></td>
								</tr>
								<tr><td colspan=2><hr></td></tr>
								<tr>		
								<td align="left">&nbsp;<button type="button" onclick="stampa('corpo_articolo');" class="btn btn-primary"  >STAMPA LISTA DOCUMENTI</button></td>
								</tr>
								<tr><td colspan=2><hr></td></tr>
								<tr>
								<td align="left">&nbsp;<button type="button" onclick="openpopup('basic');" class="btn btn-primary" >PROMEMORIA DATA CONSEGNA</button></td>
								</tr>
								<tr><td colspan=2><hr></td></tr>
								<tr>
								<td align="left">&nbsp;<button type="button" onclick="javascript:history.back();" class="btn btn-primary"  >INDIETRO</button></td>
								</tr>
								</table>
							</form>
							
							
							
						
						
								<div id="corpo_articolo"  style="width:800px;background-color:white;display:none;font-size:10px;">
								<table cellspacing="0" border="0" cellpadding="0" width="100%" align="center" style="background-color:white;font-size:10px;">
								<tr><td colspan="4">
								<table><tr><td><img width="300px" src="../images/logohome.jpg"></td><td align="right"><%=session("loginsede")%><br><%=session("loginnominativo")%><br><%=session("logintel")%><br><%=session("loginmail")%></td></tr></table>
								</td></tr>
								<tr><td colspan="4" align="center" bgcolor="black"><font color="white">DOCUMENTAZIONE ANAGRAFICA</font></td></tr>												
								<%
								sqltd="select * from pratiche_documenti where nometabella='pratiche' and idpratica='" & session("idpratica") & "' group by nomedocumento order by id asc "
								'response.write(sqltd)
								'response.end
								Set tbtd=Server.CreateObject("ADODB.Recordset")
								tbtd.open sqltd,conn
								i=0								
								do while not tbtd.eof
								i=i+1%>							
									<tr> 
									<%if tbtd("nomefile")<>"" then%>
										<td align=center width="50px"><input  type="checkbox" checked id="<%=senza_apice(tbtd("nomedocumento"))%>"></td>
										<%else%>
										<td align=center width="50px"><input  type="checkbox"  id="<%=senza_apice(tbtd("nomedocumento"))%>"></td>
										<%end if%>
									<td align=left><b><%=senza_apice(tbtd("nomedocumento"))%></b></td><td align=left>&nbsp;&nbsp;</td></tr>								
								<% if i=7 then%>
								<tr><td colspan="4" align="center" bgcolor="black"><font color="white">DOCUMENTAZIONE REDDITUALE</font></td></tr>	
								<% end if
								tbtd.movenext
								loop
								tbtd.close
								
								%>
								<tr><td colspan="2" height="3px">Firma ______________________________ consegna il <%=session("datapratica")%></td></tr>
								</table>
								</div>
							
				
							
							
																		
							
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

		
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/startmin.js"></script>

    </body>
</html>
<%conn.Execute("repair table pratiche_documenti")%>
<!--#include file=closesql.inc-->