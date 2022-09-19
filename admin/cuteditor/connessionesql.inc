<%

'Gestione Errori
'On Error Resume Next

'Connessione SQL Costruttori
Set Conn=Server.CreateObject("ADODB.connection")
Conn.ConnectionString ="server=localhost;database=costruttori;" &_
"user=costruttori;password=$$Genovese001;driver={MySQL ODBC 3.51 Driver};"
Conn.Open

strConnect="server=localhost;database=costruttori;" &_
"user=costruttori;password=$$Genovese001;driver={MySQL ODBC 3.51 Driver};"

'if err<>0 then
'	response.write "Sito momentaneamente offline, si prega di riprovare piu' tardi"
'	response.end
'end if
'on error goto 0

Function Descrizione(Byval cat,Byval sotcat)
		'Tabella Settori
		Set Tbset=Server.CreateObject("ADODB.Recordset")
		SQL="select * from settori where Gruppo='" & cat & "' and SottoGruppo='" & sotcat & "'"	     
	    Tbset.open SQL,conn
		Descrizione=Tbset("Descrizione")
		Tbset.close
End function

Function Tot(Byval cat,byval scat,byval prov)
	'Tabella Totale	
	Set Tbtot=Server.CreateObject("ADODB.Recordset")
	If prov="" Then
		SQLtot="select count(id) as Totale from annunci where Gruppo='" & cat & "' and SottoGruppo='" & scat & "'"	     
	Else
		SQLtot="select count(id) as Totale from annunci where Gruppo='" & cat & "' and SottoGruppo='" & scat & "' and Provincia='" & prov & "'"	     
	End If		
	Tbtot.Open SQLtot,conn
	Tot=Tbtot("Totale")
	Tbtot.Close 
End function
	
	
Function Tagliatesto(Byval cat,byval qty)
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
End function

	
Function senza_apice(byval txt)
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
End function

Function fillzero(byval txt,byval qty)
	'fill con 0 di una stringa con determinata dimensione	
	txt=trim(txt)
	txt_st=string(qty,"0")
	d_txt=len(txt)
	fillzero=left(txt_st,qty-d_txt)+trim(txt)
End function



%>
 
