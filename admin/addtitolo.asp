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


IdCat=request.form("IdCat")
Categoria=senza_apice(request.form("Categoria"))
txt_eventoviaggiocorso=senza_apice(request.form("eventoviaggiocorso"))
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

if Categoria="" then response.redirect("eventi_titolo.asp")
if not isnumeric(IdCat) then
	response.redirect("eventi_titolo.asp?errore=si")
end if
Set Tbeventi_titolo_controllo = Server.CreateObject("ADODB.RecordSet")
SQL="select * from eventi_titolo where categoryID='" & IdCat & "' or catdescription='" & Categoria & "'"
Tbeventi_titolo_controllo.Open SQL, connm

if Tbeventi_titolo_controllo.eof then
	'inserimento categoria
	Set Tbeventi_titolo = Server.CreateObject("ADODB.RecordSet")
	SQL="insert into eventi_titolo(categoryID,catdescription,eventoviaggiocorso,datainizioevento,datafineevento) values (" & IdCat & ",'" & Categoria & "','" & txt_eventoviaggiocorso & "','" & txt_dataInizio & "','" & txt_dataFine & "')"
	'response.write(SQL)
	'response.end
	Tbeventi_titolo.Open ucase(SQL), connm
	response.redirect("eventi_titolo.asp")
else
	'categoria o id gia presente
	response.redirect("eventi_titolo.asp?errore=si")
end if
%>