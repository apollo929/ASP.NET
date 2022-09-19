<!--#include file="connessionesql.asp" -->
<%
codice=request("codice")
sql_del="delete from prodotti where codice_buf='" & codice & "' limit 1"
'response.Write(sql_del)
'response.End()
connm.execute(sql_del)

response.Redirect("buffetti-gestione.asp")
%>
<!-- #include file=sqlchiudi.inc --->