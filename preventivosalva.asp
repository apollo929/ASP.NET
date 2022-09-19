<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<% 
on error goto 0
Set Tbut = Server.CreateObject("ADODB.Recordset")			
if lcase(Session("nomeutente"))="preventivo" then		
text_password=request("password")
else
text_password=Session("Chisono")
end if
query="Select * From Registrazione where password1='" & text_password & "'"
response.write query
Tbut.Open query,connm
if Tbut.eof then
Tbut.close
query="Select * From Registrazioneint where password1='" & text_password & "'"
response.write query
Tbut.Open query,connm
end if

if Tbut.eof  then   
Response.redirect "accedi.asp"
else

'UTENTE INTERNO
nomeutente =  Trim(Tbut("utente1"))
Chisono=Trim(Tbut("password1")) 
tbut.close

'Tabelle Utilita
Set Tbcar = Server.CreateObject("ADODB.Recordset")

Sql="Select * from Carrello where Sessionid='" &  Session.SessionID & "' Order by ID Desc"
Tbcar.Open Sql,connm


Do while not Tbcar.EOF
StrSqlins="Insert into SalvaPreventivo (sessionid,utente,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Iva,Fornitore) values ('" & year(now) & month(now) & day(now) & hour(now) & minute(now) & second(now) & "','" & chisono & "','" & Tbcar("Codice_ISP") & "','" & Tbcar("Descrizione") & "','" & Tbcar("quantita") & "','" & Replace(Tbcar("prezzo"),",",".") & "',current_timestamp,'" & Replace(Tbcar("prezzou"),",",".") & "','" & Tbcar("blocco") & "','" & Tbcar("iva") & "','" & Tbcar("fornitore") & "')"
connm.Execute StrSqlins
response.write(StrSqlins)
Tbcar.MoveNext
Loop

Response.redirect "carrellovisua.asp?info=IL PREVENTIVO E' STATO SALVATO"
end if
%>        
<!--#include file="sqlchiudi.inc" -->   