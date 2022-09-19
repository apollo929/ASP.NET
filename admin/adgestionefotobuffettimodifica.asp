<!--#include file=connessionesql.inc-->
<%if request("update")="si" then  
	
	    txt_p1=request("p1")
  		if isnumeric(txt_p1)=false or txt_p1=0 then
			txt_p1=0
			else
     		txt_p1=replace(cdbl(txt_p1),",",".")
		end if
		txt_p2=request("p2")
  		if isnumeric(txt_p2)=false or txt_p2=0 then
			txt_p2=0
			else
     		txt_p2=replace(cdbl(txt_p2),",",".")
		end if
		txt_p3=request("p3")
  		if isnumeric(txt_p3)=false or txt_p3=0 then
			txt_p3=0
			else
     		txt_p3=replace(cdbl(txt_p3),",",".")
		end if
		txt_p4=request("p4")
  		if isnumeric(txt_p4)=false or txt_p4=0 then
			txt_p4=0
			else
     		txt_p4=replace(cdbl(txt_p4),",",".")
		end if
		txt_p5=request("p5")
  		if isnumeric(txt_p5)=false or txt_p5=0 then
			txt_p5=0
			else
     		txt_p5=replace(cdbl(txt_p5),",",".")
		end if

		txt_qt1=1	
		txt_qt2=cdbl(request("qt2"))
		txt_qt3=cdbl(request("qt3"))
		txt_qt4=cdbl(request("qt4"))
		txt_qt5=cdbl(request("qt5"))	
		
		
		if txt_qt2=0 then txt_qt2=1
		if txt_qt3=0 then txt_qt3=1
		if txt_qt4=0 then txt_qt4=1
		if txt_qt5=0 then txt_qt5=1	
		
		if (txt_qt2=1 and txt_p1>0) then 
			sqlupd="update prodotti set p1=" & txt_p1 & " where codice_buf='" & request("codice") & "'"
			connm.execute(sqlupd)
		end if		
	
		if (txt_qt2>1 and txt_p2>0) then 
			sqlupd="update prodotti set p2=" & txt_p2 & ",qta2=" & txt_qt2 & " where codice_buf='" & request("codice") & "'"
			connm.execute(sqlupd)
		 end if
		 if (txt_qt2=1 and txt_p2=0) then 
			sqlupd="update prodotti set p2=p1,qta2=" & txt_qt2 & " where codice_buf='" & request("codice") & "'"
			connm.execute(sqlupd)	
		 end if	
		 
		if (txt_qt3>1 and txt_p3>0) then 
			sqlupd="update prodotti set p3=" & txt_p3 & ",qta3=" & txt_qt3 & " where codice_buf='" & request("codice") & "'"
			connm.execute(sqlupd)
		 end if
		 if (txt_qt3=1 and txt_p3=0) then 
			sqlupd="update prodotti set p3=p1,qta3=" & txt_qt3 & " where codice_buf='" & request("codice") & "'"
			connm.execute(sqlupd)	
		 end if	
		 
		if (txt_qt4>1 and txt_p4>0) then 
			sqlupd="update prodotti set p4=" & txt_p4 & ",qta4=" & txt_qt4 & " where codice_buf='" & request("codice") & "'"
			connm.execute(sqlupd)
		 end if
		 if (txt_qt4=1 and txt_p4=0) then 
			sqlupd="update prodotti set p4=p1,qta4=" & txt_qt4 & " where codice_buf='" & request("codice") & "'"
			connm.execute(sqlupd)	
		 end if	
		 
		if (txt_qt5>1 and txt_p5>0) then 
			sqlupd="update prodotti set p5=" & txt_p5 & ",qta5=" & txt_qt5 & " where codice_buf='" & request("codice") & "'"
			connm.execute(sqlupd)
		 end if
		 if (txt_qt5=1 and txt_p5=0) then 
			sqlupd="update prodotti set p5=p1,qta5=" & txt_qt5 & " where codice_buf='" & request("codice") & "'"
			connm.execute(sqlupd)	
		 end if			 
	
