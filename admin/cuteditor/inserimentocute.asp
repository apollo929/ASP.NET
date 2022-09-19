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
		<table class=testo width=100% border=0 align=left>
		<tr><td align=left>
			<p align="center" class="titoli"><font color="#FF0000">PAGINE SITO WEB</font>
			<br><%=	response.write (messaggio)%></p>		
			<form id=speedform name=modulo action=inserimentocute.asp? method=get>		
		   <table class=testo width=100% border=0 align=left>
		   <tr><td width=30%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td width=10px align=right>Categoria</td><td width=100%>
		   <select onchange=submit(this) name="categoria" ID=Select1>
			<%do while not tbcat.eof%>
				<%if Trim(Category)=cstr(tbcat("id_categoria")) then%>
				<option selected value='<%=tbcat("id_categoria")%>'> <%=tbcat("categoria")%> </option>
				<%end if%>
			<option value='<%=tbcat("id_categoria")%>' > <%=tbcat("categoria")%> </option>
			<%
			tbcat.movenext
			loop
			%>		
			</select>		
			<input type=hidden value="1" name="settaid" id="settaid">	
			</td></tr>
			</form>
			<form name="form1" action="inserimentocute.asp?action=save" method="post" ID="form1">
			<input type=hidden value="<%=trim(Category)%>" name="categoria" id=categoria>
			<input type=hidden value="<%=trim(id_ultimo)%>" name="id_ultimo" id=id_ultimo>
			<tr><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td width=10px  align=right>SottoCategoria</td><td width=100%>
			<select name="sottocategoria" id="sottocategoria" ID=Select2>
			<%do while not tbsotcat.eof%>
				<%if Trim(SubCategory)=cstr(tbsotcat("id_subcategoria")) then%>
				<option selected value='<%=tbsotcat("id_subcategoria")%>'><%=tbsotcat("subcategoria")%></option>
				<%end if%>
			<option value='<%=tbsotcat("id_subcategoria")%>' > <%=tbsotcat("subcategoria")%> </option>
			<%tbsotcat.movenext
			loop
			%>
			</select>
			</td></tr>
			<tr><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td width=10px  align=right>Titolo</td>
			<td width=100%><INPUT type="text" size=40 id=titolo name=titolo value="<%=TitleField%>"></td></tr>
			<tr><td colspan=6 align=center valign=center>
			    
				<%
				'cute editor	
				Dim editor
				Set editor = New CuteEditor
				editor.ID = "Editor1"
				editor.Text = MessageField
				editor.FilesPath = "CuteEditor_Files"
				'editor.FullPage = true
				editor.EditorBodyStyle = "font:normal 12px arial;"
				editor.EditorWysiwygModeCss = "asp.css"
				editor.Draw()

				' Request.Form(ID) access from other page
				%>
			<div class="infoBox">
					Full screen (F12)  
			</div>
			</td></tr>
			</table>
		</td></tr>
		<tr><td align=left valign=top>
			<table class=testo width=100% border=0 align=center valign=top>
			<tr><td width=20px align=left>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<%if text_nn<>"" then%>
			<td width=40% align=right><input align=right type="image" src="images/save.jpg" value="SALVA"  id="ss" name="ss" value="ss"  alt="salva la pagina"></td>	
			<td width=10px align=left><a href="../admin/root/visualizza_articoli.php"><img src="images/lista.jpg" border=0></a></td>
			<%else%>
			<td width=10px align=left><input type="image" src="images/nuovo.jpg" value="NUOVO ARTICOLO" id="nn" name="nn" value="nn" alt="nuova pagina"></td>
			<td width=10px align=left><input type="image" src="images/agg.jpg" value="AGGIORNA" id="aa" name="aa" value="aa" alt="aggiorna pagina" ></td>			
			<td width=10px align=left><a href="../admin/root/visualizza_articoli.php"><img src="images/lista.jpg" border=0></a></td>
			<%end if%>
			</form>
			<%if trim(id_ultimo)<>"" then%>
			<td width=10px align=left><a href="schedatecnica.asp?id_articolo=<%=id_ultimo%>"><img src="images/scheda.jpg" border=0></a></td>
			<%end if%>
			</td>
			</tr>		
			</table>
		</td></tr></table>
		
		</td>
		</tr>
</table>
</body>

</html>