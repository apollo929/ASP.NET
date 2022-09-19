<!--#include file=connessionesql.inc-->
<%  
    'controllo session pratica   
    if request("idpratica")<>"" then  session("idpratica")=trim(request("idpratica"))
	session("titolonavigazione")="INSERIMENTO COINTESTATARIO (2) "
	if trim(session("idpratica"))="" then response.redirect "adindex.asp"
	
	'controllo invio form
	if request("tasto")<>"" then	
			text_nome=trim(senza_apice(Request.Form("nome")))	
			text_cognome=trim(senza_apice(Request.Form("cognome")))			
			text_tipolavoratore=senza_apice(Request.Form("tipolavoratore"))	
			text_email=trim(senza_apice(Request.Form("email")))
			text_telefono=trim(senza_apice(Request.Form("telefono")))
			text_codicefiscale=senza_apice(Request.Form("codicefiscale"))		
			text_indirizzo=senza_apice(Request.Form("indirizzo"))
			text_citta=senza_apice(Request.Form("citta"))
			text_cap=senza_apice(Request.Form("cap"))
			text_provincia=senza_apice(Request.Form("provincia"))		
			text_statocivile=senza_apice(Request.Form("statocivile"))
			text_professione=senza_apice(Request.Form("professione"))
			text_reddito=senza_apice(Request.Form("reddito"))
			text_cittadinanza=senza_apice(Request.Form("cittadinanza"))		
			text_disponibilita=trim(senza_apice(Request.Form("disponibilita")))
		
		
			verrore=" "
			rossi=""
			errore="false"
			if text_nome="" then
			 errore="true"
			 rossi=rossi & "nome,"
			 verrore=verrore & "Nome  ,"
			end if  
			if text_cognome="" then
			 errore="true"
			 rossi=rossi & "cognome,"
			 verrore=verrore & "Cognome  ,"
			end if  
			'controllo reddito
			if isnumeric(text_reddito)=false then
				errore="true"
				rossi=rossi & "imp. reddito non numerico ,"
				verrore=verrore & "imp. reddito non numerico ,"
				text_reddito=0
			else
				text_reddito=replace(cdbl(text_reddito),",",".")
			end if	
			'controllo disponibilita'
			if isnumeric(text_disponibilita)=false then
				errore="true"
				rossi=rossi & "imp. disponibilita' non numerico ,"
				verrore=verrore & "imp. disponibilita' non numerico ,"
				text_disponibilita=0
			else
				text_disponibilita=replace(cdbl(text_disponibilita),",",".")
			end if 	
			if verrore=" " then 
				strsqlupdate="update pratiche_cointestatario2 set cognome='" & text_cognome & "',nome='" & text_nome & "',provincia='" & text_provincia & "',tipocliente='" & text_tipolavoratore & "',mail='" & text_email & "',codfiscale='" & text_codicefiscale & "',cap='" & text_cap & "',citta='" & text_citta & "',indirizzo='" & text_indirizzo & "',mobile='" & text_telefono & "',cittadinanza='" & text_cittadinanza & "',statocivile='" & text_statocivile & "',professione='" & text_professione & "',reddito=" & text_reddito & ",disponibilita=" & text_disponibilita & " where idpratica=" & session("idpratica")
				conn.Execute(lcase(strsqlupdate))
				strsqlppf="update pratiche_finanziarie  set cognome='" & text_cognome & "',nome='" & text_nome & "' where nometabella='pratiche_cointestatario2' and idpratica=" & session("idpratica")
		        conn.Execute(lcase(strsqlppf))
				'response.write(strsqlupdate)
				'response.end
				loggaVisSchede "insert/modifica cointestatario","pratiche_cointestatario2",session("idpratica"),"pratiche_cointestatario2",session("loginnominativo")
				response.redirect "adinsertpratica4.asp"
			end if
	else
			'controllo db
			sqlcall="select * from pratiche_cointestatario2 where idpratica=" & trim(session("idpratica")) & " limit 1"
			set tbupdrec=conn.execute(sqlcall)
			session("idpratica")=tbupdrec("idpratica")
			session("datapratica")=tbupdrec("data")	
			'response.write(sqlcall)
			'response.end	
			text_nome=trim(tbupdrec("nome"))
			text_cognome=trim(tbupdrec("cognome"))
			text_tipolavoratore=trim(tbupdrec("tipocliente"))
			text_email=trim(tbupdrec("mail"))
			text_telefono=trim(tbupdrec("mobile"))
			text_codicefiscale=tbupdrec("codfiscale")		
			text_indirizzo=tbupdrec("indirizzo")
			text_citta=tbupdrec("citta")
			text_cap=tbupdrec("cap")
			text_provincia=tbupdrec("provincia")	
			text_statocivile=tbupdrec("statocivile")
			text_professione=tbupdrec("professione")
			text_reddito=tbupdrec("reddito")
			text_cittadinanza=tbupdrec("cittadinanza")
			text_primacasa=tbupdrec("primacasa")
			text_annimutuo=tbupdrec("anni")
			text_impimmobile=tbupdrec("impimmobile")
			text_valimmobile=tbupdrec("impvaloreimmobile")	
			text_impmutuo=tbupdrec("impmutuo")
			text_tasso=tbupdrec("tasso")
			text_lvtltc=tbupdrec("ltvltc")
			text_lvt=tbupdrec("ltv")
			text_impratades=tbupdrec("ratadesiderata")
			text_nfiglis=tbupdrec("numfigli")
			text_attualeabitazione=tbupdrec("affittoproprieta")	
			text_impaffitto=tbupdrec("impaffitto")
			text_impalimenti=tbupdrec("alimenti")
			text_appbanca=tbupdrec("appbancario")
			text_finanziamenti=tbupdrec("finanziamenti")
			text_garanti=tbupdrec("garanti")
			text_compenso=tbupdrec("compenso")
			text_note=tbupdrec("note")	
			text_disponibilita=tbupdrec("disponibilita")
			text_cointestatario=tbupdrec("cointestatario")
			tbupdrec.close
	
	end if

			
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
<TITLE>KIRON S.p.A</TITLE>
<meta name="keywords" content="KIRON S.p.A">
<meta name="description" content="KIRON S.p.A">
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Backoffice Kiron S.p.A.</title>
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
				<!-- /.navbar-top-links -->
				<!--#include file=navbarback.inc--><br>
				<!--#include file=top_menu_pratica.inc-->

                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                 
									<form action="adcointestatario2.asp?tasto=invia" method="post" id="formuu" name="formuu">
									<table cellspacing="0" cellpadding="0" width="60%" align="left">
									<!-- form x tutti -->
									<!-- form x tutti -->
									<!-- form x tutti -->
									
									<!--#include file=adformtutti.asp-->
									
									<!-- form x tutti -->
									<!-- form x tutti -->
									<!-- form x tutti -->
									<tr><td colspan="2" height="5px"></td></tr>
									<tr>
									<td  align=left >Finanziamenti in Corso :</td><td>
									
									<%if trim(text_finanziamenti)<>"si" then%>
									<div id="var_1"  style="display:none;">	
									<%else%>
									<div id="var_1"  style="display:block;">										
									<%end if%>
																
									<% 
															session.lcid=1040    
															'DB TIPO DOCUMENTI
															Set Grid = Server.CreateObject("Persits.Grid")
															'Connessione
															Grid.Connect strConnect, "", ""
															Grid.SQL=""
															Grid.SQL = "select id,idpratica,idpratica as idcanc,nometabella,tipologia,debitoresiduo,importorata,scadenza,istituto,note from pratiche_finanziarie where nometabella='pratiche_cointestatario2' and idpratica=" & session("idpratica") & " group by importorata order by importorata desc"
															Grid.Cols("idpratica").AttachExpression "<a class=navy11 HREF=""adinsertfinan.asp?nometabella=pratiche_cointestatario2&tipooperazione=insert&idpratica={{idpratica}}&id={{id}}""><center><img src='images/edit.gif' border='0'></center></a>"
															Grid.Cols("idcanc").AttachExpression "<a class=navy11 HREF=""adinsertfinan.asp?nometabella=pratiche_cointestatario2&tipooperazione=delete&idpratica={{idpratica}}&id={{id}}""><center><img src='images/elimina.png' border='0'></center></a>"
															Grid.Cols("id").hidden = True	
															Grid.Cols("idpratica").readonly = True											
															Grid.Cols("idpratica").Caption="&nbsp;"
															Grid.Cols("idcanc").readonly = True											
															Grid.Cols("idcanc").Caption="&nbsp;"
															'Grid.Cols("nometabella").value="pratiche_cointestatario2"													
															Grid.Cols("nometabella").hidden = True
															Grid.Cols("tipologia").Caption="&nbsp;&nbsp;&nbsp;&nbsp;tipologia&nbsp;&nbsp;&nbsp;&nbsp;"
															Grid.Cols("istituto").Caption="&nbsp;&nbsp;&nbsp;&nbsp;istituto&nbsp;&nbsp;&nbsp;&nbsp;"
															Grid.Cols("note").Caption="&nbsp;&nbsp;&nbsp;&nbsp;note&nbsp;&nbsp;&nbsp;&nbsp;"
															Grid.Cols("importorata").Caption="&nbsp;imp.&nbsp;rata&nbsp;"
															Grid.Cols("debitoresiduo").Caption="&nbsp;deb.&nbsp;residuo&nbsp;"											
															'MAX RECORD
															Grid.MaxRows=40									
															'Grid.DeleteButtonOnClick = "Are you sure you want to delete this record?" 
															
															' Enable sorting
															Grid.ColRange(1,33).CanSort = False
															Grid.ColRange(1,33).Cell.Align = "left"
															'Grid.Cols("utentetipo").Cell.Align = "center"
															'Grid.Cols("email").Cell.Align = "center"
															' Set Colors
															Grid.ColRange(1,33).Header.BGColor = "#f6f6f6"
															Grid.ColRange(1,33).Header.Font.Face = "sans-serif"
															Grid.ColRange(1,33).Cell.Font.Face = "sans-serif"
															Grid.ColRange(1,33).Cell.Font.Size = par_font_size
															Grid.ColRange(1,33).Header.Font.Size = par_font_size
															Grid(0).Header.BGColor = "#f6f6f6"
															Grid(999).Header.BGColor = "#f6f6f6"
																	
															' Specify location of button images
															Grid.ImagePath = "images/"
															' Set <TABLE> attributes
															Grid.Table.Border = 1
															Grid.Table.CellSpacing = 0
															Grid.Table.CellPadding =0
																
															Grid.readonly = true
															Grid.Display
															Grid.Disconnect

															Set Grid = Nothing
															
														%>
									</div>							
									<script language="javascript">
										function mostra(name)
										{	// alert(document.getElementById('finanziamenti').value);
											if(document.getElementById('finanziamenti').value == "no"){
												document.getElementById(name).style.display = "none";
											}else{
												document.getElementById(name).style.display = "block"
											}
										}
									</script>							
									<select  type="select" id="finanziamenti" name="finanziamenti" onchange="mostra('var_1');">
											<%if trim(text_finanziamenti)="si"  then%>
											<option  selected="selected" value="<%=text_finanziamenti%>"><%=ucase(text_finanziamenti)%></option>	
											<%end if%>
											<option value="no">NO</option>		
											<option value="si">SI</option>	
											</select></td>
									</tr>
									<tr><td colspan="2" height="5px"><hr></td></tr>		
		<tr><td height="10px"><font color="#FF0000">*</font>campi obbligatori</td></tr>
									<tr>
									<td align="left"><button  type="submit"  border="0" class="btn btn-primary">INSERIMENTO COINTESTATARIO >>> PROSEGUI</button></td>
									<td align="left">&nbsp;<button type="button" onclick="javascript:history.back();" class="btn btn-primary"  >INDIETRO</button></td>
									</tr>
									<tr><td colspan="2" height="10px"></td></tr>
									</table>
									</form>
									<br>	
								 
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