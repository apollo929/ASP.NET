<!--#include file="connessionesql.asp" -->

<html>
<head>
	<title>Back Office</title>
	<LINK rel="stylesheet" href="../_styles.inc">
</head>
<body  bgcolor=white>
<br>
<!-- #include file=_menu.inc --->
<%' 
 	
	 'Database
	' Build connection string to aspgrid.mdb
	strConnect = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("\db\informatica.mdb")
	Set Grid = Server.CreateObject("Persits.Grid")

	'Cancella
	'Grid.FormOnSubmit = "return Validate();"
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare Argomento?"

	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "select * from Argomento order by id desc "
	
	'Hide identity column
	Grid.Cols("id").hidden = True
	Grid("DATA").AttachCalendar 
	Grid("DATA").DefaultValue=day(date()) & "/" & month(date()) & "/" & year(date())
	Grid.Cols("titolo").AttachTextarea 1,40
	Grid.Cols("testo").AttachTextarea 7,70
	
	'METODO POST
	Grid.MethodGet=FALSE
	
	'MAX RECORD
	Grid.MaxRows=40
	
	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").Hidden = True
	
		
	' Enable sorting
	Grid.ColRange(1,18).CanSort = True
	Grid.ColRange(1,18).CanSort = True

	' Set Colors
	Grid.ColRange(1,28).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,28).Header.Font.Face = "Verdana"
	Grid.ColRange(1,28).Cell.Font.Face = "Verdana"
	Grid.ColRange(1,28).Cell.Font.Size=2
	Grid.ColRange(7,28).InputSize=9
	Grid(0).Header.BGColor = "#B0B0FF"
	Grid(999).Header.BGColor = "#B0B0FF"
		
	
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
</body>
</html>
