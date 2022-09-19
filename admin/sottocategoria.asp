<!--#include file="connessionesql.asp" -->

	<%
	sottocategoria=""
	sottocategoria = Request.QueryString("sottocategoria")
	Set tb_sot = connm.Execute("SELECT distinct(sottocategoria) FROM prodotti WHERE CATEGORIA LIKE '%" & abc & "%'")
	If not tb_sot.EOF  Then
		While tb_sot.EOF = False
			if instr(1,tb_sot("sottocategoria"),sottocategoria)>0 then
			
				tt=tt&"<option value=" & tb_sot("sottocategoria") & " selected=selected>" & tb_sot("sottocategoria") & "</option>"
			else
				tt=tt&"<option value=" & tb_sot("sottocategoria") & ">" & tb_sot("sottocategoria") & "</option>"
			end if
			tb_sot.MoveNext
		Wend		
	End If
	tb_sot.close
	response.Write(tt)
	'response.Write("ddddddd")
	%>

<!-- #include file=sqlchiudi.inc --->