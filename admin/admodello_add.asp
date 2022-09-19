<!--#include file="connessionesql.asp" -->

<html>
<head>
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body  bgcolor=white>
<!--#include file="_menu.inc"-->

<%' 
    'Databse
	' Build connection string to aspgrid.mdb
	strConnect = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("/db/ovest.mdb")
	Set Grid = Server.CreateObject("Persits.Grid")

	'Cancella
	'Grid.FormOnSubmit = "return Validate();"
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare ?"

	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "Select * From Modello_Disp_Add Order by Id desc"
	
	'METODO POST
	Grid.MethodGet=FALSE
	
	'MAX RECORD
	Grid.MaxRows=70
	
	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").hidden = True
	
	' Set Colors
	Grid.ColRange(1,6).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,6).Header.Font.Face = "Verdana"
	Grid.ColRange(1,6).Cell.Font.Face = "Verdana"
	Grid.ColRange(2,6).InputSize=15
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
