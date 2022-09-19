<!--#include virtual="/connessionesql.inc"-->
<%
IdCat=request.form("IdCat")
Categoria=request.form("Categoria")

if IdCat="" or Categoria="" then response.redirect("merchant_adcategorie.asp")
if not isnumeric(IdCat) then
	response.redirect("merchant_adcategorie.asp?errore=si")
end if
Set Tbshop_categories_controllo = Server.CreateObject("ADODB.RecordSet")
SQL="select * from shop_categories where categoryID='" & IdCat & "' or catdescription='" & Categoria & "'"
Tbshop_categories_controllo.Open SQL, connm

if Tbshop_categories_controllo.eof then
	'inserimento categoria
	Set Tbshop_categories = Server.CreateObject("ADODB.RecordSet")
	SQL="insert into shop_categories(categoryID,catdescription) values(" & IdCat & ",'" & Categoria & "')"
	Tbshop_categories.Open SQL, connm
	response.redirect("merchant_adcategorie.asp")
else
	'categoria o id gia presente
	response.redirect("merchant_adcategorie.asp?errore=si")
end if
%>