<!-- #include file = "CuteEditor_Files/include_CuteEditor.asp" --> 
<!--#include file ="connessionesql.asp"--><HTML><HEAD>
<title>3DPrestige</title>

<%
'controllo session
if session("amm")<>"true" then
	response.Redirect("../riservata.asp")
end if
ris=""

text_bb=trim(senza_apice(Request("bb.x")))
text_cc=trim(senza_apice(Request("cc.x")))

'controllo record
if request("id")<>"" and text_bb="" and text_cc="" then
	sSql="select id,gallery from gallery where id=" & cdbl(request("id"))
	set tb=server.CreateObject("adodb.recordset")
	tb.open sSql,conn
	text_id=tb("id")
	text_text1=tb("gallery")
end if

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
			
if text_bb<>"" then
	text_id=senza_apice(Request.form("id"))	
	text_text1=senza_apice(Request.Form("Editor1"))
	salvasql=""
	if request("id")<>"" then
	agsql="update gallery set gallery='" & text_text1 & "' where id=" & cdbl(request("id"))
	conn.execute (agsql)
	end if 
	ris="2"
end if

if text_cc<>"" then
	cancsql=""
	cancsql="update gallery set gallery='' where id=" & cdbl(request("id"))
	conn.execute(cancsql)
	ris="3"
end if

%>
<meta name="robots" content="index,follow" >
<meta name="Keywords" content="3DPrestige " >
<meta name="Description" content="3DPrestige.it" >
<meta name="Author" content="www.jeniuscommunications.it" >
<script type="text/javascript" src="swfobject.js"></script>
<link rel="stylesheet" href="stylefonevuoto.css" ></HEAD>
<body bgcolor="#cccccc">
<table width="900" height="100%" align="left">
	<tr>
		<td colspan="2" height="30"><img src="images/testapiccolo.jpg"></td>
	</tr>
	<tr>
		<!--#include file ="menu.asp"-->
	    
		<td align="middle" width="650" valign="top">
		<br>
		<%if ris="1" then%>
			<p class="nero12"><font color="#ff0000" >Inserisci un nuovo campo</font></p>
		<%end if%>
		<%if ris="2" then%>
			<p class="nero12"><font color="#ff0000" >Salvataggio completato</font></p>
		<%end if%>
		<%if ris="3" then%>
			<p class="nero12"><font color="#ff0000" >Campo cancellato</font></p>
		<%end if%>
		
		<form  action=adgallery.asp method=post id=form1 name=form1>
		<input type="hidden" name="id" value="<%=text_id%>">
              <table width="300"  border="0" align="center" cellpadding="1" cellspacing="0" class="nero12">
                	<tr> 
                  		<td colspan=4 >&nbsp;</td>
                	</tr>
                	<tr> 
                  		<td colspan=4>&nbsp;						</td>
                	</tr>
                	<tr> 
                  		<td >Titolo:<font color="black">*</font>						</td>
                  		<td colspan="3">&nbsp;<font face=Calibri 
            size=3><strong>PAGINA GALLERY</strong></font>						</td>
                	</tr>
                	<tr> 
                  		<td >Testo:<font color="black">*</font>						</td>
                  		<td colspan="3">
							<%			
							Dim editor
							Set editor = New CuteEditor
							editor.ID = "Editor1"
							editor.Text = text_text1
							'editor.FullPage = true
							editor.FilesPath = "CuteEditor_Files"
							editor.Draw()
							%>	              		
                  		</td>
                	</tr>
					<tr>
						<td>						</td>
						<td width="77">&nbsp;						</td>
					    <td width="78">
						<input type="image" src="images/salva1.gif" id="bb" name="bb" value="bb" alt="save">
						</td>
					    <td width="105">
						<input type="image" src="images/cancella.gif" id="cc" name="cc" value="cc" alt="cancella">
						</td>
					</tr>
		</table>
		</form>
		</td>
	</tr>
</table>


</body></HTML>
