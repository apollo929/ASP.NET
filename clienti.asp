<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%  
'on error goto 0
'IMPOSTAZIONI DATA
session.lcid=1040    
'Utente internet

if trim(request("ut"))="psw" then

	Set Tbut = Server.CreateObject("ADODB.Recordset")
	'controllo utenza
	text_utente=replace(request.form("utente"),"'","")
	text_password=replace(request.form("password"),"'","")
	
	query="Select * From Registrazioneint where utente1='" & text_utente & "' and password2='" & text_password & "'"
	'aprire lettura 
	Tbut.Open query,Connm 
	
	
	if Tbut.eof   then
		'utenti interni sql  			
		Response.Redirect "clienti2.asp?ut=psw&utente="  & text_utente & "&password=" & text_password 
	end if

	'UTENTE INTERNET
	Session("tipoutente")="registrazioneint"
	Session("nomeutente") =  Trim(tbut("utente1"))
	Session("Prezzobuffetti")=tbut("Prezzobuffetti")
	Session("Prezzo")=tbut("Prezzo")
	Session("Internet")="TRUE"
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
	Response.Cookies("MyCookie")("1") = "registrazioneint"
	Response.Cookies("MyCookie")("2") = Trim(tbut("utente1"))
	Response.Cookies("MyCookie")("3") = tbut("Prezzobuffetti")
	Response.Cookies("MyCookie")("4") = tbut("Prezzo")
	Response.Cookies("MyCookie")("5") = "TRUE"
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
	Frequenza=Frequenza+cdbl(Tbut("Frequenza"))
	StrSql="Update Registrazioneint Set Frequenza=" & Cint(Frequenza) & " where password1='" & Tbut("password1") & "'"
	connm.execute(StrSql)

	'Utenti Collegati
	StrSql="Insert into Utenticollegati (nome,cognome,indirizzo,citta,provincia,telefono,utente,email,password,ragione,tipo) values ('" & Replace(Replace((Tbut("Nome") & " "),"'","`"),","," ") & "','" & Replace(Replace((Tbut("cognome") & " "),"'","`"),","," ") & "','" & Replace(Replace((Tbut("indirizzo") & " "),"'","`"),","," ") & "','" & Replace(Replace((Tbut("citta") & " "),"'","`"),","," ") & "','" & Replace(Replace((Tbut("Provincia") & " "),"'","`"),","," ") & "','" & Replace(Replace((Tbut("Telefono") & " "),"'","`"),","," ") & "','" & Tbut("utente1") & "','" & Tbut("email") & "','" & Tbut("password1") & "','" & Replace(Replace((Tbut("ragione") & " "),"'","`"),","," ")  & "','INTERNET')"
	connm.execute(StrSql)
	Response.Redirect "registratilogin.asp"        
End if		
       %>
<!--#include file="sqlchiudi.inc" -->