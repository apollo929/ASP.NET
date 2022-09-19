<!--#include file="connessionesql.asp" -->
<%
codice=session("codice")

sql_up="update prodotti set foto='" & replace(codice,".","_") & ".jpg' where codice_prodotto='" & codice & "' limit 1"
	
'response.Write(sql_up)
'response.End()
connm.execute(sql_up)

response.Redirect("interni-modifica.asp?codice=" & codice)
'response.Write(sql_up)

%>
<!-- #include file=sqlchiudi.inc --->