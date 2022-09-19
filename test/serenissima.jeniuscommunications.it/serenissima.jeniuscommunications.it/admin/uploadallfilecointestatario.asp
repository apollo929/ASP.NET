<!--#include file=connessionesql.inc-->
<%
'Upload
idir = "c:\inetpub\vhosts\jeniuscommunications.it\serenissima.jeniuscommunications.it\admin\upload\"
'Istanza Upload
dim objUpload	
set objUpload = server.CreateObject("Dundas.Upload.2")
objUpload.UseUniqueNames=true
on error resume next
objUpload.Save idir 
	
If Err.Number <> 0 Then
		Response.Redirect err.Description
Else
        i=0
		For Each objUploadedFile in objUpload.Files	
			'update file 
			sql="update pratiche_documenti set nomefile='" & cstr(objUpload.GetFileName(objUpload.Files(i).Path)) & "' where nometabella='pratiche_cointestatario' and nomedocumento='" & cstr(trim(objUploadedFile.TagName)) & "' and idpratica='" & session("idpratica") & "'"
			response.write(sql)
			conn.execute(sql)
			i=i+1
    	Next 
  
End If

objUpload = Nothing
%>
<!--#include file=closesql.inc-->
<%response.redirect "addocumentiuploadcointestatario.asp" %>