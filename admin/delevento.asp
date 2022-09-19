<!--#include file=connessionesql.inc-->
<%
IdCat=request("IdCat")
connm.execute("delete from eventi_titolo where categoryID=" & IdCat)
connm.execute("delete from eventi_sottotitolo where Categoria=" & IdCat)
connm.execute("delete from eventi where Categoria=" & IdCat)
response.redirect("eventi_titolo.asp")
%>