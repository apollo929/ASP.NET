<!-- #include file = "connessionesql.inc" -->
<!-- #include file = "CuteEditor_Files/include_CuteEditor.asp" --><HTML><HEAD>
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
nrecord = Request("id_news")

'leggi save varie opzioni
text_ss=trim(senza_apice(Request("ss.x")))
text_aa=trim(senza_apice(Request("aa.x")))
text_nn=trim(senza_apice(Request("nn.x")))
'controllo

dim content



'trova articolo
if nrecord<>"" then
	sql="SELECT * FROM news where id_news=" & nrecord
	set tbweb=server.createobject("adodb.recordset")
	tbweb.open sql,conn,3,3
	if not tbweb.eof then
		Newsdata=tbweb("inserimento")		
		TitleField=tbweb("titolo")		
		MessageField=tbweb("news")	
	end if
	tbweb.close
	set tbweb = nothing	
end if	

'nuovo
if text_nn<>"" then
    Newsdata		=	""
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
<!-- #include file = "../admin/inc/header.inc" --></HEAD>
<body>
<link rel="stylesheet" type="text/css" href="css/admin_style.css">
<table border="0" width="100%" cellpadding="2" height="100%">
	<tr>
		<td colspan="2" height="100" background="images/head.gif" class="titoli_bianco">
		<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100">
			<tr>
				<td width="50%">
				<p style="MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px; MARGIN-LEFT: 5px" class="titoli_bianco">
				<!-- #include file = "../admin/inc/titolo.inc" --></p>
</td>
				<td width="50%">
				<p align="right">
				<a href="logout.php">
				<img border="0" src="images/lucchetto_head.gif" width="100" height="100" alt="LOG OUT"></a></p></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td width="15%" bgcolor="#98a3f6" valign="top">
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




		<table class=testo width="100%" border=0 align=center>
		<tr><td align=middle>
			<table class=testo width="60%" border=0 align=center>
		    <tr><td colspan=3 align=middle>
			<p align="center" class="titoli"><font color="#ff0000">PAGINE SITO WEB</font>
			<br><%=	response.write (messaggio)%></p>		
			<form name="form1" action="addnews.asp?action=save" method="post" ID="form1">
			<input type=hidden value="<%=trim(nrecord)%>" name="id_ultimo" id=id_ultimo>
			</td></tr>
			<tr><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td width=10  align=right>Data</td><td width="100%">
			<%=Newsdata%>
			</td></tr>
			<tr><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td width=10  align=right>Titolo</td>
			<td width="100%"><INPUT type="text" size=40 id=titolo name=titolo value="<%=TitleField%>"></td></tr>
			</table>
			<table class=testo width="100%" border=0 align=center>
			<tr><td colspan=6 align=middle valign=center>
			    
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
			<table class=testo width="80%" border=0 align=center valign=top>
              <TBODY>
			<tr><td width=20 align=left>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<%if text_nn<>"" then%>
			<td width="40%" align=right><input align=right type="image" src="images/save.jpg" value="SALVA"  id="ss" name="ss" value="SALVA"  alt="salva la pagina"></td>	
			<td width=10 align=left></td>
			<%else%>
			<td width=10 align=left><input type="image" src="images/nuovo.jpg" value="NUOVO ARTICOLO" id="nn" name="nn" value="NUOVO ARTICOLO" alt="nuova pagina"></td>
			<td width=10 align=left><input type="image" src="images/agg.jpg" value="AGGIORNA" id="aa" name="aa" value="AGGIORNA" alt="aggiorna pagina" ></td>			
			<%end if%>
			</FORM>
			</td>
			</tr>		
			</table>
		</td></tr></table></TD></TR></TBODY></TABLE>
</body></HTML>
