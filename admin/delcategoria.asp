<!--#include virtual="/connessionesql.inc"-->
<%
IdCat=request("IdCat")

Set Tbshop_categories_dell = Server.CreateObject("ADODB.RecordSet")
SQL="delete from shop_categories where categoryID='" & IdCat & "'"
Tbshop_categories_dell.Open SQL, connm

Set Tbshop_subcategories_dell = Server.CreateObject("ADODB.RecordSet")
SQL="delete from shop_subcategories where Categoria='" & IdCat & "'"
Tbshop_subcategories_dell.Open SQL, connm

response.redirect("merchant_adcategorie.asp")
%>