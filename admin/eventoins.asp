<!--#include file=connessionesql.inc-->
<%  

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


'on error goto resume next
'session.lcid=1040



'Valori Form
titolo=senza_apice(Request.Form("titolo"))
sottotitolo=senza_apice(Request.Form("sottotitolo"))
Editor1=senza_apice(request.form("Editor1"))
prezzo=request.form("prezzo")
npartecipanti=request.form("npartecipanti")
disponibile=request.form("disponibile")
extra=request.form("extra")

if isnumeric(prezzo)=False then prezzo=0	
if isnumeric(npartecipanti)=False then npartecipanti=1

txt_dataInizio=request.form("dataInizio")
txt_dataFine=request.form("dataFine")
'controllo data inizio
if isdate(txt_dataInizio)=true then
	txt_dataInizio=year(txt_dataInizio) & "/"  & month(txt_dataInizio) &  "/" & day(txt_dataInizio)
	else
	txt_dataInizio=year(date()) & "/"  & month(date()) &  "/" & day(date())
end if
'controllo data fine
if isdate(txt_dataFine)=true then
	txt_dataFine=year(txt_dataFine) & "/"  & month(txt_dataFine) &  "/" & day(txt_dataFine)
	else
	txt_dataFine=year(date()) & "/"  & month(date()) &  "/" & day(date())
end if


if Trim(Request.Form("immaginepdf"))<>"" then
  immaginepdf=Request.Form("immaginepdf")
else
  immaginepdf="nessunfile-pdf"
end if
if Trim(Request.Form("immagine"))<>"" then
  immagine=Request.Form("immagine")
else
  immagine="vuoto.gif"
end if
if Trim(Request.Form("immagine1"))<>"" then
  immagine1=Request.Form("immagine1")
else
  immagine1="vuoto.gif"
end if
if Trim(Request.Form("immagine2"))<>"" then
  immagine2=Request.Form("immagine2")
else
  immagine2="vuoto.gif"
end if
if Trim(Request.Form("immagine3"))<>"" then
  immagine3=Request.Form("immagine3")
else
  immagine3="vuoto.gif"
end if
if Trim(Request.Form("immagine4"))<>"" then
  immagine4=Request.Form("immagine4")
else
  immagine4="vuoto.gif"
end if









' Apertura Database
StrSQL="update eventi set titolo='" & trim(titolo) & "'"
StrSQL=StrSQL+ ",sottotitolo='" & (trim(sottotitolo)) & "'"
StrSQL=StrSQL+ ",descrizionet=' " & (trim(Editor1)) & "'"

StrSQL=StrSQL+ ",dataval1='" & txt_dataInizio & "'"
StrSQL=StrSQL+ ",dataval2='" & txt_dataFine & "'"

StrSQL=StrSQL+ ",cimageurl1='" & (trim(immagine1)) & "'"
StrSQL=StrSQL+ ",cimageurl2='" & (trim(immagine2)) & "'"
StrSQL=StrSQL+ ",cimageurl3='" & (trim(immagine3)) & "'"
StrSQL=StrSQL+ ",cimageurl4='" & (trim(immagine4)) & "'"
StrSQL=StrSQL+ ",filepdf='" & (trim(immaginepdf)) & "'"	
StrSQL=StrSQL+ ",prezzo_vendita=" & prezzo			
StrSQL=StrSQL+ " where id_sottotitolo=" & request("Idcat")
connm.Execute StrSQL

'response.write("<br>" & StrSql)
'response.end

StrSQL="update eventi_sottotitolo set "
StrSQL=StrSQL+ "descrizione='" & (trim(sottotitolo)) & "'"
StrSQL=StrSQL+ ",disponibile='" & (trim(disponibile)) & "'"
StrSQL=StrSQL+ ",extra='" & (trim(extra)) & "'"
StrSQL=StrSQL+ ",prezzo=" & prezzo
StrSQL=StrSQL+ ",npartecipanti=" & npartecipanti
StrSQL=StrSQL+ " where id=" & request("Idcat")		
connm.Execute StrSQL

'response.write("<br>" & StrSql)
'response.end
			

'UPDATE ESEGUITO
Response.redirect "adeventi.asp?Idcat=" & request("Idcat") 

%>
