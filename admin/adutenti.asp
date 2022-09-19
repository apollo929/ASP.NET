<!--#include file="connessionesql.asp" -->

<html>
<head>
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body  bgcolor=white>
<br>
<!--#include file="_menu.inc"-->

<%' 
    'Databse
	' Build connection string to aspgrid.mdb
	strConnect = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("\db\storico.mdb")
	Set Grid = Server.CreateObject("Persits.Grid")

	'Cancella
	'Grid.FormOnSubmit = "return Validate();"
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare Storico?"

	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "select * from Storico order by Id desc"
	
	'METODO POST
	Grid.MethodGet=FALSE
	
	'MAX RECORD
	'Grid.MaxRows=2
	
	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").ReadOnly = True
	Grid.Cols("id").Cell.Align="CENTER"
	Grid.Cols("id").Caption="ID"
	'Grid("Tipologia").Array =Array("normale","admin")
		
	' Enable sorting
	Grid.ColRange(1,4).CanSort = True
	Grid.ColRange(1,4).CanSort = True

	' Set Colors
	Grid.ColRange(1,4).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,4).Header.Font.Face = "Verdana"
	Grid.ColRange(1,4).Cell.Font.Face = "Verdana"
	'Grid.ColRange(2,3).InputSize=25
	'Grid.ColRange(6,6).InputSize=5
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
