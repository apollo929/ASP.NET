<% session.lcid=1040
   Response.Buffer = True

    'Database
	' Build connection string to aspgrid.mdb
	strConnect = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("\db\registrazionepro.mdb")
	Set Grid = Server.CreateObject("Persits.Grid")

	'Connessione
	Grid.Connect strConnect, "", ""
	
	' Use regular gray buttons
	Grid.UseImageButtons = False
	
	'METODO POST
	'Grid.MethodGet=FALSE
	Grid.MaxRows=1
	
	'SQL
	Grid.SQL = "select * from registrazione "	
  	If Request("id") <> "" Then Grid.SQL = Grid.SQL & " where id=" & cint(Request("id"))	
  	
	'Hide identity column
	Grid.Cols("id").ReadOnly = True
	'Grid.Cols("indice").Cell.Align="CENTER"
	'Grid.Cols("indice").Caption="N° IMMOBILE"
	'Grid("Profilo").HIDDEN=TRUE
	'Grid("Societa").DefaultValue=Session("SOCIETA")
				
	'Sql
	'Grid("Regione").AttachForeignTable "select regioneid,regione from Regioni order by Regione", 2, 2
		
	'SIZE
	Grid.Cols("INDIRIZZO").AttachTextarea 2,60 
	Grid.Cols("CITTA").AttachTextarea 1,60
	Grid.Cols("EMAIL").AttachTextarea 1,60
	
	Grid.Cols("RAGIONE").AttachTextarea 1,60
	Grid.Cols("SEDE").AttachTextarea 1,60
	
	'Grid.Cols("COMUNE").AttachTextarea 1,25 
	
	Grid("DATA").AttachCalendar 
	' ,,dd/mm/yyyy
	Grid("DATA").DefaultValue=day(date()) & "/" & month(date()) & "/" & year(date())
	
	'Grid("DATA").AttachCalendar
	'Grid("UTENTEPARTICOLARESCONTO").DefaultValue = 0
	Grid("FREQUENZA").DefaultValue = 0
	'Grid("CAMERE").Array =Array("0","1","2","3","4","5","6","7","8","9","10","11","12","13","14")
	'Grid("BAGNI").Array =Array("0","1","2","3","4","5","6","7","8","9","10","11","12","13","14")
	Grid("SCONTO").DefaultValue = 4
	
    Grid("PREZZO").Array = Array("PREZZO1","PREZZO2","PREZZO3","PREZZO4","PREZZO5")
	'Grid("VENDEAFFITTO").Array =Array("VENDITA","AFFITTO")
	
		
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
            
		
	' Specify location of button images
	Grid.ImagePath = "images/"
	
	' Make the id parameter persistent
	Grid.ExtraFormItems = "<INPUT TYPE=HIDDEN NAME=id VALUE=" & Request("id") & ">"

	' Display grid
	Grid.BuildForm

	' Redirect if Delete button  was pressed.
	If Request("AspGridDelete1") <> "" Then Response.Redirect "adutentipro.asp"
   
	' Also redirect if the Save button was pressed
	If Request("AspGridSave1") <> "" Then Response.Redirect "adutentipro.asp"
       
	' Also redirect if the Cancel button was pressed
	If Request("AspGridCancel1") <> "" Then Response.Redirect "adutentipro.asp"
      
	If Request("AspGridAdd1") = "" Then
		Set Row = Grid.Output.Rows(1) 
		Grid.MethodGet=FALSE' first row
	Else
		Set Row = Grid.Output.FooterRow ' footer row for a new record
	End If
%>


<html>
<head>
	<title>www.UFFICIOVEST.it</title>
	<LINK rel="stylesheet" href="../_styles.inc">
	<script language="JavaScript" src="calendar.js"></script>
</head>
<body  bgcolor=LightGoldenrodYellow>
<% = Row.Form %>
<%session.lcid=1040%>
<TABLE BORDER="1" CELLPADDING="0" CELLSPACING="0" WIDTH="400">
<TR><TD bgcolor=Moccasin>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="3" WIDTH="100%">
	<TR>
		<TD width=200><B class=navy11n>N° Utente:</B></TD>
		<TD class=navy11n><% = Row(1).Value %></TD>
	</TR>
	<TR>
		<TD class=navy11n><B class=navy11n>NOME:</B></TD>
		<TD class=navy11n><% = Row(2).Value %></TD>
	</TR>

	<TR>
		<TD class=navy11n><B class=navy11n>COGNOME:</B></TD>
		<TD class=navy11n><% = Row(3).Value %></TD>
	</TR>

	<TR>
		<TD class=navy11n><B class=navy11n>INDIRIZZO:</B></TD>
		<TD class=navy11n WIDTH=300><% = Row(4).Value %></TD>
	</TR>

	<TR>
		<TD class=navy11n><B class=navy11n>CITTA':</B></TD>
		<TD class=navy11n><% = Row(5).Value %></TD>
	</TR>
	<TR>
		<TD class=navy11n><B class=navy11n>CAP :</B></TD>
		<TD class=navy11n><% = Row(6).Value %></TD>
	</TR>
	<TR>
		<TD class=navy11n><B class=navy11n>PROVINCIA</B></TD>
		<TD class=navy11n><% = Row(7).Value %></TD>
	</TR>
	<TR>
		<TD class=navy11n><B class=navy11n>E-MAIL</B></TD>
		<TD class=navy11n><% = Row(8).Value %></TD>
	</TR>
		<TR>
		<TD class=navy11n><B class=navy11n>TELEFONO</B></TD>
		<TD class=navy11n><% = Row(9).Value %></TD>
	</TR>
	<TR>
		<TD class=navy11n><B class=navy11n>PARTITA IVA</B></TD>
		<TD class=navy11n><% = Row(10).Value %> </TD>
	</TR>
		<TR>
		<TD class=navy11n><B class=navy11n>DATA </B></TD>
		<TD class=navy11n><% = Row(11).Value %></TD>
	</TR>
	<TR>
		<TD class=navy11n><B class=navy11n>RAGIONE SOCIALE</B></TD>
		<TD class=navy11n><% = Row(12).Value %></TD>
	</TR>
	<TR>
		<TD class=navy11n><B class=navy11n>SEDE</B></TD>
		<TD class=navy11n><% = Row(13).Value %></TD>
	</TR>
	<TR>
		<TD class=navy11n><B class=navy11n>UTENTE</B></TD>
		<TD class=navy11n><% = Row(14).Value %></TD>
	</TR>
		<TR>
		<TD class=navy11n><B class=navy11n>PASSWORD</B></TD>
		<TD class=navy11n><% = Row(15).Value %></TD>
	</TR>
			<TR>
		<TD class=navy11n><B class=navy11n>FREQUENZA</B></TD>
		<TD class=navy11n><% = Row(16).Value %></TD>
	</TR>
				<TR>
		<TD class=navy11n><B class=navy11n>PREZZO</B></TD>
		<TD class=navy11n><% = Row(17).Value %></TD>
	</TR>
					<TR>
		<TD class=navy11n><B class=navy11n>SCONTO GESTIONE CARTUCCE </B></TD>
		<TD class=navy11n><% = Row(18).Value %></TD>
	</TR>
		<TR>
		<TD ><B class=navy11n>OPERAZIONI</B></TD>
		<TD ALIGN=LEFT><% = Row(19).Value %></TD>
		<TD class=navy11n>&nbsp;</TD>
		<TD class=navy11n>&nbsp;</TD>
	</TR>
	</TABLE>
	
</TD></TR>
</TABLE>
<% = Row.CloseForm %>

</BODY>
</HTML>
