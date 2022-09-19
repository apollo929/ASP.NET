<!--#include file="connessionesql.asp" -->
<html>
<head>
<title></title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor=white class=nero11>
<!--#include file="_menu.inc"-->	
<% 	
txt_password1=Request("password1")   
txt_ragione=Request("ragsoc")  

function apc(s)
	if isnull(s) then 
		apc=""
	else
		s=replace(s,"'","`")
		apc=s
	end if
end function
'update
Set TbListino = Server.CreateObject("ADODB.RecordSet")
SQL = "select * from listino where id=" & cint(Request("id"))	
TbListino.Open SQL,connm	
response.Write("---")
'response.End
if trim(request("mod"))<>"" then
	SQL="update Listino set descrizione='" & apc(trim(request.form("descrizione"))) & "' where  id=" & cint(Request("mod"))
	Connm.execute((SQL))
	SQL="update Listino set prezzo=" & replace(trim(request.form("prezzo")),",",".") & " where  id=" & cint(Request("mod"))
	Connm.execute((SQL))
	response.Redirect "adlistinopar.asp?password1=" & trim(Request("password1"))
end if
if trim(request("del"))<>"" then
	SQL="delete from Listino where id=" & cint(Request("del"))
	Connm.execute((SQL))
	response.Redirect "adlistinopar.asp?password1=" & trim(Request("password1"))
end if

%>
<FORM ACTION="adlistinodet.asp?mod=<%=cint(Request("id"))%>&password1=<%=trim(Request("password1"))%>" METHOD="post" ID=Form1>
<TABLE BORDER="1" CELLPADDING="0" CELLSPACING="0" WIDTH="400">
<TR><TD bgcolor=white>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="3" WIDTH="100%">
	<TR>
		<TD width=200><B >N° Prodotto:</B></TD>
		<TD ><% = cint(Request("id"))%></TD>
	</TR>
		<TR>
		<TD ><B >CODICE:</B></TD>
		<TD ><B ><%=ucase(TbListino("codice_isp"))%></B></TD>
	</TR>
	<TR>
		<TD ><B >DESCRIZIONE:</B></TD>
		<TD ><INPUT TYPE="TEXT" SIZE=50 NAME="descrizione" VALUE="<%=TbListino("descrizione")%>" ID=TEXT1></TD>
	</TR>
	<TR>
		<TD ><B >PREZZO:</B></TD>
		<TD WIDTH=300><INPUT TYPE="TEXT" NAME="prezzo" VALUE="<%=TbListino("prezzo")%>" ID=TEXT2></TD>
	</TR>
		<TR>
		<TD ><B >OPERAZIONI</B></TD>
		<TD ALIGN=LEFT>
		<input type="image" src="images/save.gif" id="image1" name="image1">
		</FORM><a href="adlistinodet.asp?del=<%=cint(Request("id"))%>&password1=<%=trim(Request("password1"))%>" ><img src='images/delete.gif' border=0 ></a></TD></TR>
		<TR><TD  width=250><B >USCITA SENZA MODIFICHE</b><img width=200 height=1 src='images/frecciaw.gif'></TD>
		<TD ><a href=adlistinopar.asp?password1=<%=trim(Request("password1"))%> ><img src='images/senzamodifiche.gif' border=0 ></a></TD>
	</TR>
	</TABLE>
</TD></TR>
</TABLE>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->

