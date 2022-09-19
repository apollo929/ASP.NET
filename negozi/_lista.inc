<%
Dim Conntemp, Tbreg,Tbprov
Mydsn="DSN=CONNAGENZIA;;"
Set Conntemp=server.createobject("adodb.connection")
Conntemp.Open Mydsn
   
Function Scritta(byval testo)
	arparole=split(testo)
	txt=""
	for f=0 to ubound(arparole)
		txt=txt & Ucase(Left(arparole(f),1)) & lcase(mid(arparole(f),2)) & " "
	next
	Scritta=trim(txt)
End function

Function Bf(ByVal Testo)
	testoorig=replace(Testoorig,"\","\\")
	testoorig=replace(Testo,chr(34),"\" & chr(34))
	testoorig=replace(Testoorig," ","%20")
	bf=testoorig
End function

Function Show(byval regione,byval txt)
	SSQL = "Select * From Regioni order by Regione"
	Set Tbreg=Conntemp.Execute(SSQL)
	Do While not Tbreg.EOF
		nregione=Scritta(Tbreg("Regione"))
		nreg=replace(nregione," ","%20")
		Response.Write "<a class=home3 href=" & txt & "?regione=" & Tbreg("RegioneID") & "&" & "regio=" & nreg & ">&nbsp;&nbsp;&nbsp;&nbsp;" & nregione & "</a><br>"
		If trim(Tbreg("RegioneID"))=trim(regione) Then
			'Trovata Regione
			SSQL="Select * From Province where RegioneID=" & Tbreg("RegioneID")
			Set Tbprov=Conntemp.Execute(SSQL)
			Do while not Tbprov.EOF 
			    nprovincia=Scritta(Tbprov("Provincia"))
			    nprov=replace(nprovincia," ","%20")
				Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;" & "<a class=home4 href="+chr(34)+"centrocomm.asp?id=" & trim(Tbprov("provincia")) & chr(34)+">&nbsp;&nbsp;&nbsp;&nbsp;<B>" & nprovincia & "</B></a><br>"
				Tbprov.MoveNext 
			Loop
			Tbprov.Close 
		end if
		Tbreg.MoveNext 
	loop	
	Tbreg.Close 
End function
%>
