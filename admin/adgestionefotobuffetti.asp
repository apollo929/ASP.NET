<!--#include file=connessionesql.inc-->
<!DOCTYPE html>
<html lang="en">
    <head>
		<TITLE>JENIUS COMMUNICATIONS - MARCO GENOVESE</TITLE>
		<meta name="keywords" content="JENIUS">
		<meta name="description" content="JENIUS">
		<link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Backoffice JENIUS</title>
        <<!-- Bootstrap Core CSS -->
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
				<!--#include file=navbarback.inc-->
				<!--#include file=top_menu_sotto.inc-->
                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
									
															
															<HR>
															<b>GESTIONE BUFFETTI</b>
															<HR>
																														<%
															Set tbbuffetti = Server.CreateObject("ADODB.RecordSet")	
															if request("ricerca")=1 then
																sql_spi="Select codice_buf,descrizione from prodotti where codice_buf like '%" & request.Form("cerca") & "%' and fornitore like '%buffetti%' limit 100"
															else
																sql_spi="Select codice_buf,descrizione from prodotti where fornitore like '%buffetti%' order by codice_buf limit 100"
															end if
															'response.Write(sql_spi)
															tbbuffetti.Open sql_spi,connm
															%>
																<table width="10%" cellpadding="0" cellspacing="0" >
																	<form action="adgestionefotobuffetti.asp?ricerca=1" method="post">
																	<tr><td colspan=2>CERCA</td></tr>
																	<tr><td><input type="text" name="cerca"></td><td><input type="submit" value="CERCA"></td></tr>
																	</form>
																</table>
																<br><br>
																<table width="60%" cellpadding="0" cellspacing="0" style="border:1px solid black;">
																	<%do while not tbbuffetti.eof
																	%>
																	<tr>
																		<td style="border-right:1px solid black;border-bottom:1px solid black;"><%=tbbuffetti("codice_buf")%></td>
																		<td style="border-right:1px solid black;border-bottom:1px solid black;"><%=tbbuffetti("descrizione")%></td>
																		<td style="border-right:1px solid black;border-bottom:1px solid black;"><img src="../foto.asp?cat=catalogobuffetti2016_small&img=<%=tbbuffetti("codice_buf")%>.jpg" border="0"></td>
																		<td width="50px" style="border-bottom:1px solid black;border-right:1px solid black;"><a href="adgestionefotobuffettimodifica.asp?codice=<%=tbbuffetti("codice_buf")%>"><img src="images/edit.png" border=0></a></td>
																		<!---td style="border-bottom:1px solid black;"><a href="buffetti-elimina.asp?codice=<%=tbbuffetti("codice_buf")%>">ELIMINA</a></td--->
																	</tr>
																	<%tbbuffetti.movenext
																	loop
																	tbbuffetti.close%>
																</table>
																						
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