<!--#include file="connessionesql.asp" -->
<html>
<head>
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body  bgcolor=white>
<br>
<!-- #include file=_menu.inc --->
<%' 
 	
	 'Database
	Set Grid = Server.CreateObject("Persits.Grid")

	'Cancella
	Grid.FormOnSubmit = "return Validate();"
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare Utenti?"

	'Connessione
	Grid.Connect strConnect, "", ""		
	'SQL
	Grid.SQL = "select * from contatti order by id desc "
	
	'METODO POST
	Grid.MethodGet=FALSE
	
	'MAX RECORD
	Grid.MaxRows=20
	
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
	' Make grid read-only
	Grid.ReadOnly = True
	
	Grid.Display
	Grid.Disconnect

	Set Grid = Nothing
%>
</body>
</html>
<!-- #include file=sqlchiudi.inc --->