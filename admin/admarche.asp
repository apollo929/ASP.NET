<!--#include file="connessionesql.asp" -->

<html>
<head>
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="calendar.js"></script>
</head>
<body  bgcolor=white>
<!-- #include file=_menu.inc --->

<%' 


	' Build connection string to aspgrid.mdb
	Set Grid = Server.CreateObject("Persits.Grid")
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare la marca?"
	'Connessione
	Grid.Connect Conn.ConnectionString, "", ""
	
	'SQL
	Grid.SQL = "select id,marca,preIsp  from Marcauti order by marca asc "
		
    Grid.MaxRows=200

    'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").ReadOnly = True
	Grid.Cols("id").Cell.Align="CENTER"
	Grid.Cols("id").Caption="-"
	Grid("preIsp").DefaultValue = "VUO"
	            
	'METODO POST
	Grid.MethodGet=FALSE

		
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
</BODY>
</HTML>
