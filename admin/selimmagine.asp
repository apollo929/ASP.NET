<!--#include virtual="/parametriasp.inc"-->	
<!--#include virtual="/parametriasplettura.inc" -->
<!--#include virtual="/tipo_dispositivo.inc" -->
<%
'Parametri
odir="articoli/"

txt_id=cdbl(request("id"))

if request("cmd")="preview" Then preview=true else preview=false
if request("cmd")="upload" Then
	'Istanza Upload
	dim objUpload	
	dim strMessage	
	set objUpload = server.CreateObject("Dundas.Upload.2")
	objUpload.UseUniqueNames=false
	on error resume next
	objUpload.Save idir & "\"
	'Attributi del File
	dimensioni=objUpload.Files(0).Size 
	nomefile=objUpload.GetFileName(objUpload.Files(0).Path)
	if not err<>0 then
		'------------------------ creazione foto piccola
		' Creazione file immagine a 100 pixel
		Set Jpeg = Server.CreateObject("Persits.Jpeg")
		' Open source image		
		Jpeg.Open (idir & nomefile)
		' New width
		L = 150
		' Resize, preserve aspect ratio
		Jpeg.Width = L
		Jpeg.Height = L 'Jpeg.OriginalHeight * L / Jpeg.OriginalWidth
		' create thumbnail and save it to disk
		Jpeg.Save idir & "thum_" & nomefile
		Response.Redirect "selimmagine.asp?id=" & txt_id & "&cmd=preview&file=" & nomefile
		'---------------------------------------------
		on error goto 0
	else
		on error goto 0
		Response.Write "<center>"
		Response.Write "<font face=""Verdana"" size=""2"">"
		Response.Write "<b>Errore durante l'upload</b>"
		Response.Write "<br><br>"
		Response.Write "<a href=""merchant_articoli.asp"">Esci</a>"		
		Response.Write "</font>"
		Response.Write "</center>"
		Response.End 
	end if
End If




%> 
<html>
	<head>
		<title>Immagini</title>
		<link href="/admin/style.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		<!--
		.bottoni {  font-family: Verdana; font-size: 8pt; font-style: normal; line-height: normal; color: #000000;}
		-->
		</style>
		<script language="javascript">
				function putimmagine(nome) {
				opener.document.form.immagine.value=nome;
				window.close();
			}
				function putimmagine1(nome) {
				opener.document.form.immagine1.value=nome;
				window.close();
			}
				function putimmagine2(nome) {
				opener.document.form.immagine2.value=nome;
				window.close();
			}
				function putimmagine3(nome) {
				opener.document.form.immagine3.value=nome;
				window.close();
			}
				function putimmagine4(nome) {
				opener.document.form.immagine4.value=nome;
				window.close();
			}
		</script>
	</head>
	<body bgcolor="white" link="black" vlink="black">
			<table width="100%">
				<tr>
					<td class=bianco10 align=middle colspan=2> <b>Gestione Immagini</b></font></td>
				</tr>
				<tr>
				<td class=bianco10 align=middle colspan=2><hr></td>
				</tr>
				<%if preview=false then%>
					<form action="selimmagine.asp?id=<%=txt_id%>&cmd=upload" method="post" name=form1 enctype="multipart/form-data">  
					<tr>
						<td class=bianco10 align=middle colspan=2>
						Upload:&nbsp; <INPUT type="file" id=Foto name=Foto class=bottoni><INPUT type="submit" value="ok" class=bottoni id=submit1 name=submit1>
						</td>
					</tr>
				<%end if%>
				<tr>
					<td class=bianco10 colspan=2 height="20"></td>
				</tr>
				
				<%if preview=true then%>
					<tr>
						<td class=bianco10 align=middle colspan=2>
							 <i>Preview Immagine</i></font>
							<br><br>
							 <u>Originale</u><br><br></font>
							<img src='articoli/<%=request("file")%>' >
							<br><br>
							 <u>Dimensioni Standard</u><br><br></font>
							<img src='articoli/<%=("thum_" & request("file"))%>' >
							<br><br>
							<%if txt_id=1 then %>
							  <a class=orangesp href="javascript:putimmagine('<%=request("file")%>')"><img src="img/frecciaaccetta.jpg" border=0><u></u></a>
							<%end if%>  
							<%if txt_id=2 then %>
							  <a class=orangesp href="javascript:putimmagine1('<%=request("file")%>')"><img src="img/frecciaaccetta.jpg" border=0><u></u></a>
							<%end if%> 
							<%if txt_id=3 then %>
							  <a class=orangesp href="javascript:putimmagine2('<%=request("file")%>')"><img src="img/frecciaaccetta.jpg" border=0><u></u></a>
							<%end if%>  
							<%if txt_id=4 then %>
							  <a class=orangesp href="javascript:putimmagine3('<%=request("file")%>')"><img src="img/frecciaaccetta.jpg" border=0><u></u></a>
							<%end if%>  
							<%if txt_id=5 then %>
							  <a class=orangesp href="javascript:putimmagine4('<%=request("file")%>')"><img src="img/frecciaaccetta.jpg" border=0><u></u></a>
							<%end if%>  							
						</td>
					</tr>
				<%else%>
					<tr>
						<td class=bianco10 align=middle colspan=2>
							 <u>Avvertenze</u>
							<p align=justify style="font-size:14px;">Il programma gestisce esclusivamente immagini con dimensioni 150x150pixels.<br>
							Se l immagine e' quadrata cioe' con altezza e lunghezza uguali e' perfetta.<br>
							Sarà vostra cura mantenere le proporzioni dell'immagine altrimenti verrà distorta come da esempio qui in basso!</p>
							</font>
						</td>
					</tr>
					<tr>
						<td class=bianco10 colspan=2 height="20"></td>
					</tr>
					<tr>
						<td class=bianco10 align=middle>
							 <u>Originale</u><br><br></font>
							<img src="images/imgdemo.jpg">
						</td>
						<td class=bianco10 align=middle>
							 <u>Dopo</u><br><br></font>
							<img src="images/imgdemo.jpg" width=100 height=100>
						</td>
					</tr>
				<%end if%>
			</table>
		</form>
	</body>
</html>



