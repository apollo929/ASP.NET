<!--#include file="connessionesql.asp" -->
<%

'inizializzo variabili
categoria=""
sottocategoria=""
cod_poker=""
descrizione=""
aa_linea=""
giacenza=""
p1=""
p2=""
p3=""
p4=""
p5=""
foto=""

codice=request("codice")
if session("codice")="" then
	session("codice")=codice
else
	if session("codice")<>request("codice") then
		codice=request("codice")
		session("codice")=codice
	else
		codice=session("codice")
	end if
end if

Set tbcatalogo = Server.CreateObject("ADODB.RecordSet")	
sql_spi="Select * from prodotti where codice_prodotto='" & codice & "' or codice_buf='" & codice & "' or codice_od='" & codice & "' limit 1"
'response.Write(sql_spi)
tbcatalogo.Open sql_spi,connm

categoria=tbcatalogo("categoria")
sottocategoria=tbcatalogo("sottocategoria")
cod_poker=tbcatalogo("codice_prodotto")
descrizione=tbcatalogo("descrizione")
aa_linea=tbcatalogo("aa_linea")
giacenza=tbcatalogo("giacenza")
p1=tbcatalogo("p1")
p2=tbcatalogo("p2")
p3=tbcatalogo("p3")
p4=tbcatalogo("p4")
p5=tbcatalogo("p5")
foto=tbcatalogo("foto")



%>
<!doctype html>
<html>
<head>
<title>MODIFICA ARTICOLI</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js.js"></script>
</head>
<body bgcolor="white" class="nero10" onLoad="javascript:Richiesta('<%=categoria%>','<%=sottocategoria%>')">

<!-- #include file=_menu.inc --->

	<table width="100%">
		<tr>
			<td>Codice: </td>
			<td colspan="2"><%=cod_poker%></td>
		</tr>
		<tr><td colspan="2" style="border-bottom:1px solid #000000;"></td></tr>
	</table>
	
	<br>
	
	<table width="100%">
		<form action="interni-modifica-update.asp" method="post" id="form1" name="form1">
		<input type="hidden" name="cod_poker" value="<%=cod_poker%>">
		<%
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		Set tb_cat = Server.CreateObject("ADODB.RecordSet")	
		sql_cat="Select distinct(categoria) from prodotti where fornitore like '%od%' order by categoria"
		tb_cat.Open sql_cat,Connm
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		%>
		<tr>
			<td>Categoria:</td>
			<td>
				<select name="categoria">
					
					<%
					if categoria="" then
						response.Write("<option selected='selected' value=''>-------- seleziona --------</option>")
					end if
					do while not tb_cat.eof
						if instr(1,tb_cat("categoria"),categoria)>0 and categoria<>"" then
							response.Write("<option selected='selected' value='" & tb_cat("categoria") & "'>" & tb_cat("categoria") & "</option>")
						else
							response.Write("<option value='" & tb_cat("categoria") & "'>" & tb_cat("categoria") & "</option>")
						end if
					tb_cat.movenext
					loop
					%>
				</select>
			</td>
		</tr>
		
		<%
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		Set tb_cat = Server.CreateObject("ADODB.RecordSet")	
		sql_cat="Select distinct(sottocategoria) from prodotti where fornitore like '%od%' order by sottocategoria"
		tb_cat.Open sql_cat,Connm
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		' :::::::::::::::::: CATEGORIE ::::::::::::::::::
		%>
		<tr>
			<td>Sottocategoria:</td>
			<td>
				<select name="sottocategoria">
					<%
					if sottocategoria="" then
						response.Write("<option selected='selected' value=''>-------- seleziona --------</option>")
					end if
					do while not tb_cat.eof
						if instr(1,tb_cat("sottocategoria"),sottocategoria)>0 and sottocategoria<>"" then
							response.Write("<option selected='selected' value='" & tb_cat("sottocategoria") & "'>" & tb_cat("sottocategoria") & "</option>")
						else
							response.Write("<option value='" & tb_cat("sottocategoria") & "'>" & tb_cat("sottocategoria") & "</option>")
						end if
					tb_cat.movenext
					loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Descrizione:</td>
			<td><textarea name="descrizione"><%=descrizione%></textarea></td>
		</tr>
		<tr>
			<td>Prezzo 1:</td>
			<td><input type="text" name="p1" value="<%=p1%>"></td>
		</tr>
		<tr>
			<td>Prezzo 2:</td>
			<td><input type="text" name="p2" value="<%=p2%>"></td>
		</tr>
		<tr>
			<td>Prezzo 3:</td>
			<td><input type="text" name="p3" value="<%=p3%>"></td>
		</tr>
		<tr>
			<td>Prezzo 4:</td>
			<td><input type="text" name="p4" value="<%=p4%>"></td>
		</tr>
		<tr>
			<td>Prezzo 5:</td>
			<td><input type="text" name="p5" value="<%=p5%>"></td>
		</tr>
		<tr>
			<td>Linea:</td>
			<td><input type="text" name="aa_linea" value="<%=aa_linea%>"></td>
		</tr>
		<tr>
			<td>Giacenza:</td>
			<td><input type="text" name="giacenza" value="<%=giacenza%>"></td>
		</tr>
				
		<tr><td><input type="submit" value="MODIFICA"></td></tr>
	</form>
	</table>
	
	<br><table width="100%"><tr><td colspan="2" style="border-bottom:1px solid #000000;"></td></tr></table><br>
	
	<table width="100%">
		<form name="newad" method="post" enctype="multipart/form-data" action="https://www.schede.eu/cataloghi/upload-interni.php">
			<input type="hidden" name="codice" value="<%=replace(codice,".","_")%>" />
			<tr><td colspan="2" align="left">Modifica foto</td></tr>
			<tr>
				<td>Foto attuale: </td>
				<td>
				
											<% 
											'response.Write(tbcatalogo("fornitore"))
											if lcase(tbcatalogo("fornitore"))="od" then%>
												<img src='../foto.asp?cat=catalogoisp\piccole&img=<%=tbcatalogo("codice_od")%>.jpg' border="0">												
											<%end if
											if lcase(tbcatalogo("fornitore"))="gruppo buffetti s.p.a." or lcase(tbcatalogo("fornitore"))="magazine" then%>
												<img src='../foto.asp?cat=catalogobuffetti2016_small&img=<%=tbcatalogo("codice_buf")%>.jpg' border="0">											
											<%end if
											tbcatalogo.close%>	
				
				</td>
			</tr>
			<tr>
				<td>Nuova foto: </td>
				<td><input type="file" name="image"></td>
			</tr>
			<tr><td><input name="Submit" type="submit" value="CARICA"></td></tr>
		</form>
	</table>

</td>
</tr>
</table>
</BODY>
</HTML>
<!-- #include file=sqlchiudi.inc --->