<!--#include file="connessionesql.asp" -->
<html>
<head>
	<title>AGENTI</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="calendar.js"></script>
</head>
<body  bgcolor=white>
<!-- #include file=_menu.inc --->
<HR>
<FORM ACTION="adagenti.asp">
Ricerca NomeAgente:<BR>
<INPUT TYPE="TEXT" NAME="CRITERIA" VALUE="<% = Request("Criteria") %>">
<INPUT TYPE="SUBMIT" NAME="Search" VALUE="Go">
</FORM> 


<%' 

    'Database
	' Build connection string to aspgrid.mdb
	Set Grid = Server.CreateObject("Persits.Grid")


	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "SELECT * FROM Agente"
		
    Grid.MaxRows=50
	
	
	'MAX RECORD

	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").ReadOnly = True
	Grid.Cols("id").Cell.Align="CENTER"
	Grid.Cols("id").Caption="-"
	
            
	' Enable sorting
	Grid.ColRange(1,5).CanSort = True
	Grid.ColRange(7,28).CanSort = True

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
	
	
	' Turn name field into a hyperlink
	Grid.Cols("Id").AttachExpression "<A class=navy11 HREF=""adclienti.asp?id={{agente}}"">CLIENTI</A>"
	'Grid.Cols("Id").AttachExpression "<A class=navy11 HREF=""dettagli2.asp?id={{Id}}&password1={{password1}}"">Storico</A>"
	
	' Find a record if a search criteria is set
	Criteria = Request("CRITERIA")
	If Criteria <> "" Then
	  Grid.Find "Agente like '%" & Criteria & "%'"
	End If
	
	'Grid.ReadOnly=true
			
	Grid.Display
	Grid.Disconnect
	Set Grid = Nothing
	
%>
</BODY>
</HTML>
