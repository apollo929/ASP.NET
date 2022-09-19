<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%  
'SENZA CONTROLLI
text_sessionid=Session.SessionID
set cercoprezzo = server.createobject("adodb.recordset")
SQL_cercoprezzo = "select sum(prezzo) as sommapc,sum(quantita) as sommaitem from carrello where sessionid='" & text_sessionid & "'"
cercoprezzo.open SQL_cercoprezzo, connm	
'response.write(SQL_cercoprezzo)
session("sommaitem")=cercoprezzo("sommaitem")
if cercoprezzo.eof or cercoprezzo("sommapc")="" or isnull(cercoprezzo("sommapc"))=true then
	response.Write("&euro; 0,00")
else
	response.Write("&#8364; " & formatnumber(cercoprezzo("sommapc")))
end if
cercoprezzo.close


%>
<!--#include file="sqlchiudi.inc" -->