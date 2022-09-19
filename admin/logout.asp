<!--#include file=connessionesql.inc-->
<% 
sqlrepair="select concat('REPAIR TABLE ', table_name, ';') from information_schema.tables where table_schema='" & namedbmysql & "';"
connm.execute(sqlrepair)
session("utentetipo")=""
Response.Redirect "../index.asp"
%>
<!--#include file=closesql.inc-->