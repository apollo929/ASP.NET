<!-- #include file = "connessionesql.inc" -->
<!-- #include file = "CuteEditor_Files/include_CuteEditor.asp" -->
<%
MessageField=""

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
text_aa=trim(senza_apice(Request("aa.x")))

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
				'fine tabella categoria										
				TitleField=tbweb("Titolo")		
				MessageField=tbweb("HTML2")	
				set tblast=Conn.execute(sql)
				id_ultimo=tblast("id_articolo")
				tblast.close
			end if
			tbweb.close
			set tbweb = nothing
	end if			
end if	


'modifica
if text_aa<>"" then
    id_ultimo =	Request("id_ultimo")
    if id_ultimo<>"" then
			sql="SELECT * FROM articoli_ufficioshop where id_articolo=" & cint(id_ultimo)
			set tbweb=server.createobject("adodb.recordset")
			tbweb.open sql,conn,3,3
            'response.Write("modifica --- " & sql)
			TitleField = senza_apice(Request.Form("titolo"))
			MessageField	=	senza_apice(Request.Form("Editor1")) 
			Category=tbweb("categoria")
			SubCategory=tbweb("subcategoria")
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
			'fine tabella categoria		
			if tbweb("HTML2")<>MessageField then				
				tbweb("Titolo")	=	TitleField
				tbweb("HTML2")	=	MessageField
				tbweb.update
				messaggio="<font size=3 color=red>modifica pagina</font><br>"
				tbweb.close
				set tbweb = nothing
			end if	
	end if		
end if	

%>
<html>
<body>
<link rel="stylesheet" type="text/css" href="css/admin_style.css">
<table border="0" width="100%" cellpadding="2" height="100%">
	<tr>
		<td colspan="2" height="100" background="images/head.gif" class="titoli_bianco">
		<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100">
			<tr>
				<td width="50%">
				<p style="margin-left: 5px; margin-top:0; margin-bottom:0" class="titoli_bianco"></td>
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
		<p align="center" class="titoli"><font color="#FF0000">SCHEDA TECNICA</font>
		<br><%=	response.write (messaggio)%></p>	
		<form name="form1" action="schedatecnica.asp?action=save" method="post" ID="form1">	
        <table class=testo width=100% border=0 align=left>
        <tr><td width=30%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td width=10px align=right>Categoria</td><td width=100%>
        <select onchange=submit(this) name="categoria" ID=Select1>
		<%do while not tbcat.eof%>
			<%if Trim(Category)=cstr(tbcat("id_categoria")) then%>
			<option selected value='<%=tbcat("id_categoria")%>'><%=tbcat("categoria")%></option>
			<%end if%>
		<%
		tbcat.movenext
		loop
		%>		
		</select>		
		</td></tr>
		<input type=hidden value="<%=trim(Category)%>" name="categoria" id=categoria>
		<input type=hidden value="<%=trim(id_ultimo)%>" name="id_ultimo" id=id_ultimo>
		<tr><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td width=10px  align=right>SottoCategoria</td><td width=100%>
		<select name="sottocategoria" id="sottocategoria" ID=Select2>
		<%do while not tbsotcat.eof%>
			<%if Trim(SubCategory)=cstr(tbsotcat("id_subcategoria")) then%>
			<option selected value='<%=tbsotcat("id_subcategoria")%>'><%=tbsotcat("subcategoria")%></option>
			<%end if%>
		<%tbsotcat.movenext
		loop
		%>
		</select>
		</td></tr>
		<tr><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td width=10px  align=right>Titolo</td>
		<td width=100%><INPUT type="text" size=60 id=titolo name=titolo value="<%=TitleField%>"></td></tr>
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
		<tr><td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width=70%  align=left><input type="image" src="images/agg.jpg" id="aa" name="aa" value="a"  alt="aggiorna la scheda">
		<a href=inserimentocute.asp?id_articolo=<%=id_ultimo%>><image src="images/torna.jpg" border=0></a></td>
		</form>
		<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>		
		</table>
		
		
		</td>
		</tr>
</table>
</body>

</html>