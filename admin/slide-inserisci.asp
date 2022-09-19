<!--#include file="connessionesql.asp" -->
<!-- #include file = "cuteditor/CuteEditor_Files/include_CuteEditor.asp" -->
<%
if request("crea")=1 then
	descrizione=senza_apice(replace(request.Form("descrizione"),"@import url(cuteditor/asp.css);",""))
	link=senza_apice(request.Form("link"))
	
	sql_ins="insert into slide (slide,link) values ('" & descrizione & "','" & link & "')"
	response.Write(sql_ins)
	'response.End()
	Connm.execute(sql_ins)
	response.Redirect("slide-inserisci.asp")
end if
%>
<html>
<head>
<title>GESTIONE ARTICOLI SLIDE</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" class="nero10">
<!-- #include file=_menu.inc --->
</td>
<td width="20px"></td>
<td valign="top" align="left">
	<br><br>

	<table>
		<tr><td>Inserimento slide homepage. Attenzione alle dimensioni delle immagini (MAX 870x420)</td></tr>
		<tr><td height="10px"></td></tr>
		<form action="slide-inserisci.asp?crea=1" method="post" id="form1" name="form1">
		<tr>
			<td>
				<%
                           'cute editor	
                            Dim editor
                            Set editor = New CuteEditor
                            editor.ID = "Editor1"
                            editor.Text = ""
                            editor.FilesPath = "CuteEditor_Files"
                            editor.DisableItemList = "Save"
                            editor.Height = 350
                            editor.ThemeType="Office2003_BlueTheme"
                            editor.EditorWysiwygModeCss = "asp.css"
                            editor.Draw()
				%>
			</td>
		</tr>
		
		<tr><td height="5px"></td></tr>
		
		<tr><td align="left">Link:</td></tr>
		<tr><td align="left"><input type="text" size="120" name="link"></td></tr>
		
		<tr><td height="5px"></td></tr>
		<tr><td align="left"><input type="submit" style="cursor:pointer;" value="INSERISCI"></td></tr>
		</form>
		<tr><td height="10px"></td></tr>
	</table>
	
</td>
</tr>
</table>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->