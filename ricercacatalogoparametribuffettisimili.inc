		<%	
	'Gestione Catalogo Buffetti + Prezzi 
	Descrizione=Trim(replace(replace(replace(tbprodsimili("Descrizione"),"'","`"),"*"," "),"&"," "))
	Mprezzo1=tbprodsimili("p1")
							
	'Se vuoto
	if Trim(Ucase(Session("Prezzobuffetti")))="" then 
		Mprezzo2=tbprodsimili("p1")
	end if							
	if Trim(Ucase(Session("Prezzobuffetti")))="PREZZO1" then 
		Mprezzo2=tbprodsimili("p1")
	end if
	if Trim(Ucase(Session("Prezzobuffetti")))="PREZZO2" then 
		Mprezzo2=tbprodsimili("p2")
	end if
	if Trim(Ucase(Session("Prezzobuffetti")))="PREZZO3" then 
		Mprezzo2=tbprodsimili("p3")
	end if
	if Trim(Ucase(Session("Prezzobuffetti")))="PREZZO4" then 
		Mprezzo2=tbprodsimili("p4")
	end if
	if Trim(Ucase(Session("Prezzobuffetti")))="PREZZO5" then 
		Mprezzo2=tbprodsimili("p5")
	end if
						    	
	'Blocco					    
	if cstr((tbprodsimili("blocco")))<>"False" and Trim(Ucase(Session("Prezzobuffetti")))<>"" then
		Mprezzo1=tbprodsimili("p1")
		Mprezzo2=tbprodsimili("p5")
	end if	
	
	'Magazine
	boolmagazine="false"
	magqta=1
	magazinesconto="<br>"
	Set tbmagazine = Server.CreateObject("ADODB.RecordSet")
    sSQLmag = "select * From magazinebuffetti  where codice='" & tbprodsimili("codice_buf") & "' limit 1"
	tbmagazine.Open sSQLmag, conn			       
	if not tbmagazine.eof  then 
	 Mprezzo1=tbmagazine("Prezzo")
	 Mprezzo2=tbmagazine("Prezzoofferta")
	 magqta=tbmagazine("qta")
	 boolmagazine="true"
	else
	 magazinesconto=""
    end if 

	
		'UTENTE LOGGATO
	if Trim(Session("Chisono"))<>"" then
	
				'::::::::::::::::::::::::: PREZZO PROFILO (inizio) :::::::::::::::::::::::::
				'::::::::::::::::::::::::: PREZZO PROFILO (inizio) :::::::::::::::::::::::::
					'Cerca prezzo codificato dal cliente PROFILO
					querypro="Select * From PROFILO where (codice_isp='" & Trim(tbprodsimili("codice_buf")) & "' or codice_isp='" & Trim(tbprodsimili("codice_od")) & "' or codice_isp='" & Trim(tbprodsimili("codice_prodotto")) & "') AND password1='" & Trim(Session("Chisono")) & "'"
					'response.write(querypro)
					'response.end
					Set tbpro = Server.CreateObject("ADODB.RecordSet")
					tbpro.Open querypro, connm
					if not tbpro.eof then
						profilo=true
						Mprezzo2=formatnumber(tbpro("prezzo"),2)
					else
						profilo=false
					end if
					tbpro.close
				'::::::::::::::::::::::::: PREZZO PROFILO (fine) :::::::::::::::::::::::::
				'::::::::::::::::::::::::: PREZZO PROFILO (fine) :::::::::::::::::::::::::
	end if
	

	'sconto%
	v1=formatnumber(Mprezzo1,2)
	v2=formatnumber(Mprezzo2,2)
	percsconto=""
	percsconto=cstr(formatnumber(((v1-v2)*100)/v1,0)) & "%"
	
	'magazine
	if boolmagazine<>"true" and v1<>v2 then 	 
       magazinesconto="<br><font color=#ff5700>sconto da listino " & percsconto & "</font>"
      else
	   if v1<>v2 then magazinesconto="<br><font color=#ff5700>sconto magazine " & percsconto & "</font>"
	end if	
	
	if magqta<>1 then 
	   magazinesconto=magazinesconto & "<br><font color=#ff5700>quantita' min acquistabile pz." &  tbmagazine("qta") & "</font>"
	end if
	tbmagazine.close
	
	if profilo=true then magazinesconto="<br><font color=#ff5700>maxisconto cliente " & percsconto & "</font>"
	
	
    Mprezzo2=formatNumber(Mprezzo2,2)
	Mprezzo1=formatNumber(Mprezzo1,2)
	
	'response.write(Mprezzo1)
	'response.write(Mprezzo2)	
%>
	
	