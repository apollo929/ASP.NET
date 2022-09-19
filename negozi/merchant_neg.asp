<!--ILMAGGIORDOMO(c)(r)2001 Marco Genovese-->
<!--#include file="../db.asp" -->
<!--#include file="../ad/include/admentor2.asp"-->
<!--#include file="../stat/incstats.asp"-->
<!--#include file="_colors.inc"-->
<%  
	'Statistiche
	StatLog
	
	articolo=trim(request("ID"))
	tipo=trim(request("TY"))
	'Apertura Database Notizie
	strDSN = "FILEDSN=C:\inetpub\wwwroot\eNews\News.dsn"
	Set cn = Server.CreateObject("ADODB.Connection")
	Set tb = Server.CreateObject("ADODB.Recordset")
	Set tbAll = Server.CreateObject("ADODB.Recordset")
	cn.Open strDSN
	select case lcase(tipo)
		case "n1"

		case "n2"
			
	end select
%>
<html>
	<head>
		<title>www.primatist.com</title>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<!--#include file="_marketing.inc" -->
		<META NAME="Copyright" content="Marco Genovese">
		<link rel="stylesheet" href="_styles.inc">
	</head>
	<body bgcolor="<%=color1%>" link="<%=color1%>" vlink="<%=color1%>">
		<!--#include file="_menutop.inc" -->
			<tr valign="top">
				<td width="141" bgcolor="<%=color3%>">
					<!--#include file="_menusx.inc" -->
				</td>
				<td  bgcolor="<%=color1%>" colspan=2>
					<table width="100%" cellpadding="0" cellspacing="0">
						<TBODY>
						<tr>
							<td width="440">
								<table valign="top" width="100%"  cellpadding="0" cellspacing="0">
									<tr>
										<td valign="top" height="48" bgcolor="<%=color2%>">
										<!---Mezzo--->
										<!---Mezzo--->
										<!---Mezzo--->
										
										
										1
										<!---Mezzo--->
										<!---Mezzo--->
										<!---Mezzo--->
										</td>
									</tr>
								</table>
							</td>	
							<td width="284">	
								<table width="100%" border="0" cellspacing="0" cellpadding="0" id=TABLE1>
									<!--#include file="_menusearch.inc" -->
								</table>
							</td>
						</tr>
					</TD>
				</TR>
				</TBODY>
		</table>
		<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD>
				<!--I: Parte Centrale-->					
				
				<table name="documento" width="100%">
					<tr>
						<td>
							<%if tipo="n1" Then%>
								<div align="center"><center>
								<br>
								<font size="2">
								<b><%=tx_titolo%></b><br><br>
								<%=tx_sottotitolo%>
								</center>
								<p align="justify"><br>
								<img border="0" height="8" src="Images\spacer.gif" width="50">
								<%=tx_testo%>
								<br><br><em>
								<%=tx_data%>&nbsp;<%=tx_ora%>
								</p></em></font>
							<%else%>
								<font size="2" color="<%=color3%>" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u><%=tx_argomento%></u></font><br><br>
          						<div align="center"><center>
          						<br>
								<font size="2" color="<%=color4%>"><b><%=tx_titolo%></b><br><br>
								<%=tx_sottotitolo%></font>
								</center></div><font size="2">
								<p align="justify"><br>
								<%=tx_testo%>
								<br><br><em>
								<%=tx_data%>&nbsp;<%=tx_autore%>
								</p></em>
								</font>
							<%end if%>
						</td>
					</tr>
				</table>
				
 				<!--F: Parte Centrale-->					
				</TD>
			</TR>
		</TABLE>
	</TBODY>
</TABLE>
<br>
<!--#include file="_menubot.inc" -->
</body>
</html>

