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
															<b>GESTIONE OD</b>
															<HR>
															
															<%
															Set tbcatalogo = Server.CreateObject("ADODB.RecordSet")	
															if request("ricerca")=1 then
																sql_spi="Select * from prodotti where codice_od like '%" & request.Form("cerca") & "%' and fornitore like '%od%' limit 500"
															else
																sql_spi="Select * from prodotti where fornitore like '%od%' order by codice_od asc limit 500"
															end if
															'response.Write(sql_spi)
															tbcatalogo.Open sql_spi,connm
															%>

																<table>
																	<form action="adgestionefotood.asp?ricerca=1" method="post">
																	<tr><td colspan=2>CERCA</td></tr>
																	<tr><td><input type="text" name="cerca"></td><td><input type="submit" value="CERCA"></td></tr>
																	</form>
																</table>
                                                                <br><br>
																<table width="50%" cellpadding="0" cellspacing="0" style="border:1px solid black;">
																	<%do while not tbcatalogo.eof
																	'Nome_foto=Fotoimg(tbcatalogo("codice_prodotto"))
																	%>
																	<tr>
																		<td style="border-right:1px solid black;border-bottom:1px solid black;"><%=tbcatalogo("codice_od")%></td>
																		<td style="border-right:1px solid black;border-bottom:1px solid black;"><%=tbcatalogo("descrizione")%></td>
																		<td style="border-right:1px solid black;border-bottom:1px solid black;">
																		
																										<%codice_prodotto_txt=tbcatalogo("codice_prodotto") 
																										'response.Write(tbcatalogo("fornitore"))
																										if lcase(tbcatalogo("fornitore"))="od" then%>
																											<img src='../foto.asp?cat=catalogoisp\piccole&img=<%=tbcatalogo("codice_od")%>.jpg' border="0">											
																											<%codice_prodotto_txt=tbcatalogo("codice_od")
																										end if
																										if lcase(tbcatalogo("fornitore"))="gruppo buffetti s.p.a." or lcase(tbcatalogo("fornitore"))="magazine" then%>
																											<img src='../foto.asp?cat=catalogobuffetti2016_small&img=<%=tbcatalogo("codice_buf")%>.jpg' border="0">											
																										<%codice_prodotto_txt=tbcatalogo("codice_buf")
																										end if%>	
																		
																		
																		</td>
																		<td width="50px" style="border-bottom:1px solid black;border-right:1px solid black;"><a href="adgestionefotoodmodifica.asp?codice=<%=codice_prodotto_txt%>"><img src="images/edit.png" border=0></a></td>
																		<!---td width="50px" style="border-bottom:1px solid black;" align="center"><a href="interni-elimina.asp?codice=<%=codice_prodotto_txt%>">ELIMINA</a></td--->
																	</tr>
																	<%tbcatalogo.movenext
																	loop
																	tbcatalogo.close%>
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