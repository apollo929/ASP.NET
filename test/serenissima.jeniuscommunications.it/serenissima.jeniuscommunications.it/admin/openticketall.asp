<!--#include file=connessionesql.inc-->
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
<script language="JavaScript" src="calendar.js"></script>
<script language="JavaScript">
function Validate()
{
	var FormName, NumRec;
	FormName = "AspGridFormSave1";

	// check whether UPDATE or Save button is clicked.
	// In the latter case, the item AspGridUpdateRows1 is undefined
	NumRecItem = document.forms[FormName].elements['AspGridUpdateRows1'];

	if( typeof(NumRecItem) == "undefined" )
	{

		// Validate date
		var testDate=new Date(Date.parse(document.forms[FormName].FIELD7.value ) );
		if( !testDate.getYear() )
		{
			alert('Not a date!');
			document.forms[FormName].FIELD7.focus();
			return false; 
		}

		return true;
	}

	// Validate all records if UPDATE is clicked
	// Get number of visible records	
	NumRec = NumRecItem.value;

	for(i = 1; i <= NumRec; i++ )
	{

		// Validate date
		var testDate=new Date(Date.parse(document.forms[FormName].elements['FIELD7_' + i].value ) );
		if( !testDate.getYear() )
		{
			alert('Not a date!');
			document.forms[FormName].elements['FIELD7_' + i].focus();
			return false; 
		}
	}
	
	return true;
}
</SCRIPT>
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
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                 
								 
								 
							<%
													'DB TIPO TICKET
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "SELECT id,data,nominativo,provincia,cellulare,mail,note,dataintervento,noteintervento FROM ticket where nominativo ='" & session("loginnominativo") & "' order by id desc"
													Grid.Cols("id").readonly=True
													Grid.Cols("data").readonly=True
													Grid.Cols("nominativo").readonly=True
													Grid.Cols("cellulare").readonly=True
													Grid.Cols("mail").readonly=True
													Grid.Cols("note").readonly=True
													Grid.Cols("provincia").readonly=True
													Grid.Cols("data").FormatDate "%d %m, %Y %H:%M:%S"
													Grid.Cols("dataintervento").readonly=True
													Grid.Cols("dataintervento").FormatDate "%d/%m/%Y %H:%M:%S"
													Grid.Cols("id").Caption="&nbsp;&nbsp;n&nbsp;ticket&nbsp;&nbsp;&nbsp;"
													Grid.Cols("data").Caption="&nbsp;&nbsp;&nbsp;&nbsp;data_apertura&nbsp;&nbsp;&nbsp;&nbsp;"
													'MAX RECORD
													Grid.MaxRows=240		
													' Enable sorting
													Grid.ColRange(1,22).CanSort = true
													Grid.ColRange(1,22).Cell.Align = "center"													
													' Set Colors
													Grid.ColRange(1,22).Header.BGColor = "#f6f6f6"
													Grid.ColRange(1,22).Header.Font.Face = "sans-serif"
													Grid.ColRange(1,22).Cell.Font.Face = "sans-serif"
													Grid.ColRange(1,22).Cell.Font.Size = par_font_size
													Grid.ColRange(1,22).Header.Font.Size = par_font_size
													Grid(0).Header.BGColor = "#f6f6f6"
													Grid(999).Header.BGColor = "#f6f6f6"															
													' Specify location of button images
													Grid.ImagePath = "images/"
													' Set <TABLE> attributes
													Grid.Table.Border = 0
													Grid.Table.CellSpacing = 0
													Grid.Table.CellPadding =0														
													Grid.readonly = false
													Grid.Display
													Grid.Disconnect

													Set Grid = Nothing
								 
								 %>
								 
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