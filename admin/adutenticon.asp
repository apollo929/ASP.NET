<!--#include file="connessionesql.asp" -->

<html>
<head>
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
	<LINK rel="stylesheet" href="../_styles.inc">
</head>
<body  bgcolor=white>
<br>
<!-- #include file=_menu.inc --->
<%' 
 	
	 'Databse
	' Build connection string to aspgrid.mdb
	strConnect = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("..\db\contatti.mdb")
	Set Grid = Server.CreateObject("Persits.Grid")
	
	'cn.Open strConnect
	'Set tb = Server.CreateObject("ADODB.Recordset")	
	'tb.Open "select count(Email) as Tot from registrazione",cn
	'response.write("<b class=nero11>NUMERO UTENTI REGISTRATI --->>>  " & tb("Tot")  & "</b>") 
	'tb.Close
	'cn.Close
		
	
	
	Set Grid = Server.CreateObject("Persits.Grid")

	'Cancella
	'Grid.FormOnSubmit = "return Validate();"
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare Utenti?"

	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "select * from Registrazione order by data desc "
	
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
	
		
	Grid.Display
	Grid.Disconnect
	Set Grid = Nothing
%>
</body>
</html>
