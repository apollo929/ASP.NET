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

codicearticolo=senza_apice(request.Form("cod_poker"))
categoria=request.Form("categoria")
sottocategoria=request.Form("sottocategoria")
descrizione=senza_apice(request.Form("descrizione"))
p1=senza_apice(replace(request.Form("p1"),",","."))
p2=senza_apice(replace(request.Form("p2"),",","."))
p3=senza_apice(replace(request.Form("p3"),",","."))
p4=senza_apice(replace(request.Form("p4"),",","."))
p5=senza_apice(replace(request.Form("p5"),",","."))
aa_linea=senza_apice(request.Form("aa_linea"))
giacenza=senza_apice(request.Form("giacenza"))

sql_up="update prodotti set descrizione='" & descrizione & "',aa_linea='" & aa_linea & "',giacenza='" & giacenza & "',p1='" & p1 & "',p2='" & p2 & "',p3='" & p3 & "',p4='" & p4 & "',p5='" & p5 & "',categoria='" & categoria & "',sottocategoria='" & sottocategoria & "' where codice_prodotto='" & codicearticolo & "' limit 1"

'response.Write(sql_up)
'response.End()

connm.execute(sql_up)
response.Redirect("interni-modifica.asp?codice=" & codicearticolo)

%>
<!-- #include file=sqlchiudi.inc --->