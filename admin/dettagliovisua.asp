<!--#include file="connessionesql.asp" -->
<% 
   sql="update registrazione set data=now() where id=" & cint(Request("id"))
   connm.execute(sql)
   connm.close
   session.lcid=1040
   response.Buffer = True
   'gestione errori
   if err<>0 then
		response.write "errore"
		response.end
   end if
   'on error goto 0
      
	Set Grid = Server.CreateObject("Persits.Grid")	
	
	'Dati Corretti
	If Trim(Request("AspGridSave1")) <> "" and (Trim(Request("FIELD15"))="" or Trim(Request("FIELD16"))="" or Trim(Request("FIELD17"))="") Then
	    Response.Redirect "adutentipro.asp?err=vuota"
	End if	
		
	' Connect
	Grid.Connect strConnect, "", ""
    
	'SQL
	Grid.SQL = "select * from registrazione "	
	If Request("id") <> ""  Then 
	Grid.SQL = Grid.SQL & " where id=" & cint(Request("id"))	
	End If  
    Grid.MaxRows=1
	' Hide identity column
	Grid("id").ReadOnly= True
	' Use regular gray buttons
	Grid.UseImageButtons = False				
	'Sql
	Grid("CATEGORIACLIENTE").AttachForeignTable "select IDCategoriacliente,Categoriacliente from Categorie ", 2, 2
	Grid("NOMEAGENTE").AttachForeignTable "select id,Agente from Agente ", 2, 2	
	'SIZE
	Grid.Cols("INDIRIZZO").AttachTextarea 2,60 
	Grid.Cols("CITTA").AttachTextarea 1,60
	Grid.Cols("EMAIL").AttachTextarea 1,60
	Grid.Cols("RAGIONE").AttachTextarea 1,60
	Grid.Cols("SEDE").AttachTextarea 1,60
	Grid("PREZZOBUFFETTI").Array = Array("PREZZO1","PREZZO2","PREZZO3","PREZZO4","PREZZO5")
	Grid("PREZZOCWR").Array = Array("PREZZO1","PREZZO2","PREZZO3","PREZZO4","PREZZO5")
	Grid("PREZZOISP").Array = Array("PREZZO1","PREZZO2","PREZZO3","PREZZO4","PREZZO5")
	Grid("PREZZO").Array = Array("PREZZO1","PREZZO2","PREZZO3","PREZZO4","PREZZO5")
    Grid("RICEVEREOFFERTE").AttachCheckbox "Yes", "No"
	Grid("SPESEDISPEDIZIONE").AttachCheckbox "Yes", "No"	
	Grid("FREQUENZA").DefaultValue = 0
	Grid("DATA").AttachCalendar 
	Grid("DATA").DefaultValue=date		
	' Specify location of button images
	Grid.ImagePath = "images/"
	
	' Make the id parameter persistent
	Grid.ExtraFormItems = "<INPUT TYPE=HIDDEN NAME=idnew VALUE=" & Request("id") & ">"
	Grid.ExtraFormItems = "<INPUT TYPE=HIDDEN NAME=psw VALUE=" & Request("password") & ">"

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
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
	<LINK rel="stylesheet" href="style.css">
	<script language="JavaScript" src="calendar.js"></script>
