<!--#include file="connessionesql.asp" -->
<%Server.Execute(linkuserid & "\parametriasp.asp")

session.lcid=1040

if trim(request("del"))="yes" then			
	sql1 = "delete  From Modello where id=" & cint(trim(request("iddel"))) 
	sql2 = "delete  From Modello_disp_add where idmodello=" & cint(trim(request("iddel"))) 
	'sql3 = "delete  From Modello_disp_add where Modello='" & trim(replace(request("modello"),"%20"," ")) & "' and codiceisp='Stampante'"
	conn.Execute sql1
	conn.Execute sql2
	'conn.Execute sql3	        
end if
     	
Sub Insmodello
Set Tb = Server.CreateObject("ADODB.RecordSet")
sSQL = "select * From Modello where Tipologia=" & Cint(Request("Id")) & " order by Modello asc "
	
Tb.Open sSQL, conn
If not Tb.EOF then
	
	Do While not Tb.eof
		'Controlla
		marca=trim(Tb("Id"))
		Response.Write "<a class=nero11 href=inserimento.asp?id=" & request("Id") & "&Preisp=" & request("Preisp") & "&Modelloid=" & Tb("Id") & "><img src=imgnew/tasto.gif border=0> " & Ucase(Tb("Modello"))  & " </a><a href=stampanti.asp?id=" & request("Id") & "&Preisp=" & request("Preisp") & "&del=yes&iddel=" & Tb("id") & "&modello=" & Replace(Tb("Modello")," ","%20") & "><img src=images/cancel.gif border=0></a>"
						
		Set Tbadd = Server.CreateObject("ADODB.RecordSet")
	    sSQLad = "select * From Modello_Disp_Add where Idmodello=" & Tb("ID")
		Tbadd.Open sSQLad, conn
		If not Tbadd.EOF then%>
			<img src="images/ok.gif"><br>
		<% else
			response.write("<br>")
		end if
		Tbadd.close
		
		Tb.movenext
	loop
else
	
	Response.Write "------------------"
	
end if
Tb.close		
End sub
	
	

     
    %>

<html>
	<head>
		<title>SITO WEB E-COMMERCE BACK OFFICE</title>
		
		<link href="style.css" rel="stylesheet" type="text/css">
		<script language="javascript">
			function sottocategorie(formname) {
				pos = eval("document." + formname + ".categorie.selectedIndex");
				val = eval("document." + formname + ".categorie.options["+ pos + "].value");
				asp = "selsottocategoria.asp?id="+val;
				w=window.open(asp,"SottoCategoria","width=350,height=150,menubar=no,scrollbar=auto,resizable=no");
			}
			function articoli(formname) {
				pos   = eval("document." + formname + ".categorie.selectedIndex");
				val   = eval("document." + formname + ".categorie.options["+ pos + "].value");
				valsc = eval("document." + formname + ".sottocategoriaid.value");
				asp = "selarticolo.asp?id="+val+"&sid="+valsc;
				w=window.open(asp,"Articoli","width=600,height=550,menubar=no,scrollbar=auto,resizable=no");
			}
			function visuaimg(formname) {
			   	idsc = eval("document." + formname + ".codarticolo.value");
				asp = "visuarticolo.asp?id=" + idsc;
				w=window.open(asp,"Visualizzazione","width=200,height=250,menubar=no,scrollbar=auto,resizable=no");
			}
			function immagine(formname) {
				asp = "selimmagine.asp";
				w=window.open(asp,"Immagine","width=600,height=600,menubar=no,scrollbar=auto,resizable=no");
			}
			


			function checkart(formobj)
			   
			    {
			    nome = formobj.categorie.value;
				if (nome =="" )
				{
					alert(" categorie ");
					formobj.categorie.focus();
					return false
				}else
				{
				cognome = formobj.sottocategoria.value;
				if (cognome == "")
				{	alert("sottocategoria");
					return false
				}else
				{
				cap = formobj.desarticolo.value;
				if (cap == "")
				{	alert("Descrizione Obbligatoria");
					formobj.desarticolo.focus();
					return false
				}else
				{
					Prezzo = formobj.prezzo.value;
				if (isNaN(Prezzo)== true)
				{	alert("Inserisci il Prezzo");
					formobj.prezzo.focus();
					return false
				}else	
					return true
					}}
				}
			
			}



		</script>
		</head>

<body bgcolor=white >
<!--#include file="_menu.inc"-->
<hr>	
<a class=rosso href=adaggstampanti.asp?id=<%=request("id")%>><img border=0 src='imgnew/tasto.gif'><b>&nbsp;AGGIUNGI STAMPANTE</b></a><br>
										
										
<table width=100% align=center border=0 cellpadding=0 cellspacing=0>


<tr>
													<td width=100% class=navy10n >
													<%Insmodello%>
													</td>
												</tr>
</table>

</body>
</html>
