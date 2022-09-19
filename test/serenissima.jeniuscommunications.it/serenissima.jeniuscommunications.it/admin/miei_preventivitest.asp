<!--#include file=connessionesql.inc-->
<!DOCTYPE html>
<html lang="en">
    <head>
	<!--#include file=metatag.inc-->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Backoffice costruttori</title>

        <!-- Bootstrap Core CSS -->
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
	<%
if session("Ragione")="" then response.redirect("../login.asp")
if session("loginid")="" then response.Redirect("../login.asp")
intid=request("id")
' province
Set Tbprov = Server.CreateObject("ADODB.Recordset")
Sqlp="select * from province order by provincia"
Tbprov.Open Sqlp,conn

'apro tabella con preventivi acquistati
Set mio=Server.CreateObject("ADODB.Recordset")
Sqlmio="Select * From preventiviacquistati where idazienda='" & session("loginid") & "' order by id desc limit 100"
mio.open Sqlmio,conn %>

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
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">I Miei preventivi ACQUISTATI</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">							

															<%i=0
															do while not mio.EOF
															i=i+1
															varcss=""
															if i=1 then varcss="<div class='alert alert-success'>"
															if i=2 then varcss="<div class='alert alert-info'>"
															if i=3 then varcss="<div class='alert alert-warning'>"
															if i=4 then varcss="<div class='alert alert-danger'>"															
															Set interventi=Server.CreateObject("ADODB.Recordset")
															sqlin="Select * From preventivi where id='" & mio("idpreventivo") & "' limit 1 "
															interventi.open sqlin,conn
															if not interventi.eof then
															    response.write(varcss)
																response.write(ucase(interventi("provincia")) & "<br>")
																varcat="Iniz." & interventi("iniziopubb") & " Scad." & interventi("finepubb")
																response.Write("<a href=preventividettaglio.asp?id=" & Trim(interventi("id")) & ">" & "<strong>" & varcat & "</strong>" & " <strong>Intervento:</strong> " & lcase(Mid(interventi("dettagli"),1,200)) & "(...)" &"</a><br>" )
																response.write("</div>")
																if i=4 then i=0
															else
															    i=i-1
															end if
															interventi.close
															mio.MoveNext	
															loop
															mio.close%>
												
                                            </div>
                                        </div>
                                    </div>
									<!--#include file=top_menu_footer.inc-->
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