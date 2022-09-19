<!--#include file=connessionesql.inc-->
<!DOCTYPE html>
<html lang="en">
    <head>
		<TITLE>JENIUS COMMUNICATIONS - MARCO GENOVESE</TITLE>
		<meta name="keywords" content="JENIUS">
		<meta name="description" content="JENIUS">
		<link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="utf-8">
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
									
															<FORM ACTION="adutentipro.asp" ID=Form1><br>
															Ricerca Codicecliente o Password:<BR>
															<INPUT TYPE="TEXT" NAME="CRITERIA" VALUE="<% = Request("Criteria") %>" ID=TEXT1>
															<INPUT TYPE="SUBMIT" NAME="Search" VALUE="Go" ID=SUBMIT2>
															</FORM> <br>
															<FORM ACTION="adutentipro.asp" ID=Form2>
															Ricerca Ragione Sociale:<BR>
															<INPUT TYPE="TEXT" NAME="CRITERIAR" VALUE="<% = Request("Criteriar") %>" ID=TEXT2>
															<INPUT TYPE="SUBMIT" NAME="Search" VALUE="Go" ID=SUBMIT3>
															</FORM> 
															<HR>
															<b>GESTIONE UTENTI WINCODY INTERNI</b>
															
														
															<script type="text/javascript">
																function cancella(id)
																{
																if (confirm('Sicuro che vuoi CANCELLARE L UTENTE ??')) {
																window.location.href='adutentiprodettaglio.asp?del=si&id='+id;
																  }
																  //return false;
																  //window.location.href='adutentipro.asp';
																}
															</script>
															
															<HR>
													<%' 

															if Trim(request("err"))="err"  then
																Response.Write "<br><br><b>Password/Rif.Wincody gia' presente ATTENZIONE</b><br>MODIFICA NON LECITA!<br>"
															end if

															'Database
															Set Grid = Server.CreateObject("Persits.Grid")
															'Database
															Set tb = Server.CreateObject("ADODB.Recordset")	
															tb.Open "select count(frequenza) as Tot from registrazione",connm
															response.write("<b class=nero11>NUMERO UTENTI INTERNI REGISTRATI --->>>  " & tb("Tot")  & "</b>") 
                                                            
															if tb.eof then response.redirect "adutentiinternet.asp"
                                                             
															'Cancella
															'Grid.FormOnSubmit = "return Validate();"
															'Grid.DeleteButtonOnClick = "Sei sicuro di cancellare utente?"
															'Connessione
															Grid.Connect strConnect, "", ""	
															'SQL
															Grid.SQL = "select id,id  as idinc,id  as idpro,id  as idcanc,ragione,utente1,password2,Password1,email,Prezzoisp,prezzoBUFFETTI,nome,cognome,telefono,frequenza from Registrazione order by Ragione asc "
															'max record	
															Grid.MaxRows=620	

															'Enable Left-side buttons
															Grid.ShowLeftSideButtons

															'Hide identity column
															Grid.Cols("id").ReadOnly = True
															Grid.Cols("id").Cell.Align="CENTER"
															Grid.Cols("id").Caption="-"
															Grid.Cols("idinc").ReadOnly = True
															Grid.Cols("idinc").Cell.Align="CENTER"
															Grid.Cols("idinc").Caption="-"
															Grid.Cols("idpro").ReadOnly = True
															Grid.Cols("idpro").Cell.Align="CENTER"
															Grid.Cols("idpro").Caption="-"
															Grid.Cols("utente1").Caption="utente"	
															Grid.Cols("password2").Caption="password"
															Grid.Cols("password1").Caption="rif.Wincody"
															Grid.Cols("prezzoisp").Caption="prezzo OD"	
																	
															' Enable sorting
															Grid.ColRange(1,28).CanSort = True

															' Set Colors
															Grid.ColRange(1,28).Header.BGColor = "#B0B0FF"
															Grid.ColRange(1,28).Header.Font.Face = "Verdana"
															Grid.ColRange(1,28).Header.Font.Size=2
															Grid.ColRange(1,28).Cell.Font.Face = "Verdana"
															Grid.ColRange(1,28).Cell.Font.Size=2
															Grid.ColRange(7,28).InputSize=9

															' Specify location of button images
															Grid.ImagePath = "images/"
															' Set <TABLE> attributes
															Grid.Table.Border = 1
															Grid.Table.CellSpacing = 1
															Grid.Table.CellPadding = 1	

															' Turn name field into a hyperlink
															Grid.Cols("Id").AttachExpression "<A class=navy11 alt='modifica utente' HREF=""adutentiprodettaglio.asp?id={{Id}}&mod=update""><img src=images/edit.png border=0></A>"
															Grid.Cols("Idinc").AttachExpression "<A class=navy11 alt='invia user e psw' HREF=""adutentipromail.asp?id={{Id}}""><img src=images/mail.png border=0></A>"
															Grid.Cols("Idpro").AttachExpression "<A class=navy11 alt='gest. listini particolari' HREF=""adutentiproprofilo.asp?id={{Id}}&password1={{password1}}&ragsoc={{ragione}}""><img alt='gest. listini particolari' src=images/acquisire.png border=0></A>"
															Grid.Cols("idcanc").AttachExpression "<A  href=""javascript:cancella({{idcanc}});"" class=navy11 ><img src=images/delete.gif border=0></A>"



															' Find a record if a search criteria is set
															Criteria = Request("CRITERIA")
															If Criteria <> "" Then
																Grid.Find "password1 like '" & TRIM(Criteria) & "'"
															End If

															Criteriar = Request("CRITERIAr")
															If Criteriar <> "" Then
																Grid.Find "ragione like '%" & TRIM(Criteriar) & "%'"
															End If

															' Make grid read-only
															Grid.ReadOnly = True
															Grid.Display
															Grid.Disconnect

															Set Grid = Nothing

															%>
															<a href="adutentiprodettaglio.asp?id=0&mod=addnew" id=addnew name=addnew><b>Aggiungi Nuovo Utente Interno</b></b><img src='images/addnew.jpg' border=0></a>
										
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