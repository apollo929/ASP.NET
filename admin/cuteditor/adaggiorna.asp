<!-- #include file = "CuteEditor_Files/include_CuteEditor.asp" --> 
<!--#include file ="connessionesql.asp"-->

<%
'controllo session
if session("amm")<>"true" then
	response.Redirect("../riservata.asp")
end if
ris=""

text_aa=trim(senza_apice(Request("aa.x")))
text_bb=trim(senza_apice(Request("bb.x")))
text_cc=trim(senza_apice(Request("cc.x")))

'controllo record
if request("id")<>"" and text_aa="" and text_bb="" and text_cc="" then
	sSql="select id,data,titolo,sottotitolo,testo,url,note from gestione where id=" & cdbl(request("id"))
	set tb=server.CreateObject("adodb.recordset")
	tb.open sSql,conn
	text_id=tb("id")
	text_data=tb("data")  
	text_titolo=tb("titolo") 
	text_sottotitolo=tb("sottotitolo")	
	text_text1=tb("testo")
	text_url=tb("url")
	text_note=tb("note")
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

			

if text_aa<>"" then
	text_id=""
	text_data=""
	text_titolo=""
	text_sottotitolo=""
	text_text1=""
	text_url=""
	text_note=""
	ris="1"
end if
if text_bb<>"" then
	text_id=senza_apice(Request.form("id"))	
	text_data=senza_apice(Request.Form("data"))
	if not isdate(text_data) then 
		text_data=date() 
	end if
	'response.write(text_data)
	'response.write(text_data)
	text_data=year(text_data) & "/" & month(text_data) & "/" & day(text_data)
	'response.write(text_data)

	text_titolo=senza_apice(Request.Form("titolo"))
	text_sottotitolo=senza_apice(Request.Form("sottotitolo"))
	text_text1=senza_apice(Request.Form("Editor1"))
	text_url=senza_apice(Request.Form("url"))
	text_note=senza_apice(Request.Form("Editor2"))
	salvasql=""
	if request("id")="" then			
	salvasql="insert into gestione(data,titolo,sottotitolo,testo,url,note) values('"& text_data &"', '"&text_titolo &"' ,'"&text_sottotitolo &"' ,'"& text_text1 &"','"& text_url &"','"& text_note &"')"
 	conn.execute (salvasql)
	'response.write(salvasql)
	end if
	if request("id")<>"" then
	agsql="update gestione set data='" & text_data & "',titolo='" & text_titolo & "',sottotitolo='" & text_sottotitolo & "',testo='" &text_text1 & "', url='" & text_url & "',note='" & text_note & "' where id=" & cdbl(request("id"))
	'response.write(agsql)
	conn.execute (agsql)
	end if 
	ris="2"
end if

if text_cc<>"" then
	cancsql=""
	cancsql="delete from gestione where id=" & cdbl(request("id"))
	conn.execute(cancsql)
	ris="3"
end if
%>


<html>
<head>
<title>3DPrestige</title>
<meta name="robots" content="index,follow" >
<meta name="Keywords" content="3DPrestige " >
<meta name="Description" content="3DPrestige.it" >
<meta name="Author" content="www.jeniuscommunications.it" >
<script type="text/javascript" src="swfobject.js"></script>
<link rel="stylesheet" href="stylefonevuoto.css" >
</head>
<body bgcolor="#CCCCCC">
<table width="900px" height="100%" align="left">
	<tr>
		<td colspan="2" height="30px"><img src="images/testapiccolo.jpg"></td>
	</tr>
	<tr>
		<!--#include file ="menu.asp"-->
	    
		<td align="center" width="650px" valign="top">
		<br>
		<%if ris="1" then%>
			<p class="nero12"><font color="#FF0000" style="calibri">Inserisci un nuovo campo</font></p>
		<%end if%>
		<%if ris="2" then%>
			<p class="nero12"><font color="#FF0000" style="calibri">Salvataggio completato</font></p>
		<%end if%>
		<%if ris="3" then%>
			<p class="nero12"><font color="#FF0000" style="calibri">Campo cancellato</font></p>
		<%end if%>
		
		<form  action=adaggiorna.asp method=post id=form1 name=form1>
		<input type="hidden" name="id" value="<%=text_id%>">
              <table width="300px"  border="0" align="center" cellpadding="1" cellspacing="0" class="nero12">
                	<tr> 
                  		<td colspan=4 >&nbsp;</td>
                	</tr>
                	<tr> 
                  		<td colspan=4>&nbsp;						</td>
                	</tr>
                	<tr> 
                  		<td width="62" >Data:<font color="black">*</font>						</td>
                  		<td colspan="3"><input type="text"  id="text_1" maxLength="10" name="data" value="<%=text_data%>" STYLE="color: #000000; font-family: calibri;                            font-weight: bold; font-size: 14px;border: solid 1px black;background-color: #ffffff;">						</td>
                	</tr>
                	<tr> 
                  		<td >Titolo:<font color="black">*</font>						</td>
                  		<td colspan="3"><input type="text"  id="text_2" maxLength="25" name="titolo" value="<%=text_titolo%>" STYLE="color: #000000; font-family: calibri;                            font-weight: bold; font-size: 14px;border: solid 1px black;background-color: #ffffff;">						</td>
                	</tr>
                	<tr> 
                  		<td >Sottotitolo:<font color="black">*</font>						</td>
                  		<td colspan="3"><input type="text"  id="text_3" maxLength="30" name="sottotitolo" value="<%=text_sottotitolo%>" size="25" STYLE="color: #000000; font-famil:                            calibri; font-weight: bold; font-size: 14px;border: solid 1px black;background-color: #ffffff;">						</td>
                	</tr>
                	<tr> 
                  		<td >Testo:<font color="black">*</font>						</td>
                  		<td colspan="3">
							<%			
							Dim editor
							Set editor = New CuteEditor
							editor.ID = "Editor1"
							editor.Text = text_text1
							editor.FilesPath = "CuteEditor_Files"
							editor.Draw()
							%>	              		
                  		</td>
                	</tr>
					<tr> 
                  		<td >URL:<font color="black">*</font>						</td>
                  		<td colspan="3"><input type="text"  id="text_3" maxLength="30" name="url" value="<%=text_url%>" size="30" STYLE="color: #000000; font-family:                            calibri; font-weight: bold; font-size: 14px;border: solid 1px black;background-color: #ffffff;">						</td>
                	</tr>
                	<tr> 
                  		<td >Note:<font color="black">*</font>						</td>
                  		<td colspan="3">
                  		    <%			
							Dim editor_n
							Set editor_n = New CuteEditor
							editor_n.ID = "Editor2"
							editor_n.Text = text_note
							editor_n.FilesPath = "CuteEditor_Files"
							editor_n.Draw()
							%>	
							</td>
                	</tr>
					<tr>
						<td>						</td>
						<td width="77">
						<input type="image" src="images/nuovo.gif" id="aa" name="aa" value="aa" alt="nuovo">						</td>
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


</body>
</html>
