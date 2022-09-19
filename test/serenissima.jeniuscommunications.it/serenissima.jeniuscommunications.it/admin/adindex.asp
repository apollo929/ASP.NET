<!--#include file=connessionesql.inc-->
<%

session("titolonavigazione")="DASKBOARD"

filtroricerca=" where "
filtroricercan=" where "
if request("ric")="search" then
	'ricerca 
	if len(trim(request("codice_per_ricerca")))<>0 then
		cod_ric=trim(request("codice_per_ricerca")) 
	else
		cod_ric=trim(request.form("codice_per_ricerca")) 	
	end if
	aring=split(cod_ric," ")						
	filtroricerca=""
	filtroricercan=""
	'response.write(ubound(aring))
	for f=0 to ubound(aring)
		if trim(aring(f))<>"" and len(trim(aring(f)))>1 then
			filtroricerca=filtroricerca & " nome like '%" & trim(aring(f)) &  "%' or  idpratica like '%" & trim(aring(f)) & "%' or cognome like '%" & trim(aring(f)) & "%'  or "
			filtroricercan=filtroricercan & " nome like '%" & trim(aring(f)) & "%' or cognome like '%" & trim(aring(f)) & "%'  or "
		end if
	next
	'response.write(filtroricerca)
	filtroricerca=" where (" & left(filtroricerca,len(filtroricerca)-3) & ") and "
	filtroricercan=" where (" & left(filtroricercan,len(filtroricercan)-3) & ") and "
	'response.write(cod_ric)
	'response.write(filtroricerca)
	'response.end
	if trim(cod_ric)="" or len(trim(cod_ric))<=1 then
		filtroricerca=" where "
		filtroricercan=" where "
	end if
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
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- jQuery Popup Overlay -->
<script src="jquery.popupoverlay.js"></script>
<!-- Set defaults -->
<script language="javascript">
function openpopup(divName) {
// Initialize the plugin
$('#basic').popup({
autoopen: true, /* per non far aprire al caricamento impostare su false */
transition: 'all 0.3s',
scrolllock: true
});
}
$(document).ready(function () {
  $('#promemoria').popup({
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
				<!--#include file=top_menu_sotto.inc-->

                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                  
                                    <div class="panel panel-default">
									
									
									<!--#include file=top_menu_footer.inc-->

										
                                    </div>
									
									
									<!--------------promemoria-------------->
									<!--------------promemoria-------------->
									<!--------------promemoria-------------->
									<%	text_datapromemoria=date()
										text_datapromemoria=year(text_datapromemoria) & "/"  & month(text_datapromemoria) &  "/" & day(text_datapromemoria)
										sqlcontrollo="select id from promemoria where nominativo like '%" & session("loginnominativo") & "%' and data<='" & text_datapromemoria & "' limit 1"
										set tbcontrollo=conn.execute(sqlcontrollo)
										'response.write(sqlcontrollo)
										if not tbcontrollo.eof then 
										   session("colore_promemoria")="#ff0000"
										   else
										   session("colore_promemoria")="#ffffff"
										end if   
										if not tbcontrollo.eof and trim(request("log"))="ok" then
										%>
												<div id="promemoria" class="well" style="max-width:44em;"> 
												<table border="0" style="width:350px;height:400px;background-color:white;font-size:12px;" align="center" >
												<tr><td colspan="2" align="center" height="35px"><button class="btn btn-primary">PROMEMORIA</button></td></tr>					
												<tr><td colspan="2" align="center" height="1px"><%
													  
													'DB TIPO LEAD
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "select id,data,note,idpratica from promemoria where nominativo like '%" & session("loginnominativo") & "%' and data<='" & text_datapromemoria & "'"
													Grid.Cols("id").hidden=True
													Grid.ExtraFormItems = "<INPUT TYPE=HIDDEN NAME=log VALUE=ok>"
													Grid.Cols("idpratica").Caption="&nbsp;"
													Grid.Cols("idpratica").AttachExpression "<a class=navy11 HREF=""adinsertpratica4.asp?doc=doc&idpratica={{idpratica}}""><center><img src='images/user.png' border='0'></center></a>"
													Grid.Cols("data").readonly=True
													Grid.Cols("note").readonly=True
													Grid.Cols("data").FormatDate "%d %m, %Y"
													Grid.Cols("note").Caption="___________note____________"
													Grid.Cols("data").Caption="&nbsp;&nbsp;___data___&nbsp;&nbsp;"
													'MAX RECORD
													Grid.MaxRows=40		
													' Enable sorting
													Grid.ColRange(1,33).CanSort = False
													Grid.ColRange(1,33).Cell.Align = "center"
													' Set Colors
													Grid.ColRange(1,33).Header.BGColor = "#f6f6f6"
													Grid.ColRange(1,33).Header.Font.Face = "sans-serif"
													Grid.ColRange(1,33).Cell.Font.Face = "sans-serif"
													Grid.ColRange(1,33).Cell.Font.Size = par_font_size
													Grid.ColRange(1,33).Header.Font.Size = par_font_size														
													' Specify location of button images
													Grid.ImagePath = "images/"
													' Set <TABLE> attributes
													Grid.Table.Border = 0
													Grid.Table.CellSpacing = 0
													Grid.Table.CellPadding =0
													Grid.CanAppend = False	
													Grid.CanEdit = False										
													Grid.readonly = False
													Grid.Display
													Grid.Disconnect

													Set Grid = Nothing
													
												%></td></tr>
												<tr><td colspan="2" height="1px"><hr></td></tr>
												<tr>
												<td align="center" colspan="2">
												<button class="promemoria_close btn btn-default">CHIUDI</button>
												</td></tr>
												</table>
												</div>	
										<%
										
										tbcontrollo.close
										end if
									%>	
									<!--------------promemoria-------------->
									<!--------------promemoria-------------->
									<!--------------promemoria-------------->
									
						
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
        <script src="js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="js/startmin.js"></script>

    </body>
</html>
<%'log al primo collegamento
if trim(request("log"))="ok" then loggaVisSchede "daskboard","home","homepage","collegamento al sito homepage",session("loginnominativo")
%>
<!--#include file=closesql.inc-->