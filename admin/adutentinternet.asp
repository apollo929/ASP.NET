<!--#include file="connessionesql.asp" -->
<html>
<head>
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="calendar.js"></script>
</head>
<body  bgcolor=white class=nero10>
<!-- #include file=_menu.inc --->
<a class=nero10 href=proc_stampaint.asp><img border=0 src=imgnew/tasto.gif>&nbsp;STAMPA UTENTI INTERNET</a><br>
<a class=nero10 href=proc_email.asp><img border=0 src=imgnew/tasto.gif>&nbsp;MAIL UTENTI INTERNI X OFFERTE</a><br>
<a class=nero10 href=proc_emailinternet.asp><img border=0 src=imgnew/tasto.gif>&nbsp;MAIL UTENTI INTERNET X OFFERTE</a><br>
<FORM ACTION="adutentinternet.asp" ID=Form1><br>
Ricerca Codicecliente o Password:<BR>
<INPUT TYPE="TEXT" NAME="CRITERIA" VALUE="<% = Request("Criteria") %>" ID=TEXT1>
<INPUT TYPE="SUBMIT" NAME="Search" VALUE="Go" ID=SUBMIT2>
</FORM> <br>
<FORM ACTION="adutentinternet.asp" id=Form2 name=form1>
Ricerca Ragione Sociale:<BR>
<INPUT TYPE="TEXT" NAME="CRITERIAR" VALUE="<% = Request("Criteriar") %>" ID=TEXT2>
<INPUT TYPE="SUBMIT" NAME="Search" VALUE="Go" ID=SUBMIT3>
</FORM> 
<HR>
<b>GESTIONE UTENTI PROVENIENTI DA INTERNET</b>
<HR>	
<%' 
on error goto 0
    if Trim(request("err"))="si"  then
     Response.Write "<br><br><b>Password gia' presente ATTENZIONE</b><br><br>"
    end if
    if Trim(request("err"))="vuota"  then
     Response.Write "<br><br><b>Password vuota ATTENZIONE</b><br><br>"
    end if
	 'Database
	' Build connection string to aspgrid.mdb
	Set Grid = Server.CreateObject("Persits.Grid")
	
	Set tb = Server.CreateObject("ADODB.Recordset")	
	tb.Open "select count(frequenza) as Tot from registrazioneint ",connm
	response.write("<b class=nero11>NUMERO UTENTI PROVENIENTI DA INTERNET --->>>  " & tb("Tot")  & "</b>") 
	tb.Close
	
	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "select id,id  as idinc,Ragione,Utente1,Password2,Password1,Prezzo,Prezzoisp,Prezzobuffetti,Nome,Cognome,Email,telefono,nomeagente,frequenza from Registrazioneint order by Ragione asc "
		
    Grid.MaxRows=200

	
	

	
	'MAX RECORD

	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").ReadOnly = True
	Grid.Cols("id").Cell.Align="CENTER"
	Grid.Cols("id").Caption="-"
	Grid.Cols("idinc").ReadOnly = True
	Grid.Cols("idinc").Cell.Align="CENTER"
	Grid.Cols("idinc").Caption="-"	
	Grid.Cols("utente1").Caption="Utente"	
	Grid.Cols("password2").Caption="Password"
	Grid.Cols("password1").Caption="Rif.Wincody"
	Grid.Cols("frequenza").Caption="N°"
	Grid.Cols("prezzo").Caption="Prezzo Spicers"	
            
	' Enable sorting
	Grid.ColRange(1,28).CanSort = True

	' Set Colors
	Grid.ColRange(1,28).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,28).Header.Font.Face = "Verdana"
	Grid.ColRange(1,28).Header.Font.Size=2
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
	Grid.Cols("Id").AttachExpression "<A class=navy11 HREF=""dettaglioint.asp?id={{Id}}&password={{password1}}""><img src=images/edit.gif border=0></A>"
	Grid.Cols("Idinc").AttachExpression "<A class=navy11 HREF=""trasfint.asp?id={{Id}}&password={{password1}}""><img src=img/ie-map.gif border=0></A>"
	
	
	' Find a record if a search criteria is set
	Criteria = Request("CRITERIA")
	If Criteria <> "" Then
	  Grid.Find "password2 like '" & TRIM(Criteria) & "'"
	End If
	
	Criteriar = Request("CRITERIAr")
	If Criteriar <> "" Then
	  Grid.Find "ragione like '%" & TRIM(Criteriar) & "%'"
	End If
	
	' Make grid read-only
	Grid.ReadOnly = True
	Grid.Display
	Grid.Disconnect

	Set Grid = Nothing
	
	
	
		
%>
<br>
<a href="dettaglioint.asp?id=0&mod=addnew" id=addnew name=addnew>
<b>Add New/Nuovo</b></b><img src='images/addnew.jpg' border=0></a>
</FORM>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->
