<!--#include file=connessionesql.inc-->
<%
if session("Ragione")="" then response.redirect("../login.asp")
if session("loginid")="" then response.Redirect("../login.asp")

'cerco azienda su database
Set tblista=Server.CreateObject("ADODB.Recordset")
SQLaccedi="Select * From lista where id=" & session("loginid") & " LIMIT 1 union Select * From lista1 where id=" & session("loginid") & " LIMIT 1"
tblista.open SQLaccedi,conn
if not tblista.eof then	
	'inizializzo le variabili session
	session("nome")=""
	session("cognome")=""
	session("ragione")=tblista("ragione1")
	session("loginid")=tblista("Id")
	session("sesmail")=tblista("mail")
	session("sesprovincia")=tblista("provincia")
	session("sesragione")=tblista("ragione1")
	session("telefono")=tblista("cellulare")
	session("crediti")=Tblista("preventivicrediti")
	session("abilitatocrediti")=Tblista("abilitatocrediti")
end if

' province
Set Tbprov = Server.CreateObject("ADODB.Recordset")
Sqlp="select * from province order by provincia"
Tbprov.Open Sqlp,conn


%>
<!DOCTYPE html>
<html lang="en">
    <head>
	<!--#include file=metatag.inc-->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Backoffice Costruttori</title>

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

            <!-- Navigation -->
				<!--#include file=topmenu.inc-->
				<!-- /.navbar-top-links -->
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
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">DATI CLIENTE</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">							
              
			  
												<div class="col-lg-4">

												<!-- Standard button -->
												RAGIONE SOCIALE : <button type="button" class="btn btn-lg btn-default"><%=session("ragione")%></button><br><br>

												<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
												E@MAIL          : <button type="button" class="btn btn-lg btn-default"><%=session("sesmail")%></button><br><br>

												<!-- Indicates a successful or positive action -->
												PROVINCIA       : <button type="button" class="btn btn-lg btn-default"><%=session("sesprovincia")%></button><br><br>

												<!-- Contextual button for informational alert messages -->
												CELLULARE       : <button type="button" class="btn btn-lg btn-default"><%=session("telefono")%></button><br><br>

												<!-- Indicates caution should be taken with this action -->
												USERNAME        : <button type="button" class="btn btn-lg btn-warning"><%=Tblista("username")%></button><br><br>

												<!-- Indicates a dangerous or potentially negative action -->
												PASSWORD        : <button type="button" class="btn btn-lg btn-danger"><%=Tblista("psw")%></button><br><br>
												</div>
                               
			  
		
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
<%tblista.close%>
<!--#include file=closesql.inc-->