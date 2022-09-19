<!--#include file=connessionesql.inc-->
<!DOCTYPE html>
<%
'Inserimento Profilo Prodotti         
txt_password1=trim(Request("password1")) 
txt_ragione=Request("ragsoc")   
Verifica=False  

'Inserimento Profilo
if Trim(request("tipo"))="updateric" then
	'Verifica
	'Ricerca codice buffetti
	Set tbprodotti = Server.CreateObject("ADODB.RecordSet")
	sSQL = "select codice_od,codice_buf,descrizione,p1,fornitore From prodotti where codice_buf='" & Trim(Cstr((Request.form("codice_ricerca")))) & "' or  codice_od='" & Trim(Cstr((Request.form("codice_ricerca")))) & "' union SELECT ccode,ccode,cname as descrizione,cprice as p1,fornitore FROM shop_products where ccode='" & Trim(Cstr((Request.form("codice_ricerca")))) & "'"
	tbprodotti.Open sSQL,connm	
	if not tbprodotti.EOF then
	 descrizione=replace(tbprodotti("descrizione"),"'","`")		
	 codice_ricerca=Trim(Request.form("codice_ricerca"))
	 Verifica=True
	 StrSql="insert into profilo (password1,codice_isp,Descrizione,Prezzo,Fornitore) values ('" & txt_password1 & "','" & codice_ricerca & "','" & descrizione & "'," & replace((formatnumber(tbprodotti("p1"),2)),",",".") & ",'" & tbprodotti("fornitore") & "')"
	 StrSqllist="insert into listino (password1,codice_isp,Descrizione,Prezzo,Fornitore,CodCliente) values ('" & txt_password1 & "','" & codice_ricerca & "','" & descrizione & "'," & replace((formatnumber(tbprodotti("p1"),2)),",",".") & ",'" & tbprodotti("fornitore") & "','REG')"
	else%>				  	
		<script language="JavaScript">
	    alert("Codice OD/Buffetti/Ecommerce non trovato!");
	    </script>		
		<%
	end if
	tbprodotti.close
	If Verifica=True then						    		    
		'INSERIMENTO
		'response.write(StrSql)
		'response.end
		Set Tbcarins = Server.CreateObject("ADODB.RecordSet")					
		Tbcarins.Open StrSql, connm	
		Set Tbcarinslist = Server.CreateObject("ADODB.RecordSet")	
		response.write(StrSqllist)
		Tbcarinslist.Open StrSqllist, connm	
	End if
End if   


if Trim(request("import"))="true" then
	txtpasswordimp=trim(request.form("txtimport"))
	if txtpasswordimp="elimina tutto" then
		sqldeleteprofilo="delete from profilo where password1='" & txt_password1  & "'"
		connm.execute(sqldeleteprofilo)
	else
		sqlimportdel="delete FROM profilotemp ;"
		connm.execute(sqlimportdel)
		if txtpasswordimp<>"" then 
				sqlinsertimp="INSERT INTO profilotemp SELECT * FROM profilo WHERE password1 = '" & txtpasswordimp & "'" 
				connm.execute(sqlinsertimp)
				sqlimportupdate="update profilotemp set password1='" & txt_password1  & "'"
				connm.execute(sqlimportupdate)
				sqlinsertimp2="INSERT INTO profilo (password1,codice_isp,prezzo,promo,sconto,fornitore) SELECT password1,codice_isp,prezzo,promo,sconto,fornitore FROM profilotemp WHERE password1 = '" & txt_password1  & "'" 
				connm.execute(sqlinsertimp2)
				sqlimportdel="delete FROM profilotemp ;"
				connm.execute(sqlimportdel)
		end if	
	end if	
