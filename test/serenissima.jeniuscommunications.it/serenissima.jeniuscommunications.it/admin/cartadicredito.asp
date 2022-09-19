<!--#include file=connessionesql.inc-->
<%
'Dim sReferer, sIP, sScriptName
'leggiamo l'IP del visitatore
'sIP = Request.ServerVariables("REMOTE_ADDR")
'leggiamo il nome della pagina in esecuzione
'sScriptName = Request.ServerVariables("SCRIPT_NAME")
'leggiamo l'intestazione HTTP Referer
'sReferer = Request.ServerVariables("HTTP_REFERER")
'response.write(sIP & "1")
'response.write(sScriptName & "2" )
'response.write(sReferer & "3" )
'response.end
'if instr(referer,"paypal")=0 then response.Redirect("../login.asp")

amount=cdbl(request("amount"))
id=request("id")
credito=session("crediti")
session("loginid")=id
'cerco azienda su database
Set tblista=Server.CreateObject("ADODB.Recordset")
SQLaccedi="Select * From lista where id=" & session("loginid") & " LIMIT 1 union Select * From lista1 where id=" & session("loginid") & " LIMIT 1"
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


if session("loginid")="" then response.Redirect("../login.asp")


'cerco azienda su database
Set tblista=Server.CreateObject("ADODB.Recordset")
SQLaccedi="Select * From lista where id=" & id & " LIMIT 1 union Select * From lista1 where id=" & id & " LIMIT 1"
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
	session("abilitatocrediti")=Tblista("abilitatocrediti")
	if amount>0 then
			'sottraggo i crediti			
			credito=credito+amount			
			'aggiorno il campo crediti in lista
			SqlCrediti="update lista set preventivicrediti='" & credito & "' where id='" & session("loginid") & "' limit 1"
			conn.Execute(SqlCrediti) 
			SqlCrediti="update lista1 set preventivicrediti='" & credito & "' where id='" & session("loginid") & "' limit 1"
			conn.Execute(SqlCrediti) 
			session("crediti")=credito
	end if
end if
tblista.close%>
<!--#include file=closesql.inc-->
<%
response.Redirect("miei_preventivitest.asp")
%>
