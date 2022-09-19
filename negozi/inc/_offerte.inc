<%
Sub InsOfferte
	'Visualizza le offerte in corso
	openconn
	set rs = server.CreateObject("ADODB.Recordset")
	strSQL = "Select * from products where cofferta=true"
	rs.Open strSQL,dbc
	counter=1
	If not rs.EOF Then
		ihtml=""
		flipflop=1
		do while not rs.EOF 
			If flipflop=1 Then
				ihtml=ihtml+"<table width=""100%"" bgcolor="&color6&">"
				ihtml=ihtml+"<tr>"
			Else
				ihtml=ihtml+"<table width=""100%"" bgcolor="&color4&">"
				ihtml=ihtml+"<tr>"
			End if
			flipflop=-flipflop
			ihtml=ihtml+"<td>"
			ihtml=ihtml+"</td>"
			ihtml=ihtml+"<td>"
			ihtml=ihtml+"<font size=""1"" face=""Verdana"">"
			ihtml=ihtml+"<font size=""2"" face=""Verdana"">"
			ihtml=ihtml+"<b>"+rs("cname")+"</b>"
			ihtml=ihtml+"<br>"
			ihtml=ihtml & "Prezzo: " & FormatCurrency(rs("cpriceofferta"),0) & "" & vbcrlf
			ihtml=ihtml+"</font>"
			ihtml=ihtml+"<a href=""../product.asp?id="
			ihtml=ihtml & rs("catalogID") & "&subcatid=" & rs("ccategory") & chr(34)+">"
			ihtml=ihtml & "Info &gt;&gt;&gt;</a></font>"
			ihtml=ihtml+"</td>"
			ihtml=ihtml+"</tr>"
			rs.MoveNext 
			counter=counter+1
			ihtml=ihtml+"</table>"				  
		loop
		
		closeconn
	else
		'Nessuna Offerta in Corso
		ihtml=ihtml+"<table width=""100%"" bgcolor="&color4&">"
		ihtml=ihtml+"<tr valign=""top"">"
		ihtml=ihtml+"<td><font size=""2"" color="&color4&" face=""Verdana""><u>Non ci sono Offerte..."
		ihtml=ihtml+"</u></font></td>"
		ihtml=ihtml+"</tr>"
		ihtml=ihtml+"</table>"
	end if	
	'Output HTML	
	Response.Write ihtml
End Sub
%>
