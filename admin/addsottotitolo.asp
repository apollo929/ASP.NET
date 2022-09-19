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

categoria=senza_apice(request.form("categoria"))
nomecat=senza_apice(request.form("nomecat"))
prezzo=request.form("prezzo")
npartecipanti=request.form("npartecipanti")
disponibile=request.form("disponibile")
extra=request.form("extra")

if isnumeric(prezzo)=False then prezzo=0	
if isnumeric(npartecipanti)=False then npartecipanti=1
if nomecat="" then response.redirect("eventi_titolo.asp")
	
Set Tbeventi_sottotitolo_codice = Server.CreateObject("ADODB.RecordSet")
SQL="select max(Codice) as totale from eventi_sottotitolo where categoria=" & categoria & ""
'response.Write(SQL)
'response.End()
Tbeventi_sottotitolo_codice.Open SQL, connm

'response.Write("Codice: " & Tbeventi_sottotitolo_codice("totale"))
'response.End()

dim Codice
if isnull(Tbeventi_sottotitolo_codice("totale")) then
	Codice=1
else
	Codice=Tbeventi_sottotitolo_codice("totale")
	Codice=Codice + 1
end if
	
'response.Write(Codice)
'response.End()

'inserimento categoria
Set Tbeventi_sottotitolo = Server.CreateObject("ADODB.RecordSet")
SQL="insert into eventi_sottotitolo(Codice,Descrizione,Categoria,prezzo,npartecipanti,disponibile,extra) values(" & Codice & ",'" & nomecat & "','" & categoria & "'," & prezzo & "," & npartecipanti & ",'" & disponibile & "','" & extra & "')"
Tbeventi_sottotitolo.Open ucase(SQL), connm
response.redirect("eventi_titolo.asp")
%>