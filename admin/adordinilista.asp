<!--#include file=connessionesql.inc-->
<%  on error resume next
Function Estr_Ragione(Byval Rif_cody)
	Set tbreg= Server.CreateObject("ADODB.Recordset")
	SQL="Select * From Registrazione where Password1='" & Rif_cody & "' UNION " & _
	"Select * From Registrazioneint where Password1='" & Rif_cody & "'"
	tbreg.Open SQL,connm
	if not tbreg.EOF then
	 Estr_Ragione=tbreg("Ragione")
	else
	 Estr_Ragione="non trovata"
	end if
End function

session.lcid=1040
'Tabelle Utilita
Set tbst = Server.CreateObject("ADODB.Recordset")
Sql="Select * from Ordine where tempo='" &  Trim(request("tempo")) & "' and data='" &  year((request("data"))) & "-" &  month((request("data"))) & "-" &  day((request("data")))  & "' order by data desc"
tbst.Open Sql,connm
            
   %>
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
															<b>GESTIONE ORDINI VIA WEB DETTAGLIO ORDINE</b>
															<HR>
															
															
															  <TABLE WIDTH=800 name=documento BORDER=0 CELLSPACING=0 CELLPADDING=0 align=left>
              <TR> 
                <TD valign=top align=center> <br> <br> 
                
                  <%if not Tbst.Eof then %>
							<TABLE BORDER="1" CELLSPACING="0" CELLPADDING="2">
							<TR> 
							<TH >Codice Articolo</TH>
							<TH >Descrizione</TH>
							<TH  colspan="2">Quantità</TH>
							<TH  colspan="2">Prezzo</TH>
							<TH  colspan="2">Fornitore</TH>
							</TR>
							<%
							tot=0
							counterfrm=0
							Do While not Tbst.eof
								Descrizione=Trim(replace(replace(replace(Tbst("Descrizione"),"'","`"),"*"," "),"&"," "))
								Mprezzo=Tbst("Prezzo")
								%>
								<TR> 
								<td ><%=Tbst("codice_isp")%></td>
								<!---TH >€.&nbsp;<%=FormatNumber(Mprezzo,2)%></TH>-------->
								<%counterfrm=counterfrm+1%>
								<td align=left   > <%=Descrizione%></td>
								<td align="center" colspan=2><%=Tbst("Quantita")%></td>
								<td align="center" colspan=2><%=Tbst("PrezzoUnita")%></td>
								<td align="center" colspan=2><%=Tbst("Fornitore")%></td>
								</TR>
								<%
								Tot=Tot+Tbst("Prezzototale")
								Tbst.movenext
							Loop
							%>
							</TABLE>
						<%
					else
						response.write("vuoto")
					end if%>
						<TABLE WIDTH=300 BORDER=0 CELLSPACING=0 CELLPADDING=0 align=right>
						<TR><TD valign=top align=right>
						<%
						response.write("<hr>")
						response.write("Totale €." & Tot & "  ------------ Totale Ivato " & " €." & (Tot*Session("partitaivac")))
						%>
						</TD></TR>
						</TABLE>
                  <br> <br> </TD>
              </TR>
            </TABLE> 
															
													
																								
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