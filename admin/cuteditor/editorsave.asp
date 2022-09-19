<!--#include file=connessionesql.inc-->
<%
Dim sValue
sValue = replace(Replace(Replace(Request.Form("Editor1"),"'","`"),"\","-"),"@import url(asp.css);","")
 if cdbl(session("id"))<=100000 or cdbl(session("id"))>700000 then
 	Queryp="update Lista set Descrizione='" & sValue & "' where id='" & session("id") & "'"
 else
 	Queryp="update Lista1 set Descrizione='" & sValue & "' where id='" & session("id") & "'"   
 end if 
set Tblista=Conn.Execute(Queryp) 
query="update lista set descrizione=replace(descrizione,'@import url(asp.css);','') where descrizione like '%@import url(asp.css);%' order by id desc"
conn.execute(query) 
response.Redirect("../vetrina.asp")
%>


