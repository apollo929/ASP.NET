	<%	
	
    'OD
	Mprezzo1=tbprodcatalogo("p1")
	Descrizione=Trim(replace(replace(replace(tbprodcatalogo("Descrizione"),"'","`"),"*"," "),"&"," "))
			
	'Se vuoto
	if Trim(Ucase(Session("Priceisp")))="" then 
		Mprezzo2=tbprodcatalogo("p1")
	end if							
	if Trim(Ucase(Session("Priceisp")))="PREZZO1" then 
		Mprezzo2=tbprodcatalogo("p1")
	end if
	if Trim(Ucase(Session("Priceisp")))="PREZZO2" then 
		Mprezzo2=tbprodcatalogo("p2")
	end if
	if Trim(Ucase(Session("Priceisp")))="PREZZO3" then 
		Mprezzo2=tbprodcatalogo("p3")
	end if
	if Trim(Ucase(Session("Priceisp")))="PREZZO4" then 
		Mprezzo2=tbprodcatalogo("p4")
	end if
	if Trim(Ucase(Session("Priceisp")))="PREZZO5" then 
		Mprezzo2=tbprodcatalogo("p5")
	end if
				    
	Mprezzo2=formatNumber(Mprezzo2,2)
	Mprezzo1=formatNumber(Mprezzo1,2)
	
	
	profilo=false
	magazinesconto=""	
	if Mprezzo2<>Mprezzo1 then magazinesconto="<br>sconto da listino "


	'UTENTE LOGGATO
	if Trim(Session("Chisono"))<>"" then
	
				'::::::::::::::::::::::::: PREZZO PROFILO (inizio) :::::::::::::::::::::::::
				'::::::::::::::::::::::::: PREZZO PROFILO (inizio) :::::::::::::::::::::::::
					'Cerca prezzo codificato dal cliente PROFILO
					querypro="Select * From PROFILO where (codice_isp='" & Trim(tbprodcatalogo("codice_buf")) & "' or codice_isp='" & Trim(tbprodcatalogo("codice_od")) & "' or codice_isp='" & Trim(tbprodcatalogo("codice_prodotto")) & "') AND password1='" & Trim(Session("Chisono")) & "'"
					'response.write(querypro)
					'response.end
					Set tbpro = Server.CreateObject("ADODB.RecordSet")
					tbpro.Open querypro, connm
					if not tbpro.eof then
						profilo=true
						Mprezzo2=formatnumber(tbpro("prezzo"),2)
						magazinesconto="<br>maxisconto cliente "
					else
						profilo=false
						'magazinesconto=""
					end if
					tbpro.close
				'::::::::::::::::::::::::: PREZZO PROFILO (fine) :::::::::::::::::::::::::
				'::::::::::::::::::::::::: PREZZO PROFILO (fine) :::::::::::::::::::::::::
	end if
	
%>
