<!--#include virtual="/connessionesql.asp"-->
<html>
<head>
<title>Gestione Negozio</title>
<link href="/admin/style.css" rel="stylesheet" type="text/css">
</head>
<body  bgcolor=white>
<br>
<table valign="top" width="100%"  cellpadding="0" cellspacing="0" border=0>
<tr>
<td class=orange14 align=center valign="middle" height="48" bgcolor="white">
	<img align=left border=0 src='/admin/imgnew/testapiccolo.jpg'>
</td>
</tr>
</table>
<table width="800" border="0" cellspacing="0" cellpadding="0" align="left" id=TABLE2>
<tr valign="top">
<td width="200" height=900 bgcolor="white">
		     <!--#include file="_menusxme.inc" -->
</td>	
<td width="540" bgcolor="white">
<!--I: Parte Centrale-->
			<FORM ACTION="merchant_adcategorie.asp" id=form1 name=form1>
			<b class=nero10>Digita Nome della CATEGORIA:</b><BR>
			<INPUT TYPE="TEXT" NAME="CRITERIA" VALUE="<% = Request("Criteria") %>">
			<INPUT TYPE="SUBMIT" NAME="Search" VALUE="Go">
			</FORM>

			<%' 
			'Databse
			Set Grid = Server.CreateObject("Persits.Grid")

			'Cancella
			'Grid.FormOnSubmit = "return Validate();"
			Grid.DeleteButtonOnClick = "Sei sicuro di cancellare Categorie?"

			'Connessione
			Grid.Connect strConnect, "",""

			'SQL
			Grid.SQL = "select * from Shop_Categories order by categoryid desc"

			'METODO POST
			Grid.MethodGet=FALSE

			'MAX RECORD
			'Grid.MaxRows=2

			'Enable Left-side buttons
			Grid.ShowLeftSideButtons

			'Hide identity column
			Grid.Cols("id").Hidden = True
			'Grid.Cols("categoryid").ReadOnly = True
			Grid.Cols("categoryid").Cell.Align="CENTER"
			Grid.Cols("categoryid").Caption="N� CATEGORIA"

			Grid.Cols("catdescription").Caption="_____CATEGORIA_____"			
			Grid.Cols("catdescription").AttachTextarea 1,25 
				
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
				Grid.Find " catdescription LIKE '%" & Criteria & "%'"
				'Grid.MaxRows=1
			End If

			Grid.Display
			Grid.Disconnect
			Set Grid = Nothing
			%>
	<!--I: Parte Centrale-->
</td>
</tr>
</table>		
</body>
</html>
