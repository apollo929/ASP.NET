<!--Shop Manuale -->
<!--#include virtual="/connessionesql.inc"-->
<%
Function CA(ByVal Testo)
	If not isnull(Testo) then
		testo=replace(testo,chr(13),"")
		testo=replace(testo,chr(10),"")
		ca=replace(testo,"'","‘")
	else
		Ca=""
	end if
End Function

Function Trova(ByVal articolo)
	Set Rsfind = Server.CreateObject("ADODB.RecordSet")
	VSQL = "select * From Shop_Merchantproducts where catalogID=" & Cdbl(articolo)
	Rsfind.Open VSQL, connm
	if Rsfind.RecordCount>0 then 
	 Trova=true
	else
	 Trova=false 
	end if
End Function

if request("act")="ins" then
	'Inserisce l'articolo
	Set tbshop = Server.CreateObject("ADODB.RecordSet")
	sSQL = "select * From Shop_Products where catalogID=" & request("art")
	tbshop.Open sSQL, connm
	If not tbshop.EOF then
		descrizione=ca(tbshop("cname"))
		note=ca(tbshop("cdescription"))
		immagine=ca(tbshop("cimageurl"))
		Response.Write "<script language=javascript>"
		'Response.Write "opener.document.form.codarticolo.value='" & request("art") & "';"
		'Response.Write "opener.document.form.hcodarticolo.value='" & request("art") & "';"
		Response.Write "opener.document.form.desarticolo.value='" & descrizione & "';"
		Response.Write "opener.document.form.artdettagli.value='" & descrizione & "';"
		Response.Write "opener.document.form.immagine.value='" & immagine & "';"
		Response.Write "opener.document.form.artdettagli.value='" & note & "';"
		'Response.Write "opener.document.form.insdb.value='true';"
		Response.Write "window.close();"
		Response.Write "</script>"
	end if
	Response.Write "Errore"
	Response.End 
end if

'Visualizza tutte le Sottocategorie
Sub InsSottoCategorie
	Set tbshop = Server.CreateObject("ADODB.RecordSet")
	subid=request("SID")
	If subid="" Then
		sSQL = "select * From Shop_Products where ccategory=" & request("ID") & " order by cname"
	else
		sSQL = "select * From Shop_Products where ccategory=" & request("ID") & " and cscategory=" & subid & " order by cname"
	end if
	tbshop.Open sSQL, connm
	If not tbshop.EOF then
		tbshop.PageSize=54
		npagine=tbshop.pagecount
		If request("Pag")<>"" Then
			'tbshop.absolutepage=request("Pag")
		else
			'tbshop.absolutepage=1
		end if
		counter=1
		Response.Write "<tr>"
		Do while not (tbshop.eof or (Counter > tbshop.PageSize))
		 	If len(tbshop("cimageurl"))>2 then
				Response.Write "<td class=nero10 width=100 height=100 allign=middle vallign=middle>"
				newimmagine=Trim(tbshop("cimageurl"))
				newimmagine=replace(newimmagine," ","%20")
				Response.Write "<img width=100 height=100 border=1 src='articoli/" & newimmagine & "'>"
			else
				Response.Write "<td class=nero10 width=100 height=100 allign=middle vallign=middle bgcolor=" & color2 & ">"
				Response.Write "<img width=100 height=100 border=1 src=spacer.gif>"
			end if
			Response.Write "</td>"
			Response.Write "<td class=nero10 valign=top>"
			Response.Write "<table>"
			Response.Write "<tr><td class=nero10 height=20 valign=top>"
			 
			Response.Write "Codice: <b>" & tbshop("catalogID") & "</b>"
			Response.Write "</font>"
			Response.Write "</tr></td>"
			Response.Write "<tr><td class=nero10 height=50 valign=top>"
			 
			Response.Write "<b>" & tbshop("cname") & "</b><br>"
			Response.Write "</font>"
			Response.Write "</tr></td>"
			Response.Write "<tr><td class=nero10 height=30 valign=baseline>"
			 
			Response.Write "<a  class=nero10   href=selarticolo.asp?art="& tbshop("catalogID") & "&act=ins>"
			Response.Write "<u>Seleziona</u>"
			Response.Write "</a>"
			Response.Write "</font>"
			'If Trova(tbshop("catalogid"))=false then
		     'response.write( "<br><font color=red><b>Codice senza Merchant N°Art.-> " & tbshop("catalogid") & "</b></font><br>")	
		    'end if
			Response.Write "</td></tr>"
			Response.Write "</table>"
			Response.Write "</td>"
			counter=counter+1
			if counter/2<>int(counter/2) then Response.Write "</tr>"
		    tbshop.movenext
		loop
		Response.Write "</table>"
		Response.Write "<br>"
		pagina=request("Pag")
		if pagina="" then pagina=1 else pagina=cint(pagina)
		 
		If pagina<>1 then
			Response.Write "<a href=selarticolo.asp?pag=" & pagina-1 & "&id=" & request("ID") & "&sid=" & request("SID") & ">"
			Response.Write "<img src=img/_prev.gif border=0 align=absmiddle>&nbsp;"
			Response.Write "</a>"
		else
			Response.Write "<img src=spacer.gif width=10 border=0 align=absmiddle>&nbsp;"
		end if
		for f=1 to npagine
			if pagina=f Then
				Response.Write "<b>(" & f & ")</b>&nbsp;"
			else
				Response.Write "<a  class=nero10   href=selarticolo.asp?pag=" & trim(f) & "&id=" & request("ID") & "&sid=" & request("SID") & ">"
				Response.Write "" & f & "&nbsp;"
				Response.Write "</a>"
			end if
		next
		If pagina<npagine then
			Response.Write "<a href=selarticolo.asp?pag=" & pagina+1 & "&id=" & request("ID") & "&sid=" & request("SID") & ">"
			Response.Write "<img src=img/_next.gif border=0 align=absmiddle>"
			Response.Write "</a>"
		end if
		Response.Write "</font>"
	else
		 
		Response.Write "<br><br><br><br><br><br><br><br><center><i><b>Nessun Articolo Soddisfa la Ricerca</b></i></center>"
		Response.Write "</font>"
	end if
	tbshop.close
end sub


%>
<html>
	<head>
		<title>Articoli</title>
		<link href="/admin/style.css" rel="stylesheet" type="text/css">
	</head>
	<body bgcolor="white" link="black" vlink="black">
		<form name="articoli">
			<table width="100%">
				<tr>
					<td class=nero10 align=middle colspan=2><font face="Verdana" Size="2"><b>Selezionare l'Articolo</b></font></td>
				</tr>
				<tr>
				<td class=nero10 align=middle colspan=2><hr></td>
				</tr>
				<tr>
					<td class=nero10 align=middle colspan=2>
					<table width=100%>
						<%InsSottoCategorie%>
					</td>
				</tr>
				<tr>
					<td class=nero10 colspan=2 height="20"></td>
				</tr>
			</table>
		</form>
	</body>
</html>



