<!--#include file=connessionesql.inc-->
<%

if trim(session("idpratica"))="" then response.redirect "adindex.asp"
session("titolonavigazione")="AGGIORNAMENTO FINALE"

'CHANGE
if trim(request("change"))="1" then
			strsqlupdate_dati="update pratiche set dati='1' where idpratica=" & session("idpratica")
			conn.Execute(lcase(strsqlupdate_dati))	
 			'log
			loggaVisSchede "cambio stato pratica","status pratica",session("idpratica"),"modifica status - compilazione dati (VERDE) ",session("loginnominativo")
end if
if trim(request("change"))="2" then
			strsqlupdate_dati="update pratiche set allegati='1' where idpratica=" & session("idpratica")
			conn.Execute(lcase(strsqlupdate_dati))	
 			'log
			loggaVisSchede "cambio stato pratica","status pratica",session("idpratica"),"modifica status - allegati (VERDE) ",session("loginnominativo")
end if
if trim(request("change"))="3" then
			strsqlupdate_dati="update pratiche set esitibanca='1' where idpratica=" & session("idpratica")
			conn.Execute(lcase(strsqlupdate_dati))	
 			'log
			loggaVisSchede "cambio stato pratica","status pratica",session("idpratica"),"modifica status - esiti banca (VERDE) ",session("loginnominativo")
end if
if trim(request("change"))="4" then
			strsqlupdate_dati="update pratiche set inviopratica='1' where idpratica=" & session("idpratica")
			conn.Execute(lcase(strsqlupdate_dati))	
 			'log
			loggaVisSchede "cambio stato pratica","status pratica",session("idpratica"),"modifica status - invio pratica (VERDE) ",session("loginnominativo")
end if
if trim(request("change"))="5" then
			strsqlupdate_dati="update pratiche set perizia='1' where idpratica=" & session("idpratica")
			conn.Execute(lcase(strsqlupdate_dati))	
 			'log
			loggaVisSchede "cambio stato pratica","status pratica",session("idpratica"),"modifica status - perizia (VERDE) ",session("loginnominativo")
end if
if trim(request("change"))="6" then
			strsqlupdate_dati="update pratiche set rogito='1' where idpratica=" & session("idpratica")
			conn.Execute(lcase(strsqlupdate_dati))	
 			'log
			loggaVisSchede "cambio stato pratica","status pratica",session("idpratica"),"modifica status - rogito (VERDE) ",session("loginnominativo")
end if

