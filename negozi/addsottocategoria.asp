<!--#include virtual="/connessionesql.inc"-->
<%
categoria=request.form("categoria")
nomecat=request.form("nomecat")

if nomecat="" then response.redirect("merchant_adsottocategorie.asp")
	
	Set Tbshop_subcategories_codice = Server.CreateObject("ADODB.RecordSet")
	SQL="select max(Codice) as totale from shop_subcategories where categoria=" & categoria & ""
	'response.Write(SQL)
	'response.End()
	Tbshop_subcategories_codice.Open SQL, connm
	
	'response.Write("Codice: " & Tbshop_subcategories_codice("totale"))
	'response.End()
	
dim Codice
	
	if isnull(Tbshop_subcategories_codice("totale")) then
		Codice=1
	else
		Codice=Tbshop_subcategories_codice("totale")
		Codice=Codice + 1
	end if
	
	
	
	'response.Write(Codice)
	'response.End()
	
	'inserimento categoria
	Set Tbshop_subcategories = Server.CreateObject("ADODB.RecordSet")
	SQL="insert into shop_subcategories(Codice,Descrizione,Categoria) values(" & Codice & ",'" & nomecat & "','" & categoria & "')"
	Tbshop_subcategories.Open SQL, connm
	response.redirect("merchant_adsottocategorie.asp")
%>