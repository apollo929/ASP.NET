<!--#include file=connessionesql.inc-->

<%

dim content

Set tbevento = Server.CreateObject("ADODB.RecordSet")
Set tbsottoevento = Server.CreateObject("ADODB.RecordSet")
SQL = "select eventi_sottotitolo.id,eventi_sottotitolo.*,eventi_titolo.catdescription,eventi_titolo.datainizioevento,eventi_titolo.datafineevento From eventi_sottotitolo INNER JOIN  eventi_titolo ON eventi_sottotitolo.categoria = eventi_titolo.categoryid where eventi_sottotitolo.id=" & request("Idcat") & " order by categoria asc,extra asc,codice asc;"
'response.write(SQL)
tbevento.Open SQL, connm

SQL = "select * from eventi where id_sottotitolo=" & request("Idcat")
tbsottoevento.Open SQL, connm
if tbsottoevento.eof then
	txt_dataFine   = year(tbevento("datafineevento")) & "/"  & month(tbevento("datafineevento")) &  "/" & day(tbevento("datafineevento"))
	txt_dataInizio = year(tbevento("datainizioevento")) & "/"  & month(tbevento("datainizioevento")) &  "/" & day(tbevento("datainizioevento"))
	'response.write("insert into eventi (id_sottotitolo,titolo,sottotitolo,prezzo_vendita,dataval1,dataval2) value (" & request("Idcat") & ",'" & tbevento("catdescription") & "','" & tbevento("descrizione") & "'," & tbevento("prezzo") & ",'" & tbevento("datainizioevento") & "','" & tbevento("datafineevento") & "')")
	'response.end
	connm.execute("insert into eventi (id_sottotitolo,categoria,titolo,sottotitolo,prezzo_vendita,dataval1,dataval2) value (" & request("Idcat") & ",'" & tbevento("categoria") & "','" & tbevento("catdescription") & "','" & tbevento("descrizione") & "'," & tbevento("prezzo") & ",'" & txt_dataInizio & "','" & txt_dataFine & "')")
	content ="inserire una descrizione"
else
	txt_dataFine   = year(tbsottoevento("dataval2")) & "/"  & month(tbsottoevento("dataval2")) &  "/" & day(tbsottoevento("dataval2"))
	txt_dataInizio = year(tbsottoevento("dataval1")) & "/"  & month(tbsottoevento("dataval1")) &  "/" & day(tbsottoevento("dataval1"))
	t_immagine1=tbsottoevento("cimageurl1")
	t_immagine2=tbsottoevento("cimageurl2")
	t_immagine3=tbsottoevento("cimageurl3")
	t_immagine4=tbsottoevento("cimageurl4")
	t_immaginepdf=tbsottoevento("filepdf")						
	content =tbsottoevento("descrizionet")		
end if



