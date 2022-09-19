<!--#include file="connessionesql.asp" -->
<%
codice=session("codice")

Set tbspi = Server.CreateObject("ADODB.RecordSet")	
sql_spi="Select * from prodotti where codice_buf='" & codice & "' limit 1"
tbspi.Open sql_spi,connm

Set tbcontrollofoto = Server.CreateObject("ADODB.RecordSet")	
sql_controllofoto="Select * from BuffettiSchede where codice='" & codice & "' limit 1"
tbcontrollofoto.Open sql_controllofoto,conn

if not tbcontrollofoto.eof then

	sql_up="update BuffettiSchede set foto1='" & codice & ".jpg' where codice='" & codice & "' limit 1"
	
else
	sql_up="insert into BuffettiSchede (macrocategoria,codice,brand,descrizione,foto1) values ('" & tbspi("sottocategoria") & "','" & tbspi("codice_buf") & "','" & tbspi("marchio") & "','" & tbspi("descrizione") & "','" & codice & ".jpg')"
end if

'response.Write(sql_up)
'response.End()
conn.execute(sql_up)



response.Redirect("buffetti-modifica.asp?codice=" & codice)
'response.Write(sql_up)

%>
<!-- #include file=sqlchiudi.inc --->