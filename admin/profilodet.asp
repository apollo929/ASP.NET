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
Set Tbprofilo = Server.CreateObject("ADODB.RecordSet")
SQL = "select * from Profilo where id=" & cdbl(Request("id"))	
Tbprofilo.Open SQL,connm	
response.Write("---")
'response.End
if trim(request("mod"))<>"" then
	SQL="update Profilo set descrizione='" & apc(trim(request.form("descrizione"))) & "' where  id=" & cdbl(Request("mod"))
	Connm.execute((SQL))
	SQL="update Profilo set prezzo=" & replace(trim(request.form("prezzo")),",",".") & " where  id=" & cdbl(Request("mod"))
	Connm.execute((SQL))
	response.Redirect "profilo.asp?password1=" & trim(Request("password1"))
end if
if trim(request("del"))<>"" then
	SQL="delete from Profilo where id=" & cdbl(Request("del"))
	Connm.execute((SQL))
	response.Redirect "profilo.asp?password1=" & trim(Request("password1"))
end if

%>
<FORM ACTION="profilodet.asp?mod=<%=cdbl(Request("id"))%>&password1=<%=trim(Request("password1"))%>" METHOD="post" ID=Form1>
<TABLE BORDER="1" CELLPADDING="0" CELLSPACING="0" WIDTH="400">
<TR><TD bgcolor=white>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="3" WIDTH="100%">
	<TR>
		<TD width=200><B >N° Prodotto:</B></TD>
		<TD ><% = cdbl(Request("id"))%></TD>
	</TR>
		<TR>
		<TD ><B >CODICE:</B></TD>
		<TD ><B ><%=ucase(Tbprofilo("codice_isp"))%></B></TD>
	</TR>
	<TR>
		<TD ><B >DESCRIZIONE:</B></TD>
		<TD ><INPUT TYPE="TEXT" SIZE=50 NAME="descrizione" VALUE="<%=Tbprofilo("descrizione")%>" ID=TEXT1></TD>
	</TR>
	<TR>
		<TD ><B >PREZZO:</B></TD>
		<TD WIDTH=300><INPUT TYPE="TEXT" NAME="prezzo" VALUE="<%=Tbprofilo("prezzo")%>" ID=TEXT2></TD>
	</TR>
	<!---TR>
		<TD ><B >CONPAIA SCRITTA SCONTO</B></TD>
		<TD WIDTH=300><INPUT type="checkbox" ID=Checkbox1 name="sconto"></TD>
	</TR>
		<TR>
		<TD ><B >COMPAIA SCRITTA PROMO</B></TD>
		<TD WIDTH=300><INPUT type="checkbox" ID=Checkbox2 name="promo"></TD>
	</TR>
	</TR>
		<TR>
		<TD ><B >FORNITORE:</B></TD>
		<TD ><B ><INPUT TYPE="TEXT" NAME="fornitore" VALUE="<%'=Tbprofilo("prezzo")%>" ID=TEXT3></B></TD>
	</TR--->
		<TR>
		<TD ><B >OPERAZIONI</B></TD>
		<TD ALIGN=LEFT>
		<input type="image" src="images/save.gif" id="image1" name="image1">
		</FORM><a href="profilodet.asp?del=<%=cdbl(Request("id"))%>&password1=<%=trim(Request("password1"))%>" ><img src='images/delete.gif' border=0 ></a></TD></TR>
		<TR><TD  width=250><B >USCITA SENZA MODIFICHE</b><img width=200 height=1 src='images/frecciaw.gif'></TD>
		<TD ><a href=profilo.asp?password1=<%=trim(Request("password1"))%> ><img src='images/senzamodifiche.gif' border=0 ></a></TD>
	</TR>
	</TABLE>
</TD></TR>
</TABLE>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->

