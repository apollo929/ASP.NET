<!--#include file="connessionesql.asp" -->
<%
codice=request("codice")
sql_del="delete from prodotti where codice_prodotto='" & codice & "' limit 1"
'response.Write(sql_del)
'response.End()
connm.execute(sql_del)

response.Redirect("interni-gestione.asp")
%>
<!-- #include file=sqlchiudi.inc --->