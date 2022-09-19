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
															<b>GESTIONE PRODOTTI DA ELIMINARE</b>
															<HR>
															
														<%
'elimina codici
if trim(request("elimina"))="si" then
		queryel="select codice_prodotto,codice_od,codice_buf from prodotti INNER JOIN prodottielimina  ON prodotti.codice_prodotto = prodottielimina.codice_elimina or prodotti.codice_od = prodottielimina.codice_elimina or prodotti.codice_buf = prodottielimina.codice_elimina"
		Set tbeli = Server.CreateObject("ADODB.Recordset")	
		tbeli.Open Queryel,connm
		do while not tbeli.eof
		 on error resume next
	     sql1="delete from prodotti where codice_prodotto='" &  trim(tbeli("codice_prodotto"))  & "' limit 1;"
		 sql2="delete from prodotti where codice_od='" &  trim(tbeli("codice_od"))  & "' limit 1;"
		 sql3="delete from prodotti where codice_buf='" &  trim(tbeli("codice_buf"))  & "' limit 1;"
         connm.execute(sql1)
		 connm.execute(sql2)
		 connm.execute(sql3)
		tbeli.movenext
		loop
		tbeli.close		
		response.write("cancellazione eseguita!")
end if		


%>
<FORM ACTION="adgestionedaeliminare.asp?elimina=si" method="post" id="form1" name="form1">
<INPUT TYPE="SUBMIT" NAME="Search" value="ELIMINA TUTTI I CODICI" ID=SUBMIT3>
</FORM> 
<HR>
<b>CODICI DA ELIMINARE</b>
<%' 
 	
	 'Database
	Set Grid = Server.CreateObject("Persits.Grid")

	'Cancella
	Grid.FormOnSubmit = "return Validate();"
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare il Prodotto?"

	'Connessione
	Grid.Connect strConnect, "", ""		
	'SQL
	Grid.SQL = "select * from prodottielimina "
	'response.write(Grid.SQL)
	'response.end
	
	'METODO POST
	Grid.MethodGet=FALSE
	
	'MAX RECORD
	Grid.MaxRows=50
	
	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").Hidden = True
	
		
	' Enable sorting
	Grid.ColRange(1,17).CanSort = True
	Grid.ColRange(1,17).CanSort = True

	' Set Colors
	Grid.ColRange(1,28).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,28).Header.Font.Face = "Verdana"
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