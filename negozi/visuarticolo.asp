<!--Shop Manuale -->
<!--#include virtual="/connessionesql.asp"-->
<%
'Visualizza tutte le Sottocategorie
Sub Visuaimg
  if trim(request("ID"))<>"" then
	Set tbshop = Server.CreateObject("ADODB.RecordSet")
	subid=request("SID")
	If subid="" Then
		sSQL = "select * From Products where catalogID=" & request("ID") & " order by cname"
	End if
	tbshop.Open sSQL, connm
	If not tbshop.EOF then
	        Response.Write "<table>"
		 	If len(tbshop("cimageurl"))>2 then
		 	    Response.Write "<td width=100 height=100 allign=middle vallign=middle>"
				newimmagine=Trim(tbshop("cimageurl"))
				newimmagine=replace(newimmagine," ","%20")
				if instr(lcase(newimmagine),"vuot")=0 then
				 Response.Write "<img width=100 height=100 border=1 src='articoli/" & newimmagine & "'>"
				else
				 Response.Write "<img width=100 height=100 border=1 src=spacer.gif>Nessuna Immagine"
				end if 
			Else
				Response.Write "<td width=100 height=100 allign=middle vallign=middle bgcolor=" & color2 & ">"
				Response.Write "<img width=100 height=100 border=1 src=spacer.gif>Nessuna Immagine"
			End if
			Response.Write "</td>"
			Response.Write "<table>" 
	 End if	
	 tbshop.close
	end if 
end sub
%>
<html>
	<head>
		<title>Articoli</title>
		<link rel="stylesheet" href="_styles.inc">
	</head>
	<body bgcolor=<%=color4%> link="<%=color1%>" vlink="<%=color1%>">
		<form name="articoli">
			<table width="100%">
				<tr>
					<td align=middle colspan=2 class=bianco10><b>Visualizza Immagine</b></font></td>
				</tr>
				<tr>
				<td align=middle colspan=2><hr></td>
				</tr>
				<tr>
					<td align=middle colspan=2>
					<table width=100%>
						<%visuaimg%>
					</td>
				</tr>
				<tr>
					<td colspan=2 height="20"></td>
				</tr>
			</table>
		</form>
	</body>
</html>



