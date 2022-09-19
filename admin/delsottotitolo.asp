<!--#include file=connessionesql.inc-->
<%
IdCat=request("IdCat")
connm.execute("delete from eventi_sottotitolo where id='" & IdCat & "' limit 1")
connm.execute("delete from eventi where id_sottotitolo='" & IdCat & "' limit 1")
response.redirect("eventi_titolo.asp")
%>
