<!--#include file=tipo_dispositivo.inc-->
<%
'parametri mobile o tablet o desktop o generali
'__________________________________________________
If mobile="ok" Then
   par_font_size="1"
   par_table_upload="width:600px;background-color:white;font-size:9px;"
Else
   par_font_size="2"
   par_table_upload="width:900px;background-color:white;font-size:15px;"
End If
spedizionemail="info@jeniuscommunications.it"
ricezioneticket="jeniuscommunications@gmail.com"
'__________________________________________________
'parametri mobile o tablet o desktop o generali



'Gestione Errori
On Error Resume Next
'errori
'if err<>0 then
'response.write "Sito momentaneamente offline"
'response.redirect "logout.asp"
'end if
'on error goto 0


'se perde login
if session("loginid")="" then
	'utilizzo cookies per tenere la sessione
	session("loginid")=request.cookies("MyCookie")("1")
	session("logintipo")=request.cookies("MyCookie")("2")
	session("loginnominativo")=request.cookies("MyCookie")("3")
	session("loginmail")=request.cookies("MyCookie")("4")
	session("logintel")=request.cookies("MyCookie")("5")
	session("loginprovincia")=request.cookies("MyCookie")("6") 
	session("loginsede")=request.cookies("MyCookie")("7") 
	if session("loginid")="" then response.Redirect("../index.asp")
end if

'connessione SQL DATABASE kiron
Set conn=Server.CreateObject("ADODB.connection")
conn.connectionString ="server=localhost;database=kiron;" &_
"user=kiron;password=Genovese001;driver={MySQL ODBC 3.51 Driver};"
conn.Open
'connessione kiron aspgrid
strConnect = "Driver={MySQL ODBC 3.51 Driver};server=LOCALHOST;db=kiron;uid=kiron;pwd=Genovese001;"

'funzioni di utilita'
function tagliatesto(Byval cat,byval qty)
'Funzione per tagliare il testo a qty x riga
 lt=len(txt)
 counter=0
 parola=0
 tx=""
 for f=1 to lt
	c=mid(txt,f,1)
	if c=chr(13) or c=" " then
	 parola=0
	 counter=0
	 tx=tx+c
	else
	 parola=parola+1 
		if  counter>=qty and parola>=20 then
			tx=tx+c+"<br>"
			counter=0
		else
			tx=tx+c
			counter=counter+1
		end if
	end if
 next
 tagliatesto=tx
end function


function senza_apice(byval txt)
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
end function

function fillzero(byval txt,byval qty)
'fill con 0 di una stringa con determinata dimensione	
txt=trim(txt)
txt_st=string(qty,"0")
d_txt=len(txt)
fillzero=left(txt_st,qty-d_txt)+trim(txt)
end function

'send mail
Function SendEmail(byval strfrom,byval strTo, byval strSubject, byval strBody)				

dim myMail
Set myMail=CreateObject("CDO.Message")
myMail.Subject=strsubject
myMail.From=strfrom
myMail.HTMLBody=strBody
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=1
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "c:\inetpub\mailroot\pickup"
myMail.Configuration.Fields.Update
myMail.To=strto
myMail.Send
set myMail=nothing
end function

function toSql(a)
if isnull(a) then a =""
a=replace(a,"\","")
a=replace(a,"'","\'")
toSql = a
end function

sub loggaVisSchede(tipooperazione1,settore1,numeropratica1,descrizione1,nominativo1)
conn.execute "insert into statschede (data,tipooperazione,settore,numeropratica,descrizione,nominativo) values (" & _
	"current_timestamp," & _
	"'" & tosql(tipooperazione1) & "'," & _
	"'" & tosql(settore1) & "'," & _
	 "'" & tosql(numeropratica1) & "'," & _
	  "'" & tosql(descrizione1) & "'," & _
		 "'" & tosql(nominativo1) & "')"
end sub
%>