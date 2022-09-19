<!--#include file=connessionesql.inc-->
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
				<!--#include file=top_menu_sotto.inc-->
			

                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
									
									
									                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne1">DB AMMINISTRATORE</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne1" class="panel-collapse collapse in">
                                            <div class="panel-body">							
                                   
												<%
                                                    session.lcid=1040    
													'DB AMMINISTRATORE
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "select * from amministratore"
													'Grid.Cols("numpratica").AttachExpression "<a class=navy11 HREF=""adinsertpratica2.asp?update=modifica&idpratica={{idpratica}}""><center><img src='images/user.png' border='0'></center></a>"
													'Grid.Cols("numpratica").Caption="&nbsp;"
													'Grid.Cols("numeropratica").Caption="&nbsp;n&nbsp;pratica&nbsp;"
													Grid.Cols("id").readonly = True
													Grid.Cols("id").hidden=True
												    Grid.Cols("id").Caption="&nbsp;"
													Grid.Cols("email").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;___email___&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("utentetipo").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tipo&nbsp;utente&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("sede").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sede&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													'Grid.Cols("cognome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cognome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													'Grid.Cols("mail").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													'Grid.Cols("mobile").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mobile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													'Grid.Cols("dati").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;compilazione dati&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													'Grid.Cols("esitibanca").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;esito banca&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													'Grid.Cols("allegati").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inserito allegati&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													'Grid.Cols("inviopratica").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inviata pratica&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													'Grid("data").FormatDate "%d %b %Y", "%d %b %Y"
													'MAX RECORD
													Grid.MaxRows=40
													'Grid("dati").Array = Array("<a HREF=""adinsertpratica2.asp?idpratica=[[idpratica]]""><img src='images/no.png' border='0'></a>","<a HREF=""adinsertpratica4.asp?idpratica=[[idpratica]]""><img src='images/si.png' border='0'></a>","<a HREF=""adinsertpratica4.asp?idpratica=[[idpratica]]""><img src='images/nonrisposti.png' border='0'></a>")
													'Grid("dati").VArray = Array(0, 1, 2) ' DB values	
													'Grid("esitibanca").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													'Grid("esitibanca").VArray = Array(0, 1) ' DB valuezs
													'Grid("allegati").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>","<img src='images/nonrisposti.png' border='0'>")
													'Grid("allegati").VArray = Array(0, 1, 2) ' DB values
													'Grid("inviopratica").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													'Grid("inviopratica").VArray = Array(0, 1) ' DB values
													
													'Grid.Cols("data").FormatDate "%d %m, %Y"
													'Grid.DeleteButtonOnClick = "Are you sure you want to delete this record?" 
													
													' Enable sorting
													Grid.ColRange(1,33).CanSort = False
													Grid.ColRange(1,33).Cell.Align = "center"
													Grid.Cols("utentetipo").Cell.Align = "center"
													Grid.Cols("email").Cell.Align = "center"
													' Set Colors
													Grid.ColRange(1,33).Header.BGColor = "#f6f6f6"
													Grid.ColRange(1,33).Header.Font.Face = "sans-serif"
													Grid.ColRange(1,33).Cell.Font.Face = "sans-serif"
													Grid.ColRange(1,33).Cell.Font.Size = "1"
													Grid.ColRange(1,33).Header.Font.Size = "1"
													Grid(0).Header.BGColor = "#f6f6f6"
													Grid(999).Header.BGColor = "#f6f6f6"
													
						
															
													' Specify location of button images
													Grid.ImagePath = "images/"
													' Set <TABLE> attributes
													Grid.Table.Border = 0
													Grid.Table.CellSpacing = 0
													Grid.Table.CellPadding =0
														
													Grid.readonly = False
													Grid.Display
													Grid.Disconnect

													Set Grid = Nothing
													
												%>

                                            </div>
                                        </div>
										

										
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