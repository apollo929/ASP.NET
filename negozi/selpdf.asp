<%
'Parametri
idir="c:\inetpub\vhosts\spazioufficiosrl.it\httpdocs\negozi\articoli\"
odir="articoli/"


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
		Jpeg.Save (idir & nomefile)
		Response.Redirect "selpdf.asp?id=" & txt_id & "&cmd=preview&file=" & nomefile
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
		<title>PDF</title>
		<link href="/admin/style.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		<!--
		.bottoni {  font-family: Verdana; font-size: 8pt; font-style: normal; line-height: normal; color: #000000;}
		-->
		</style>
		<script language="javascript">
				function putpdf(nome) {
				// alert("ciaio");
				opener.document.form.immaginepdf.value=nome;
				window.close();
					}
		</script>
	</head>
	<body bgcolor="white" link="black" vlink="black">
			<table width="100%">
				<tr>
					<td class=bianco10 align=middle colspan=2> <b>Gestione PDF</b></font></td>
				</tr>
				<tr>
				<td class=bianco10 align=middle colspan=2><hr></td>
				</tr>
				<%if preview=false then%>
					<form action="selpdf.asp?cmd=upload" method="post" name=form1 enctype="multipart/form-data">  
					<tr>
						<td class=bianco10 align=middle colspan=2>
						Upload:&nbsp; <INPUT type="file" id=Foto name=Foto class=bottoni><INPUT type="submit" value="ok" class=bottoni id=submit1 name=submit1>
						</td>
					</tr>
					</form>
				<%end if%>
				<tr>
					<td class=bianco10 colspan=2 height="20"></td>
				</tr>
				
				<%if preview=true then%>
					<tr>
						<td class=bianco10 align=middle colspan=2>
							 <i>Preview Immagine PDF<i>
							 <img width=100px  src='../negozi/img/pdf.jpg' border=0>
						   <a class=orangesp href="javascript:putpdf('<%=request("file")%>')"><u><b>Accetta</b></u></a>
					</td>
					</tr>
				<%end if%>
			</table>

	</body>
</html>



