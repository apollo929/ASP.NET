<%
on error resume next 
Function iso8601date(dLocal,utcOffset)	
	Dim d
	' convert local time into UTC
	d = DateAdd("H",-1 * utcOffset,dLocal)

	' compose the date
	iso8601date = Year(d) & "-" & Right("0" & Month(d),2) & "-" & Right("0" & Day(d),2) & "T" & _
		Right("0" & Hour(d),2) & ":" & Right("0" & Minute(d),2) & ":" & Right("0" & Second(d),2) & "Z"
End Function


MAXURLS_PER_SITEMAP = 50000

baseurl="https://shop.spazioufficiosrl.com"

strsql = "SELECT * FROM sitemap"
utcOffset=1

response.ContentType = "text/xml"
response.write "<?xml version='1.0' encoding='UTF-8'?>"
response.write "<urlset xmlns='http://www.google.com/schemas/sitemap/0.84'>"
URLS=0


'modify this to change database field
id_page=1
filelmdate="" 'rs("pagina_lastupdate")
priority=""

if not isdate(filelmdate) then filelmdate=now()
filedate=iso8601date(filelmdate,utcOffset)

if priority="" or priority>1.0 then priority="1.0"

response.write "<url><loc>"&server.htmlencode(baseurl)&"</loc><lastmod>"&filedate&"</lastmod><priority>"&priority&"</priority></url>"
URLS=URLS+1
Response.Flush


response.write "</urlset>"

response.end%>