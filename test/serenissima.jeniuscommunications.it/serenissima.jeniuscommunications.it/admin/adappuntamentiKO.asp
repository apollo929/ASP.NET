<!--#include file=connessionesql.inc-->
<%
'appuntamento da trovare
sqlmod="select * from appuntamenti where id=" & cdbl(request("id"))
set tbapp=conn.execute(sqlmod)						
text_cognome=senza_apice(tbapp("cognome"))
text_nome=senza_apice(tbapp("nome"))
tbapp.close

if request("appuntamento")="yes" and isnumeric(request("id"))=true then
	sqlupdateapp="update appuntamenti set esito=0,esitodesc='non interessato' where id=" & cdbl(request("id"))
	conn.execute(sqlupdateapp)
	'log	 
	loggaVisSchede "modifica appuntamento","modifica appuntamento","appuntamento di " & text_cognome & "  " & text_nome,"non interessato",session("loginnominativo")
	response.redirect "adappuntamenti.asp"
end if	
if request("appuntamento")="forse" and isnumeric(request("id"))=true then
	sqlupdateapp="update appuntamenti set esito=2,esitodesc='ci pensa...' where id=" & cdbl(request("id"))
	conn.execute(sqlupdateapp)
	'log	 
	loggaVisSchede "modifica appuntamento","modifica appuntamento","appuntamento a " & text_cognome & "  " & text_nome,"ci pensa",session("loginnominativo")
	response.redirect "adappuntamenti.asp"
end if
%>
<!--#include file=closesql.inc-->