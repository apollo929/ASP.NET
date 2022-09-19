<!--#include file=connessionesql.inc-->
<%
if request("errore")="si" then
%>
	<script type="text/javascript">
    alert("Inserimento annulato, controllare la correttezza dei dati inseriti e riprovare!!");
    </script>
<%
	end if
	Set tbcategorie = Server.CreateObject("ADODB.RecordSet")
	SQL = "select * From shop_categories order by categoryID ASC"
	tbcategorie.Open SQL, connm
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
															<b>GESTIONE ECOMMERCE MANUALE</b>
															<HR>
															
															
<FORM ACTION="merchant_adsottocategorie.asp" id=form1 name=form1>
<b class=nero10>Digita Nome della CATEGORIA:</b><BR>
<INPUT TYPE="TEXT" NAME="CRITERIA" VALUE="<% = Request("Criteria") %>" ID=TEXT1>
<INPUT TYPE="SUBMIT" NAME="Search" VALUE="Go" ID=SUBMIT1>
</FORM>
<br><br>
			<%
				Set tbsottocategorie = Server.CreateObject("ADODB.RecordSet")
				SQL = "select * From shop_subcategories order by categoria,codice asc"
				tbsottocategorie.Open SQL, connm
			%>
            
			<table width="40%" border="1">
            <tr>
            	<td><strong>CATEGORIA</strong></td>
          		<td><strong>PROGRESSIVO X SOTTOCATEGORIA</strong></td>
  				<td><b>NOME SOTTOCATEGORIA</b></td>
                <td><b>AZIONI</b></td>
            </tr>
            <%
				do while not tbsottocategorie.eof
			%>
            <tr>
            	<td><%=tbsottocategorie("categoria")%></td>
                <td><%=tbsottocategorie("codice")%> </td>
                <td><%=tbsottocategorie("descrizione")%></td>
              	<td width="45px" align="center"><a href="delsottocategoria.asp?Idcat=<%=tbsottocategorie("id")%>"><img src="images/delete.gif" alt="Elimina" border="0"></a></td>
            </tr>
            <%
				tbsottocategorie.movenext()
				loop
			%>

            </table>
            <br>
           <!-- <div id="inserisci">-->
            <form name="form1" action="addsottocategoria.asp" method="post">
            <table width="30%" border="1">
            <tr><td colspan="4" align="center">Aggiungi campo:</td></tr>
            <tr>
            	<td><strong>CATEGORIA</strong></td>
			 	<td><b>NOME SOTTOCATEGORIA</b></td>
                <td><b>AZIONI</b></td>
            </tr>
            <tr>
            	<td align="center">
                	<select name="categoria">
					<%do while not tbcategorie.eof%>	
                      	<option value="<%=tbcategorie("categoryID")%>"><%=tbcategorie("categoryID")%> - <%=tbcategorie("catdescription")%></option>  
                    <%
						tbcategorie.movenext()
						loop
					%>
                    </select>
              </td>
           	  	
       	  	  <td><input type="text" name="nomecat"></td>
                <td align="center"><input type="submit" value="Inserisci"></td>
            </tr>
            </table>
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