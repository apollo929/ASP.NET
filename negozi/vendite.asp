<!--#include file="../db.asp" -->
<!--#include file="../ad/include/admentor2.asp"-->
<!--#include file="../stat/incstats.asp"-->
<!--#include file="_colors.inc"-->
<%  
	
	'ILMAGGIORDOMO(c)(r)2001 Alberto Piganti

	'Statistiche
	StatLog
	
%>

<html>
	<head>
		<title>primatist.com</title>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<!--#include file="_marketing.inc" -->
		<META NAME="Copyright" content="Alberto Piganti">
		<link rel="stylesheet" href="_styles.inc">
	</head>
	<body bgcolor="<%=color1%>" link="<%=color1%>" vlink="<%=color1%>">
		<!--#include file="_menutop.inc" -->
			<tr valign="top">
			    <td width="141" bgcolor="<%=color3%>">
				<%if Visuamanifestazioni<>True then %>
					<!--#include file="_menusxme.inc" -->
				<%end if %>	
				</td>
				<!--I: Parte Centrale-->					
				<td width="440" bgcolor="<%=color1%>">
					<font size="1">
					<table valign="top" width="100%"  cellpadding="0" cellspacing="0">
						<tr>
							<td valign="top" height="48" bgcolor="<%=color6%>">
							<img src="img_merchant/merchant.gif">
							</td>
						</tr>
						<tr>
							<td>
							<table name="documento" width="100%">
								<tr>
									<td>
										<!---- Parte Centrale ------->
										<br><br>
										<center>
										<img src="../img/icon-error.gif">
										<br>
										<font size=2>
										Questa sezione sarà Disponibile<br>entro breve...
										</font>
										<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
										</center>
										<!---- Parte Centrale ------->
									</td>
								</tr>
							</table>
						
							</td>
						</tr>
					</table>
					</font>
				<!--F: Parte Centrale-->					
				</td>
				<td height="172" bgcolor="<%=color6%>" width="284">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id=TABLE1>
					<!--#include file="_menusearch.inc" -->
					<tr>
						<td colspan="2">
						</td>
					</tr>
				</table>
				<!--I: Parte Destra-->
				
				<!--F: Parte Destra-->
			</TD>
			</TR>
			<tr valign="top">
				<td rowspan="2" bgcolor="<%=color3%>" width="51">
				</td>
<tr valign="top">
	<td >
    </td>
    </tr>
	<tr valign="top">
		<td colspan="2" bgcolor="<%=color3%>">
		</td>
		<td bgColor="<%=color3%>" width="200"></td>
	</tr>
	<tr vAlign="top">
		<td colSpan="3">&nbsp;</td>
	</tr>
</TABLE>
<!--#include file="_menubot.inc" -->
</body>
</html>
