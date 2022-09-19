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
                
                                    <div class="panel panel-default">
									
									
									                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne1">LOG OPERAZIONI</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne1" class="panel-collapse collapse in">
                                            <div class="panel-body">


													<form name="formsearch" action="dblog.asp?ric=search" method="post">
													<div class="input-group custom-search-form" style="width:390px;">								    
													<input type="text" id="codice_per_ricerca"   name="codice_per_ricerca" class="form-control" placeholder="numero pratica...& eventuale tipo operazione ">
													<span class="input-group-btn">
														<button class="btn btn-primary" type="submit">
															<i class="fa fa-search"></i>
														</button>
													</span>									
													</div>
													</form>	

													<br>											
                                   
												<%
													if request("ric")="search" then
														'ricerca 
														if len(trim(request("codice_per_ricerca")))<>0 then
															cod_ric=trim(request("codice_per_ricerca")) 
														else
															cod_ric=trim(request.form("codice_per_ricerca")) 	
														end if
														aring=split(cod_ric," ")						
														filtroricerca=""
														'response.write(ubound(aring))
														for f=0 to ubound(aring)
															if trim(aring(f))<>"" and len(trim(aring(f)))>1 then
																filtroricerca=filtroricerca & " numeropratica = '" & trim(aring(f)) &  "' or  tipooperazione like '%" & trim(aring(f)) & "%' or descrizione like '%" & trim(aring(f)) & "%'  or "
															end if
														next														
														filtroricerca=" where (" & left(filtroricerca,len(filtroricerca)-3) & ") "
														'response.write(filtroricerca)
													end if  
												
												
                                                    session.lcid=1040    
													'DB TIPO LEAD
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "SELECT * FROM statschede " & filtroricerca & " order by id desc"
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