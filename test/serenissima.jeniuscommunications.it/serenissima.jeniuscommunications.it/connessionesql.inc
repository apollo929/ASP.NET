<!--#include file="tipo_dispositivo.inc" -->
<%
'Gestione errori
on error resume next
'estrapolazione name mysql dal hostname - parte centrale del dominio 
namedbmysql="kiron"
linkuserid="serenissima.jeniuscommunications.it"

'DB KIRON
Set Connm=Server.CreateObject("ADODB.connection")
connm.ConnectionString ="server=localhost;database=" & namedbmysql & ";" &_
"user=" & namedbmysql & ";password=Genovese001;driver={MySQL ODBC 3.51 Driver};"
connm.Open
'connessione kiron aspgrid
strConnect = "Driver={MySQL ODBC 3.51 Driver};server=LOCALHOST;db=kiron;uid=kiron;pwd=Genovese001;"

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

function tagliatesto(Byval txt,byval qty)
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

%>