<!--#include file="connessionesql.inc" --><%					
    text_sessionid=trim(Session.SessionID)							    	 
	'Cancella Carrello
	Sql="Delete From Carrello Where sessionid='" & text_sessionid & "'"
	connm.Execute Sql 
	response.redirect "carrellovisua.asp"
%>
<!--#include file="sqlchiudi.inc" -->