<!--#include file="connessionesql.asp" -->
<html>
<head>
<title>SITO WEB E-COMMERCE BACK OFFICE</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body  bgcolor=white class=nero10>
<!-- #include file=_menu.inc --->
<HR>
							
										
<table width=100% align=left border=0 cellpadding=0 cellspacing=0>


<tr>
													<td class=navy10n >



<%' 
    'Databse
	' Build connection string to aspgrid.mdb
		Set Grid = Server.CreateObject("Persits.Grid")

	'Cancella
	'Grid.FormOnSubmit = "return Validate();"
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare Cliente?"

	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "select * from Registrazione where nomeagente='" & Replace(Trim(Request("id")),"%20"," ") & "' order by Ragione desc"
	
	'METODO POST
	'Grid.MethodGet=FALSE
	
	'MAX RECORD
	'Grid.MaxRows=2
	
	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").ReadOnly = True
	Grid.Cols("id").Cell.Align="CENTER"
	Grid.Cols("id").Caption="ID"



	'Sql
	Grid("CATEGORIACLIENTE").AttachForeignTable "select IDCategoriacliente,Categoriacliente from Categorie ", 2, 2
	Grid("NOMEAGENTE").AttachForeignTable "select id,Agente from Agente ", 2, 2	
	'SIZE
	Grid.Cols("INDIRIZZO").AttachTextarea 2,60 
	Grid.Cols("CITTA").AttachTextarea 1,60
	Grid.Cols("EMAIL").AttachTextarea 1,60
	Grid.Cols("RAGIONE").AttachTextarea 1,60
	Grid.Cols("SEDE").AttachTextarea 1,60
	
	'Grid("FREQUENZA").DefaultValue = 0
	'Grid("SCONTO").DefaultValue = 4
	Grid("PREZZO").Array = Array("PREZZO1","PREZZO2","PREZZO3","PREZZO4","PREZZO5")
    'Grid("RICEVEREOFFERTE").Array = Array("SI","NO")
    
    Grid("DATA").AttachCalendar 
	Grid("DATA").DefaultValue=day(date()) & "/" & month(date()) & "/" & year(date())
    'Grid.Cols("NOMEAGENTE").AttachTextarea 1,60
	Grid("RICEVEREOFFERTE").AttachCheckbox "Yes", "No"





	Grid.ColRange(1,8).CanSort = True
	Grid.ColRange(1,8).CanSort = True

	' Set Colors
	Grid.ColRange(1,28).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,28).Header.Font.Face = "Verdana"
	Grid.ColRange(1,28).Cell.Font.Face = "Verdana"
	Grid.ColRange(1,28).Cell.Font.Size=2
	Grid.ColRange(7,28).InputSize=9
	Grid.Cols("id").AttachExpression  "<INPUT TYPE='HIDDEN' NAME='id' VALUE='" & Request("id") & "'>"	
	
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





													</td>
												</tr>
</table>

</body>
</html>
<!-- #include file=sqlchiudi.inc --->