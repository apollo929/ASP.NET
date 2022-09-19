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

response.Write(request("sottocat") & "<br><br>")

codicearticolo=senza_apice(request.Form("spicers"))
cod_poker=request.Form("cod_poker")
cat=request.Form("cat")
sottocategoria=request.Form("sottocategoria")
descrizione=senza_apice(request.Form("descrizione"))
aa_linea=senza_apice(request.Form("aa_linea"))
giacenza=senza_apice(request.Form("giacenza"))

sql_up="update prodotti set codice_prodotto='" & cod_poker & "',descrizione='" & descrizione & "',aa_linea='" & aa_linea & "',giacenza='" & giacenza & "' where codice_sp='" & codicearticolo & "' limit 1"
connm.execute(sql_up)
response.Redirect("spicers-modifica.asp?codice=" & codicearticolo)
'response.Write(sql_up)

%>
<!-- #include file=sqlchiudi.inc --->