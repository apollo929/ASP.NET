<!--#include file=connessionesql.inc-->
<!-- #include file = "../cuteditor/CuteEditor_Files/include_CuteEditor.asp" -->
<%
if session("loginid")="" then response.Redirect("../login.asp")

acquistato=0
acquistato=request("acquistato")

'leggo id del preventivo
intid=request("id")

' province
Set Tbprov = Server.CreateObject("ADODB.Recordset")
Sqlp="select * from province order by provincia"
Tbprov.Open Sqlp,conn

'controllo se il preventivo è già stato acquistato
Set verifica_acquisto=Server.CreateObject("ADODB.Recordset")
Sql_acquisto="Select * from preventiviacquistati where idpreventivo='" & intid & "' and idazienda='" & session("loginid") & "'"
verifica_acquisto.open Sql_acquisto,conn

'estrapolo dati dal preventivo
Set Tbscheda=Server.CreateObject("ADODB.Recordset")
sql="Select * From preventivi where Id= '"& intid &"' limit 1"
Tbscheda.open sql,conn

credito=session("crediti")
 
%>
<!DOCTYPE html>
<html lang="en">
    <head>
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

 <div id="wrapper">

            <!-- Navigation -->
			<!--#include file=topmenu.inc-->
				<!--#include file=navbarback.inc-->	

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Tutti gli interventi</h1>                        
						<div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Dati
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="alert alert-success">
                                   Referente:<a href="#" class="alert-link"> <%
						   if not verifica_acquisto.eof then
						   response.Write(" " & Tbscheda("cognomenome"))
						   end if
						   %></a>.
                                </div>
                                <div class="alert alert-info">
                                    Indirizzo:<a href="#" class="alert-link"><%
							if not verifica_acquisto.eof then
							response.Write(" " & Tbscheda("indirizzo"))
							end if
							%></a>.
                                </div>
                                <div class="alert alert-warning">
                                    Provincia:<a href="#" class="alert-link"><%response.Write(" " & Tbscheda("provincia"))%></a>.
                                </div>
                                <div class="alert alert-danger">
                                    Città:<a href="#" class="alert-link"><%response.Write(" " & Tbscheda("citta"))%></a>.
                                </div>
								<div class="alert alert-success alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    Telefono: <a href="#" class="alert-link"><%
							if not verifica_acquisto.eof then
							response.Write(" " & Tbscheda("telefono"))
							end if
							%></a>.
                                </div>
                                <div class="alert alert-info alert-dismissable">								
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
									<%if not verifica_acquisto.eof then%>
                                    Mail: <a href="#" class="alert-link"><%response.Write(" " & Tbscheda("mail"))%></a>.
									<%end if%>
                                </div>
                            </div>
							<!-- .panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-6 -->
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Dettagli Preventivo
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">                               
                                <div class="alert alert-warning alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    Budget del preventivo<a href="#" class="alert-link"><%response.Write(" " & Tbscheda("budget"))%> </a>.
                                </div>
                                <div class="alert alert-danger alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    Inizio inserzione:<a href="#" class="alert-link"><%response.Write(" " & Tbscheda("iniziopubb"))%> </a>.
                                </div>
								<div class="alert alert-warning alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    Fine inserzione:<a href="#" class="alert-link"><%response.Write(" " & Tbscheda("finepubb"))%> </strong></a>.
                                </div>
                                <div class="alert alert-danger alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    Dettagli intervento:<a href="#" class="alert-link"><%response.Write(Tbscheda("dettagli"))%></a>.
                                </div>
                            </div>
	                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->
			<%if verifica_acquisto.eof then%>
						<div class="row">
			RAGGIUNTO NUMERO MASSIMO DI PREVENTIVI
			<div>
			<div class="row">
			<a href="certificato_acquista.asp?acquistato=1&id=<%=intid%>"><img src="images/acquista.png" alt=""></a>
			<div>
			<%end if%>	

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
<%Tbscheda.close
verifica_acquisto.close
%>
<!--#include file=closesql.inc-->