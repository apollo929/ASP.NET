<!--#include file="connessionesql.asp" -->

<%  
     session.lcid=1040
    
     
if request("reg")="yes" then
     StrSql1="Insert into Modello (Id,Tipologia,Modello) values (" & Cint(Request("id")) & "," & Cint(Request("Tipologia"))  & ",'" & Request.form("Modello") & "')"
     conn.Execute StrSql1
     Response.redirect "stampanti.asp?id=" & Cint(Request("Tipologia"))
end if
     	

	 Set Tb = Server.CreateObject("ADODB.RecordSet")
	 Set Tbmarca = Server.CreateObject("ADODB.RecordSet")
	 
	 sSQL = "select * From Modello order by Id desc"
	 Tb.Open sSQL,conn
	 
	 Idnum=Cint(Tb("Id")+1)
	 Tipologia1=Cint(Request("Id"))
	 
	 sSQLm = "select * From Marcauti where id=" & Tipologia1 & " order by Id desc"
	 Tbmarca.Open sSQLm,conn
	 Marcam=Tbmarca("Marca")	 

     
    %>
     
   
<html>
	<head>
		<title>SITO WEB E-COMMERCE BACK OFFICE</title>
	
		<link href="style.css" rel="stylesheet" type="text/css">
		</head>

<body bgcolor=white >
					
		<!--#include file="_menu.inc"-->								
	<table width=50% align=center border=0 cellpadding=0 cellspacing=0>
	<tr>
	<td class=navy10n >
				
	<form  action='adaggstampanti.asp?reg=yes&id=<%=idnum%>&tipologia=<%=tipologia1%>' method=post id=form1 name=form1>					
														
		<TABLE BORDER="1" CELLSPACING="1" CELLPADDING="1">
<TR><TH BGCOLOR="#B0B0FF">&nbsp;</TH>
<TH BGCOLOR="#B0B0FF"><FONT FACE="Verdana">

		
		Id</FONT></TH><TH BGCOLOR="#B0B0FF"><FONT FACE="Verdana">

		
		Marca</FONT></TH><TH BGCOLOR="#B0B0FF"><FONT FACE="Verdana">

		
		Nome Stampante</FONT></TH></TR>




<TR><TH BGCOLOR="white"><input type=image src=images/save.gif border=0></TH>
<TH BGCOLOR="white"><FONT FACE="Verdana">

		
		<%=Idnum%></FONT></TH><TH BGCOLOR="white"><FONT FACE="Verdana">

		
		<%=Marcam%></FONT></TH><TH BGCOLOR="white"><FONT FACE="Verdana">

		
		<input CLASS=NERO10  id="modello" maxLength="130" name="modello" size=45 value="<%=text_modello%>"></FONT></TH></TR>

<TABLE>											
</form>
													
													
													
													
													
													
													
													
													
													
													
													
													
													
	</td>
	</tr>
	</table>

</body>
</html>
