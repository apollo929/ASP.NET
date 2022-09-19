<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%

on error resume next
if trim(Session("Chisono"))="" then response.redirect "accedi.asp"

'Invia un'Email			
function SendEmail(byval strfrom,byval strto, byval strsubject, byval strbody)
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
						
'NUMERO ORDINE
Randomize
numeroordine = cstr(int((9999 - 1 + 1) * Rnd + 1)) & "." & replace(cstr(date()),"/","")  & replace(cstr(time()),".","")

if Trim(Session("Internet"))<>"TRUE" then
		'DBUTENTE INTERNO							    			    
		queryu="Select * From Registrazione where password1='" & Session("Chisono") & "'"
		Set Tbutu = Server.CreateObject("ADODB.Recordset")	
		Tbutu.Open Queryu,Connm
		if not Tbutu.eof then 									
			text_utente=Tbutu("utente1")
			text_password=Tbutu("password1")
			text_email=Tbutu("Email") & " "
			text_telefono=Tbutu("telefono") & " "
			text_azienda=Tbutu("Ragione") & " "	
			text_partitaiva=Tbutu("PI")	& " "																							
			text_nome=Tbutu("Nome") & " "
			text_cognome=Tbutu("Cognome") & " "	
			text_indirizzo=Tbutu("Indirizzo")& " "
			text_citta=Tbutu("Citta") & " "	
			text_cap=Tbutu("Cap") & " "
			text_provincia=Tbutu("Provincia") & " "
			text_prezzo=Tbutu("Prezzo") & " "
			text_prezzoisp=Tbutu("Prezzoisp") & " "
			text_prezzobuffetti=Tbutu("Prezzobuffetti") & " "
			Session("n_puntibuffetti")=Session("n_puntibuffetti")+cdbl(Tbutu("Puntibuffetti"))
			Connm.execute("update Registrazione set puntibuffetti=" & Session("n_puntibuffetti") & " where password1='" & Session("Chisono") & "'")	
		end if

else
		'UTENTE INTERNET
								    			    
		queryu="Select * From Registrazioneint where password1='" & Session("Chisono") & "'"
		SET Tbutu=Connm.EXECUTE(queryu) 		
		if not Tbutu.eof then 
			text_utente=Tbutu("utente1")
			text_password=Tbutu("password1")
			text_email=Tbutu("Email") & " "
			text_telefono=Tbutu("telefono") & " "
			text_azienda=Tbutu("Ragione") & " "	
			text_partitaiva=Tbutu("PI")	& " "																							
			text_nome=Tbutu("Nome") & " "
			text_cognome=Tbutu("Cognome") & " "	
			text_indirizzo=Tbutu("Indirizzo")& " "
			text_citta=Tbutu("Citta") & " "	
			text_cap=Tbutu("Cap") & " "
			text_provincia=Tbutu("Provincia") & " "
			text_prezzo=Tbutu("Prezzo") & " "
			text_prezzoisp=Tbutu("Prezzoisp") & " "
			text_prezzobuffetti=Tbutu("Prezzobuffetti") & " "
			Session("n_puntibuffetti")=Session("n_puntibuffetti")+cdbl(Tbutu("Puntibuffetti"))
			Connm.execute("update Registrazioneint set puntibuffetti=" & Session("n_puntibuffetti") & " where password1='" & Session("Chisono") & "'")	
		end if

end if  

num=instr(1,cstr(text_email),"@")
if len(trim(text_email))=0 or num=0 then
'Response.Redirect "contattaci.asp?errore=true"
end if 

'controllo a capo
text_indirizzo=trim(replace(text_indirizzo,VBCrLf," "))
text_azienda =trim(replace(text_azienda,VBCrLf," "))
text_email=trim(replace(text_email,VBCrLf," "))
text_citta=trim(replace(text_citta,VBCrLf," "))
text_note=trim(request.form("note"))

if request.Form("tipoindirizzo")=3 then
	text_indirizzo=replace(request.Form("indirizzo"),VBCrLf," ")
end if

'Tabelle Utilita
Set tbcar = Server.CreateObject("ADODB.Recordset")
Set tbst = Server.CreateObject("ADODB.Recordset")

HTML = ""
HTML = HTML   & "<html>" 
HTML = HTML   & "<head>" 
'HTML = HTML   & "<link rel=stylesheet href='" & sitourl & "style.css'></head>" 			
HTML = HTML   & "<body>"
HTML = HTML   & "<img src='" & sitourllogo &"'><br>"				

