<!--#include file="connessionesql.asp" -->
<html>
<head>
<title>GESTIONE ARTICOLI SLIDE</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" class="nero10">

<!-- #include file=_menu.inc --->

<br><br><a href="inserisci-slide.asp"><img src="images/addnew.gif" border="0"> Inserisci</a><br><br>

<%
'Database
Set Grid = Server.CreateObject("Persits.Grid")

'Cancella
'Grid.FormOnSubmit = "return Validate();"
Grid.DeleteButtonOnClick = "Sei sicuro di cancellare utente?"
'Connessione
Grid.Connect strConnect, "", ""	
'SQL
Grid.SQL = "SELECT * FROM slide"
'max record	
Grid.MaxRows=20	

'Enable Left-side buttons
Grid.ShowLeftSideButtons

'Hide identity column
Grid.Cols("id").ReadOnly = True
'Grid.Cols("id").Cell.Align="CENTER"

        
' Enable sorting
Grid.ColRange(1,28).CanSort = True

' Set Colors
Grid.ColRange(1,28).Header.BGColor = "#B0B0FF"
Grid.ColRange(1,28).Header.Font.Face = "Verdana"
Grid.ColRange(1,28).Header.Font.Size=2
Grid.ColRange(1,28).Cell.Font.Face = "Verdana"
Grid.ColRange(1,28).Cell.Font.Size=2
Grid.ColRange(7,28).InputSize=9

' Specify location of button images
Grid.ImagePath = "images/"
' Set <TABLE> attributes
Grid.Table.Border = 1
Grid.Table.CellSpacing = 1
Grid.Table.CellPadding = 1	

' Turn name field into a hyperlink
'Grid.Cols("Id").AttachExpression "<A class=navy11 HREF=""dettaglio.asp?id={{Id}}&mod=update""><img src=images/edit.gif border=0></A>"

' Find a record if a search criteria is set
Criteria = Request("CRITERIA")
If Criteria <> "" Then
	Grid.Find "password1 like '" & TRIM(Criteria) & "'"
End If

Criteriar = Request("CRITERIAr")
If Criteriar <> "" Then
	Grid.Find "ragione like '%" & TRIM(Criteriar) & "%'"
End If

' Make grid read-only
Grid.ReadOnly = False
Grid.Display
Grid.Disconnect

Set Grid = Nothing

%>



</td>
</tr>
</table>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->