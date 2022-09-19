<%
'Gestione errori
'on error resume next



namedbmysql="programmaufficio"
linkuserid="www.programmaufficio.eu"

'Cliente 
Set Connm=Server.CreateObject("ADODB.connection")
connm.ConnectionString ="server=localhost;database=" & namedbmysql & ";" &_
"user=" & namedbmysql & ";password=Genovese001;driver={MySQL ODBC 3.51 Driver};OPTION=3"
connm.Open

function toSql(a)
    if isnull(a) then a =""
    'a=replace(a,"\","")
    a=replace(a,"'","`")
	a=replace(a,"“","``")
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

%>