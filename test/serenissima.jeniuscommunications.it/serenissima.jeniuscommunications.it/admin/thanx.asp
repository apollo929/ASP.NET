<%
if session("loginid")="" then response.Redirect("http://www.costruttori.it/annunci/")
intid=request("id")
%>
<HTML><HEAD>
<!--#include file=metatag.inc-->
<link href="style.css" rel="stylesheet" type="text/css" >
</HEAD>
<BODY>
<table width="100%">
	<tr><td colspan="2" align="left"><a href="../index.asp"><img src="../images/logo.png" border="0"></a></td></tr>
	<tr>
		<td>
		<table>
			<tr>
				<td width="300px">
				<!--=====================================COLONNA DI SINISTRA====================================-->
				<table width="100%">
					<tr><td valign="top"><!--#include file="menu_sx.asp"--></td></tr>
				</table>
				<!--=====================================COLONNA DI SINISTRA====================================-->
				</td>
				<td width="900px" align="center">
				<!--=====================================COLONNA CENTRALE====================================-->
				<table>	
					<tr>
						<td class="nero13"><fieldset><legend><img src="http://www.costruttori.it/interventi/img/check.png" border="0"></legend>
						Il messaggio è stato inviato correttamente!<br>
						<a class="nero13" href="adindex.asp"><u>cliccare qui per visionare altri annunci</u></a>
						</fieldset>
						</td>
					</tr>
					<tr><td class="nero13"></td></tr>
				</table>
				<!--=====================================COLONNA CENTRALE====================================-->
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</BODY>
</HTML>