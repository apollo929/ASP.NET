<!--#include file="configall.asp"-->
<%
	
	'Open the database
	'OpenDB sConnStats

	'Get ID's by Names
	'lIdOS		= GetIdOS(sOS)
	'lIdColor	= GetIdColor(sColor)
	'lIdBrowser	= GetIdBrowser(sBrowser)
	'lIdPath		= GetIdPath(sPath)
	'lIdRef		= GetIdRef(sReferer)
	'lIdRes		= GetIdRes(sResolution)
	
	'sSQL = "SELECT * FROM Stats"
	'rs.Open sSQL,,,adCmdTable

	'Save the data
	'rs.AddNew
	'rs("OsID") = lIdOS
	'rs("ColorID") = lIdColor
	'rs("BrowserID") = lIdBrowser
	'rs("PathID") = lIdPath
	'rs("RefID") = lIdRef
	'rs("ResID") = lIdRes
	'rs("Date") = date
	'rs("Time") = time
	'rs("Pageviews")=lcase(Request.ServerVariables("HTTP_REFERER"))
	'response.write(lcase(Request.ServerVariables("HTTP_REFERER")))
	'rs("IP") = sIP
	'rs.Update
	
	'Terminate database connection
	'CloseDB

	'Show the image
	'response.redirect sImageLocation

%>
