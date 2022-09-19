<%
'Parametri
idir="c:\inetpub\nometuaazienda.it\webhousedomini.it\ufficiovest\articoli\"
odir="articoli"

if request("cmd")="upload" Then
	'Istanza Upload
	dim objUpload	
	dim strMessage	
	set objUpload = server.CreateObject("Dundas.Upload.2")
	'Dimensioni Upload
	objUpload.MaxFileSize = 50000
	objUpload.MaxUploadSize = 50000
	objUpload.UseUniqueNames=false
	on error resume next
	objUpload.Save idir & "\"
	if not err<>0 then
		Response.Redirect "browseimg.asp"
		on error goto 0
	else
		on error goto 0
		Response.Write "<center>"
		Response.Write "<font face=""Verdana"" size=""2"">"
		Response.Write "<b>Errore durante l'upload</b>"
		Response.Write "<br><br>"
		Response.Write "<a href=""browseimg.asp"">Esci</a>"		
		Response.Write "</font>"
		Response.Write "</center>"
		Response.End 
	end if
End If

%>
<HTML>
<HEAD>
<TITLE>Seleziona Immagine</TITLE>

<script language="JavaScript">

function insimg(fl,ft) {
	document.write('<html><head><title>Attendi...</title>');
	document.write('<scr');
	document.write('ipt language="javascript">');
	document.write('function exitimg() {');
	document.write('w=self.document.imgupload.width;');
	document.write('h=self.document.imgupload.height;');
	document.write('opener.document.form1.TEXTAREA2.value = opener.document.form1.TEXTAREA2.value');
	document.write(' + "<img src="+');
	document.write('document.imgupload.title');
	document.write('+" border="+0+" width="');
	document.write('+w+');
	document.write('" height="');
	document.write('+h+');
	document.write('">";');
	document.write('self.window.close();');
	document.write('}');
	document.write('</sc');
	document.write('ript>');
	document.write('</head><body>');
	document.write('<center>');
	document.write('<img src="' + fl.src + '" name="imgupload" title="'+fl.title+'">');
	document.write('</center>');
	document.write('</body></html>');
	document.imgupload.src=fl;
	document.imgupload.title=ft;
	//Attende 2 Secondi per chiudere la finestra
	setTimeout('exitimg()',2000);
}
</script>
<style type="text/css">
<!--
.bottoni {  font-family: Verdana; font-size: 8pt; font-style: normal; line-height: normal; color: #000000; background-color: #FFCCCC}
-->
</style>
</HEAD>
<TITLE>Digi Piscine.com</TITLE>
<BODY>
<A NAME="goto_top">
<center>
<font face="Verdana" size="2">
<form action="browseimg.asp?cmd=upload" method="post" id=form1 name=form1 enctype="multipart/form-data">  
Upload:&nbsp; <INPUT type="file" id=Foto name=Foto class=bottoni><INPUT type="submit" value="ok" class=bottoni>
</form>
Vai:&nbsp;
<%for f=asc("A") to asc("Z")

Response.Write "<a href="+chr(34)+"browseimg.asp#goto_"+chr(f)+chr(34)+">"+lcase(chr(f))+"</A>&nbsp;"

next%>
</A>
<br>
<a href="javascript:self.window.close();">Esci</a>
</center><br><hr><br>
<%

'Comandi passati dall'utente
nomefile=request("ID")
Select case request("CMD")
	case "del"
		'Elimina
		Set fsys = CreateObject("Scripting.FileSystemObject")
		Set delfile = fsys.GetFile(idir & "\" & nomefile)
		delfile.delete true
end select

'Browse Dir
Dim filesys, ifolder, fil, filecoll, filist 
Set filesys = CreateObject("Scripting.FileSystemObject") 
Set ifolder = filesys.GetFolder(idir)  
Set filecoll = ifolder.Files 
Response.Write "<center>"
timg=filecoll.count
nimg=1
capital="@"
For Each fil in filecoll
	dimg=fil.size
	If dimg<50000 Then
		check=ucase(left(fil.name,1))
		if check<>capital then
			'Nuova lettera
			capital=check
			Response.Write "<A NAME="+chr(34)+"goto_"+check+chr(34)+"></A>"
		end if
		Response.Write "<img border="+chr(34)+"0"+chr(34)+" src="+chr(34)+odir+"\"+fil.name +chr(34)+"name="+chr(34)+"img"+trim(nimg)+chr(34)+" title="+chr(34)+fil.name+chr(34)+">"
		Response.Write "<br>"
		Response.Write fil.name & "&nbsp;&nbsp;(" & nimg & " di " & timg & ")"
		Response.Write "<br>"
		Response.Write "<i>" & dimg & "Bytes</i>"
		Response.Write "<br>"
		Response.Write "<a href=" & chr(34) & "browseimg.asp?cmd=del&id=" & fil.name & chr(34) & ">Cancella</a>"
		Response.Write "&nbsp;&nbsp;"
		Response.Write "<a href=" & chr(34) & "javascript:insimg(" & "img" & trim(nimg) & ".src,'" & odir & "'+" & "img" & trim(nimg) & ".title)" & chr(34) & ">Inserisci</a>"
		Response.Write "&nbsp;&nbsp;"
		Response.Write "<a href=" & chr(34) & "browseimg.asp#goto_top" & chr(34) & ">Top</a>"
		Response.Write "<br>"
		Response.Write "<br>"
	Else
		Response.Write fil.shortname & "  (" & nimg & " di " & timg & ")"
		Response.Write "<br>"
		Response.Write "<i><b>File Troppo Grande: </b>" & dimg & "Bytes</i>"
		Response.Write "<br>"
		Response.Write "<a href=" & chr(34) & "browseimg.asp?cmd=del&id=" & fil.name & chr(34) & ">Cancella</a>"
		Response.Write "&nbsp;&nbsp;"
		Response.Write "<a href=" & chr(34) & "browseimg.asp#goto_top" & chr(34) & ">Top</a>"
		Response.Write "<br>"
		Response.Write "<br>"
	end if
    nimg=nimg+1
    
    
Next   
Response.Write "</center>"
%>

<P>&nbsp;</P>
</font>
</BODY>
</HTML>
