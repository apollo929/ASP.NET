<!--#include file="connessionesql.asp" -->
<html>
<head>
<title></title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor=white class=nero11>
<!--#include file="_menu.inc"-->	
<% 	
ON ERROR RESUME NEXT
function apc(s)
	if isnull(s) then 
		apc=""
	else
		s=replace(s,"'","\'")
		apc=s
	end if
end function
'update
Set Tbespri = Server.CreateObject("ADODB.RecordSet")
SQL = "select * from ListinoEsprinet where id="	& cint(Request("id"))
Tbespri.Open SQL,connm	
if trim(request("addnew"))<>"" then
    'StrSql="Insert into Registrazioneint (Nome,Cognome,Indirizzo,citta,provincia,telefono,Utente1,Email,Pa) values ('" & text_nome & "','" & text_cognome & "','" & text_indirizzo & "','" & text_citta & "','" & text_provincia & "','" & text_telefono & "','" & text_utente & "','" & text_email & "','" & text_password & "','" & text_password & "','" & text_azienda & "','" & text_indirizzo & "','" & text_partitaiva & "','" & text_codicefiscale & "','" & text_cap & "','" & Session("Prezzo") & "','" & Session("Priceisp") & "','" & Session("PrezzoBuffetti") & "','" & Session("Prezzocwr") & "',1,current_date," & check_newsletter & ")"
    SQL="Insert into ListinoEsprinet (nomelistino,limite1,limite2,ricaricoutente,ricaricogenerico) values ('nome-listino'," & cdbl(request.form("limite1")) & "," & cdbl(request.form("limite2")) & "," & cdbl(request.form("ricaricoutente")) & "," & cdbl(request.form("ricaricogenerico")) & ")"
    Connm.execute(SQL)
    Tbespri.Close 
    SQL = "select * from ListinoEsprinet order by id desc"	
    Tbespri.Open SQL,connm
end if
if trim(request("mod"))<>"" then
	SQL="update ListinoEsprinet set nomelistino='" & cstr(request.form("nomelistino")) & "',limite1=" & cdbl(request.form("limite1")) & ",limite2=" & cdbl(request.form("limite2")) & ",ricaricoutente=" & cdbl(request.form("ricaricoutente")) & ",ricaricogenerico=" & cdbl(request.form("ricaricogenerico")) & " where id=" & cint(Request("mod"))
	Connm.execute(SQL) 
	response.Redirect "adlistini.asp"
end if
if trim(request("del"))<>"" then
	SQL="delete from ListinoEsprinet where id=" & cint(Request("del"))
	Connm.execute(SQL)
	response.Redirect "adlistini.asp"
end if
%>
<%session.lcid=1040%>
<FORM ACTION="adlistinidet.asp?mod=<%=cint(Tbespri("id"))%>" METHOD="post" ID=Form1>
	<TABLE BORDER="1" CELLPADDING="0" CELLSPACING="0" WIDTH="400">
	<TR><TD bgcolor=white>
		<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="3" WIDTH="100%">
			<TR>
			<TD width=200><B >-</B></TD>
			<TD ><% '= cint(Request("id"))%></TD>
			</TR>
			<TR>
			<TD ><B >NOME LISTINO:</B></TD>
			<TD ><B ><INPUT SIZE=35 TYPE="TEXT"  NAME="nomelistino" VALUE="<%=Tbespri("nomelistino")%>" ID=TEXT5></B></TD>
			</TR>
			<TR>
			<TD ><B >LIMITE1:</B></TD>
			<TD ><INPUT SIZE=15 TYPE="TEXT"  NAME="limite1" VALUE="<%=Tbespri("limite1")%>" ID=TEXT1>   VALORE NUMERICO</TD>
			</TR>
			<TR>
			<TD ><B >LIMITE2:</B></TD>
			<TD ><INPUT SIZE=15 TYPE="TEXT"  NAME="limite2" VALUE="<%=Tbespri("limite2")%>" ID=TEXT4>   VALORE NUMERICO</TD>
			</TR>
			</TR>
			<TR>
			<TD ><B >RICARICO UTENTE:</B></TD>
			<TD ><B ><INPUT SIZE=5 TYPE="TEXT" NAME="ricaricoutente" VALUE="<%=Tbespri("ricaricoutente")%>" ID=TEXT3>%</B>   VALORE NUMERICO</TD>
			</TR>
			<TR>
			<TD ><B >RICARICO GENERICO:</B></TD>
			<TD ><B ><INPUT SIZE=5 TYPE="TEXT" NAME="ricaricogenerico" VALUE="<%=Tbespri("ricaricogenerico")%>" ID=TEXT2>%</B>   VALORE NUMERICO</TD>
			</TR>
			<TR>
			<TD ><B >OPERAZIONI</B></TD>
			<TD ALIGN=LEFT>
			<a href="adlistinidet.asp?addnew=nuovo" ><img src='images/addnew.jpg' border=0 ></a><input type="image" src="images/save.gif" id="image1" name="image1">
			</FORM><a href="adlistinidet.asp?del=<%=cint(Tbespri("id"))%>" ><img src='images/delete.gif' border=0 ></a></TD></TR>
			<TR><TD  width=250><B >USCITA SENZA MODIFICHE</b><img width=200 height=1 src='images/frecciaw.gif'></TD>
			<TD ><a href=adlistini.asp? ><img src='images/senzamodifiche.gif' border=0 ></a></TD>
			</TR>
		</TABLE>
	</TD></TR>
	</TABLE>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->
