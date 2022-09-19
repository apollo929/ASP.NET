<!--Shop Manuale -->
<!--#include virtual="/connessionesql.inc"-->
<%
Set tbshop = Server.CreateObject("ADODB.RecordSet")
sSQL = "select * From shop_subcategories where categoria=" & cint(request("ID"))
tbshop.Open sSQL, connm
%>
<html>
	<head>
		<title>SottoCategorie</title>
		<link href="/admin/style.css" rel="stylesheet" type="text/css">
		<script language="javascript">
			function inssottocategoria(formname) {
				pos = eval("document." + formname + ".sottocategoria.selectedIndex");
				val = eval("document." + formname + ".sottocategoria.options["+ pos + "].value");
				txt = eval("document." + formname + ".sottocategoria.options["+ pos + "].text");
				opener.document.form.sottocategoria.value=txt;
				opener.document.form.sottocategoriaid.value=val;
				window.close();
			}
		</script>
	</head>
	<body >
		<form name="sottocategoria">
			<table width="100%">
				<tr>
					<td align=middle colspan=2 >Selezionare la SottoCategoria dell'Articolo</b></font></td>
				</tr>
				<tr>
				<td align=middle colspan=2><hr></td>
				</tr>
				<tr>
					<td align=right >SottoCategoria:</font></td>
					<td align=left><SELECT id=sottocategoria name=sottocategoria>
					<%  
						if not tbshop.EOF then
							do While not tbshop.eof
								categoria=trim(tbshop("codice"))
								Response.Write "<option value=" & categoria & ">"
								Response.Write tbshop("descrizione")
								Response.Write "</option>"
								tbshop.movenext
							loop
						else
						response.Write "<option value=0>"
						response.Write "------------------"
						response.Write "</option>"
						end if
						tbshop.close		
					
					%>
					</SELECT></td>
				</tr>
				<tr>
					<td colspan=2 height="20"></td>
				</tr>
				<tr>
					<td colspan=2 align=middle>
					<input type="image" border="0" src="images/save.png" onclick=inssottocategoria('sottocategoria');>Accetta
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>