end if%>
<!DOCTYPE html>
<html lang="en">
    <head>
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
        <!-- Bootstrap Core CSS -->
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
															<b>GESTIONE BUFFETTI</b>
															<HR>
														<%
															codice=request("codice")

															Set tbbuffetti = Server.CreateObject("ADODB.RecordSet")	
															sql_spi="Select * from prodotti where codice_buf='" & codice & "' limit 1"
															tbbuffetti.Open sql_spi,connm
															codice_buf=""
															categoria=tbbuffetti("categoria")
															sottocategoria=tbbuffetti("sottocategoria")
															cod_od=tbbuffetti("codice_prodotto")
															buffetti=tbbuffetti("codice_buf")
															descrizione=tbbuffetti("descrizione")
															aa_linea=tbbuffetti("aa_linea")
															giacenza=tbbuffetti("giacenza")
															codice_buf=tbbuffetti("codice_buf")
															txt_p1=formatnumber(tbbuffetti("p1"),2)
															txt_p2=formatnumber(tbbuffetti("p2"),2)
															txt_p3=formatnumber(tbbuffetti("p3"),2)
															txt_p4=formatnumber(tbbuffetti("p4"),2)
															txt_p5=formatnumber(tbbuffetti("p5"),2)
															txt_qt1=formatnumber(tbbuffetti("qta1"),0)
															txt_qt2=formatnumber(tbbuffetti("qta2"),0)
															txt_qt3=formatnumber(tbbuffetti("qta3"),0)
															txt_qt4=formatnumber(tbbuffetti("qta4"),0)
															txt_qt5=formatnumber(tbbuffetti("qta5"),0)
															if txt_qt2=1 then txt_p2=0
															if txt_qt3=1 then txt_p3=0
															if txt_qt4=1 then txt_p4=0
															if txt_qt5=1 then txt_p5=0
															tbbuffetti.close

															%>
															<form name="newad" method="post" action="adgestionefotobuffettimodifica.asp?update=si&codice=<%=codice_buf%>">
																<table width="40%">

																	<tr>
																		<td>Codice: </td>
																		<td colspan="2"><b><font size="+2"><%=buffetti%></b></font></td>
																	</tr>
																	<tr><td colspan="2" style="border-bottom:1px solid #000000;"></td></tr>
																</table>
																
																<br>
																
																<table width="40%">
																	<input type="hidden" name="codice_buffetti" value="<%=buffetti%>">
																	<tr>
																		<td>Categoria: </td>
																		<td><%=categoria%></td>
																		<td></td>
																		<td></td>
																	</tr>
																	<tr><td colspan="6"><hr></td></tr>
																	<tr>
																		<td>Sottocategoria:</td>
																		<td><%=sottocategoria%></td>
																	</tr>
																	<tr><td colspan="6"><hr></td></tr>
																	<tr>
																		<td>Descrizione:</td>
																		<td><textarea disabled name="descrizione"><%=descrizione%></textarea></td>
																	</tr>
																	<tr><td colspan="6"><hr></td></tr>
																	<tr>
																		<td>(1) prezzo:</td>
																		<td><input type="text" name="p1" value="<%=txt_p1%>"></td>
																		<td>(1)quantita'</td>
																		<td><input type="number" min="1" step="1" name="qt1" value="<%=txt_qt1%>"></td>
																	</tr>
																	<tr>
																		<td>(2) prezzo:</td>
																		<td><input type="text" name="p2" value="<%=txt_p2%>"></td>
																		<td>(2)quantita'</td>
																		<td><input type="number" min="1" step="1" name="qt2" value="<%=txt_qt2%>"></td>
																	</tr>
																	<tr>
																		<td>(3) prezzo:</td>
																		<td><input type="text" name="p3" value="<%=txt_p3%>"></td>
																		<td>(3)quantita'</td>
																		<td><input type="number" min="1" step="1" name="qt3" value="<%=txt_qt3%>"></td>
																	</tr>
																	<tr>
																		<td>(4) prezzo:</td>
																		<td><input type="text" name="p4" value="<%=txt_p4%>"></td>
																		<td>(4)quantita'</td>
																		<td><input type="number" min="1" step="1" name="qt4" value="<%=txt_qt4%>"></td>
																	</tr>
																	<tr>
																		<td>(5) prezzo:</td>
																		<td><input type="text" name="p5" value="<%=txt_p5%>"></td>
																		<td>(5)quantita'</td>
																		<td><input type="number" min="1" step="1" name="qt5" value="<%=txt_qt5%>"></td>
																	</tr>	
																	<tr><td colspan="6"><hr><br>
																	<input type="submit" style="background:navy;color:white;height:35px;" name="sub" value=" AGGIORNO PREZZI E QUANTITA' ? "></td></tr>		
																	</form>
																
																</table>
																
 
																
																
																<table width="30%">	
																	<link   rel="stylesheet" href="css/yBox.min.css">
																	<script src="css/yBox.min.js"></script>																
																 
																		<script>
																		window.onload = function(){
																		let myYbox;
																		if(document.querySelector('.yBox')){
																		myYbox = new yBox();
																		myYbox.init();
																		}
																		myYbox.onYboxOpen = function(){
																		document.body.classList.add('yBoxIsOpen');
																		}
																		myYbox.onYboxClose = function(){
																		document.body.classList.remove('yBoxIsOpen');
																		}
																		myYbox.onNextItemClick = function(){
																		console.log('next item clicked');
																		};
																		myYbox.onPrevItemClick = function(){
																		console.log('prev item clicked');
																		}
																		};
																		</script>																
																	<tr><td colspan="6"><hr></td></tr>	
																	<tr>
																		<td>FOTO ATTUALE : </td>
																		<td><a class='yBox yBox_iframe' href="adgestionefotobuffettiupload.asp?codice=<%=codice_buf%>"><img src="../foto.asp?cat=catalogobuffetti2016_small&img=<%=codice_buf%>.jpg" border="0" border="0"></a></td>
																	</tr>
																	<tr><td colspan="6"><hr></td></tr>
																	<tr><td>
																	<a class='yBox yBox_iframe' href="adgestionefotobuffettiupload.asp?codice=<%=codice_buf%>"><input type="submit" style="background:#ff0000;color:white;height:35px;" name="sub" value=" AGGIUNGI O MODIFICA FOTO ? (solo estensione .jpg) ">
																	</a>
																	</td></tr>
																	<tr><td colspan="6"><hr></td></tr>
																	
																 
																</table>
																						
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