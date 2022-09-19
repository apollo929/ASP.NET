<!--#include file="parametriasp.inc"-->	
<HTML>
<HEAD>
<link href="style.css" rel="stylesheet" type="text/css">
</HEAD>
<body bgcolor="#ffffff" onload="window.print()" text="#000000" name="printform">
<font face="Verdana" size="2">
<center>
inviare ordine via fax al numero : <%=Session("faxnum")%>
<br>
Stampa del <%Response.Write Date%> , <%Response.Write Time%>
<br>
  <u><%=titolopagina%></u>
</center>				
<br><br><br>
</font>

<!--#include file="ricaricacarrellovisua.asp" -->

</body>
</HTML>
