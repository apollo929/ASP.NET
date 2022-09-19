<!--#include file=connessionesql.inc-->
<%


if trim(request("id"))<>"" then
	sqlcont="select * from contatti where id=" & cdbl(request("id"))
	set tbcontatti=conn.execute(sqlcont) 		
	text_cognome=senza_apice(tbcontatti("cognome"))
	text_nome=senza_apice(tbcontatti("nome"))
	tbcontatti.close
end if

if request("canc")="yes" and isnumeric(request("id"))=true then
	 sqldel="delete from contatti where id=" & cdbl(request("id"))
	 conn.execute(sqldel)
	 'log	 
	loggaVisSchede "elimina lead","elimina lead","elimina lead >> " & text_cognome & "  " & text_nome,"elimina lead",session("loginnominativo")
end if
if request("assegnami")="yes" and isnumeric(request("id"))=true then
	text_utenteprovenienza=trim(senza_apice(Request.Form("utenteprovenienza")))
	if cstr(text_utenteprovenienza)="" then 
		text_utenteprovenienza=session("loginnominativo")
	end if 
	sqlupdapp="update contatti set appartenenza='" & lcase(text_utenteprovenienza) & "' where id=" & cdbl(request("id")) & " limit 1"
	conn.execute(sqlupdapp)
	'response.write(sqlupdapp)
	'log	 
	loggaVisSchede "assegnazione lead","assegnazione lead","assegna il lead >> " & text_cognome & "  " & text_nome," all utente >>> " & lcase(text_utenteprovenienza),session("loginnominativo")
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
									
									
									<!--#include file=_leads.inc-->

										
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