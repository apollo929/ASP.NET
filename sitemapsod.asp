<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%

Function iso8601date(dLocal,utcOffset)	
	Dim d
	' convert local time into UTC
	d = DateAdd("H",-1 * utcOffset,dLocal)

	' compose the date
	iso8601date = Year(d) & "-" & Right("0" & Month(d),2) & "-" & Right("0" & Day(d),2) & "T" & _
		Right("0" & Hour(d),2) & ":" & Right("0" & Minute(d),2) & ":" & Right("0" & Second(d),2) & "Z"
End Function


MAXURLS_PER_SITEMAP = 50000

baseurl=Session("sitourl") & "oddettagli.asp?cod="

strsql = "SELECT * FROM prodotti where codice_od<>'' order by rand() limit 2500 "
utcOffset=1

response.ContentType = "text/xml"
response.write "<?xml version='1.0' encoding='UTF-8'?>"
response.write "<urlset xmlns='http://www.google.com/schemas/sitemap/0.84'>"
URLS=0
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open strsql, connm
Do while not rs.eof
	if URLS<MAXURLS_PER_SITEMAP then

		'modify this to change database field
		id_page=Server.URLEncode(rs("codice_od"))
		filelmdate="" 'rs("pagina_lastupdate")
		priority=""

		if not isdate(filelmdate) then filelmdate=now()
		filedate=iso8601date(filelmdate,utcOffset)

		if priority="" or priority>1.0 then priority="1.0"

		response.write "<url><loc>"&server.htmlencode(baseurl&id_page)&"</loc><lastmod>"&filedate&"</lastmod><priority>"&priority&"</priority></url>"
		URLS=URLS+1
		Response.Flush
	rs.movenext
end if
Loop

response.write "</urlset>"

rs.Close
Set rs = Nothing



%>
<!--#include file="sqlchiudi.inc" -->
<%response.end%>