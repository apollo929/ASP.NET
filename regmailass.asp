<%
'Parametri
idir="C:\inetpub\vhosts\franciacortaufficio.com\shop.franciacortaufficio.com\admin\articoli\"
'Istanza Upload
dim objUpload	
dim strMessage	
set objUpload = server.CreateObject("Dundas.Upload.2")
objUpload.UseUniqueNames=false
on error resume next
objUpload.Save idir
'Attributi del File
'dimensioni=objUpload.Files(0).Size 
nomefile=objUpload.GetFileName(objUpload.Files(0).Path)
nomefile1=objUpload.GetFileName(objUpload.Files(1).Path)
nomefile2=objUpload.GetFileName(objUpload.Files(2).Path)

'response.write("---" & nomefile)
'response.end
%>
<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
  'Mostro tutti i campi
  For Each objFormItem In objUpload.Form
      'Response.Write "<br> - " & objFormItem
      'Response.Write ": " & objFormItem.Value
   Next
   
   'Invia un'Email
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
   
text_nome=senza_apice(objUpload.Form("Nome"))
text_cognome=senza_apice(objUpload.Form("Cognome"))
text_indirizzo=senza_apice(objUpload.Form("Indirizzo"))
text_citta=senza_apice(objUpload.Form("Citta"))
text_provincia=senza_apice(objUpload.Form("Provincia"))
text_email=senza_apice(objUpload.Form("Email"))
text_telefono=senza_apice(objUpload.Form("telefono"))
text_note=cstr(senza_apice(objUpload.Form("note")))
text_tipo=cstr(senza_apice(objUpload.Form("tipo")))
   
   
  ' response.end




Function SendEmail(byval strfrom,byval strTo, byval strSubject, byval strBody)				

dim myMail
Set myMail=CreateObject("CDO.Message")
myMail.Subject=strsubject
myMail.From=strfrom
myMail.HTMLBody=strBody
myMail.To=strto
'myMail.AttachFile="c:\inetpub\vhosts\ciacsrl.it\httpdocs\uploads\" & nomefile 
if trim(nomefile)<>"" then myMail.AddAttachment "C:\inetpub\vhosts\franciacortaufficio.com\shop.franciacortaufficio.com\admin\articoli\" & nomefile
if trim(nomefile1)<>"" then myMail.AddAttachment "C:\inetpub\vhosts\franciacortaufficio.com\shop.franciacortaufficio.com\admin\articoli\" & nomefile1
if trim(nomefile2)<>"" then myMail.AddAttachment "C:\inetpub\vhosts\franciacortaufficio.com\shop.franciacortaufficio.com\admin\articoli\" & nomefile2
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=1
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "c:\inetpub\mailroot\pickup"
myMail.Configuration.Fields.Update

myMail.Send
set myMail=nothing
end function





					
strBody = ""
strBody = "<!DOCTYPE HTML PUBLIC -//IETF//DTD HTML//EN>" 
strBody = strBody   & "<html>" 
strBody = strBody   & "<head>" 
strBody = strBody   & "<meta http-equiv=Content-Type>" 
'strBody = strBody   & "<link rel=stylesheet href='" & sitourl & "/style.css'></head>" 			
strBody = strBody   & "<body>"
strBody = strBody   & "<img src='" & sitourllogo &"'><br>"						
strBody = strBody & "Richiesta inoltrata Da: " & "<br>"
strBody = strBody & "<br>"
strBody = strBody & "I Dati" & "<br>" & "<br>"
strBody = strBody & "Tipo intervento : "      & text_tipo  & "<br><br>"
strBody = strBody & "Nome : "      & text_nome      & "<br>" 
strBody = strBody & "Cognome : "   & text_cognome   & "<br>"
strBody = strBody & "Indirizzo : " & text_indirizzo & "<br>"
strBody = strBody & "Citta : "     & text_citta     & "<br>"
strBody = strBody & "Provincia : " & text_provincia & "<br>"
strBody = strBody & "Telefono : "  & text_telefono  & "<br>"
strBody = strBody & "Mail : "      & text_email  & "<br>"
strBody = strBody & "Note : "      & text_note  & "<br>"
strBody = strBody & "</body></html>" 

if instr(text_note,"http")=0 and instr(text_nome,"http")=0 and instr(text_cognome,"http")=0 then
	'response.write(strBody)
	Rt=SendEmail("info@franciacortaufficio.com","jeniuscommunications@gmail.com","RICHIESTA ASSISTENZA SOFTWARE / ALTRO ",strBody)
	Rt1=SendEmail("info@franciacortaufficio.com",text_email,"RICHIESTA ASSISTENZA SOFTWARE / ALTRO ",strBody)
	Rt2=SendEmail("info@franciacortaufficio.com","info@franciacortaufficio.com","RICHIESTA ASSISTENZA SOFTWARE / ALTRO ",strBody)
	'response.end
	'dati   
	session.lcid=1040    
	StrSql="Insert into Contatti (nome,cognome,indirizzo,citta,provincia,telefono,note,mail,data) values ('" & text_nome & "','" & text_cognome & "','" & text_indirizzo & "','" & text_citta & "','" & text_provincia & "','" & text_telefono & "','" & text_note & "','" & text_email & "',current_date)"   	 
	connm.Execute StrSql
end if

response.redirect "ok.asp"
%>