<!--#include file="connessionesql.asp" -->
<html>
<head>
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
	<LINK rel="stylesheet" href="style.css">
</head>
<body  bgcolor=white>
<!-- #include file=_menu.inc --->
<HR>
<%' 
   session.lcid=1040
   response.Buffer = True
   on error resume next
	Set Grid = Server.CreateObject("Persits.Grid")
	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "SELECT id,nomelistino,limite1,limite2,ricaricoutente,ricaricogenerico FROM ListinoEsprinet order by limite1 asc"		

 	Grid.Cols("id").readonly = True
	Grid.Cols("id").Cell.Align="CENTER"
	Grid.Cols("id").caption="-"	
	Grid.MethodGet = false
	Grid.ShowLeftSideButtons
	
	' Set Colors
	Grid.ColRange(1,28).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,28).Header.Font.Face = "Verdana"
	Grid.ColRange(1,28).Cell.Font.Face = "Verdana"
	Grid.ColRange(1,28).Cell.Font.Size=2
	Grid("limite1").DefaultValue = 0
	Grid("limite2").DefaultValue = 0
	Grid("ricaricoutente").DefaultValue = 0
	Grid("ricaricogenerico").DefaultValue = 0
	Grid("nomelistino").DefaultValue = "nome listino"
	Grid.Cols("id").AttachExpression "<A class=navy11 HREF=""adlistinidet.asp?id={{Id}}""><img src=images/edit.gif border=0></A>"
	' Specify location of button images
	Grid.ImagePath = "images/"
	Grid.Table.Border = 1
	Grid.Table.CellSpacing = 1
	Grid.Table.CellPadding = 1
				
	Grid.ReadOnly = True
	
	Grid.Display
	Grid.Disconnect

	Set Grid = Nothing
	
%><br>
<a href="adlistinidet.asp?addnew=nuovo" ><img src='images/addnew.jpg' border=0 >NUOVO RECORD</a>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->
