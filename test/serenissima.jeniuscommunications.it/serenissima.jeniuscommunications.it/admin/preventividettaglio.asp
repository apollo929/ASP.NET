<!--#include file=connessionesql.inc-->
<%
if session("loginid")="" then response.Redirect("../login.asp")
intid=request("id")
 ' province
Set Tbprov = Server.CreateObject("ADODB.Recordset")
Sqlp="select * from province order by provincia"
Tbprov.Open Sqlp,conn
'if session("abilitatocrediti")<>1 then response.Redirect("abbonati.asp")

'estrapolo dati dal preventivo
Set Tbscheda=Server.CreateObject("ADODB.Recordset")
sql="Select * From preventivi where Id= '"& intid &"' limit 1"
Tbscheda.open sql,conn

%>
<!DOCTYPE html>
<html lang="en">
<!--#include file=metatag.inc-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Startmin - Bootstrap Admin Theme</title>

        <<!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <div id="wrapper">

			<!--#include file=topmenu.inc-->
			<!--#include file=navbarback.inc-->
			<!--#include file=top_menu_sotto.inc-->
			<!--#include file="province.asp"-->
				
				
                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
													<div class="panel-group" id="accordion">
													<div class="alert alert-warning">
													Provincia:<a href="#" class="alert-link"><%response.Write(" " & Tbscheda("provincia"))%></a>.
													</div>
													<div class="alert alert-success alert-dismissable">
													Città:<a href="#" class="alert-link"><%response.Write(" " & Tbscheda("citta"))%></a>.
													</div>
													<div class="alert alert-danger alert-dismissable">
													<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
													Dettagli intervento:<a href="#" class="alert-link"><%response.Write(Tbscheda("dettagli"))%></a>.
													</div>
													<div class="col-lg-12">													
													<%if session("crediti")<>0 then
													response.Redirect("certificato.asp?id=" & intid)%>
													<%end if%>
													<%if  session("crediti")=0 then%>								
													<h3>Avete esaurito il vostro credito .<a href="abbonati.asp">Clicca qui per ricaricare</a></h3>
													<%End if%>
													<a href="abbonati.asp"><img src="images/acquista.png" alt=""></a>
													</div>
													<!-- /.row -->						
									
									
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
