<!--#include file="connessionesql.asp" -->
<html>
<head>
	<title>IMPORTAZIONE</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="calendar.js"></script>
</head>
<body  bgcolor=white>
<!-- #include file=_menu.inc --->
<HR>
<%
conn.execute("REPAIR TABLE magazinebuffetti QUICK;")
'Magazine
querymag="SELECT * FROM magazinebuffetti "
Set tbmag = Server.CreateObject("ADODB.RecordSet")
'response.write(querymag)
tbmag.Open querymag,conn
on error resume next
i=0	
Do While not tbmag.eof
i=i+1
StrSqldel="delete from prodotti where codice_buf='" & tbmag("codice") & "'"
connm.execute(StrSqldel)
t1=Replace(Replace(tbmag("prezzo"),".",""),",",".")
t2345=Replace(Replace(tbmag("prezzoofferta"),".",""),",",".")
StrSql=""
StrSql="Insert into prodotti (codice_buf,descrizione,descrizione1,p1,p2,p3,p4,p5,qta1,qta2,qta3,qta4,qta5,fornitore,categoria,sottocategoria)  values ('" & tbmag("codice") & "','" & tbmag("descrizione") & "','" & tbmag("descrizione") & "','" & t1 & "','" & t2345 & "','" & t2345 & "','" & t2345 & "','" & t2345 & "','1','1','1','1','1','Gruppo Buffetti S.p.A.','altro','altro')"
connm.execute(StrSql)
response.write(i & "<br>")
tbmag.movenext
Loop
response.write("inserimento prodotti magazine ok")
conn.execute("REPAIR TABLE magazinebuffetti QUICK;")
%>