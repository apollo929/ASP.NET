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
									
									
<FORM ACTION="adutentiinternet.asp" ID=Form1><br>
Ricerca Codicecliente o Password:<BR>
<INPUT TYPE="TEXT" NAME="CRITERIA" VALUE="<% = Request("Criteria") %>" ID=TEXT1>
<INPUT TYPE="SUBMIT" NAME="Search" VALUE="Go" ID=SUBMIT2>
</FORM> <br>
<FORM ACTION="adutentiinternet.asp" ID=Form2 >
Ricerca Ragione Sociale:<BR>
<INPUT TYPE="TEXT" NAME="CRITERIAR" VALUE="<% = Request("Criteriar") %>" ID=TEXT2>
<INPUT TYPE="SUBMIT" NAME="Search" VALUE="Go" ID=SUBMIT3>
</FORM> 
<HR>
<b>GESTIONE UTENTI PROVENIENTI DA INTERNET</b>
<HR>	
<%' 
on error goto 0
    if Trim(request("err"))="si"  then
     Response.Write "<br><br><b>Password gia' presente ATTENZIONE</b><br><br>"
    end if
    if Trim(request("err"))="vuota"  then
     Response.Write "<br><br><b>Password vuota ATTENZIONE</b><br><br>"
    end if
	 'Database
	' Build connection string to aspgrid.mdb
	Set Grid = Server.CreateObject("Persits.Grid")
	
	Set tb = Server.CreateObject("ADODB.Recordset")	
	tb.Open "select count(frequenza) as Tot from registrazioneint ",connm
	response.write("<b class=nero11>NUMERO UTENTI PROVENIENTI DA INTERNET --->>>  " & tb("Tot")  & "</b>") 
	tb.Close
	
	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "select id,id  as idinc,Ragione,Utente1,Password2,Password1,Prezzoisp,PrezzoBUFFETTI,nome,cognome,email,telefono,frequenza from Registrazioneint order by Ragione asc "
		
    Grid.MaxRows=200

	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").ReadOnly = True
	Grid.Cols("id").Cell.Align="CENTER"
	Grid.Cols("id").Caption="-"
	Grid.Cols("idinc").ReadOnly = True
	Grid.Cols("idinc").Cell.Align="CENTER"
	Grid.Cols("idinc").Caption="-"	
	Grid.Cols("utente1").Caption="utente"	
	Grid.Cols("password2").Caption="password"
	Grid.Cols("password1").Caption="rif.Wincody"
	'Grid.Cols("frequenza").Caption="N°"
	'Grid.Cols("prezzo").Caption="Prezzo Spicers"
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
	'Grid(0).Header.BGColor = "#B0B0FF"
	'Grid(999).Header.BGColor = "#B0B0FF"
		
	
	' Specify location of button images
	Grid.ImagePath = "images/"
	' Set <TABLE> attributes
	Grid.Table.Border = 1
	Grid.Table.CellSpacing = 1
	Grid.Table.CellPadding = 1
	
	
		' Turn name field into a hyperlink
	Grid.Cols("Id").AttachExpression "<A class=navy11 alt='modifica utente' HREF=""adutentiinternetdettaglioint.asp?id={{Id}}&password={{password1}}""><img src=images/edit.png border=0></A>"
	Grid.Cols("Idinc").AttachExpression "<A class=navy11 alt='traferimento wincody' HREF=""trasfint.asp?id={{Id}}&password={{password1}}""><img src=images/scambia.png border=0></A>"
	
	
	' Find a record if a search criteria is set
	Criteria = Request("CRITERIA")
	If Criteria <> "" Then
	  Grid.Find "password2 like '" & TRIM(Criteria) & "'"
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