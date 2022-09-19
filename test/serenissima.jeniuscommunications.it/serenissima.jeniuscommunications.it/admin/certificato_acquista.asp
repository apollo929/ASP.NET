<!--#include file=connessionesql.inc-->
<%
if session("Ragione")="" then response.redirect("../login.asp")
if session("loginid")="" then response.Redirect("../login.asp")



Set tblista=Server.CreateObject("ADODB.Recordset")
SQLaccedi="Select * From lista where id=" & session("loginid") & " union Select * From lista1 where id=" & session("loginid") & " LIMIT 1"
tblista.open SQLaccedi,conn
if not tblista.eof then	
	'inizializzo le variabili session
	session("nome")=""
	session("cognome")=""
	session("ragione")=tblista("ragione1")
	session("loginid")=tblista("Id")
	session("sesmail")=tblista("mail")
	session("sesprovincia")=tblista("provincia")
	session("sesragione")=tblista("ragione1")
	session("telefono")=tblista("cellulare")
	session("crediti")=Tblista("preventivicrediti")
	session("abilitatocrediti")=Tblista("abilitatocrediti")
end if
tblista.close
if session("crediti")<=0 then response.Redirect("abbonati.asp")




acquistato=request("acquistato")
intid=request("id")

'controllo verifica QUANTI ACQUISTATI
Sql_numberoforders="Select count(*) AS numberoforders from preventiviacquistati where idpreventivo='" & intid & "'"
Set verifica_n = conn.Execute(Sql_numberoforders)
tot_record = cint(verifica_n(0))
set verifica_n = nothing
numero_acquisti=0
numero_acquisti=1+tot_record
'response.write(tot_record)
'response.write(numero_acquisti)
'response.write(verifica_n("numberoforders"))
if numero_acquisti>10 then response.Redirect("preventividettagliomax.asp?id=" & intid)

'controllo se il preventivo è già stato acquistato
Set verifica_acquisto=Server.CreateObject("ADODB.Recordset")
Sql_acquisto="Select * from preventiviacquistati where idpreventivo='" & intid & "' and idazienda='" & session("loginid") & "' limit 1"
verifica_acquisto.open Sql_acquisto,conn

'estrapolo dati dal preventivo
Set Tbscheda=Server.CreateObject("ADODB.Recordset")
sql="Select * From preventivi where Id= '" & intid &"' limit 1"
Tbscheda.open sql,conn

credito=session("crediti")
if not Tbscheda.eof then
	Sqlupdprev="update preventivi set lista_aziende='" & Tbscheda("lista_aziende") & "PREV -' where Id= '" & intid &"' limit 1"
	response.write(Sqlupdprev)
	conn.Execute(Sqlupdprev) 
	if verifica_acquisto.eof then
		if acquistato=1 then
			acquistato=0
			'sottraggo i crediti			
			credito=credito-20			
			'aggiorno il campo crediti in lista
			SqlCrediti="update lista set preventivicrediti='" & credito & "' where id='" & session("loginid") & "' limit 1"
			conn.Execute(SqlCrediti) 
			SqlCrediti="update lista1 set preventivicrediti='" & credito & "' where id='" & session("loginid") & "' limit 1"
			conn.Execute(SqlCrediti) 
			'aggiungo il preventivo alla lista degli acquisti
			Sql_statistiche_preventivi="Insert into preventiviacquistati (idpreventivo,descrizione,provincia,idazienda,costo) values ('" & Tbscheda("id") & "', '" & Tbscheda("dettagli") & "','" & Tbscheda("provincia") & "','" & session("loginid") & "',15)"
			conn.Execute(Sql_statistiche_preventivi) 
			session("crediti")=credito
		end if		
	end if
end if
verifica_acquisto.close
'verifica_n.close
Tbscheda.close
response.Redirect("certificato.asp?acquistato=" & acquistato & "&id=" & intid)
%>
<!--#include file=closesql.inc-->