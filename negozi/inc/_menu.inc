<%

Sub WriteFakeButton( sRef, sText )
	Response.Write "<img src=""images/linkoff.gif"">"
	Response.Write "<b><a href=""" & sRef & """" & "><font color=#000066 size=""2"" face=""Verdana,Arial,Helvetica"">" & "  " & sText &  "</font></a></b>"
End Sub


Sub WriteMenuItem( sRef, sText )
	If sRef<>"" Then
		Response.Write "<tr>"
		Response.Write "<td><IMG height=8 src=""spacer.gif"" width=8></td>"
		Response.Write "<td>"
		Response.Write "<font size=""2"" face=""verdana""><font color=""#000000""><A href="+chr(34)+sRef+chr(34)+">"+sText+"</A>&nbsp;"
		Response.Write "<BR><BR></font></td>"
		Response.Write "</tr>"
	Else
		Response.Write "<tr><td>"
		'Response.Write "<IMG height=8 src=""spacer.gif"" width=8>"
		response.Write "</td>"
		response.Write "<td>"
		response.Write "<hr>"
		Response.Write "</tr></td>"
	End If
End Sub


Sub AdminMenu
	WriteMenuItem "../ad/admin.asp","Menu Principale"
	WriteMenuItem "merchant_adneg.asp?cm=vis","Merchant"
	WriteMenuItem "merchant_adcentro.asp?cm=vis","Centro Commerciale"
	WriteMenuItem "",""
End Sub

%>
