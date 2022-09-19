<!--#include file="connessionesql.asp" -->
<%
session("categoria")=request.Form("categoria")
session("sottocategoria")=request.Form("sottocategoria")
session("cod_poker")=request.Form("cod_poker")
session("marchio")=request.Form("marchio")
session("descrizione")=request.Form("descrizione")
session("aa_linea")=request.Form("aa_linea")
session("giacenza")=request.Form("giacenza")

p1=request.Form("p1")
p2=p1*1.10

if session("giacenza")="" then session("giacenza")=10
if session("aa_linea")="" then session("aa_linea")=0

sql_ins="insert into prodotti (codice_prodotto,categoria,sottocategoria,descrizione,aa_linea,giacenza,fornitore,marchio,p1,p2,p3,p4,p5) values ('" & session("cod_poker") & "','" & session("categoria") & "','" & session("sottocategoria") & "','" & session("descrizione") & "','" & session("aa_linea") & "','" & session("giacenza") & "','SPICERS','" & session("marchio") & "','" & p1 & "','" & p2 & "','" & p2 & "','" & p2 & "','" & p2 & "')"

'response.Write(sql_ins)
'response.End()
connm.execute(sql_ins)

cod_poker=request.Form("cod_poker")

session("categoria")=""
session("sottocategoria")=""
session("cod_poker")=""
session("descrizione")=""
session("aa_linea")=""
session("giacenza")=""

response.Redirect("interni-modifica.asp?codice=" & cod_poker)

%>
<!-- #include file=sqlchiudi.inc --->