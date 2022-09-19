<!--#include file="connessionesql.asp" -->
<%
codice=session("codice")
codiceins=right(codice,6)

Set tbspi = Server.CreateObject("ADODB.RecordSet")	
sql_spi="Select * from prodotti where codice_sp='" & codice & "' or codice_prodotto='" & codice & "' limit 1"
tbspi.Open sql_spi,connm

Set tbcontrollofoto = Server.CreateObject("ADODB.RecordSet")	
sql_controllofoto="Select * from spicersdett2014 where spicers='" & codice & "' limit 1"
tbcontrollofoto.Open sql_controllofoto,conn

if not tbcontrollofoto.eof then
	sql_up="update spicersdett2014 set foto='" & codiceins & ".jpg' where spicers='" & codiceins & "' limit 1"	
else
	sql_up="insert into spicersdett2014 (marchio,categoria,sottocategoria,nomeprodotto,spicers,foto) values ('" & tbspi("marchio") & "','" & tbspi("categoria") & "','" & tbspi("sottocategoria") & "','" & tbspi("descrizione") & "','" & codiceins & "','" & codiceins & ".jpg')"
end if

'response.Write(sql_up)
'response.End()
conn.execute(sql_up)

response.Redirect("spicers-modifica.asp?codice=" & codice)
'response.Write(sql_up)
%>
<!-- #include file=sqlchiudi.inc --->