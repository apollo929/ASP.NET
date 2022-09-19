<%
Set tbmarche = Server.CreateObject("ADODB.RecordSet")
Set tbmarchemodelli = Server.CreateObject("ADODB.RecordSet")
sql="select * from marcauti where visibile='true' order by marca asc" 
tbmarche.open sql,conn
%><script type="text/javascript">
function cartucce_lista(selezionata){

var select = document.getElementById("modelloid");
var length = select.options.length;
for (i = length-1; i >= 0; i--) {
select.options[i] = null;
}


<%do while not tbmarche.eof
sqlm=""
sqlm="select * from modello where tipologia=" & tbmarche("id") & " order by modello asc"
tbmarchemodelli.open sqlm,conn
%>
<%=trim(replace(tbmarche("marca")," ","_"))%>=new Array();
<%
	i=0
	do while not tbmarchemodelli.eof %>
	<%=trim(replace(tbmarche("marca")," ","_"))%>[<%=i%>]=new Option('<%=ucase(trim(tbmarchemodelli("modello")))%>','<%=tbmarchemodelli("id")%>');
	<%
	i=i+1
	tbmarchemodelli.movenext
	loop%>
if(selezionata=="<%=trim(replace(tbmarche("marca")," ","_"))%>")array_rif=<%=trim(replace(tbmarche("marca")," ","_"))%>;	
<%tbmarchemodelli.close
tbmarche.movenext	
loop
%>
for(i=0;i<array_rif.length;i++)document.form_cartucce.modelloid.options[i]=array_rif[i];
}
</script>

<table border="0" cellpadding="0" cellspacing="0">
<tr><td height="15px" valign="bottom">marca</td>
	<td height="15px">&nbsp;&nbsp;</td>
	<td height="15px" valign="bottom">modello stampante</td>
	<td height="15px">&nbsp;&nbsp;</td>
	<td height="15px">&nbsp;&nbsp;</td>
</tr>
<form action="odcartuccelista.asp#primaindietro" method="post" id="form_cartucce" name="form_cartucce">
<tr>
	<td valign="top">
		<select name="marca" onchange="cartucce_lista(this[this.selectedIndex].value)" ID="marca">
		<option value="----------">----------</option>
		<%
		tbmarche.moveFirst
		do while not tbmarche.eof
		 response.write("<option value=" & trim(replace(tbmarche("marca")," ","_")) & ">" & ucase(tbmarche("marca")) & "</option>")
		tbmarche.movenext
		loop
		tbmarche.close%>
		</select>
	</td>
	<td>&nbsp;&nbsp;</td>
	<td valign="top">
		<select name="modelloid" ID="modelloid">
		<option value="----------">--------------------------</option>
		</select>
	</td>
	<td>&nbsp;&nbsp;</td>
	<td valign="top"><input type="submit" style="height:45px;" value="Search"></td>
</tr>
</form>
</table><br><br>