%>
<!DOCTYPE html>
<html lang="en">
<head>
<TITLE>KIRON S.p.A</TITLE>
<meta name="keywords" content="KIRON S.p.A">
<meta name="description" content="KIRON S.p.A">

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
                  
                                    <div class="panel panel-default">
								            <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne1">FINALE PRATICA</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne1" class="panel-collapse collapse in">
                                            <div class="panel-body">


												<script>
												function changeok(testo,id) 		{
													swal("vuoi cambiare stato (VERDE) ? "+testo, {
												  buttons: {
													cancel: "non modificare",
													defeat: "sii voglio modificare",
												  },
												})
												.then((value) => {
												  switch (value) {
												 
													case "defeat":
													location.href = 'adinsertpraticasave2.asp?change='+id; 
													return true;
													
													default:
													return false;
													
													
												  }
												});}
												</script>								
                                   
												<%  
													'repair  
													'conn.Execute("repair table pratiche")
                                                    session.lcid=1040    
													'Database Pratiche
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "select idpratica as numpratica,idpratica as modificapratica,idpratica as docpratica,idpratica,numeropratica,nome,cognome,provincia,mobile,dati,allegati,esitibanca,inviopratica,perizia,rogito,data from pratiche where idpratica=" & session("idpratica") & " and agente like '%" & session("loginnominativo") & "%' order by idpratica desc limit 1"
													'response.write(Grid.SQL)
													'response.write(Grid.SQL)
													'Grid.Cols("numpratica").AttachExpression "<a class=navy11 HREF=""adinsertpratica2.asp?update=modifica&idpratica={{idpratica}}""><center><img src='images/user.png' border='0'></center></a>"
													'Grid.Cols("modificapratica").AttachExpression "<a class=navy11 HREF=""admodificapratica.asp?oper=modifica&idpratica={{idpratica}}""><center><img src='images/edit.gif' border='0'></center></a>"
													Grid.Cols("numpratica").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("modificapratica").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													'Grid.Cols("docpratica").AttachExpression "<a class=navy11 HREF=""adinsertpratica4.asp?doc=doc&idpratica={{idpratica}}""><center><img src='images/scambia.png' border='0'></center></a>"
													Grid.Cols("docpratica").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("idpratica").hidden = True
													Grid.Cols("numpratica").hidden = True
													Grid.Cols("modificapratica").hidden = True
													Grid.Cols("docpratica").hidden = True
													Grid.Cols("idpratica").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("nome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("cognome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cognome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													'Grid.Cols("mail").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("mobile").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mobile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("dati").Caption="compilazione dati"
													Grid.Cols("esitibanca").Caption="&nbsp;esito banca&nbsp;&nbsp;"
													Grid.Cols("allegati").Caption="&nbsp;inserimento allegati&nbsp;&nbsp;&nbsp;"
													Grid.Cols("inviopratica").Caption="&nbsp;&nbsp;invio pratica&nbsp;"
													Grid.Cols("perizia").Caption="&nbsp;perizia&nbsp;"
													Grid.Cols("rogito").Caption="&nbsp;rogito&nbsp;"
													Grid.Cols("data").Caption="&nbsp;&nbsp;data_operazione.&nbsp;&nbsp;"
													Grid.Cols("data").FormatDate "%d %m, %Y"
													'MAX RECORD
													Grid.MaxRows=1
													Grid("dati").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>","<img src='images/nonrisposti.png' border='0'>")
													Grid("dati").VArray = Array(0, 1, 2) ' DB values	
													Grid("esitibanca").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													Grid("esitibanca").VArray = Array(0, 1) ' DB valuezs
													Grid("allegati").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>","<img src='images/nonrisposti.png' border='0'>")
													Grid("allegati").VArray = Array(0, 1, 2) ' DB values
													Grid("inviopratica").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													Grid("inviopratica").VArray = Array(0, 1) ' DB values
													Grid("perizia").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													Grid("perizia").VArray = Array(0, 1) ' DB values
													Grid("rogito").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													Grid("rogito").VArray = Array(0, 1) ' DB values
												    
													
													' Enable sorting
													Grid.ColRange(1,33).CanSort = False
													Grid.ColRange(1,33).Cell.Align = "center"
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
													Grid.Table.Border = 0
													Grid.Table.CellSpacing = 0
													Grid.Table.CellPadding =0
														
													Grid.readonly = True
													Grid.Display
													Grid.Disconnect

													Set Grid = Nothing
													
												%>
												
													<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0">
													<TR><TH BGCOLOR="#f6f6f6"><FONT COLOR="#f6f6f6" FACE="sans-serif" SIZE="2">numeropratica</FONT></TH><TH BGCOLOR="#f6f6f6"><FONT COLOR="#f6f6f6" FACE="sans-serif" SIZE="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT></TH><TH BGCOLOR="#f6f6f6"><FONT COLOR="#f6f6f6" FACE="sans-serif" SIZE="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cognome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT></TH><TH BGCOLOR="#f6f6f6"><FONT COLOR="#f6f6f6" FACE="sans-serif" SIZE="2">provincia</FONT></TH><TH BGCOLOR="#f6f6f6"><FONT COLOR="#f6f6f6" FACE="sans-serif" SIZE="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mobile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT></TH><TH BGCOLOR="#f6f6f6"><FONT FACE="sans-serif" SIZE="2">compilazione dati</FONT></TH><TH BGCOLOR="#f6f6f6"><FONT FACE="sans-serif" SIZE="2">&nbsp;inserimento allegati&nbsp;&nbsp;&nbsp;</FONT></TH><TH BGCOLOR="#f6f6f6"><FONT FACE="sans-serif" SIZE="2">&nbsp;esito banca&nbsp;&nbsp;</FONT></TH><TH BGCOLOR="#f6f6f6"><FONT FACE="sans-serif" SIZE="2">&nbsp;&nbsp;invio pratica&nbsp;</FONT></TH><TH BGCOLOR="#f6f6f6"><FONT FACE="sans-serif" SIZE="2">&nbsp;perizia&nbsp;</FONT></TH><TH BGCOLOR="#f6f6f6"><FONT FACE="sans-serif" SIZE="2">&nbsp;rogito&nbsp;</FONT></TH><TH BGCOLOR="#f6f6f6"><FONT FACE="sans-serif" SIZE="2">&nbsp;&nbsp;&nbsp;&nbsp;</FONT></TH></TR>													
													<TR><TD ALIGN="center"><FONT FACE="sans-serif" SIZE="2"></FONT></TD><TD ALIGN="center"><FONT FACE="sans-serif" SIZE="2"></FONT></TD><TD ALIGN="center"><FONT FACE="sans-serif" SIZE="2"></FONT></TD><TD ALIGN="center"><FONT FACE="sans-serif" SIZE="2"></FONT></TD><TD ALIGN="center"><FONT FACE="sans-serif" SIZE="2"></FONT></TD><TD ALIGN="center"><FONT FACE="sans-serif" SIZE="2"><a onclick="changeok('COMPILAZIONE DATI','1');" href="#"><img src='images/assmio.png' border='0'></a></FONT></TD><TD ALIGN="center"><FONT FACE="sans-serif" SIZE="2"><a onclick="changeok('INSERIMENTO ALLEGATI','2');" href="#"><img src='images/assmio.png' border='0'></a></FONT></TD><TD ALIGN="center"><FONT FACE="sans-serif" SIZE="2"><a onclick="changeok('ESITO BANCA','3');" href="#"><img src='images/assmio.png' border='0'></a></FONT></TD><TD ALIGN="center"><FONT FACE="sans-serif" SIZE="2"><a onclick="changeok('INVIO PRATICA BANCA','4');" href="#"><img src='images/assmio.png' border='0'></a></FONT></TD><TD ALIGN="center"><FONT FACE="sans-serif" SIZE="2"><a onclick="changeok('PERIZIA','5');" href="#"><img src='images/assmio.png' border='0'></a></FONT></TD><TD ALIGN="center"><FONT FACE="sans-serif" SIZE="2"><a onclick="changeok('ROGITO','6');" href="#"><img src='images/assmio.png' border='0'></a></FONT></TD><TD ALIGN="center"><FONT FACE="sans-serif" SIZE="2"></FONT></TD></TR>
													</TABLE>
													<br><br>
													<hr><br>
													OPERAZIONE ESEGUITE NELLA PRATICA
													
													
																									<%
													   
													'DB LOG
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "SELECT * FROM statschede where numeropratica='" & cstr(session("idpratica")) & "' order by id desc"
													Grid.Cols("id").hidden=True
													Grid.Cols("data").FormatDate "%d %m, %Y %H:%M:%S"
													Grid.Cols("tipooperazione").Caption="&nbsp;&nbsp;&nbsp;&nbsp;tipo_operazione&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("data").Caption="&nbsp;&nbsp;&nbsp;&nbsp;data_operazione&nbsp;&nbsp;&nbsp;&nbsp;"
													'MAX RECORD
													Grid.MaxRows=240		
													' Enable sorting
													Grid.ColRange(1,22).CanSort = true
													Grid.ColRange(1,22).Cell.Align = "left"													
													' Set Colors
													Grid.ColRange(1,22).Header.BGColor = "#f6f6f6"
													Grid.ColRange(1,22).Header.Font.Face = "sans-serif"
													Grid.ColRange(1,22).Cell.Font.Face = "sans-serif"
													Grid.ColRange(1,33).Cell.Font.Size = par_font_size
													Grid.ColRange(1,33).Header.Font.Size = par_font_size
													Grid(0).Header.BGColor = "#f6f6f6"
													Grid(999).Header.BGColor = "#f6f6f6"															
													' Specify location of button images
													Grid.ImagePath = "images/"
													' Set <TABLE> attributes
													Grid.Table.Border = 0
													Grid.Table.CellSpacing = 0
													Grid.Table.CellPadding =0
														
													Grid.readonly = true
													Grid.Display
													Grid.Disconnect

													Set Grid = Nothing
													
												%>

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
<!--#include file=closesql.inc-->