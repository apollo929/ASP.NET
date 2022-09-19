<!-- #include file = "connessionesql.inc" -->	
<%
on error resume next
MySQL="delete from news where id=" & Request("id") & " limit 1"
set rs2=connm.execute(MySQL)
response.redirect "adlista.asp"
%>
			
			
