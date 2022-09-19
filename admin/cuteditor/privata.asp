<!--#include file ="connessionesql.asp"-->
<%
'controllo session
if session("amm")<>"true" then
	response.Redirect("../riservata.asp")
end if
%>
<html>
<head>
<title>3DPrestige</title>
<meta name="robots" content="index,follow" >
<meta name="Keywords" content="3DPrestige " >
<meta name="Description" content="3DPrestige.it" >
<meta name="Author" content="www.jeniuscommunications.it" >
<script type="text/javascript" src="swfobject.js"></script>
<link rel="stylesheet" href="stylefonevuoto.css" >
</head>
<body bgcolor="#CCCCCC">
<table width="900px" height="100%" align="left">
	<tr>
		<td colspan="2" height="30px"><img src="images/testapiccolo.jpg"></td>
	</tr>
	<tr>
		<!--#include file ="menu.asp"-->
	    
		<td align="center" width="650px"></td>
	</tr>
</table>


</body>
</html>
