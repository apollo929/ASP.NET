<!--#include virtual="/connessionesql.inc"-->
<%
IdCat=request("IdCat")


Set Tbshop_subcategories_dell = Server.CreateObject("ADODB.RecordSet")
SQL="delete from shop_subcategories where id='" & IdCat & "' limit 1"
Tbshop_subcategories_dell.Open SQL, connm

response.redirect("merchant_adsottocategorie.asp")
%>
