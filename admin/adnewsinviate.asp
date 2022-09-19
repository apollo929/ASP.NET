<!--#include file=connessionesql.inc-->
<%
'ELIMINA TUTTI I RECORD
if request("elimina")="si" then
 connm.execute("delete from newsletter_mail_inviate")
end if
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
															<b>GESTIONE NEWS MAIL INVIATE</b>
															<HR>
															<a href="adnewsinviate.asp?elimina=si">
															<button  type="button"  class="btn btn-primary" style="height:45px;background-color:red;color:white;font-size:14px;text-align:center;" style="height:35px;" value="">RESET ARCHIVIO INVIO MAIL</button>
															</a>
															<HR>
															<br>
															<%' 
															
															'Database
															Set Grid = Server.CreateObject("Persits.Grid")
															' Enable client-side validation routine
															Grid.FormOnSubmit = "return Validate();"

															'Cancella
															'Grid.FormOnSubmit = "return Validate();"
															Grid.DeleteButtonOnClick = "Sei sicuro di cancellare?"

															'Connessione
															Grid.Connect strConnect, "", ""

															'SQL
															Grid.SQL = "select * from newsletter_mail_inviate order by datainsert desc "
															
															'Grid("utentetipo").Array = Array("Amministratore", "Guest")
															
															'METODO POST
															Grid.MethodGet=FALSE
															
															'MAX RECORD
															Grid.MaxRows=400
															'Grid("sconto").FormatNumeric 0, True, True, True, ""
															'Grid("sconto").Cell.Align = "center"
															'Grid("sconto").DefaultValue = 0
															
															
															'Enable Left-side buttons
															'Grid.ShowLeftSideButtons
															
															'Hide identity column
															'Grid.Cols("id").Hidden = True
															'Grid.Cols("data").readonly = True
															Grid.Cols("Id").AttachExpression "<A class=navy11 alt='modifica utente' HREF=""""><img src=images/check.png border=0></A>"
																
															' Enable sorting
															Grid.ColRange(1,17).CanSort = True
															Grid.ColRange(1,17).CanSort = True

															' Set Colors
															Grid.ColRange(1,17).Header.BGColor = "#B0B0FF"
															Grid.ColRange(1,17).Header.Font.Face = "Verdana"
															Grid.ColRange(1,17).Cell.Font.Face = "Verdana"
															Grid.ColRange(1,17).InputSize=15
															Grid(0).Header.BGColor = "#B0B0FF"
															Grid(999).Header.BGColor = "#B0B0FF"
																
															
															' Specify location of button images
															Grid.ImagePath = "images/"
															' Set <TABLE> attributes
															Grid.Table.Border = 1
															Grid.Table.CellSpacing = 1
															Grid.Table.CellPadding = 1
															' Peform server-side validation of date
															'If Request("AspGridSave1.x") <> "" Then ' Adding or saving in progress
															'	If Request("FIELD2_")="" Then			
															'	Grid.IgnoreCommands ' do not save!
															'	End If
															'End If																
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