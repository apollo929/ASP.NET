<!--#include file="tipo_dispositivo.inc" -->
<%
'Gestione errori
'on error resume next

'if err<>0 then
'	response.write "Sito momentaneamente offline, si prega di riprovare piu' tardi"
'	response.end
'end if
'on error goto 0

'se perde login
if Session("Chisono")="" then
	'utilizzo cookies per tenere la sessione	
	Session("tipoutente")=request.cookies("MyCookie")("1")
	Session("nomeutente") = request.cookies("MyCookie")("2")
	Session("Prezzobuffetti")=request.cookies("MyCookie")("3")
	Session("Prezzo")=request.cookies("MyCookie")("4")
	Session("Internet")=request.cookies("MyCookie")("5")
	Session("Chisono")=request.cookies("MyCookie")("6") 
	Session("carrelloabilitato")=request.cookies("MyCookie")("7") 
	Session("sRagione") = request.cookies("MyCookie")("8") 
	Session("sSede") = request.cookies("MyCookie")("9") 
	Session("sProvincia") =request.cookies("MyCookie")("10") 
	Session("n_puntibuffetti")=request.cookies("MyCookie")("11") 
	session("coupon")=request.cookies("MyCookie")("12") 
	Session("Priceisp")=request.cookies("MyCookie")("13") 
end if

'estrapolazione name mysql dal hostname - parte centrale del dominio 
linkurl=replace(lcase(Trim(replace(Request.ServerVariables("URL"),"/ustora/",""))),"/","")
namedbmysql="dbhatseries"
linkuserid="https://shop.hatseries.com"

'Connessione SQL Generale 
Set Conn=Server.CreateObject("ADODB.connection")
conn.ConnectionString ="server=localhost;database=informaticaml;" &_
"user=informaticaml;password=^6Wvbn45;driver={MySQL ODBC 3.51 Driver};"
conn.Open

'Cliente Buffetti 
Set Connm=Server.CreateObject("ADODB.connection")
connm.ConnectionString ="server=localhost;database=" & namedbmysql & ";" &_
"user=" & namedbmysql & ";password=0Ave1g8^;driver={MySQL ODBC 3.51 Driver};"
connm.Open

sub loggaVisSchede(fornitore1,codice1,categoria1,descrizione1,utente1,password1)
    connm.execute "insert into statschede (data,fornitore,codice,categoria,descrizione,utente,password) values (" & _
        "current_timestamp," & _
        "'" & tosql(fornitore1) & "'," & _
        "'" & tosql(codice1) & "'," & _
         "'" & tosql(categoria1) & "'," & _
          "'" & tosql(descrizione1) & "'," & _
           "'" & tosql(utente1) & "'," & _
            "'" & tosql(password1) & "')"
end sub

function toSql(a)
    if isnull(a) then a =""
    a=replace(a,"\","")
    a=replace(a,"'","\'")
    toSql = a
end function

function Tagliatesto(Byval txt,byval qty)
	'Funzione per tagliare il testo a qty x riga
	 lt=len(txt)
	 counter=0
	 parola=0
	 tx=""
	 for f=1 to lt
	    c=mid(txt,f,1)
	    if c=chr(13) or c=" " then
		 parola=0
		 counter=0
		 tx=tx+c
		else
		 parola=parola+1 
		    if  counter>=qty and parola>=20 then
				tx=tx+c+"<br>"
				counter=0
			else
			    tx=tx+c
				counter=counter+1
			end if
	    end if
	 next
	 Tagliatesto=tx
end function


function valore_iva (Byval txt_codice)
 	Set tbprodiva = Server.CreateObject("ADODB.RecordSet")
	sSQLiva = "select aliq_iva from prodotti where codice_od='" & Trim(txt_codice) & "' or codice_buf='" & Trim(txt_codice) & "' limit 1"
	tbprodiva.Open sSQLiva, connm
    if not tbprodiva.eof then 	
	 valore_iva=cstr(tbprodiva("aliq_iva"))
	else
	 valore_iva="0"
	end if
	if  valore_iva=0 then 
	  valore_iva=" esente iva"
	else
      valore_iva=""
    end if	
    tbprodiva.close
end function

%>