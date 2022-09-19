<%					
    'text_sessionid=trim(Session.SessionID)
	'Cancella											    	 
	'Sql="Delete From Carrello Where sessionid='" & text_sessionid & "'"
	'connm.Execute Sql
	
	'LOGOUT TUTTI I CAMPI
	Session("tipoutente")=""
	Session("nomeutente") =  ""
	Session("Prezzobuffetti")=""
	Session("Prezzo")=""
	Session("Internet")=""
	Session("Chisono")=""
	Session("carrelloabilitato")=""
	Session("sRagione") =  ""
	Session("sSede") =  ""
	Session("sProvincia") = ""
	Session("n_puntibuffetti")=0	
	session("coupon")="" 
	Session("Priceisp")=""	
	Response.Cookies("MyCookie")=""
	
	response.redirect "accedi.asp"
%>