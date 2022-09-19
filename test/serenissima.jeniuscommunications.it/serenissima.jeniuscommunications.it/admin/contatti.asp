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
<%
if session("Ragione")="" then response.redirect("../login.asp")
if session("loginid")="" then response.Redirect("../login.asp")
intid=request("id")
' province
Set Tbprov = Server.CreateObject("ADODB.Recordset")
Sqlp="select * from province order by provincia"
Tbprov.Open Sqlp,conn
%>
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
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Contatti</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">							
              
			  
			  
														insert form
																							<!-- Standard button -->
                                <button type="button" class="btn btn-lg btn-default">Default</button>

                                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                <button type="button" class="btn btn-lg btn-primary">Primary</button>

                                <!-- Indicates a successful or positive action -->
                                <button type="button" class="btn btn-lg btn-success">Success</button>

                                <!-- Contextual button for informational alert messages -->
                                <button type="button" class="btn btn-lg btn-info">Info</button>

                                <!-- Indicates caution should be taken with this action -->
                                <button type="button" class="btn btn-lg btn-warning">Warning</button>

                                <!-- Indicates a dangerous or potentially negative action -->
                                <button type="button" class="btn btn-lg btn-danger">Danger</button>

                                <!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
                                <button type="button" class="btn btn-lg btn-link">Link</button>
                            </div>
                            <div class="margin-bottom">
                                <!-- Standard button -->
                                <button type="button" class="btn btn-default">Default</button>

                                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                <button type="button" class="btn btn-primary">Primary</button>

                                <!-- Indicates a successful or positive action -->
                                <button type="button" class="btn btn-success">Success</button>
			  
			  
		
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