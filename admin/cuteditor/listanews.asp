<!-- #include file = "connessionesql.inc" -->
<!-- #include file = "CuteEditor_Files/include_CuteEditor.asp" -->
<%

Function senza_apice(byval txt)
lt=len(txt)
tx=""
for f=1 to lt
	c=mid(txt,f,1)
	if c="'" then
		c="`"
	end if
	tx=tx+c
next
senza_apice=tx
End function

'leggi categoria
Category = Request("categoria")

'leggi save varie opzioni
text_ss=trim(senza_apice(Request("ss.x")))
text_aa=trim(senza_apice(Request("aa.x")))
text_nn=trim(senza_apice(Request("nn.x")))
'controllo
if text_ss="" and text_aa="" and text_nn="" and Request("id_articolo")="" then
	text_nn="100"
	id_ultimo = ""
	if Category="" then
		Category ="1"
	end if
end if


'tabella categoria
set tbcat = Server.CreateObject("ADODB.Recordset")	
'tabella sottocategoria
set tbsotcat = Server.CreateObject("ADODB.Recordset")	
sqlcat="SELECT * FROM categorie_ufficioshop order by categoria"       
tbcat.Open sqlcat,conn
if Trim(Category)="" then
sqlsottocat="SELECT * FROM subcat_ufficioshop order by subcategoria"       
else
sqlsottocat="SELECT * FROM subcat_ufficioshop where cat='" & Trim(Category) & "' order by subcategoria" 
end if
tbsotcat.Open sqlsottocat,conn

dim content



'trova articolo
if Request("id_articolo")<>"" then    
    if isnumeric(id_articolo) then
            id_ultimo =	Request("id_articolo")
			sql="SELECT * FROM articoli_ufficioshop where id_articolo=" & cint(id_ultimo)
			set tbweb=server.createobject("adodb.recordset")
			'response.Write("visua id --- " & sql)
			tbweb.open sql,conn,3,3
			if not tbweb.eof then
				Category=tbweb("categoria")
				SubCategory=tbweb("subcategoria")		
				TitleField=tbweb("Titolo")		
				MessageField=tbweb("HTML1")	
				set tblast=Conn.execute(sql)
				id_ultimo=tblast("id_articolo")
				tblast.close
			else
			    'vai a vuoto
			    text_nn="100" 
			end if
			tbweb.close
			set tbweb = nothing
	end if			
end if	

'nuovo
if text_nn<>"" or trim(request("settaid"))="1" then
    'response.Write("vuoto --- " & sql)
    text_nn			=	"100"
    'Category		=	"1"
    SubCategory		=	""
	TitleField		=	""
	MessageField	=	""
end if	

'modifica
if text_aa<>"" then
    id_ultimo =	Request("id_ultimo")
    if id_ultimo<>"" then
			sql="SELECT * FROM articoli_ufficioshop where id_articolo=" & cint(id_ultimo)
			set tbweb=server.createobject("adodb.recordset")
			tbweb.open sql,conn,3,3
            'response.Write("modifica --- " & sql)
			Category=tbweb("categoria")
			SubCategory=tbweb("subcategoria")	
			TitleField = senza_apice(Request.Form("titolo"))
			MessageField	=	senza_apice(Request.Form("Editor1")) 
			if tbweb("HTML1")<>MessageField then				
				tbweb("Titolo")	=	TitleField
				tbweb("HTML1")	=	MessageField
				tbweb.update
				messaggio="<font size=3 color=red>modifica pagina</font><br>"
				tbweb.close
				set tbweb = nothing
			end if	
	end if		
end if	

