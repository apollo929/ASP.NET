<html>
<head>
<title>Gestione Negozio</title>
	<LINK rel="stylesheet" href="_styles.inc">
</head>
<body  bgcolor=white>
<br>
<!-- #include file=_menuoff.inc --->
<%' 
    'Databse
	' Build connection string to aspgrid.mdb
	strConnect = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("\negozi\db\scart.mdb")
	Set Grid = Server.CreateObject("Persits.Grid")

	'Cancella
	'Grid.FormOnSubmit = "return Validate();"
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare Categorie?"

	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "select * from subcategories order by CATEGORIA"
	
	'METODO POST
	Grid.MethodGet=FALSE
	
	'MAX RECORD
	Grid.MaxRows=20
	
	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").Hidden= True
	
	Grid.Cols("Descrizione").Caption="_____CATEGORIA_____"			
	Grid.Cols("Descrizione").AttachTextarea 1,25 
		
	' Enable sorting
	Grid.ColRange(1,4).CanSort = True
	Grid.ColRange(1,4).CanSort = True

	' Set Colors
	Grid.ColRange(1,4).Header.BGColor = "navy"
	Grid.ColRange(1,4).Header.Font.Face = "Verdana"
	Grid.ColRange(1,4).Header.Font.size = 2
	Grid.ColRange(1,4).Header.font.color = "white"
	Grid.ColRange(1,4).Cell.Font.Face = "Verdana"
	Grid.ColRange(1,4).Cell.Font.size = 2
	Grid.ColRange(2,4).InputSize=15
	Grid(0).Header.BGColor = "navy"
	Grid(999).Header.BGColor = "navy"
		
	
	' Specify location of button images
	Grid.ImagePath = "images/"
	' Set <TABLE> attributes
	Grid.Table.Border = 1
	Grid.Table.CellSpacing = 1
	Grid.Table.CellPadding = 1
	
	' Ricerca Record
	Criteria = Request("CRITERIA")
	If Criteria <> "" Then
		Grid.Find " DESCRIZIONE LIKE '%" & Criteria & "%'"
		'Grid.MaxRows=1
	End If
	
	Grid.Display
	Grid.Disconnect
	Set Grid = Nothing
%>
</body>
</html>
