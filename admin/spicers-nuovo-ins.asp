<!--#include file="connessionesql.asp" -->
<%

session("categoria")=request.Form("categoria")
session("sottocategoria")=request.Form("sottocategoria")
session("cod_sp")=request.Form("cod_sp")
session("cod_poker")=request.Form("cod_poker")
session("marchio")=request.Form("marchio")
session("descrizione")=request.Form("descrizione")
session("aa_linea")=request.Form("aa_linea")
session("giacenza")=request.Form("giacenza")

p1=request.Form("p1")
p2=request.Form("p2")
p3=request.Form("p3")
p4=request.Form("p4")
p5=request.Form("p5")


if session("giacenza")="" then session("giacenza")=10
if session("aa_linea")="" then session("aa_linea")=0

'::::::::::::::: CONTROLLI CODICE SPICERS/ADVEO (inizio) :::::::::::::::
'if len(session("cod_sp"))<>6 then response.Redirect("spicers-nuovo.asp?errore=codice spicers errato")
'if instr(1,session("cod_sp"),"spi")=0 then session("cod_sp")="spi" & session("cod_sp")
'cod_sp=session("cod_sp")
'::::::::::::::: CONTROLLI CODICE SPICERS/ADVEO (fine) :::::::::::::::

if session("cod_sp")="" then
	sql_ins="insert into prodotti (codice_prodotto,codice_sp,categoria,sottocategoria,descrizione,aa_linea,giacenza,fornitore,marchio,p1,p2,p3,p4,p5) values ('" & session("cod_poker") & "','" & session("cod_sp") & "','" & session("categoria") & "','" & session("sottocategoria") & "','" & session("descrizione") & "','" & session("aa_linea") & "','" & session("giacenza") & "','SPICERS INTERNI','" & session("marchio") & "','" & p1 & "','" & p2 & "','" & p3 & "','" & p4 & "','" & p5 & "')"
else
	sql_ins="insert into prodotti (codice_prodotto,codice_sp,categoria,sottocategoria,descrizione,aa_linea,giacenza,fornitore,marchio,p1,p2,p3,p4,p5) values ('" & session("cod_poker") & "','" & session("cod_sp") & "','" & session("categoria") & "','" & session("sottocategoria") & "','" & session("descrizione") & "','" & session("aa_linea") & "','" & session("giacenza") & "','SPICERS','" & session("marchio") & "','" & p1 & "','" & p2 & "','" & p3 & "','" & p4 & "','" & p5 & "')"
end if
'response.Write(sql_ins)
'response.End()
connm.execute(sql_ins)

cod_sp=request.Form("cod_sp")
cod_poker=request.Form("cod_poker")

session("categoria")=""
session("sottocategoria")=""
session("cod_sp")=""
session("cod_poker")=""
session("descrizione")=""
session("aa_linea")=""
session("giacenza")=""

if cod_sp="" then
	response.Redirect("interni-modifica.asp?codice=" & cod_poker)
else
	response.Redirect("spicers-modifica.asp?codice=" & cod_sp)
end if
%>
<!-- #include file=sqlchiudi.inc --->