' Totale di Spesa					
Sql="select id,sessionid,codice_isp,descrizione,sum(quantita) as quantita,sum(prezzo) as prezzo,data,prezzou,blocco,fornitore,iva,aliqiva from Carrello where Sessionid='" &  Session.SessionID & "' GROUP BY codice_isp Order by ID Desc"
tbcar.Open Sql,connm
Tot=0
   
   'table
   HTML = HTML & "<table border=1 cellspacing=1 cellpadding=2 width=100% >" 
   
   session.lcid=1040
   t_data=date()
   t_time=Cstr(time())
   
   NHTM=""
   NHTM=HTML
   
Do While Not tbcar.EOF

    dicituraiva=""
	if lcase(trim(tbcar("iva")))="no" then dicituraiva=" esente iva "
	
	HTML = HTML   &  "<tr><td width='130' align='left'   ><b>" & Cstr(Trim(tbcar("codice_isp"))) & "</b> </td><td width='250' align='left'   ><b>" & tbcar("descrizione") & "</b> </td><td width='20'  align='right'   ><b>PZ." & tbcar("quantita") & "</b> </td><td width='140'  align='right'   ><b>Euro " & Formatnumber(tbcar("prezzou"),2) &  dicituraiva & "</b></td>"
	HTML = HTML   &  "<td width='140'  align='right'   ><b>Euro " & Formatnumber(tbcar("prezzo"),2) & dicituraiva & "</b></td>"
	'IVA
	if lcase(trim(tbcar("iva")))="no" then 
	   HTML = HTML   &  "<td width='50'  align='right'   ><b>esente iva</td></tr>"
	else
	   HTML = HTML   &  "<td width='50'  align='right'   ><b>" & tbcar("aliqiva") & "%</td></tr>"
	end if

	NHTM = NHTM   &  "<TR><td width='130' align='left'   ><b>" & Cstr(Trim(tbcar("codice_isp"))) & "</b> </td><td width='250' align='left'   ><b>" & tbcar("descrizione") & "</b> </td><td width='20'  align='right'   ><b>PZ." & tbcar("quantita") & "</b> </td><td width='140'  align='right'   ><b>Euro " & Formatnumber(tbcar("prezzou"),2) &  dicituraiva & "</b></td>"
	NHTM = NHTM   &  "<td width='140'  align='right'   ><b>Euro " & Formatnumber(tbcar("prezzo"),2) & dicituraiva & "</b></td><td width='140'  align='right'   ><b>&nbsp;" & Cstr(Trim(tbcar("Blocco"))) & "</b> </td><td width='140'  align='right'   ><b>&nbsp;" & Cstr(Trim(tbcar("fornitore"))) & "</b> </td>"
    'IVA
	if lcase(trim(tbcar("iva")))="no" then 
	   NHTM  = NHTM    &  "<td width='50'  align='right'   ><b>esente iva</td></tr>"
	else
	   NHTM  = NHTM   &  "<td width='50'  align='right'   ><b>" & tbcar("aliqiva") & "%</td></tr>"
	end if

	Descrizione=""
	Descrizione=Trim(replace(replace(replace(tbcar("Descrizione"),"'","`"),"*"," "),"&"," "))	
	'Storico 
	StrSqlst="Insert into Storico (Utente1,Password1,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Tempo,Fornitore,iva,Numeroordine,Aliqiva) values ('" & Trim(text_utente) & "','" & text_password & "','" & tbcar("codice_isp") & "','" & descrizione & "'," & tbcar("quantita") & "," & Replace(tbcar("prezzo"),",",".") & ",current_date,'" & t_time & "','" & tbcar("fornitore") & "','si','" & numeroordine & "'," & tbcar("aliqiva") & ")"
	Connm.Execute(StrSqlst)
	'Ordini SQL
	StrSqlserver="Insert into Ordine (Utente1,Password1,Codice_Isp,Descrizione,Quantita,Prezzounita,Prezzototale,Iva,Data,Tempo,Fornitore,Numeroordine,Tipoordine,Aliqiva) values ('" & Trim(text_utente) & "','" & Trim(text_password) & "','" & tbcar("codice_isp") & "','" & descrizione & "'," & tbcar("quantita") & "," & Replace(tbcar("prezzou"),",",".") & "," & Replace(tbcar("prezzo"),",",".") & ",'" & tbcar("iva")& "',current_date,'" & t_time & "','" & tbcar("fornitore") & "','" & numeroordine & "','O'," & tbcar("aliqiva") & ")"		   
	connm.Execute(StrSqlserver)
	'listino
	StrSqlst="Insert into listino (Utente1,Password1,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Tempo,Fornitore,iva,Numeroordine,codcliente) values ('" & Trim(text_utente) & "','" & text_password & "','" & tbcar("codice_isp") & "','" & descrizione & "'," & tbcar("quantita") & "," & Replace(tbcar("prezzo"),",",".") & ",current_date,'" & t_time & "','" & tbcar("fornitore") & "','si','" & numeroordine & "','REG')"
	Connm.Execute(StrSqlst)	
	'Ordini SQL
	StrSqlst=""
			
	tbcar.MoveNext				   