'aggiunge record
if text_ss<>"" and Trim(Request("id_ultimo"))="" then
    Category		=	Request.Form("categoria")
    SubCategory		=	Request.Form("sottocategoria")
	TitleField		=	trim(senza_apice(Request.Form("titolo")))
	MessageField	=	trim(senza_apice(Request.Form("Editor1")))
	
	if TitleField="" or MessageField="" then%>
		<SCRIPT language="JavaScript">
		alert('inserire titolo e descrizione');
		</SCRIPT> 
	<%  text_nn = "100"
	else     	
		sql="SELECT * FROM articoli_ufficioshop order by id_articolo desc"
		set tbweb=server.createobject("adodb.recordset")
		tbweb.open sql,conn,3,3
		'response.Write("add --- " & sql)	
		tbweb.addnew
		tbweb("categoria")	=	Category
		tbweb("subcategoria")	=	SubCategory
		tbweb("Titolo")	=	TitleField
		tbweb("HTML1")	=	MessageField
		tbweb.update
		set tblast=Conn.execute(sql)
		id_ultimo=tblast("id_articolo")
		messaggio="<font size=3 color=red>aggiunta pagina</font><br>"
	    tblast.close
		tbweb.close
		set tbweb = nothing
	end if	
end if	

%>
<html>
<!-- #include file = "../admin/inc/header.inc" -->
<body>
<link rel="stylesheet" type="text/css" href="css/admin_style.css">
<table border="0" width="100%" cellpadding="2" height="100%">
	<tr>
		<td colspan="2" height="100" background="images/head.gif" class="titoli_bianco">
		<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100">
			<tr>
				<td width="50%">
				<p style="margin-left: 5px; margin-top:0; margin-bottom:0" class="titoli_bianco">
				<!-- #include file = "../admin/inc/titolo.inc" -->
</td>
				<td width="50%">
				<p align="right">
				<a href="logout.php">
				<img border="0" src="images/lucchetto_head.gif" width="100" height="100" alt="LOG OUT"></a></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td width="15%" bgcolor="#98A3F6" valign="top">
<table border="0" width="190" cellpadding="2" height="100%">
	<tr>
		<td height="1%" nowrap>

<iframe name="I1" src="../admin/menu_left.php" scrolling="no" border="0" frameborder="0" width="169" height="150">
</iframe>
		</td>
	</tr>
	<tr>
		<td height="99%" valign="bottom">

&nbsp;</td>
	</tr>
</table>
		</td>
		<td width="84%" valign="top">
		
		
		
		<%' 

    'Database
	' Build connection string to aspgrid.mdb
	Set Grid = Server.CreateObject("Persits.Grid")


	'Connessione
	Grid.Connect "server=208.109.198.20;database=lufficio;user=lufficio;password=ufficio09.;driver={MySQL ODBC 3.51 Driver};", "", ""
	
	'SQL
	Grid.SQL = "select id_news,id_news as id_taglia,titolo,news,inserimento from news"
		
    Grid.MaxRows=50
	
	
	'MAX RECORD

	'Enable Left-side buttons
	Grid.ShowLeftSideButtons
	
	'Hide identity column
	Grid.Cols("id_news").ReadOnly = True
	Grid.Cols("id_news").Cell.Align="CENTER"
	Grid.Cols("id_news").Caption="-"
	Grid.Cols("id_taglia").ReadOnly = True
	Grid.Cols("id_taglia").Cell.Align="CENTER"
	Grid.Cols("id_taglia").Caption="-"	
            
	' Enable sorting
	Grid.ColRange(1,5).CanSort = True
	Grid.ColRange(7,28).CanSort = True

	' Set Colors
	Grid.ColRange(1,28).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,28).Header.Font.Face = "Verdana"
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
	Grid.Cols("id_news").AttachExpression "<A class=navy11 HREF=""addnews.asp?mod=yes&id_news={{id_news}}""><img src='http://www.lufficio.it/admin/images/edit.gif' border=0></A>"
	Grid.Cols("id_taglia").AttachExpression "<A class=navy11 HREF=""addnews.asp?mod=del&id_news={{id_taglia}}""><img src='http://www.lufficio.it/cuteditor/images/delete.gif' border=0></A>"	
	Grid.ReadOnly=true
			
	Grid.Display
	Grid.Disconnect
	Set Grid = Nothing
	
%>
		
		
		</td>
		</tr>
</table>
</body>

</html>