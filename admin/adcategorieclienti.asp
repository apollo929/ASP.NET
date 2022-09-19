<!--#include file="connessionesql.asp" -->

<html>
<head>
	<title>CATEGORIE CLIENTI</title>
<link href="style.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="calendar.js"></script>
</head>
<body  bgcolor=white>
<a class=nero10 href=adutentipro.asp><img border=0 src=imgnew/tasto.gif>&nbsp;INDIETRO</a><br>

<%' 
    'Database
	Set Grid = Server.CreateObject("Persits.Grid")

	'Cancella
	'Grid.FormOnSubmit = "return Validate();"
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare Categorie?"

	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "select * from Categorie "
	
	'METODO POST
	Grid.MethodGet=FALSE
	
	'MAX RECORD
	'Grid.MaxRows=2
	
	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("idCATEGORIACLIENTE").Hidden = True
		
	' Enable sorting
	Grid.ColRange(1,4).CanSort = True
	Grid.ColRange(1,4).CanSort = True

	' Set Colors
	Grid.ColRange(1,4).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,4).Header.Font.Face = "Verdana"
	Grid.ColRange(1,4).Cell.Font.Face = "Verdana"
	Grid.ColRange(2,4).InputSize=20
    Grid.ColRange(1,4).Cell.Font.Size=2
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

<!-- #include file=sqlchiudi.inc --->