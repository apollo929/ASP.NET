<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%     	 
'Tabelle Utilita
Set Tbcar = Server.CreateObject("ADODB.Recordset")
'Query   
Sql="Select * from SalvaCarrello where Sessionid='" &  Trim(Session("chisono")) & "' Order by ID Desc"
Tbcar.Open Sql,connm	

Do while not Tbcar.EOF
	StrSqlins="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore) values ('" & Session.SessionID & "','" & Tbcar("Codice_ISP") & "','" & Tbcar("Descrizione") & "','" & Tbcar("quantita") & "','" & Replace(Tbcar("prezzo"),",",".") & "','" & Tbcar("data")& "','" & Replace(Tbcar("prezzou"),",",".") & "','" & Tbcar("blocco") & "','" & Tbcar("fornitore") & "')"
	connm.Execute StrSqlins
Tbcar.MoveNext
Loop
Tbcar.close
%>
<!--#include file=sqlchiudi.inc-->
<%Response.redirect "carrellovisua.asp?info=Carrello Ripristinato"%>
	