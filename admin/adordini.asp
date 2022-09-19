<!--#include file=connessionesql.inc-->
<%  

on error goto 0
	
Function Estr_Ragione(Byval Rif_cody)
	Set tbreg= Server.CreateObject("ADODB.Recordset")
	SQL = "select Ragione,Nome,Cognome FROM Registrazione where Password1='" & Rif_cody & "' union select Ragione,Nome,Cognome FROM Registrazioneint where Password1='" & Rif_cody & "'"
	tbreg.Open SQL,connm
	if tbreg.eof then
		Estr_Ragione="n/a"
	else
		Estr_Ragione=tbreg("Ragione") & " - " & tbreg("Nome") & " - " & tbreg("Cognome")
	end if
End function

'impostazione data
session.lcid=1040
'tabelle utilita'
Set tbst = Server.CreateObject("ADODB.Recordset")
Sql="Select * from ordine order by ID desc"
response.write(Sql)
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
															<b>GESTIONE ORDINI VIA WEB</b>
															<HR>
															
															
															  <TABLE WIDTH=800 BORDER=1 CELLSPACING=0 CELLPADDING=0 align=left>
															  <TR> 
																<TH   >n ordine</TH>
																<TH   >codice cliente</TH>
																<TH   >ragione sociale</TH>
																<TH   >data</TH>
																<TH   >ora dell'ordine</TH>
																<TH   >visualizza</TH>
															  </TR>
															  <%		
																	if Tbst.EOF then%>
															  <TR> 
																<td   >NESSUN ORDINE ARCHIVIATO</td>
																<td align="center"   >cod. cliente</td>
																<td align="center"   >ragione sociale</td>
																<td align="center"   ><%=date()%></td>
																<td align="center"   ><%=time()%></td>
																<td align="center"  ><img src='images/pagedown.gif' border=0></td>
															  </TR>
															  <%end if
																	
																	data=""
																	tempo=""
																	i=0
																 Do While Not Tbst.EOF and i<>120
																	i=i+1
																	if data=cstr(tbst("data")) and tempo=cstr(tbst("tempo"))  then
																	'null
																	else%>
																	<TR> 
																	<td   ><%=tbst("numeroordine")%></td>
																	<td align="center" ><%=tbst("password1")%></td>
																	<td align="center" ><%=Estr_Ragione(tbst("password1"))%></td>
																	<td align="center" ><%=tbst("data")%></td>
																	<td align="center" ><%=tbst("TEMPO")%></td>
																	<td align="center" ><a href='adordinilista.asp?data=<%=tbst("data")%>&tempo=<%=tbst("TEMPO")%>'><img src='images/pagedown.gif' border=0></a></td>
																	</TR>
																	<%end if
																	data=""
																	tempo=""		       	
																	data=cstr(tbst("data"))
																	tempo=cstr(tbst("tempo"))
																	Tbst.MoveNext
																Loop	
																	'response.write(i)%>
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