Loop	
   '/table
   HTML = HTML & "</TABLE>"											
   NHTM = NHTM & "</TABLE>"	
   																

HTML = HTML & "<br><b> Numero Ordine >> " & numeroordine & "</b><br>"
HTML = HTML & " Spese di Spedizione Addebitate Euro " & Formatnumber(Session("CostoSpese"),2) & "<br>RITIRO : <b>" & ucase(session("txt_ritiro")) & "</b><br>"
if session("coupon")<>"" then HTML = HTML & "<br><b>COUPON ATTIVO >> " & session("coupon") & "%</b><br>"
HTML = HTML & " Totale Fattura Euro " & session("totcarta") & "<br><br><br>"
HTML = HTML & "Rag.Sociale  : " & text_azienda   & "<br>"								
HTML = HTML & "Partita Iva : " & text_partitaiva & "<br>"								
HTML = HTML & "Nome      : " & text_nome       & "<br>"								
HTML = HTML & "Cognome   : " & text_cognome    & "<br>"								
HTML = HTML & "Indirizzo : " & text_indirizzo  & "<br>"								
HTML = HTML & "Citta     : " & text_citta      & "<br>"								
HTML = HTML & "Cap     : " & text_cap      & "<br>"								
HTML = HTML & "Provincia : " & text_provincia  & "<br>"								
HTML = HTML & "Telefono  : " & text_telefono   & "<br>"								
HTML = HTML & "Mail      : " & text_email   & "<br>"								
HTML = HTML & "Note      : " & text_note   & "<br>"	

NHTM = NHTM & "<b> Numero Ordine >> " & numeroordine & "</b><br>"
NHTM = NHTM & " Spese di Spedizione Addebitate Euro " & Formatnumber(Session("CostoSpese"),2) & "<br>RITIRO : <b>" & ucase(session("txt_ritiro")) & "</b><br>"
if session("coupon")<>"" then NHTM= NHTM & "<br><b>COUPON ATTIVO >> " & session("coupon") & "%</b><br>"
NHTM = NHTM & " Totale Fattura Euro " & session("totcarta") & "<br><br><br>"
NHTM = NHTM & "Rag.Sociale  : " & text_azienda   & "<br>"								
NHTM = NHTM & "Partita Iva : " & text_partitaiva & "<br>"								
NHTM = NHTM & "Nome      : " & text_nome       & "<br>"								
NHTM = NHTM & "Cognome   : " & text_cognome    & "<br>"								
NHTM = NHTM & "Indirizzo : " & text_indirizzo  & "<br>"								
NHTM = NHTM & "Citta     : " & text_citta      & "<br>"								
NHTM = NHTM & "Cap     : " & text_cap      & "<br>"								
NHTM = NHTM & "Provincia : " & text_provincia  & "<br>"								
NHTM = NHTM & "Telefono  : " & text_telefono   & "<br>"								
NHTM = NHTM & "Mail      : " & text_email   & "<br>"
NHTM = NHTM & "Note      : " & text_note   & "<br>"

				
											
if Trim(text_azienda)="" then	
  testoemail=Ucase("RIBA_PAGAMENTO_CONCORDATO_" & Replace(Replace(Replace(Trim(text_cognome),".","_"),",","_"),"&","-"))
else
  testoemail=Ucase("RIBA_PAGAMENTO_CONCORDATO_" & Replace(Replace(Replace(Trim(text_azienda),".","_"),",","_"),"&","-"))
end if 	

HTML = HTML & "<b>PAGAMENTO : " & Session("IBAN") & "<br></b>"
HTML = HTML & "<b>CAUSALE : ORDINE WEB " & numeroordine & "<br></b>"
HTML = HTML & "</body></html>" 
NHTM = NHTM & "Prezzo OD   : " & Session("Priceisp")   & "<br>"
NHTM = NHTM & "Prezzo Buffetti   : " & Session("Prezzobuffetti")  & "<br></b>"
NHTM = NHTM & "<b>PAGAMENTO : " & Session("IBAN") & "<br></b>"
NHTM = NHTM & "<b>CAUSALE : ORDINE WEB " & numeroordine & "</b><br>"
NHTM = NHTM & "</body></html>" 	

'taglio ragione sociale
if len(testoemail)>40 then
 testoemail=Mid(testoemail,1,50)															
end if				

'cliente
Rt1=SendEmail(spedizionemail,text_email,testoemail,HTML)
'azienda
Rt2=SendEmail(spedizionemail,spedizionemail,testoemail,NHTM)
Rt5=SendEmail(spedizionemail,"info@webhousesas.net",testoemail,NHTM)   

response.redirect "ok.asp?sped=ok&nordine=" & numeroordine

%>