<%					
    'text_sessionid=trim(Session.SessionID)
	'Cancella											    	 
	'Sql="Delete From Carrello Where sessionid='" & text_sessionid & "'"
	'connm.Execute Sql
	
	Session("chisono")=""
	Session("Prezzo")=""
	Session("Internet")=""
	Session("Scontoinfo")=0
	Session("nomeutente")=""
	Session("sRagione") =  ""
	Session("sSede") =  ""
	Session("sProvincia") =  ""
	
	response.redirect "index.asp"
%>