%>
<!--#include file="CuteEditor_Files/include_CuteEditor.asp" -->
<!DOCTYPE html>
<html lang="en">
    <head>
		<script language="javascript">
		function selpdfjava(formname) {
		asp = "selpdf.asp?";
		w=window.open(asp,"Immagine","width=900,height=700,menubar=no,scrollbar=auto,resizable=yes");
		}
		function sottocategorie(formname) {
		pos = eval("document." + formname + ".categorie.selectedIndex");
		val = eval("document." + formname + ".categorie.options["+ pos + "].value");
		asp = "selsottocategoria.asp?id="+val;
		w=window.open(asp,"SottoCategoria","width=550,height=250,menubar=no,scrollbar=auto,resizable=no");
		}
		function articoli(formname) {
		pos   = eval("document." + formname + ".categorie.selectedIndex");
		val   = eval("document." + formname + ".categorie.options["+ pos + "].value");
		valsc = eval("document." + formname + ".sottocategoriaid.value");
		asp = "selarticolo.asp?id="+val;
		w=window.open(asp,"Articoli","width=700,height=650,menubar=no,scrollbar=auto,resizable=no");
		}
		function visuaimg(formname,i) {
		idsc = eval("document." + formname + ".codarticolo.value");
		asp = "visuarticolo.asp?id=" + idsc;
		w=window.open(asp,"Visualizzazione","width=400,height=350,menubar=no,scrollbar=auto,resizable=no");
		}
		function immagine(formname,i) {
		asp = "selimmagine.asp?id=" + i;
		w=window.open(asp,"Immagine","width=900,height=700,menubar=no,scrollbar=auto,resizable=yes");
		}
		function checkart(formobj)

		{
		categoriatxt = formobj.categorie.value;
		if (categoriatxt =="" )
		{
		alert(" categorie ");
		formobj.categorie.focus();
		return false
		}else
		{
		sottocat = formobj.sottocategoria.value;
		if (sottocat == "")
		{	alert("sottocategoria");
		return false
		}else
		{
		codiceprodotto= formobj.rifarticolo.value;
		if (codiceprodotto == "")
		{	alert("codice prodotto obbligatorio ");
		formobj.rifarticolo.focus();
		return false
		}else
					{
		descri_artic = formobj.desarticolo.value;
		if (descri_artic == "")
		{	alert("descrizione obbligatoria");
		formobj.desarticolo.focus();
		return false
		}else
		return true
		}}
		}

		}
		</script>
		<TITLE>JENIUS COMMUNICATIONS - MARCO GENOVESE</TITLE>
		<meta name="keywords" content="JENIUS">
		<meta name="description" content="JENIUS">
		<link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Backoffice JENIUS</title>
        <<!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="wrapper">

            <!-- Navigation -->
				<!--#include file=topmenu.inc-->
				<!--#include file=navbarback.inc-->
				<!--#include file=top_menu_sotto.inc-->
                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
									
														
														
														
			<form name="form" method="post" action="eventoins.asp?Idcat=<%=tbevento("id")%>">
            <table align="center">
				<tr><td colspan="2"><hr></td></tr>
                <tr>
                    <td><label> numero identificativo </label></td>
                    <td><span name = "ni"> <%=tbevento("id")%></span></td>
                </tr>
				<tr><td colspan="2"><hr></td></tr>
                <tr>
                    <td colspan="2" style="text-align:left;"> data prenotazione evento <br><br></td>
                </tr>
                <tr>
                    <td> data inizio: <input type="date" name ="dataInizio" value="<%=(year(txt_dataInizio) & "-"  & right("0" & month(txt_dataInizio),2) &  "-" & right("0" & day(txt_dataInizio),2))%>"> </td>
                    <td> data fine: <input type="date" name = "dataFine"    value="<%=(year(txt_dataFine ) & "-"  & right("0" & month(txt_dataFine ),2) &  "-" & right("0" & day(txt_dataFine ),2))%>" > </td>
                </tr>
				<tr><td colspan="2"><hr></td></tr>
                <tr>
                    <td>titolo</td>
                    <td> <input type="text" readonly style="height:25px;width:400px;" name = "titolo" VALUE="<%=tbevento("catdescription")%>" placeholder = "<%=tbevento("catdescription")%>"> </td>
                </tr>
				<tr height="5px;"><td colspan="2"></td></tr>
                <tr>
                    <td> sottotitolo </td>
                    <td> <input type="text" style="height:25px;width:400px;" name = "sottotitolo" VALUE="<%=tbevento("descrizione")%>" placeholder = "<%=tbevento("descrizione")%>"> </td>
                </tr>
				<tr><td colspan="2"><hr></td></tr>
                <tr>
                    <td> descrizione evento </td>
                    <td> 		<%
			

			Dim editor
			Set editor = New CuteEditor
					
			editor.ID = "Editor1"
			editor.NAME = "Editor1"
			editor.Text = content
			editor.FilesPath = "CuteEditor_Files"
			editor.AutoConfigure = "Minimal"
			
			editor.Width = 600
			'editor.Height = 240
			editor.Draw()
		%></td>
                </tr>
                <tr><td colspan="2"><hr></td></tr>
				
				<tr>
				<td> prezzo </td>
				<td><input id="number" style="height:25px;width:80px;" type="number" name="prezzo" value="<%=tbevento("prezzo")%>"></td>
				</tr>
				<tr>
				<td> n partecipanti </td>
				<td><input id="number" style="height:25px;width:80px;" type="number" name="npartecipanti" value="<%=tbevento("npartecipanti")%>" step="1" min="1" max="5000"></td>
				</tr>
				<tr>
				<td> disponibilita' </td>
				<td><select name="disponibile" style="height:25px;" id="disponibile">
				<option selected value="<%=tbevento("disponibile")%>"><%=tbevento("disponibile")%></option>
				<option value="SI">SI</option>
				<option value="NO">NO</option>															
				</select></td>
				</tr>	
				<tr>		
				<td> extra </td>		 
				<td><select name="extra" style="height:25px;" id="extra">
				<option selected value="<%=tbevento("extra")%>"><%=tbevento("extra")%></option>
				<option value="SI">SI</option>
				<option value="NO">NO</option>																		
				</select></td>
				</tr>
				
				<tr><td colspan="2"><hr></td></tr>
				<tr>
					<td height=10></td>
					<td   ></td>
				</tr>
		
				<tr><td   ></td><td   >
							<table border=0    cellpadding=0 cellspacing=0>
							<tr>
								<td   ><br>					
									<a href=javascript:immagine('form','2')><img src='img/seleziona.gif' border=0 alt="Seleziona Immagine"></a>
									</td><td>
									<INPUT   type="text" name="immagine1" value="<%=t_immagine1%>" ><br>
								</td>
								<td valign="center">
								<%if trim(t_immagine1)<>"" then %><img width=50px  src='articoli/<%=t_immagine1%>'><%end if%>
								</td>
							</tr>
							</table>
				</td></tr>	
				<tr><td   ></td><td   >
							<table border=0  bordercolor=Navy cellpadding=0 cellspacing=0>
							<tr>
								<td   ><br>					
									<a href=javascript:immagine('form','3')><img src='img/seleziona.gif' border=0 alt="Seleziona Immagine"></a>
									</td><td>
									<INPUT   type="text" name="immagine2" value="<%=t_immagine2%>" ><br>
								</td>
								<td valign="center">
								<%if trim(t_immagine2)<>"" then %><img width=50px  src='articoli/<%=t_immagine2%>'><%end if%>
								</td>
							</tr>
							</table>
				</td></tr>		
				<tr><td   ></td><td   >
							<table border=0  cellpadding=0 cellspacing=0>
							<tr>
								<td   ><br> 				
									<a href=javascript:immagine('form','4')><img src='img/seleziona.gif' border=0 alt="Seleziona Immagine"></a>
									</td><td>
									<INPUT   type="text" name="immagine3" value="<%=t_immagine3%>" ><br>
								</td>
								<td valign="center">
								<%if trim(t_immagine3)<>"" then %><img width=50px  src='articoli/<%=t_immagine3%>'><%end if%>
								</td>
							</tr>
							</table>
				</td></tr>		
				<tr><td   ></td><td   >
							<table border=0  cellpadding=0 cellspacing=0>
							<tr>
								<td   ><br>																											
									<a href=javascript:immagine('form','5')><img src='img/seleziona.gif' border=0 alt="Seleziona Immagine"></a>
									</td><td>
									<INPUT   type="text" name="immagine4" value="<%=t_immagine4%>" ><br>
								</td>
								<td valign="center">
								<%if trim(t_immagine4)<>"" then %><img width=50px  src='articoli/<%=t_immagine4%>'><%end if%>
								</td>
							</tr>
							</table>
				</td></tr>		
				<tr><td   ></td><td   >
							<table border=0  cellpadding=0 cellspacing=0>
							<tr>
								<td   ><br>																											
									<a href=javascript:selpdfjava('form');><img src='img/selezionapdf.gif' border=0 alt="Seleziona PDF"></a>
									</td><td>
									<INPUT   type="text" name="immaginepdf" value="<%=t_immaginepdf%>" ><br>
								</td>
								<td valign="center">
								<a target="_blank" href="articoli/<%=t_immaginepdf%>"><img width=30px  src='images/pdf.jpg'></a>
								</td>
							</tr>
							</table>
				</td></tr>													
											<tr>
					<td height=30></td>
					<td   ></td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
                <!---
                    ni
                    nio
                    password
                    dataInizio
                    dataFine
                    titolo
                    sottotitolo
                    autore
                    file1
                    file2
                    file3
                    file4
                --->
				<%'CHIUSURA DATABASE
				tbevento.close
				tbsottoevento.close
				%>
            </table>
			
			<table align="center"><tr>
			<td><input type="image" border="0" name="imgsave" src="images/save.png"></td><td>Salva </td><td width=20px></td>
			<td><a href="delsottotitolo.asp?Idcat=<%=request("Idcat")%>"><img border="0" name="imgsave" src="images/elimina.png">elimina</a>
			</td></tr></table>
																				
								
            
        </form>									
														
														
														
														
                                    </div>							
                                </div>
                            </div>
                            <!-- .panel-body -->
                        					
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                
                <!-- /.row -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="js/startmin.js"></script>
    </body>
</html>
<!--#include file=closesql.inc-->