<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
if request("checktext")<>session("checktext") then
   response.redirect "contattaci.asp"
end if

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

'Invia un'Email
Function SendEmail2(byval strTo, byval sttbprodcatalogoubject, byval strBody)
	dim myMail
	Set myMail=CreateObject("CDO.Message")
	myMail.Subject=sttbprodcatalogoubject
	myMail.From=spedizionemail
	myMail.HTMLBody=strBody
	myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=1
	myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "c:\inetpub\mailroot\pickup"
	myMail.Configuration.Fields.Update
	myMail.To=strto
	myMail.Send
	set myMail=nothing
end function

Function SendEmail(byval strfrom,byval strTo, byval sttbprodcatalogoubject, byval strBody)				

dim myMail
Set myMail=CreateObject("CDO.Message")
myMail.Subject=sttbprodcatalogoubject
myMail.From=strfrom
myMail.HTMLBody=strBody
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=1
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "c:\inetpub\mailroot\pickup"
myMail.Configuration.Fields.Update
myMail.To=strto
myMail.Send
set myMail=nothing
end function

text_nome=senza_apice(Request.Form("Nome"))
text_cognome=senza_apice(Request.Form("Cognome"))
text_indirizzo=senza_apice(Request.Form("Indirizzo"))
text_citta=senza_apice(Request.Form("Citta"))
text_provincia=senza_apice(Request.Form("Provincia"))
text_email=senza_apice(Request.Form("Email"))
text_telefono=senza_apice(Request.Form("telefono"))
text_note=cstr(senza_apice(Request.Form("note")))
					
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
strBody = strBody & "Nome : "      & text_nome      & "<br>" 
strBody = strBody & "Cognome : "   & text_cognome   & "<br>"
strBody = strBody & "Indirizzo : " & text_indirizzo & "<br>"
strBody = strBody & "Citta : "     & text_citta     & "<br>"
strBody = strBody & "Provincia : " & text_provincia & "<br>"
strBody = strBody & "Telefono : "  & text_telefono  & "<br>"
strBody = strBody & "Mail : "      & text_email  & "<br>"
strBody = strBody & "Note : "      & text_note  & "<br>"
strBody = strBody & "</body></html>" 

Rt1=SendEmail(spedizionemail,text_email,"Richiesta dal sito",strBody)
Rt2=SendEmail(spedizionemail,spedizionemail,"Richiesta dal sito",strBody)

'dati   
session.lcid=1040    
Sttbprodcatalogoql="Insert into Contatti (nome,cognome,indirizzo,citta,provincia,telefono,note,mail,data) values ('" & text_nome & "','" & text_cognome & "','" & text_indirizzo & "','" & text_citta & "','" & text_provincia & "','" & text_telefono & "','" & text_note & "','" & text_email & "',current_date)"   	 
connm.Execute Sttbprodcatalogoql

'response.write(strBody)
response.redirect "ok.asp"
%>