<!--#include file="connessionesql.asp" -->
<%Server.Execute(linkuserid & "\parametriasp.asp")
     	
session.lcid=1040       
if Request("del")="yes" then
 Set Tbdel = Server.CreateObject("ADODB.RecordSet")
 sSQL = "Delete FROM Modello_Disp_Add where Codice_isp='" & Trim(Request("codisp")) & "'"
 response.write(sSQL)
 Tbdel.Open sSQL, conn	
 Tbdel.close
end if
     	
Sub Visuamodello
Set Tb = Server.CreateObject("ADODB.RecordSet")
Set Tbmarca = Server.CreateObject("ADODB.RecordSet")
Set Tbm = Server.CreateObject("ADODB.RecordSet")
Response.write ("<br><br><br><a class=nero10 href=modstampante.asp?del=yes&codisp=" & Trim(Request("codisp")) & "><img src='images/cancel.gif' border=0 ><b>ELIMINA CARTUCCIA</b></a><br><br>")
sSQL = "SELECT * FROM Modello_Disp_Add where Codice_isp='" & Trim(Request("codisp")) & "'"
Tb.Open sSQL, conn	
Response.write "<b>(DESCRIZIONE CARTUCCIA)</b><br>" & Tb("Descrizione") & "<br><br>" 
do while not tb.EOF
	sSQm = "select * From Modello where Id=" & Cint(Tb("Idmodello"))
	Tbm.Open sSQm, conn
	sSQLmarca = "SELECT * FROM MarcaUti where Id=" & Tbm("Tipologia")
	Tbmarca.Open sSQLmarca, conn
	Response.Write "<a class=nero11 href=inserimento.asp?id=" & Tbm("Tipologia") & "&Preisp=VUO&Sos=" & Trim(Request("codisp"))  & "&Modelloid=" & Tbm("Id") & "><img src=imgnew/tasto.gif border=0>" & Tbm("Modello")  & "   <b>" & Tbmarca("Marca") & "</b></a> " & "<br>"
	Tbm.close
	Tbmarca.close
	Tb.MoveNext
loop 
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
							
										
<table width=100% align=center border=0 cellpadding=0 cellspacing=0>


<tr>
													<td class=navy10n >
													<STRONG>Cambio Codice</STRONG><br><br>
													<FORM ACTION="modstampante.asp?" id=form1 name=form1>
													Vecchio Codice:<BR><INPUT TYPE="TEXT" NAME="codisp" VALUE="<% = Trim(Request("codisp")) %>"><br>
													Nuovo Codice:<BR><INPUT TYPE="TEXT" NAME="codicenew" VALUE="">
													<INPUT TYPE="SUBMIT" NAME="change" VALUE="Cambia_tutti_i_codici_ATT.NE">
													</FORM> 
													<br><STRONG>													
													<%	 if trim(request("change"))="Cambia_tutti_i_codici_ATT.NE" then
																Set Tbold = Server.CreateObject("ADODB.RecordSet")     
																sqlold = "SELECT * FROM DB_ARTICOLI where Codice_isp='" & Trim(Request("codicenew")) & "'"     
																Tbold.Open sqlold,connm
																if not Tbold.eof then  
																	Set Tbchange = Server.CreateObject("ADODB.RecordSet")
																	sql1 = "update Modello_disp_add Set codice_isp='" & trim(request("codicenew")) & "' where codice_isp='" & trim(request("codisp")) & "'"
																	Tbchange.Open sql1, conn
																	response.write("AGGIORNAMENTO OK !")
																else
																	response.write("Codice nuovo non trovato controlla!!")	
																end if
														end if													
													%><br></STRONG>
													<STRONG>Stampante da Verificare</STRONG><br><br>
													<%visuamodello%>
													</td>
												</tr>
</table>

</body>
</html>
