<!--#include file="connessionesql.asp" -->
<html>
<head>
<title></title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor=white class=nero11>
<!--#include file="_menu.inc"-->		
<%  
on error resume next

'Inserimento ADD
if Trim(request("tipo"))="updateric" then
			
	'Ricerca codice spicers
	Set Tbsp = Server.CreateObject("ADODB.RecordSet")
	'sSQL = "select * From Spicers where Spicers='" & Trim(Cstr((Request.form("Codice_ISP")))) & "'"
	sSQL = "select * From prodotti where codice_sp='" & Trim(Cstr((Request.form("Codice_ISP")))) & "' or codice_prodotto='" & Trim(Cstr((Request.form("Codice_ISP")))) & "' or codice_buf='" & Trim(Cstr((Request.form("Codice_ISP")))) & "'"
	Tbsp.Open sSQL,connm																
												
	Verifica=False													
	if not Tbsp.EOF then
		if instr(1,Tbsp("fornitore"),"SPI")>0 then
			Descrizione=replace(Tbsp("Descrizione"),"'","`")		
			Codice_ISP=Trim(Request.form("Codice_ISP"))
			Verifica=True
			StrSql="Insert into profilo (password1,codice_isp,Descrizione,Prezzo,Fornitore,internet) values ('offerte','" & Codice_ISP & "','" & descrizione & "'," & Replace(Formatnumber(Tbsp("p1"),2),",",".") & ",'spicers','1')"
			'response.Write("<br>----"&StrSql)
			'response.end
			Tbsp.close
		else
	 	'iserire inserimento codici buffetti
		'Ricerca codice buffetti
			Descrizione=" Vuoto "
			Descrizione=replace(Tbsp("Descrizione"),"'","`")	
			
			Codice_ISP=Trim(Request.form("Codice_ISP"))
			Verifica=True
			StrSql="Insert into profilo (password1,codice_isp,Descrizione,Prezzo,Fornitore,internet) values ('offerte','" & Codice_ISP & "','" & descrizione & "'," & Replace(Formatnumber(Tbsp("p1"),2),",",".") & ",'buffetti','1')"
			Tbbuf.close		
		end if	
	else
		Descrizione=" Vuoto "%>
		<script language="JavaScript">
		alert("Codice Spicers/Buffetti non trovato!");
		</script>
	<%end if
														
		
	if Verifica=True then						    		    
		'INSERIMENTO
		connm.Execute StrSql					
	end if			
End if                 
%>											
<table width=100% border=1 cellpadding=0 cellspacing=0>					
<FORM name="form" method="post" action="offertespicers.asp?prezzo=<%=Trim(Request("Prezzo"))%>&id=<%=Request("Id")%>&password1=<%=txt_password1%>&tipo=updateric" >
<tr><td colspan=3><STRONG>OFFERTE HOMEPAGE >>>>>  INSERIRE MINIMO 6 ARTICOLI DA SPICERS 2 BUFFETTI <font color=RED>(N.B:IL NUMERO DEI PRODOTTI INSERITI DEVE ESSERE PARI )</font> </STRONG></EM></td></tr>
<tr>
<td ><b><INPUT class=navy10n type="image" border="0" name="imgsave" src="images/addnew.gif"></td>
<td width=300 class=navy10n >
<STRONG><EM>Inserire Codice Prodotto Spicers/Buffetti (l'articolo  inserito compare come primo della lista)</EM></STRONG>
</td>
<td class=navy10n ><B>
<input id="text_1" maxLength="25" name="codice_isp" >Aggiungi Codice<INPUT class=navy10n type="image" border="0" name="imgsave" src="images/addnew.gif"></b></td></tr>
</FORM>														
</table>
<%' 
    'Database
	' Build connection string to aspgrid.mdb
	Set Grid = Server.CreateObject("Persits.Grid")

	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "select * from Profilo where password1='offerte' order by id desc"
	
	'METODO POST
	Grid.MethodGet=False
	
	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id").readonly = True
	Grid.Cols("id").Caption="-"
	Grid.Cols("codice_isp").Caption="Codice"	
	Grid.Cols("password1").Hidden = True
	Grid.Cols("descrizione").InputSize =60 
    'Grid.Cols("prezzo").FormatNumeric 2,True,True,False 
	' Set Colors
	Grid.ColRange(1,7).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,7).Header.Font.Face = "Verdana"
	Grid.ColRange(1,7).Cell.Font.Face = "Verdana"
	Grid.ColRange(1,7).Cell.Font.Size=2
	Grid(0).Header.BGColor = "#B0B0FF"
	Grid(999).Header.BGColor = "#B0B0FF"
	Grid.Cols("Id").AttachExpression "<A class=navy11 HREF=""offertespicersdet.asp?id={{Id}}""><img src=images/edit.gif border=0></A>"
	' Specify location of button images
	Grid.ImagePath = "images/"
	' Make grid read-only
	Grid.ReadOnly = True
	
	Grid.Display
	Grid.Disconnect

	Set Grid = Nothing
%>

</body>
</html>
<!-- #include file=sqlchiudi.inc --->
