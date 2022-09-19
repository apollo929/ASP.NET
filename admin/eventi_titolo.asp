<!--#include file=connessionesql.inc-->
<%
if request("errore")="si" then
%>
	<script type="text/javascript">
    alert("Inserimento annulato, controllare la correttezza dei dati inseriti e riprovare!!");
    </script>
<%
	end if
%>
<!DOCTYPE html>
<html lang="en">
    <head>
		<!--INIZIO SCRIPT APRI/CHIUDI POPUP!-->
		<script language="javascript">
		function display_block(valore) {
			document.getElementById(valore).style.display = "block";
		}
		function hide_block(valore) {
			document.getElementById(valore).style.display = "none";
		}
		</script>
		<TITLE>JENIUS COMMUNICATIONS - MARCO GENOVESE</TITLE>
		<meta name="keywords" content="JENIUS">
		<meta name="description" content="JENIUS">
		<link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
									
															
															<HR>
															<b>GESTIONE EVENTI HATSERIES</b>
															<HR>
															
															<!---FORM ACTION="eventi_titolo.asp" id=form1 name=form1>
															<b class=nero10>Digita Nome della TITOLO:</b><BR>
															<INPUT TYPE="TEXT" NAME="CRITERIA" VALUE="<% = Request("Criteria") %>">
															<INPUT TYPE="SUBMIT" NAME="Search" VALUE="Go">
															</FORM>
															<br><br--->
															<%
																Set tbcategorie = Server.CreateObject("ADODB.RecordSet")
																SQL = "select * From eventi_titolo order by categoryID asc"
																tbcategorie.Open SQL, connm
															%>
															
															<table width="40%" border="1">
															<tr>
																<td>
																	<b>N°EVENTO</b>
																</td>
																<td>
																	<b>TITOLO</b>
																</td>
																<td>
																	<b>TIPO_OPERAZIONE</b>
																</td>
																<td>
																	<b>DATAINIZIO EVENTO</b>
																</td>
																<td>
																	<b>DATA FINE EVENTO</b>
																</td>
																<td>
																	<b></b>
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
																<td>
																	<%=tbcategorie("eventoviaggiocorso")%>
																</td>
																<td>
																	<%=right("0" & day(tbcategorie("datainizioevento")),2) & "/"  & right("0" & month(tbcategorie("datainizioevento")),2)  &  "/" & year(tbcategorie("datainizioevento"))%>
																</td>																
																<td>
																	<%=right("0" & day(tbcategorie("datafineevento")),2) & "/"  & right("0" & month(tbcategorie("datafineevento")),2)  &  "/" & year(tbcategorie("datafineevento"))%>
																</td>																
															  <td width="45px" align="center">
																	<a href="delevento.asp?IdCat=<%=tbcategorie("categoryID")%>"><img src="images/delete.gif" alt="Elimina" border="0"></a>
															  </td>
															</tr>
															<%  if not tbcategorie.eof then 
															     valult=tbcategorie("categoryID")
																 else
																 valult=0
																 end if
																tbcategorie.movenext()
																loop
															%>
													
															</table>
															<br>
														   <!-- <div id="inserisci">-->
															<form name="form1" action="addtitolo.asp" method="post">
															<table width="30%" border="0">
															<tr height="5px;"><td colspan="2"></td></tr>
															<tr>
																<td colspan="3" align="left">
																AGGIUNGERE CAMPO E DARE UN NUMERO  NEL CAMPO "ID EVENTO"
																</td>
															</tr>
															<tr height="5px;"><td colspan="2"></td></tr>
															<tr>
																<td><b>ID EVENTO</b></td>
																<td><b>TITOLO</b></td>
																<td><b></b></td>
																<td><b>INIZIO ISCRIZ.</b></td>
																<td><b>FINE ISCRIZ.</b></td>
															</tr>
															<tr>
																<td><input type="text" value="<%=valult+1%>" style="height:25px;" name="IdCat"></td>
																<td><input type="text" style="height:25px;width:400px;" name="Categoria"></td>
																 <td><select name="eventoviaggiocorso" style="height:25px;" id="eventoviaggiocorso">
																	  <option SELECTED value="EVENTO">EVENTO</option>
																	  <option value="VIAGGIO">VIAGGIO</option>
																	  <option value="CORSO">CORSO</option>																	
																	</select></td>
																	<td><input type="date" style="height:25px;" value="<%=date()%>" name ="dataInizio"></td>
																	<td><input type="date" style="height:25px;" value="<%=date()%>" name ="dataFine"> </td>
																<td align="center"><input style="background-color:#ff0000;color:white;width:200px;height:25px;border:0px;" type="submit" value="INSERISCI EVENTO"></td>
															</tr>
															</table>
															</form>
															<HR>
															

                          <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
									
															
															<HR>
															<b>GESTIONE EVENTI & SOTTO EVENTI</b>
															<HR>

																<%
																	Set tbsottocategorie = Server.CreateObject("ADODB.RecordSet")
																	SQL = "select eventi_sottotitolo.id,eventi_sottotitolo.*,eventi_titolo.catdescription From eventi_sottotitolo INNER JOIN  eventi_titolo ON eventi_sottotitolo.categoria = eventi_titolo.categoryID order by categoria asc,extra asc,codice asc;"
																	tbsottocategorie.Open SQL, connm
																%>
																
																<table width="70%" border="1">
																<tr>
																	<td width="5%"><strong>N_EVENTO</strong></td>
																	<td width="5%"><strong>GEST.SOTTOEVENTI</strong></td>
																	<td width="70%"><b>NOME EVENTO</b></td>
																	<td width="5%"><b>PREZZO</b></td>
																	<td width="5%"><b>NPARTECIPANTI MAX</b></td>
																	<td width="5%"><b>DISP./NON DISP.</b></td>
																	<td width="5%"><b>EXTRA</b></td>
																	<td width="5%"><b></b></td>
																</tr>
																<%
																	do while not tbsottocategorie.eof
																%>
																<tr>
																	<td align="center" ><%=tbsottocategorie("catdescription")%></td>
																	<td align="center" ><%=tbsottocategorie("codice")%> </td>
																	<td align="left" ><%=tbsottocategorie("descrizione")%></td>
																	<td align="center" >Euro.<%=tbsottocategorie("prezzo")%></td>
																	<td align="center" ><%=tbsottocategorie("npartecipanti")%></td>
																	<td align="center" ><img src="images/<%=tbsottocategorie("disponibile")%>.png" ></td>
																	<td align="center" ><%=tbsottocategorie("extra")%></td>																	
																	<td width="45px" align="center"><a href="adeventi.asp?Idcat=<%=tbsottocategorie("id")%>"><img src="images/modifica.png" alt="modifica" border="0"></a></td>
																	<td width="45px" align="center"><a href="delsottotitolo.asp?Idcat=<%=tbsottocategorie("id")%>"><img src="images/delete.gif" alt="Elimina" border="0"></a></td>
																</tr>
																<%
																	tbsottocategorie.movenext()
																	loop
																%>

																</table>
																<br>
															   <!-- <div id="inserisci">-->
																<form name="form1" action="addsottotitolo.asp" method="post">
																<table width="30%" border="1">
																<tr><td colspan="4" align="center">Aggiungi campo:</td></tr>
																<tr>
															<td width="5%"><strong>N_EVENTO</strong></td>
																	<td width="5%"><strong>GEST.SOTTOEVENTI</strong></td>
																	<td width="5%"><b>PREZZO</b></td>
																	<td width="5%"><b>NPARTECIPANTI MAX</b></td>
																	<td width="5%"><b>DISP./NON DISP.</b></td>
																	<td width="5%"><b>EXTRA</b></td>
																	<td width="5%"><b>AZIONE</b></td>
																</tr>
																<tr>
																	<td align="center">
																		<select name="categoria">
																		<%
																		tbcategorie.movefirst
																		do while not tbcategorie.eof%>	
																			<option value="<%=tbcategorie("categoryID")%>"><%=tbcategorie("categoryID")%> - <%=tbcategorie("catdescription")%></option>  
																		<%
																			tbcategorie.movenext()
																			loop
																		%>
																		</select>
																  </td>
																	
																	<td><input type="text" style="height:25px;width:400px;" name="nomecat"></td>
																	<td><input id="number" style="height:25px;width:80px;" type="number" name="prezzo" value="0.00"></td>
																	<td><input id="number" style="height:25px;width:80px;" type="number" name="npartecipanti" value="1" step="1" min="1" max="5000"></td>
																	<td><select name="disponibile" style="height:25px;" id="disponibile">
																	<option SELECTED value="SI">SI</option>
																	<option value="NO">NO</option>															
																	</select></td>
																	<td><select name="extra" style="height:25px;" id="extra">
																	<option value="SI">SI</option>
																	<option SELECTED value="NO">NO</option>																		
																	</select></td>
																	
																  <td align="center"><input type="submit" style="background-color:#ff0000;color:white;width:200px;height:25px;border:0px;" value="INSERISCI SOTTO EVENTO"></td>
																</tr>
																</table>
																</form>
															
															
																						
                                    </div>							
                                </div>
								  </div>
                         <%
						 tbcategorie.close
						 tbsottocategorie.close
						 %>
                            <!-- .panel-body -->
                        					
                        <!-- /.panel -->
              											
															
																						
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