<!--#include file=connessionesql.inc-->
<!-- #include file = "CuteEditor_Files/include_CuteEditor.asp" -->
<%
if request("save")="ok" then
 Dim sValue
 sValue = Replace(Replace(Request.Form("Editor1"),"'","`"),"\","-")
 if cdbl(session("id"))<=100000 or cdbl(session("id"))>700000 then
 	Queryp="update Lista set Descrizione='" & sValue & "' where id='" & session("id")& "'"
 else
 	Queryp="update Lista1 set Descrizione='" & sValue & "' where id='" & session("id")& "'"   
 end if
 'Queryp="update Lista inner join Lista1 on Lista.id=Lista1.id set Lista.Descrizione='" & sValue & "',Lista1.Descrizione='" & sValue & "' where Lista.id=" & session("id")& ""
 set Tblista=Conn.Execute(Queryp) 
 %>
 
 					<table border=0 width=300px>
					<tr>
					<td class="Stile5">
					<fieldset>
					<legend class="botgia style1" >scheda aggiornata</legend>
					<img src="http://www.costruttori.it/annunci/images/si.jpg" border=0>
					inserimento avvenuto con successo
					</fieldset>
					</td>
					</tr>
					</table>
 
<%end if 

if session("Id")="" then 
	response.Redirect("http://www.costruttori.it/login/index.asp")	
end if
Queryp="SELECT * FROM Lista where id='" & session("id") & "' union SELECT * FROM Lista1 where id='" & session("id") & "'"
set Tblista=Conn.Execute(Queryp) 
numc=0
if Tblista("Descrizione")<>"" then
numc=999
end if

if  numc=0 then

%>
<style type="text/css">
<!--
.Stile15 {color: #0066CC}
.Stile18 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 24px;
}
-->
</style><style type="text/css">
<!--
.ciao { border: 1px solid #0033CC; }
.Stile6 {color: #FF6600}
.Stile15 {color: #0066CC}
.Stile17 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
.Stilep {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: bold; color:#FFFFFF    }
.desc {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;  color:#000000    }
.Stile18 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 24px;
}
.nero{
font-family:verdana;
color:#000000;
font-size:11px;
}
.Stile22 {font-family: Verdana, Arial, Helvetica, sans-serif; font-weight: bold; font-size: 12px; }
-->
</style>
<table align="left" width="100%">
<tr>
<td valign=top align=left class="Stile17">
<form action="editormini.asp?save=ok" method="post">

	<%
	'cute editor	
	Dim editor
	Set editor = New CuteEditor
	editor.ID = "Editor1"
	editor.Text = "inserire una breve descrizione dell'azienda"
	editor.FilesPath = "CuteEditor_Files"
	editor.DisableItemList = "Save"
	editor.AutoConfigure = "Minimal"			
	editor.Width = 400
	editor.Height = 160
	editor.ThemeType="Office2003_BlueTheme"
	editor.EditorWysiwygModeCss = "asp.css"
	editor.Draw()

		%>
<br>Full screen (F12)  
<br><input type="submit" value="SALVA SCHEDA TECNICA" />
</td>
</tr>
</table>
</form>

<%end if%>

