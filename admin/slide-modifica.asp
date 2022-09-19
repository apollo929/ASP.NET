<!--#include file="connessionesql.asp" -->
<!-- #include file = "cuteditor/CuteEditor_Files/include_CuteEditor.asp" -->
<%
id=request("Id")
if request("mod")=1 then
	descrizione=senza_apice(replace(request.Form("descrizione"),"@import url(cuteditor/asp.css);",""))
	link=senza_apice(request.Form("link"))
	
	sql_ins="insert into slide (slide,link) values ('" & descrizione & "','" & link & "')"
	sql_ins="update slide set slide='" & descrizione & "',link='" & link & "' where id='" & id & "' limit 1"
	'response.Write(sql_ins)
	'response.End()
	Connm.execute(sql_ins)
	response.Redirect("slide-gestione.asp")
end if

Set Tbs = Server.CreateObject("ADODB.RecordSet")
sSQLs = "select * From slide where id='" & id & "' limit 1"
Tbs.Open sSQLs, connm
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
		<form action="slide-modifica.asp?mod=1&id=<%=id%>" method="post" id="form1" name="form1">
		<tr>
			<td>
				<%
				'cute editor	
				Dim editor1
				Set editor1 = New CuteEditor
				editor1.ID = "descrizione"
				editor1.Text = Tbs("slide")
				editor1.FilesPath = "cuteditor/CuteEditor_Files"
				editor1.DisableItemList = "Save"
				editor1.TemplateItemList="G_start,Bold,Italic,Underline,Separator,JustifyLeft,JustifyCenter,JustifyRight,G_end,Undo,Redo,ForeColor,BackColor,FontSize,FontName,InsertImage"
				'editor.AutoConfigure = "Minimal"			
				editor1.Width = 900
				editor1.Height = 600
				editor1.ThemeType="Office2003_BlueTheme"
				editor1.EditorWysiwygModeCss = "cuteditor/asp.css"
				editor1.Draw()
				%>
			</td>
		</tr>
		
		<tr><td height="5px"></td></tr>
		
		<tr><td align="left">Link:</td></tr>
		<tr><td align="left"><input type="text" size="120" name="link" value="<%=Tbs("link")%>"></td></tr>
		
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