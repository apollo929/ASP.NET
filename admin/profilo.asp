<!--#include file="connessionesql.asp" -->
<%
'Inserimento Profilo Prodotti         
txt_password1=Request("password1")   
txt_ragione=Request("ragsoc")   
Verifica=False  


'Inserimento Profilo
if Trim(request("tipo"))="updateric" then
	'Verifica
	'Ricerca codice buffetti
	Set tbprodotti = Server.CreateObject("ADODB.RecordSet")
	sSQL = "select * From prodotti where codice_buf='" & Trim(Cstr((Request.form("codice_ricerca")))) & "' or  codice_od='" & Trim(Cstr((Request.form("codice_ricerca")))) & "'"

	tbprodotti.Open sSQL,connm	
	if not tbprodotti.EOF then
	 descrizione=replace(tbprodotti("descrizione"),"'","`")		
	 codice_ricerca=Trim(Request.form("codice_ricerca"))
	 Verifica=True
	 StrSql="Insert into profilo (password1,codice_isp,Descrizione,Prezzo,Fornitore) values ('" & txt_password1 & "','" & codice_ricerca & "','" & descrizione & "'," & replace((formatnumber(tbprodotti("p1"),2)),",",".") & ",'" & tbprodotti("fornitore") & "')"
	 StrSqllist="Insert into listino (password1,codice_isp,Descrizione,Prezzo,Fornitore,CodCliente) values ('" & txt_password1 & "','" & codice_ricerca & "','" & descrizione & "'," & replace((formatnumber(tbprodotti("p1"),2)),",",".") & ",'" & tbprodotti("fornitore") & "','REG')"
	else%>				  	
		<script language="JavaScript">
	    alert("Codice OD/Buffetti non trovato!");
	    </script>		
		<%
	end if
	tbprodotti.close
									
		
	If Verifica=True then						    		    
		'INSERIMENTO
		Set Tbcarins = Server.CreateObject("ADODB.RecordSet")					
		Tbcarins.Open StrSql, connm	
		Set Tbcarinslist = Server.CreateObject("ADODB.RecordSet")	
		response.write(StrSqllist)
		Tbcarinslist.Open StrSqllist, connm		
	End if			

End if   

	%>
<html>
<head>
<title>SITO WEB E-COMMERCE BACK OFFICE</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body  bgcolor=white class=nero10>
<!-- #include file=_menu.inc --->		
<a class=nero10 href=adutentipro.asp><img border=0 src='imgnew/tasto.gif'>&nbsp;INDIETRO</a><br>									
<table width=100% border=1 cellpadding=0 cellspacing=0>					
<FORM name="form" method="post" action="profilo.asp?prezzo=<%=Trim(Request("Prezzo"))%>&id=<%=Request("Id")%>&password1=<%=txt_password1%>&tipo=updateric" >
<tr><td colspan=3 class=navy10n ><STRONG>RAGIONE SOCIALE :<%=txt_ragione%></STRONG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<STRONG>Rif.Wincody&nbsp;<%=txt_password1%></STRONG></td></tr>
<tr>
<td ><b><INPUT class=navy10n type="image" border="0" name="imgsave" src="images/addnew.gif"></td>
<td width=300 class=navy10n >
<STRONG>INSERIRE CODICE PRODOTTO OD/BUFFETTI</STRONG>
</td>
<td class=navy10n ><B>
<input id="text_1" maxLength="25" name="codice_ricerca" ><INPUT class=navy10n type="image" border="0" name="imgsave" src="images/addnew.gif">
<br></b></td></tr>
</FORM>														
</table>
<% 	sqlgrid="select * from Profilo where password1='" & txt_password1 & "' order by id desc"
	'response.write(sqlgrid)
	'response.end
	
    'Database
	Set Grid = Server.CreateObject("Persits.Grid")
	'Cancella
	Grid.DeleteButtonOnClick = "Sei sicuro di cancellare ?"
	'Connessione
	Grid.Connect strConnect, "", ""	
	'SQL
	Grid.SQL = sqlgrid
	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").ReadOnly = True
	Grid.Cols("password1").ReadOnly = True	
	Grid.Cols("id").Cell.Align="CENTER"
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
	Grid.Cols("Id").AttachExpression "<A class=navy11 HREF=""profilodet.asp?id={{Id}}&password1={{password1}}""><img src=images/edit.gif border=0></A>"

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
