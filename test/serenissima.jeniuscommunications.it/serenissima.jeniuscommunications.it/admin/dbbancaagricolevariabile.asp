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
									
									
															<%
                                                    session.lcid=1040    
													'DB TIPO LEAD
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "select * from banca_agricole_var"
													Grid.Cols("id").hidden=True
													Grid.Cols("mutuo").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mutuo&nbsp;anni&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("ltv%").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_____ltv%_____&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("spread%").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;spread%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("cap%").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cap%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("tftv").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TF-TV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("banca").Caption="&nbsp;&nbsp;&nbsp;&nbsp;NOME&nbsp;BANCA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid("tftv").Array = Array("TF","TV")
													Grid("banca").AttachForeignTable "select id, banca from banca_lista", 2, 2
													
													Grid("ltv%").DefaultValue = "<xx  ltv =<xx"
													'MAX RECORD
													Grid.MaxRows=40		
													' Enable sorting
													Grid.ColRange(1,15).CanSort = False
													Grid.ColRange(1,15).Cell.Align = "center"													
													' Set Colors
													Grid.ColRange(1,15).Header.BGColor = "#f6f6f6"
													Grid.ColRange(1,15).Header.Font.Face = "sans-serif"
													Grid.ColRange(1,15).Cell.Font.Face = "sans-serif"
													Grid.ColRange(1,15).Cell.Font.Size = "2"
													Grid.ColRange(1,15).Header.Font.Size = "2"
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