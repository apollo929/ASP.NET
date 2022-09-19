<!--#include file="connessionesql.asp" -->
<html>
<head>
<title></title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor=white class=nero11>
<!--#include file="_menu.inc"-->	
<% 	

function apc(s)
	if isnull(s) then 
		apc=""
	else
		s=replace(s,"'","`")
		apc=s
	end if
end function
'update
Set Tboff = Server.CreateObject("ADODB.RecordSet")
SQL = "select * from Profilo where password1='offerte' and id=" & clng(Request("id"))	
Tboff.Open SQL,connm

if trim(request("mod"))<>"" then
    'response.Write(request.form("sconto"))
    'response.end
    if request.form("sconto")="on" then
     textsconto="sconto.gif"
     else
     textsconto="vuoto.gif"
    end if
    if request.form("promo")="on" then
     textpromo="promo.gif"
     else
     textpromo="vuoto.gif"
    end if
	SQL="update Profilo set descrizione='" & apc(trim(request.form("descrizione"))) & "',prezzo=" & replace(trim(request.form("prezzo")),",",".") & ",sconto='" & textsconto & "',promo='" & textpromo & "' where password1='offerte' and id=" & clng(Request("mod"))
	Connm.execute(SQL)
	response.Redirect "offertespicers.asp"
end if
if trim(request("del"))<>"" then
	SQL="delete from Profilo where id=" & clng(Request("del"))
	Connm.execute(SQL)
	response.Redirect "offertespicers.asp"
end if

'check sconto promo
if Tboff("sconto")="sconto.gif" then
 checksconto="checked"
 else
 checksconto=""
end if
if Tboff("promo")="promo.gif" then
 checkpromo="checked"
else
 checkpromo=""
end if


%>
<%session.lcid=1040%>
<FORM ACTION="offertespicersdet.asp?mod=<%=clng(Request("id"))%>" METHOD="post" ID=Form1>
<TABLE BORDER="1" CELLPADDING="0" CELLSPACING="0" WIDTH="400">
<TR><TD bgcolor=white>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="3" WIDTH="100%">
	<TR>
		<TD width=200><B >N° Prodotto:</B></TD>
		<TD ><% = clng(Request("id"))%></TD>
	</TR>
		<TR>
		<TD ><B >CODICE:</B></TD>
		<TD ><B ><%=ucase(tboff("codice_isp"))%></B></TD>
	</TR>
	<TR>
		<TD ><B >DESCRIZIONE:</B></TD>
		<TD ><INPUT TYPE="TEXT" SIZE=50 NAME="descrizione" VALUE="<%=tboff("descrizione")%>" ID=TEXT1></TD>
	</TR>
	<TR>
		<TD ><B >PREZZO:</B></TD>
		<TD WIDTH=300><INPUT TYPE="TEXT" NAME="prezzo" VALUE="<%=tboff("prezzo")%>" ID=TEXT2></TD>
	</TR>
	<TR>
		<TD ><B >CONPAIA SCRITTA SCONTO</B></TD>
		<TD WIDTH=300><INPUT type="checkbox" ID=Checkbox1 name="sconto" <%=checksconto%> ></TD>
	</TR>
		<TR>
		<TD ><B >COMPAIA SCRITTA PROMO</B></TD>
		<TD WIDTH=300><INPUT type="checkbox" ID=Checkbox2 name="promo" <%=checkpromo%> ></TD>
	</TR>
	</TR>
		<TR>
		<TD ><B >FORNITORE:</B></TD>
		<TD ><B ><INPUT TYPE="TEXT" NAME="fornitore" disabled="disabled" VALUE="<%=tboff("fornitore")%>" ID=TEXT3></B></TD>
	</TR>
		<TR>
		<TD ><B >OPERAZIONI</B></TD>
		<TD ALIGN=LEFT>
		<input type="image" src="images/save.gif" id="image1" name="image1">
		</FORM><a href="offertespicersdet.asp?del=<%=clng(Request("id"))%>" ><img src='images/delete.gif' border=0 ></a></TD></TR>
		<TR><TD  width=250><B >USCITA SENZA MODIFICHE</b><img width=200 height=1 src='images/frecciaw.gif'></TD>
		<TD ><a href=offertespicers.asp? ><img src='images/senzamodifiche.gif' border=0 ></a></TD>
	</TR>
	</TABLE>
</TD></TR>
</TABLE>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->