</head>
<body  bgcolor=white>
<% = Row.Form %>
<%session.lcid=1040%>
<TABLE BORDER="1" CELLPADDING="0" CELLSPACING="0" WIDTH="400">
<TR><TD bgcolor=Moccasin>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="3" WIDTH="100%">
	<TR>
		<TD width=200><B >N° Utente:</B></TD>
		<TD ><% = Row(1).Value %></TD>
	</TR>
	<TR>
		<TD ><B >NOME:</B></TD>
		<TD ><% = Row(2).Value %></TD>
	</TR>

	<TR>
		<TD ><B >COGNOME:</B></TD>
		<TD ><% = Row(3).Value %></TD>
	</TR>

	<TR>
		<TD ><B >INDIRIZZO:</B></TD>
		<TD WIDTH=300><% = Row(4).Value %></TD>
	</TR>

	<TR>
		<TD ><B >CITTA':</B></TD>
		<TD ><% = Row(5).Value %></TD>
	</TR>
	<TR>
		<TD ><B >CAP :</B></TD>
		<TD ><% = Row(6).Value %></TD>
	</TR>
	<TR>
		<TD ><B >PROVINCIA</B></TD>
		<TD ><% = Row(7).Value %></TD>
	</TR>
	<TR>
		<TD ><B >E-MAIL</B></TD>
		<TD ><% = Row(8).Value %></TD>
	</TR>
		<TR>
		<TD ><B >TELEFONO</B></TD>
		<TD ><% = Row(9).Value %></TD>
	</TR>
	<TR>
		<TD ><B >PARTITA IVA</B></TD>
		<TD ><% = Row(10).Value %> </TD>
	</TR>
	<TR>
		<TD ><B >CODICE FISCALE</B></TD>
		<TD ><% = Row(11).Value %> </TD>
	</TR>
		<TR>
		<TD ><B >DATA </B></TD>
		<TD ><% = Row(12).Value %></TD>
	</TR>
	<TR>
		<TD ><B >RAGIONE SOCIALE</B></TD>
		<TD ><% = Row(13).Value %></TD>
	</TR>
	<TR>
		<TD ><B >SEDE</B></TD>
		<TD ><% = Row(14).Value %></TD>
	</TR>
	<TR>
		<TD ><B >UTENTE</B></TD>
		<TD ><% = Row(15).Value %></TD>
	</TR>
		<TR>
		<TD ><B >PASSWORD</B></TD>
		<TD ><% = Row(17).Value %></TD>
	</TR>
	<TR>
		<TD ><B >RIFWINCODY</B></TD>
		<TD ><% = Row(16).Value %></TD>
	</TR>
			<TR>
		<TD ><B >FREQUENZA</B></TD>
		<TD ><% = Row(18).Value %></TD>
	</TR>
				<TR>
		<TD ><B >PREZZO SPICERS</B></TD>
		<TD ><% = Row(19).Value %></TD>
	</TR>
	<TR>
		<TD ><B >PREZZO IS PRODUCTS</B></TD>
		<TD ><% = Row(20).Value %></TD>
	</TR>
	<TR>
		<TD ><B >PREZZO CWR</B></TD>
		<TD ><% = Row(21).Value %></TD>
	</TR>
		<TR>
		<TD ><B >PREZZO BUFFETTI</B></TD>
		<TD ><% = Row(22).Value %></TD>
	</TR>
		<TR>
		<TD ><B >NOME AGENTE</B></TD>
		<TD ><% = Row(23).Value %></TD>
	</TR>
	<TR>
		<TD ><B >TELEFONO AGENTE</B></TD>
		<TD ><% = Row(24).Value %></TD>
	</TR>
	<TR>
		<TD ><B >CATEGORIA CLIENTE</B></TD>
		<TD ><% = Row(25).Value %></TD>
	</TR>
	<TR><TD COLSPAN=2><HR></TD></TR>
	<TR>
		<TD ><B >RICEVERE EMAIL VIA INTERNET</B></TD>
		<TD ><% = Row(26).Value %></TD>
	</TR>
	<TR><TD COLSPAN=2><HR></TD></TR>
	<TR>
		<TD ><B >DISABILITO LE SPESE DI SPEDIZIONE</B></TD>
		<TD ><% = Row(27).Value %></TD>
	</TR>
	<TR><TD COLSPAN=2><HR></TD></TR>
		<TR>
		<TD ></TD>
		<TD ALIGN=LEFT></TD></TR>
		<TR><TD  width=250></TD>
		<TD ><a href=adutentipro.asp? ><img src='images/save.gif' border=0 ></a></TD>
	</TR>
	</TABLE>
</TD></TR>
</TABLE>
<% = Row.CloseForm %>
</BODY>
</HTML>
<%
    'errore
	if Err.Number<>0 then
	 response.Redirect "adutentipro.asp?err=err"
	end if

%>