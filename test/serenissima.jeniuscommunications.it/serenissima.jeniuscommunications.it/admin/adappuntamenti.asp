<!--#include file=connessionesql.inc-->
<%
if request("canc")="yes" and isnumeric(request("id"))=true then
	'appuntamento da trovare
	sqlmod="select * from appuntamenti where id=" & cdbl(request("id"))
	set tbapp=conn.execute(sqlmod)						
	text_cognome=senza_apice(tbapp("cognome"))
	text_nome=senza_apice(tbapp("nome"))
	tbapp.close
	sqldel="delete from appuntamenti where id=" & cdbl(request("id"))
	conn.execute(sqldel)
	loggaVisSchede "elimina appuntamento","elimina appuntamento","eliminato appuntamento di " & text_cognome & "  " & text_nome,"elimina appuntamento",session("loginnominativo")
	response.redirect "adappuntamenti.asp"
end if

'filtro 
filtro=" order by id desc "
if trim(request("tric"))="0" then filtro=" and month(data)=MONTH(curdate()) order by data asc"
if trim(request("tric"))="1" then filtro=" and day(data)=DAY(curdate()) order by data desc"
if trim(request("tric"))="2" then filtro=" and day(data)=DAY(curdate()+1) order by data desc"
if trim(request("tric"))="3" then filtro=" and month(data)=(MONTH(CURDATE()) + 1)  order by data desc"

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
				<!--#include file=top_menu_sotto.inc-->

                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                       
                                    <div class="panel panel-default">
									




									   <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne1">LISTA APPUNTAMENTI</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne1" class="panel-collapse collapse in">
                                            <div class="panel-body">

											
													<script type="text/javascript">
													function cancella(id)
													{
													swal("sei sicuro di voler cancellare?", {
													buttons: {
													cancel: "non cancellare",
													defeat: "cancella appuntamento",
													},
													})
													.then((value) => {
													switch (value) {

													case "defeat":
													location.href = 'adappuntamenti.asp?canc=yes&id=' + id;
													return true;

													default:
													return false;
													//location.href = 'adappuntamentiKO.asp?appuntamento=yes&id='+id; 

													}
													});}
													</script>
									<%

													'Database Pratiche
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "select id as numpratica,id as idcanc,data,time,nome,cognome,titolo,indirizzoapp,noteapp,esito,esitodesc,operazione from appuntamenti where idcontatto='" & session("loginid") & "'" & filtro 
													'response.write(Grid.SQL)
													Grid.Cols("numpratica").AttachExpression "<a class=navy11 HREF=""adappuntamentivisua.asp?id={{numpratica}}""><center><img src='images/user.png' border='0'>&nbsp;&nbsp;&nbsp;&nbsp;</center></a>"
													Grid.Cols("idcanc").AttachExpression "<a class=navy11 onclick=""cancella({{idcanc}})""><center><img src='images/elimina.png' border='0'>&nbsp;&nbsp;&nbsp;&nbsp;</center></a>"
													Grid.Cols("numpratica").Caption="&nbsp;"
													'Grid.Cols("id").readonly = True
													Grid.Cols("idcanc").Caption="&nbsp;"
													Grid.Cols("data").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data&nbsp;app.&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("time").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ora&nbsp;app.&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("cognome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cognome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("nome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("indirizzoapp").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;luogo&nbsp;incontro&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("titolo").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;motivo&nbsp;incontro&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("noteapp").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;note&nbsp;appuntamento&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("esito").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;esito&nbsp;app.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("esitodesc").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;esito&nbsp;desc&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid("data").FormatDate "%d %b %Y", "%d %b %Y"
													Grid("operazione").FormatDate "%d %b %Y", "%d %b %Y"
													'MAX RECORD
													Grid.MaxRows=100
													'Grid("dati").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>","<img src='images/nonrisposti.png' border='0'>")
													'Grid("dati").VArray = Array(0, 1, 2) ' DB values	
													Grid("esito").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>","<img src='images/nonrisposti.png' border='0'>")
													Grid("esito").VArray = Array(0, 1, 2) ' DB values
													'Grid("allegati").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>","<img src='images/nonrisposti.png' border='0'>")
													'Grid("allegati").VArray = Array(0, 1, 2) ' DB values
													'Grid("inviopratica").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													'Grid("inviopratica").VArray = Array(0, 1) ' DB values
													
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