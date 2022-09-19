<!--#include file="connessionesql.asp" -->
<%
'Inserimento Listino x Buffetti Spicers Isp         
txt_password1=Request("password1")   
txt_ragione=Request("ragsoc")   
  
'Inserimento Listino
if Trim(request("tipo"))="updateric" then
	'Verifica
	Verifica=False	
	'Ricerca codice buffetti
	Set Tbbuf = Server.CreateObject("ADODB.RecordSet")
	sSQL = "select * From Catbuffetti where Codice='" & Trim(Cstr((Request.form("Codice_ISP")))) & "'"
	Tbbuf.Open sSQL,connm	
	if not Tbbuf.EOF then
	Descrizione=replace(Tbbuf("Descrizione"),"'","`")		
	Codice_ISP=Trim(Request.form("Codice_ISP"))
	Verifica=True
	StrSql="Insert into Listino (codcliente,fornitore,password1,codice_isp,Descrizione,Prezzo) values ('REG','buffetti','" & txt_password1 & "','" & Codice_ISP & "','" & descrizione & "'," & replace((formatnumber(Tbbuf("Prezzo1"),2)),",",".") & ")"
	Tbbuf.close
	else				  	
	'Ricerca codice spicers
	Set Tb1 = Server.CreateObject("ADODB.RecordSet")
	sSQL = "select * From Spicers where Spicers='" & Trim(Cstr((Request.form("Codice_ISP")))) & "'"
	Tb1.Open sSQL,connm																											
	if not Tb1.EOF then
		Descrizione=replace(Tb1("Descrizione"),"'","`")		
		Codice_ISP=Trim(Request.form("Codice_ISP"))
		Verifica=True
		StrSql="Insert into Listino (codcliente,fornitore,password1,codice_isp,Descrizione,Prezzo) values ('REG','spicers','" & txt_password1 & "','" & Codice_ISP & "','" & descrizione & "'," & replace((formatnumber(Tb1("Prezzo"),2)),",",".") & ")"
		Tb1.close																											
	else
		'Ricerca codice isp
		Set Tb2 = Server.CreateObject("ADODB.RecordSet")
		sSQL2 = "select * From db_ARTICOLI where Codice_ISP='" & Trim(Cstr((Request.form("Codice_ISP")))) & "'"
		Tb2.Open sSQL2,connm
		If not Tb2.EOF then
			Descrizione=replace(Tb2("Descrizione"),"'","`")		
			Codice_ISP=Trim(Request.form("Codice_ISP"))
			Verifica=True				  	
			StrSql="Insert into Listino (codcliente,fornitore,password1,codice_isp,Descrizione,Prezzo) values ('REG','isp','" & txt_password1 & "','" & Codice_ISP & "','" & descrizione & "'," & replace((formatnumber(Tb2("PrezzodiVendita"),2)),",",".") & ")"
			Tb2.close																																																														
		else		
				Set Tb3 = Server.CreateObject("ADODB.RecordSet")
				sSQL = "select * From shop_products where ccode='" & Trim(Cstr((Request.form("Codice_ISP")))) & "'"
				Tb3.Open sSQL,connm		
				If not Tb3.EOF then
					Descrizione=replace(Tb3("cdescription"),"'","`")		
					Codice_ISP=Trim(Request.form("Codice_ISP"))
					Verifica=True				  	
					StrSql="Insert into Listino (codcliente,fornitore,password1,codice_isp,Descrizione,Prezzo) values ('REG','ecommerce','" & txt_password1 & "','" & Codice_ISP & "','" & descrizione & "'," & replace((formatnumber(Tb3("cprice"),2)),",",".") & ")"
					Tb3.close																																																														
				else		  	
				Descrizione=" Vuoto "			%>
				<script language="JavaScript">
				alert("Codice Spicers/ISP/Buffetti/Ecommerce non trovato!");
				</script>		<%
				end if
		end if 		
	end if
	end if														
		
	If Verifica=True then						    		    
	'INSERIMENTO
	Set Tbcarins = Server.CreateObject("ADODB.RecordSet")					
	Tbcarins.Open StrSql, connm		
	End if			

End if   

	%>
<html>
<head>
<title>SITO WEB E-COMMERCE BACK OFFICE</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="calendar.js"></script>
</head>
<body bgcolor=white class=nero11>
<!--#include file="_menu.inc"-->		
<a class=nero10 href=adutentipro.asp><img border=0 src='imgnew/tasto.gif'>&nbsp;INDIETRO</a><br>									
<table width=100% border=1 cellpadding=0 cellspacing=0>					
<FORM name="form" method="post" action="adlistinopar.asp?prezzo=<%=Trim(Request("Prezzo"))%>&id=<%=Request("Id")%>&password1=<%=txt_password1%>&tipo=updateric" >
<tr><td colspan=3 class=navy10n ><STRONG>RAGIONE SOCIALE :<%=txt_ragione%></STRONG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<STRONG>Rif.Wincody&nbsp;<%=txt_password1%></STRONG></td></tr>
<tr>
<td ><b><INPUT class=navy10n type="image" border="0" name="imgsave" src="images/addnew.gif"></td>
<td width=300 class=navy10n >
<STRONG>INSERIRE CODICE PRODOTTO </STRONG>
</td>
<td class=navy10n ><B>
<input id="text_1" maxLength="25" name="codice_isp" ><INPUT class=navy10n type="image" border="0" name="imgsave" src="images/addnew.gif">
<br></b></td></tr>
</FORM>														
</table>
<%' 
    'Database
	Set Grid = Server.CreateObject("Persits.Grid")
	'Cancella
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare ?"
	'Connessione
	Grid.Connect strConnect, "", ""	
	'SQL
	Grid.SQL = "select * from Listino where password1='" & txt_password1 & "'"
	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").ReadOnly = True
	Grid.Cols("password1").ReadOnly = True	
	Grid.Cols("id").Cell.Align="CENTER"
	Grid.Cols("id").Caption="n°rec"
	Grid.Cols("id").Caption="n°rec"
	Grid.Cols("password1").Caption="rif.utente"
	Grid.Cols("codice_isp").Caption="cod.articolo"
		
	' Enable sorting
	Grid.ColRange(1,7).CanSort = True
	Grid.ColRange(1,7).CanSort = True

	' Set Colors
	Grid.ColRange(1,7).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,7).Header.Font.Face = "Verdana"
	Grid.ColRange(1,7).Cell.Font.Face = "Verdana"
	Grid.ColRange(1,7).Cell.Font.Size=2
	Grid(0).Header.BGColor = "#B0B0FF"
	Grid(999).Header.BGColor = "#B0B0FF"
	Grid.Cols("Id").AttachExpression "<A class=navy11 HREF=""adlistinodet.asp?id={{Id}}&password1={{password1}}""><img src=images/edit.gif border=0></A>"

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

</body>
</html>
<!-- #include file=sqlchiudi.inc --->
