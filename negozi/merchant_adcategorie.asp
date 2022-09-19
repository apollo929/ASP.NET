<!--#include virtual="/connessionesql.inc"-->

<%
if request("errore")="si" then
%>
	<script type="text/javascript">
    alert("Inserimento annulato, controllare la correttezza dei dati inseriti e riprovare!!");
    </script>
<%
	end if
%>
<html>
<head>
<title>Gestione Negozio</title>
<!--INIZIO SCRIPT APRI/CHIUDI POPUP!-->
<script language="javascript">
		function display_block(valore) {
			document.getElementById(valore).style.display = "block";
		}
		function hide_block(valore) {
			document.getElementById(valore).style.display = "none";
		}
</script>
<!--FINE SCRIPT APRI/CHIUDI POPUP!-->
<link href="/admin/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
#inserisci
{ 
	visibility:visible;
}
-->
</style>
</head>
<body  bgcolor=white onLoad="hide_block('inserisci');">
<br>
<table valign="top" width="100%"  cellpadding="0" cellspacing="0" border=0>
<tr>
<td class=orange14 align=center valign="middle" height="48" bgcolor="white">
	<img align=left border=0 src='/admin/imgnew/testapiccolo.jpg'>
</td>
</tr>
</table>
<table width="800" border="0" cellspacing="0" cellpadding="0" align="left" id=TABLE2>
<tr valign="top">
<td width="200" height=900 bgcolor="white">
		     <!--#include file="_menusxme.inc" -->
</td>	
<td width="540" bgcolor="white">
<!--I: Parte Centrale-->
			<FORM ACTION="merchant_adcategorie.asp" id=form1 name=form1>
			<b class=nero10>Digita Nome della CATEGORIA:</b><BR>
			<INPUT TYPE="TEXT" NAME="CRITERIA" VALUE="<% = Request("Criteria") %>">
			<INPUT TYPE="SUBMIT" NAME="Search" VALUE="Go">
			</FORM>
			
            <%
				Set tbcategorie = Server.CreateObject("ADODB.RecordSet")
				SQL = "select * From shop_categories order by Id desc"
				tbcategorie.Open SQL, connm
			%>
            
			<table width="90%" border="1">
            <tr>
            	<td>
                	<b>N°CAT</b>
                </td>
                <td>
                	<b>CATEGORIA</b>
                </td>
                <td>
                	<b>AZIONI</b>
                </td>
            </tr>
            <%
				do while not tbcategorie.eof
			%>
            <tr>
            	<td>
                	<%=tbcategorie("categoryID")%>
                </td>
                <td>
                	<%=tbcategorie("catdescription")%>
                </td>
              <td width="45px" align="center">
                    <a href="delcategoria.asp?IdCat=<%=tbcategorie("categoryID")%>"><img src="images/delete.gif" alt="Elimina" border="0"></a>
              </td>
            </tr>
            <%
				tbcategorie.movenext()
				loop
			%>
            <tr>
            	<td colspan="2"></td>
                <td align="center">
                	<a href="addcategoria.asp">
                    	<input type="image" src="images/addnew.gif" border="0" onClick="display_block('inserisci');" alt="Aggiungi Categoria">
                    </a>
                </td>
            </tr>
            </table>
            <br>
           <!-- <div id="inserisci">-->
            <form name="form1" action="addcategoria.asp" method="post">
            <table width="90%" border="1">
            <tr>
            	<td colspan="3" align="center">
                Aggiungi campo:
                </td>
            </tr>
            <tr>
            	<td><b>ID CATEGORIA</b></td>
                <td><b>CATEGORIA</b></td>
            </tr>
            <tr>
            	<td><input type="text" name="IdCat"></td>
                <td><input type="text" name="Categoria"></td>
                <td align="center"><input type="submit" value="Inserisci"></td>
            </tr>
            </table>
            </form>
            <!--</div>-->
</td>
</tr>
</table>
</body>
</html>
