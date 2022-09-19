<html>
<head>
	<title>www.ufficiovest.it</title>
	<LINK rel="stylesheet" href="../_styles.inc">
	<script language="JavaScript" src="calendar.js"></script>
</head>
<body  bgcolor=LightGoldenrodYellow>
<!-- #include file=_menu.inc --->

<FORM ACTION="adutentipro.asp">
Ricerca Codicecliente o Password:<BR>
<INPUT TYPE="TEXT" NAME="CRITERIA" VALUE="<% = Request("Criteria") %>">
<INPUT TYPE="SUBMIT" NAME="Search" VALUE="Go">
</FORM> 


<%' 
    'response.write("ciaooooooooo")  
    'response.end


    'Database
	' Build connection string to aspgrid.mdb
	strConnect = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("\db\registrazionepro.mdb")
	Set Grid = Server.CreateObject("Persits.Grid")

	'Cancella
	'Grid.FormOnSubmit = "return Validate();"
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare utente?"

	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "select * from Registrazione order by data desc "
		
    Grid.MaxRows=20

	
	

	
	'MAX RECORD

	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").ReadOnly = True
	Grid.Cols("id").Cell.Align="CENTER"
	Grid.Cols("id").Caption="-"
	'Grid("Societa").HIDDEN=TRUE
	'Grid("Societa").DefaultValue=Session("SOCIETA")
	'Grid("Comune").DefaultValue=Replace(Request.form("field4"),"'","`")
			
	'Sql
	'Grid("Regione").AttachForeignTable "select regioneid,regione from Regioni order by Regione", 2, 2
	'Grid("Provincia").AttachForeignTable "select provinciaid,provincia from Province order by Provincia", 2, 2
	
	'SIZE
	'Grid.Cols("DESCRIZIONE").AttachTextarea 7,60 
	'Grid.Cols("COMUNE").AttachTextarea 1,25 
	
	Grid("DATA").DefaultValue = Date()
	Grid("DATA").AttachCalendar
	'Grid("LIRE").DefaultValue = 0
	'Grid("EURO").DefaultValue = 0
	'Grid("CAMERE").Array =Array("0","1","2","3","4","5","6","7","8","9","10","11","12","13","14")
	'Grid("BAGNI").Array =Array("0","1","2","3","4","5","6","7","8","9","10","11","12","13","14")
	'Grid("MQ").DefaultValue = 0
	
	'Grid("TIPOLOGIA").Array = Array("APPARTAMENTO", "MINIAPPARTAMENTO" , "ATTICO" , "SCHIERA-ABBINATA" , "CASA-SINGOLA" ,"VILLA" , "RUSTICO" , "TERRENO" , "CAPANNONE" , "NEGOZIO" ,"PALAZZO" , "POSTO AUTO")
	'Grid("VENDEAFFITTO").Array =Array("VENDITA","AFFITTO")
	
	'Grid.Cols("DESCRIZIONE").Caption="_____DESCRIZIONE____________IMMOBILE___________DETTAGLIATA_____"
	'Grid.Cols("SCPRIV").Caption="SCOPERTO PRIVATO"
	'Grid.Cols("Cstorico").Caption="CENTRO STORICO"
	'Grid.Cols("Travivista").Caption="TRAVI A VISTA"
	'Grid.Cols("Riscaut").Caption="RISCALDAMENTO AUTONOMO"
	'Grid.Cols("INGRESSOIND").Caption="INGRESSO INDIPENDENTE"
	'Grid.Cols("ANG_COTTURA").Caption="ANGOLO COTTURA"
	
	' Display this field as a check box in edit mode
	'Grid("SCPRIV").AttachCheckbox "Yes", "No"
	'Grid("Garage").AttachCheckbox "Yes", "No"
	'Grid("Cantina").AttachCheckbox "Yes", "No"
    'Grid("Piscina").AttachCheckbox "Yes", "No"
    'Grid("Cstorico").AttachCheckbox "Yes", "No"
    'Grid("Travivista").AttachCheckbox "Yes", "No"
    'Grid("Riscaut").AttachCheckbox "Yes", "No"
    'Grid("ANG_COTTURA").AttachCheckbox "Yes", "No"
    'Grid("ASCENSORE").AttachCheckbox "Yes", "No"
    'Grid("ARIA_CONDIZIONATA").AttachCheckbox "Yes", "No"
    'Grid("ARREDATA").AttachCheckbox "Yes", "No"
    'Grid("INGRESSOIND").AttachCheckbox "Yes", "No"
            
	' Enable sorting
	Grid.ColRange(1,5).CanSort = True
	Grid.ColRange(7,28).CanSort = True

	' Set Colors
	Grid.ColRange(1,28).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,28).Header.Font.Face = "Verdana"
	Grid.ColRange(1,28).Cell.Font.Face = "Verdana"
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
	Grid.Cols("Id").AttachExpression "<A class=navy11 HREF=""dettaglio.asp?id={{Id}}""><img src=images/edit.gif border=0></A>"
	'Grid.Cols("Id").AttachExpression "<A class=navy11 HREF=""dettagli2.asp?id={{Id}}&password1={{password1}}"">Storico</A>"
	
	' Find a record if a search criteria is set
	Criteria = Request("CRITERIA")
	If Criteria <> "" Then
	  Grid.Find "password1 like '%" & Criteria & "%'"
	End If
	
	
	' Make grid read-only
	Grid.ReadOnly = True
	
	Grid.Display
	Grid.Disconnect

	Set Grid = Nothing
	
%>
<FORM ACTION="dettaglio.asp" id=dettaglio name=dettaglio>
<INPUT TYPE="HIDDEN" NAME="AspGridAdd1" VALUE="1">
<INPUT TYPE="SUBMIT" VALUE="Add New" id=SUBMIT1 name=SUBMIT1>
</FORM>
</BODY>
</HTML>
