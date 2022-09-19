<!--#include file="connessionesql.asp" -->
<html>
<head>
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body  bgcolor=white>
<br>
<!-- #include file=_menu.inc --->
<%@LANGUAGE = VBScript%>
<%
    Dim sc, cn, rs

    sc = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="
    sc = sc & Server.MapPath("database.xls")
    sc = sc & ";Extended Properties=Excel 8.0"

    Set cn = Server.CreateObject("ADODB.Connection")
    cn.Open sc

    Set rs = Cn.Execute("SELECT * FROM utenti")
    With (Response)
        While rs.EOF = False
            .Write "<p>"
            .Write "ID: " & rs(0) & "<br>"
            .Write "Nome: " & rs(1) & "<br>"
            .Write "Telefono: " & rs(2)
            .Write "</p>"
            rs.MoveNext
        Wend
    End With
    Set rs = Nothing

    cn.Close
    Set cn = Nothing
%>
<!-- #include file=sqlchiudi.inc --->