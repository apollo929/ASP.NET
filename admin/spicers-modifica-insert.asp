<!--#include file="connessionesql.asp" -->
<%
Function Fotoimg(Byval Cod)
	Set Tbf = Server.CreateObject("ADODB.RecordSet")
	sSql="select Spicers,foto from Spicersdett2014 where Spicers='" & Replace(Trim(Cod),"spi","") & "' limit 1"
	Tbf.Open sSql, conn
	Nome_foto=""
	if not Tbf.EOF then
	   Fotoimg=Trim(Tbf("foto")) & " "
	end if   
	Tbf.Close
End function

codicearticolo=request.Form("codicearticolo")
cod_poker=request.Form("cod_poker")
cat=request.Form("cat")
sottocategoria=request.Form("sottocategoria")
descrizione=request.Form("descrizione")
aa_linea=request.Form("aa_linea")
giacenza=request.Form("giacenza")

sql_ins="insert into prodotti () values ()"
sql_up="update prodotti set codice_prodotto='" & codicearticolo & "',categoria='" & cat & "',sottocategoria='" & sottocategoria & "',descrizione='" & descrizione & "',aa_linea='" & aa_linea & "',giacenza='" & giacenza & "' where codice_sp='" & cod_poker & "' limit 1"
response.Write(sql_up)



%>
<!-- #include file=sqlchiudi.inc --->