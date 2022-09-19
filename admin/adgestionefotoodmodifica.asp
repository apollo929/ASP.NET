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

		sqlupd="update prodotti set p1=" & txt_p1 & ",p2=" & txt_p2 & ",p3=" & txt_p3 & ",p4=" & txt_p4 & ",p5=" & txt_p5 & " where codice_od='" & request("codice") & "'"
		'response.write(sqlupd)
		'response.end
		connm.execute(sqlupd)
		 
	
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
															<b>GESTIONE OD</b>
															<HR>
															
														<%

'inizializzo variabili
categoria=""
sottocategoria=""
cod_od=""
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
cod_od=tbcatalogo("codice_od")
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
    <form name="newad" method="post" action="adgestionefotoodmodifica.asp?update=si&codice=<%=cod_od%>">
	<table width="30%">
		<tr>
			<td>Codice: </td>
			<td colspan="2"><b><font size="+2"><%=cod_od%></b></font></td>
		</tr>
		
	</table>

	<table width="60%">
	<tr><td colspan=4><br><hr><br></td></tr>
		<input type="hidden" name="cod_od" value="<%=cod_od%>">
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
				<select disabled name="categoria">
					
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
				<select disabled name="sottocategoria">
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
			<td><textarea rows="5" cols="30" disabled name="descrizione"><%=descrizione%></textarea></td>
		</tr>
		<tr>
			<td>Prezzo 1:</td>
			<td><input type="text" name="p1" value="<%=formatnumber(p1,2)%>"></td>
		</tr>
		<tr>
			<td>Prezzo 2:</td>
			<td><input type="text" name="p2" value="<%=formatnumber(p2,2)%>"></td>
		</tr>
		<tr>
			<td>Prezzo 3:</td>
			<td><input type="text" name="p3" value="<%=formatnumber(p3,2)%>"></td>
		</tr>
		<tr>
			<td>Prezzo 4:</td>
			<td><input type="text" name="p4" value="<%=formatnumber(p4,2)%>"></td>
		</tr>
		<tr>
			<td>Prezzo 5:</td>
			<td><input type="text" name="p5" value="<%=formatnumber(p5,2)%>"></td>
		</tr>
		<tr><td colspan="6"><hr>
		<input type="submit" style="background:navy;color:white;height:35px;" name="sub" value=" AGGIORNO PREZZI ? "><br></td></tr>		
		</form>
	</table>
	
	<br><hr><br>
	
	<table width="30%">
		<form name="newad" method="post" enctype="multipart/form-data" action="https://img.schede.eu/cataloghi/upload-interni.php">
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
											
											tbcatalogo.close%>	
				
				</td>
			</tr>
			<tr>
				<td>Nuova foto: </td>
				<td><input type="file" name="image"></td>
			</tr>
			<tr><td><input style="background:#ff0000;color:white;height:35px;"  name="Submit" type="submit" value="AGGIORNA FOTO NUOVA "></td></tr>
		</form>
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