<!--#include file="connessionesql.asp" -->
<!doctype html>
<html>
<head>
<title>INSERISCI ARTICOLI INTERNI</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js.js"></script>
<SCRIPT language=JavaScript>


function linkTo(optVal){
if(optVal=="") return false;
window.location='http://www.pokersrl.com/admin/interni-nuovo.asp?cat='+optVal;
}
</SCRIPT>
</head>
<body bgcolor="white" class="nero10" onLoad="javascript:Richiesta('<%=categoria%>','<%=sottocategoria%>')">

<!-- #include file=_menu.inc --->
	
	<table width="100%">
		<form action="interni-nuovo-ins.asp" method="post" id="form1" name="form1">
		<input type="hidden" name="spicers" value="<%=spicers%>">
		
		<%
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		Set tb_cat = Server.CreateObject("ADODB.RecordSet")
		sql_cat="Select distinct(categoria) from prodotti"
		tb_cat.Open sql_cat,Connm
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		%>
		<tr>
			<td>Categoria: </td>
			<td>
				<!--<select name="categoria" id="categoria" onChange="Richiesta(document.getElementById('categoria').value);">-->
				<select name="categoria" id="categoria" onChange="linkTo(this.options[this.selectedIndex].value);">
					<option value="-------">-----seleziona-----</option>
					<%do while not tb_cat.eof
						if instr(1,tb_cat("categoria"),request("cat"))>0 then
					%>
							<option value="<%=tb_cat("categoria")%>" selected="selected"><%=tb_cat("categoria")%></option>
						<%else%>
							<option value="<%=tb_cat("categoria")%>"><%=tb_cat("categoria")%></option>
					<%
						end if
					tb_cat.movenext
					loop
					tb_cat.close%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Sottocategoria:</td>
			<td>
				<select name="sottocategoria">
					<option value="-------">-----seleziona-----</option>
					<%if request("cat")<>"" then				
						Set tb_sot = connm.Execute("SELECT distinct(sottocategoria) FROM prodotti WHERE CATEGORIA LIKE '%" & request("cat") & "%'")
						If not tb_sot.EOF  Then
							While tb_sot.EOF = False
								if instr(1,tb_sot("sottocategoria"),sottocategoria)>0 then
									tt=tt&"<option value=" & tb_sot("sottocategoria") & " selected=selected>" & tb_sot("sottocategoria") & "</option>"
								else
									tt=tt&"<option value=" & tb_sot("sottocategoria") & ">" & tb_sot("sottocategoria") & "</option>"
								end if
								tb_sot.MoveNext
							Wend		
						End If
						tb_sot.close
						response.Write(tt)
					end if%>
				</select>
			</td>
		</tr>	
		<tr>
			<td>Codice interno:</td>
			<td><input type="text" name="cod_poker" value=""></td>
		</tr>	
		<tr>
			<td>Marchio:</td>
			<td><input type="text" name="marchio" value=""></td>
		</tr>	
		<tr>
			<td>Descrizione:</td>
			<td><textarea name="descrizione"></textarea></td>
		</tr>
		<tr>
			<td>Prezzo:</td>
			<td><input type="text" name="p1" value=""></td>
		</tr>
		<tr>
			<td>Linea:</td>
			<td><input type="text" name="aa_linea" value=""></td>
		</tr>
		<tr>
			<td>Giacenza:</td>
			<td><input type="text" name="giacenza" value="10"></td>
		</tr>
				
		<tr><td><input type="submit" value="INSERISCI"></td></tr>
	</form>
	</table>	

</td>
</tr>
</table>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->