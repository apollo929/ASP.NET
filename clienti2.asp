<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%     
'DATA IMPOSTAZIONI
session.lcid=1040

'UTENTE INTERNO
if trim(request("ut"))="psw" then
		
	'COLLEGAMENTO DATABASE SQL
	Set tbut = Server.CreateObject("ADODB.Recordset")			
	'Lettura Request senza form (passata indiretta)
	'controllo utenza
	text_utente=replace(request("utente"),"'","")
	text_password=replace(request("password"),"'","")
	
	query="Select * From Registrazione where utente1='" & text_utente & "' and password2='" & text_password & "'"
	tbut.Open query,connm
	if tbut.eof  then   
		response.Redirect "accedi.asp?err=yes"  
	end if

	'UTENTE INTERNO
	Session("tipoutente")="registrazione"
	Session("nomeutente") =  Trim(tbut("utente1"))
	Session("Prezzobuffetti")=tbut("Prezzobuffetti")
	Session("Prezzo")=tbut("Prezzo")
	Session("Internet")="FALSE"
	Session("Chisono")=Trim(tbut("password1")) 
	Session("carrelloabilitato")= cstr(Trim(tbut("spesedispedizione")))
	Session("sRagione") =  Trim(tbut("ragione")) 
	Session("sSede") =  Trim(tbut("Sede")) 
	Session("sProvincia") =  Trim(tbut("Provincia"))
	Session("n_puntibuffetti")=0	
	session("coupon")="" 
	Session("Priceisp")=tbut("Prezzoisp")
	
	 'cookies salvataggio  e reset 
	Response.Cookies("MyCookie")=""
	Response.Cookies("MyCookie").Expires = DateAdd("d", 60, Date)	 
	Response.Cookies("MyCookie")("1") = "registrazione"
	Response.Cookies("MyCookie")("2") = Trim(tbut("utente1"))
	Response.Cookies("MyCookie")("3") = tbut("Prezzobuffetti")
	Response.Cookies("MyCookie")("4") = tbut("Prezzo")
	Response.Cookies("MyCookie")("5") = "FALSE"
	Response.Cookies("MyCookie")("6") = Trim(tbut("password1"))
	Response.Cookies("MyCookie")("7") = cstr(Trim(tbut("spesedispedizione")))
	Response.Cookies("MyCookie")("8") = Trim(tbut("ragione")) 
	Response.Cookies("MyCookie")("9") = tbut("sede")
	Response.Cookies("MyCookie")("10") = Trim(tbut("Provincia"))
	Response.Cookies("MyCookie")("11") = 0
	Response.Cookies("MyCookie")("12") = ""
	Response.Cookies("MyCookie")("13") = tbut("Prezzoisp")
	

	'Frequenza
	Frequenza=1			
	Frequenza=Frequenza+cdbl(tbut("Frequenza"))
	StrSql="Update Registrazione Set Frequenza=" & cdbl(Frequenza ) & " where password1='" & tbut("password1") & "'"
	connm.execute(StrSql) 

	'Utenti Collegati
	StrSql="Insert into Utenticollegati (nome,cognome,indirizzo,citta,provincia,telefono,utente,email,password,ragione,tipo) values ('" & Replace(Replace((tbut("Nome") & " "),"'","`"),","," ") & "','" & Replace(Replace((tbut("cognome") & " "),"'","`"),","," ") & "','" & Replace(Replace((tbut("indirizzo") & " "),"'","`"),","," ") & "','" & Replace(Replace((tbut("citta") & " "),"'","`"),","," ") & "','" & Replace(Replace((tbut("Provincia") & " "),"'","`"),","," ") & "','" & Replace(Replace((tbut("Telefono") & " "),"'","`"),","," ") & "','" & tbut("utente1") & "','" & tbut("email") & "','" & tbut("password1") & "','" & Replace(Replace((tbut("ragione") & " "),"'","`"),","," ")  & "','INTERNI')"
	connm.execute(StrSql)
	response.Redirect "registratilogin.asp"
		
End if	
	
%>
<!--#include file="sqlchiudi.inc" -->