end if
'response.end
	%>


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
									
									
											<a class=nero10 href=adutentipro.asp><img border=0 src='images/indietro.png'>&nbsp;INDIETRO</a><br><br>

											<FORM name="formimport" method="post" action="adutentiproprofilo.asp?import=true&password1=<%=txt_password1%>" >
											<table width=35% border=0 cellpadding=0 cellspacing=0>	
											<tr><td colspan="3" height="5px"></td></tr>
											<tr>
											<td align="left">RagioneSociale:<font color="#0394D8"></font></td>
											<td align="left">
											<select id="txtimport" name="txtimport">
											<option value="elimina tutto">ELIMINA TUTTO (RESETTA IL PROFILO)</option>
											<% 	sqlragione="select ragione,nome,cognome,password1 from registrazione where password1<>'" & trim(txt_password1) & "' order by ragione desc"
											Set tbragione = Server.CreateObject("ADODB.RecordSet")	
											tbragione.Open sqlragione, connm
											do while not tbragione.eof%>		
											<option value="<%=tbragione("password1")%>"><%=ucase(tbragione("ragione"))%>-<%=ucase(tbragione("nome"))%>-<%=ucase(tbragione("cognome"))%></option>
											<%tbragione.movenext
											loop
											tbragione.close%>
											</select>
											</td><td><input type="submit" value="inserisci tutti i prodotti profilati di questo cliente"><input type="submit" value="resetta profilo ELIMINA TUTTO (RESETTA IL PROFILO)"></td>
											</tr>
											<tr><td colspan="3" height="5px"></td></tr>
											</table>
											</form>
											<hr>


											<table width=100% border=0 cellpadding=1 cellspacing=0>					
											<FORM name="form" method="post" action="adutentiproprofilo.asp?prezzo=<%=Trim(Request("Prezzo"))%>&id=<%=Request("Id")%>&password1=<%=txt_password1%>&tipo=updateric" >
											<tr><td colspan=3 class=navy10n ><STRONG>RAGIONE SOCIALE :<%=txt_ragione%></STRONG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<STRONG>Rif.Wincody&nbsp;<%=txt_password1%></STRONG></td></tr>
											<tr>
											<td ><b><INPUT class=navy10n type="image" border="0" name="imgsave" src="images/addnew.gif"></td>
											<td width=300 class=navy10n >
											<STRONG>INSERIRE CODICE PRODOTTO OD / BUFFETTI</STRONG>
											</td>
											<td class=navy10n ><B>
											<input id="text_1" maxLength="25" name="codice_ricerca" ><INPUT class=navy10n type="image" border="0" name="imgsave" src="images/addnew.gif">
											<br></b></td></tr>
											</FORM>														
											</table>
											<hr>

											<% 	sqlgrid="select * from profilo where password1='" & txt_password1 & "' order by codice_isp asc"
												'response.write(sqlgrid)
												'response.end
												
												'Database
												Set Grid = Server.CreateObject("Persits.Grid")
												'Cancella
												'Grid.DeleteButtonOnClick = "Sei sicuro di cancellare ?"
												'Connessione
												Grid.Connect strConnect, "", ""	
												'SQL
												Grid.SQL = sqlgrid
												'Enable Left-side buttons
												'Grid.ShowLeftSideButtons
												
												'Hide identity column
												Grid.Cols("id").ReadOnly = True
												Grid.Cols("password1").ReadOnly = True	
												Grid.Cols("id").Cell.Align="CENTER"
												Grid.Cols("id").Caption="n°rec"
												Grid.Cols("password1").Caption="rif.utente"
												Grid.Cols("codice_isp").Caption="cod.articolo"
												Grid.Cols("promo").hidden = True
												Grid.Cols("sconto").hidden = True
												Grid.MaxRows=100
													
												' Enable sorting
												Grid.ColRange(1,7).CanSort = True
												Grid.ColRange(1,7).CanSort = True

												' Set Colors
												Grid.ColRange(1,7).Header.BGColor = "#B0B0FF"
												Grid.ColRange(1,7).Header.Font.Face = "Verdana"
												Grid.ColRange(1,7).Cell.Font.Face = "Verdana"
												Grid.ColRange(1,7).Cell.Font.Size=2
												Grid(0).Header.BGColor = "#B0B0FF"
												Grid(999).Header.BGColor = "#B0B0FF"
												Grid.Cols("Id").AttachExpression "<A class=navy11 HREF=""adutentiproprofilodet.asp?id={{Id}}&password1={{password1}}""><img src=images/edit.png border=0></A>"

												' Specify location of button images
												Grid.ImagePath = "images/"
												' Set <TABLE> attributes
												Grid.Table.Border = 1
												Grid.Table.CellSpacing = 1
												Grid.Table.CellPadding = 1
												
												' Make grid read-only
												Grid.ReadOnly = True
												Grid.Display
												Grid.Disconnect

												Set Grid = Nothing
											%>

										
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