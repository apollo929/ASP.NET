<!--#include file=connessionesql.inc-->
<%  
if request("idpratica")<>"" then  session("idpratica")=trim(request("idpratica"))  
if trim(session("idpratica"))="" then response.redirect "adindex.asp"
  
'controllo form
sqlcall="select idpratica,data,nome,cognome,nometabella from pratiche where idpratica=" & trim(session("idpratica")) & " limit 1"
set tbupdrec=conn.execute(sqlcall)
session("idpratica")=tbupdrec("idpratica")
session("datapratica")=tbupdrec("data")	
text_nome=trim(tbupdrec("nome"))
text_cognome=trim(tbupdrec("cognome"))
'response.write(sqlcall)
'response.end	
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
                                 
								 						<table>
														<tr><td colspan=2><hr></td></tr>
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
														<td align=left>DATA PRATICA :</td>
														<td align=left><input type="text" size="35" id="datapratica"  name="datapratica" readonly="readonly" value="<%=session("datapratica")%>"></td>
														</tr>
														<tr><td colspan="2" height="15px"></td></tr>
								 <tr><td colspan="2" >

					<%
                                                    session.lcid=1040    
													'DB TIPO DOCUMENTI
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "select id,idpratica,idpratica as idcanc,nome,cognome,tipologia,debitoresiduo,importorata,scadenza,istituto,note,nometabella from pratiche_finanziarie where idpratica=" & session("idpratica") & " group by importorata order by importorata desc"
													Grid.Cols("idpratica").AttachExpression "<a class=navy11 HREF=""adinsertfinan.asp?gen=gen&nometabella={{nometabella}}&tipooperazione=insert&idpratica={{idpratica}}&id={{id}}""><center><img src='images/edit.gif' border='0'></center></a>"
													Grid.Cols("idcanc").AttachExpression "<a class=navy11 HREF=""adinsertfinan.asp?gen=gen&nometabella={{nometabella}}&tipooperazione=delete&idpratica={{idpratica}}&id={{id}}""><center><img src='images/elimina.png' border='0'></center></a>"
													Grid.Cols("id").hidden = True	
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
													Grid.DeleteButtonOnClick = "Are you sure you want to delete this record?" 
													
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
	
														</td></tr>
<tr><td colspan="2" height="15px"></td></tr>														
														<tr>
													
														<td align="left">&nbsp;<button type="button" onclick="javascript:history.back();" class="btn btn-primary"  >INDIETRO</button></td>
														</tr>
													</table>
													
								 
								 
                                </div>
                            </div>
                            <!-- .panel-body -->
                        					
                
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