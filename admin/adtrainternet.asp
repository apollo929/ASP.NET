<!--#include file="connessionesql.asp" -->

<html>
<head>
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body  bgcolor=white>
<img src='imgnew/testa.jpg'><br>
<HR>
<a class=nero10 href=adutentipro.asp><img border=0 src=imgnew/tasto.gif>&nbsp;INDIETRO</a><br>
<HR>
<FORM ACTION="adtrainternet.asp?trasf=invia" id=form1 name=form1>
Inserire la password identificativa al riferimento cliente Wincody:<BR>
Vecchio Rif Wincody : <INPUT TYPE="text" NAME="vecchia" ID="vecchia">
Nuovo Rif.Wincody : <INPUT TYPE="text" NAME="nuova" ID="nuova">
<INPUT TYPE="submit" NAME="trasf" VALUE="Modifica_PASSWORD" ID=SUBMIT1>
</FORM> 	<br>
<%
if Trim(Request("trasf"))="Modifica_PASSWORD" then
		'cambio
		textv=Request("vecchia")
		textn=Request("nuova")
		
		'##verifica univocità password
		Set rs = Server.CreateObject("ADODB.Recordset")
		if textn<>"" then
			sql="select password1 from registrazione  where password1='" & textn & "' union select password1 from registrazioneint where password1='" & textn & "'"
			rs.Open sql,connm
			if not rs.eof then
				response.Write ("<b><font color='red'>Rif. Wincody è già presente in archivio</font></b>")
				rs.close
				connm.close
				response.end
			end if	
			rs.close
		end if
		
		queryu="Select * From Registrazione where password1='" & textv & "'"
		Set Tbutu = Server.CreateObject("ADODB.Recordset")	
		Tbutu.Open Queryu,Connm
		
		if textv<>"" and textn<>"" and not Tbutu.eof then
			StrSql="Update Registrazione Set Password1=" & textn & " where password1='" & textv & "'"			response.write(StrSql & "<br>")			connm.EXECUTE(StrSql)
			StrSql="Update Profilo Set Password1=" & textn & " where password1='" & textv & "'"			response.write(StrSql & "<br>")			connm.EXECUTE(StrSql)
			StrSql="Update Listino Set Password1=" & textn & " where password1='" & textv & "'"			response.write(StrSql & "<br>")			connm.EXECUTE(StrSql)
			StrSql="Update Storico Set Password1=" & textn & " where password1='" & textv & "'"			response.write(StrSql & "<br>")			connm.EXECUTE(StrSql)
			StrSql="Update Ordine Set Password1=" & textn & " where password1='" & textv & "'"			response.write(StrSql & "<br>")			connm.EXECUTE(StrSql)
			response.write("SPOSTAMENTO ANDATO A BUON FINE")
		else
		 response.write(" I campi non possono essere vuoti o errati <br>")
		end if
	
end if 

%>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->