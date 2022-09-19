<!--#include file=connessionesql.inc-->
<%
if request("tasto")<>"invia" then

			if request("fissoappuntamento")="yes" and isnumeric(request("id"))=true then
			 'sqlupdapp="update contatti set appartenenza='" & session("loginnominativo") & " app_fissato ' where id=" & cdbl(request("id"))
			 'conn.execute(sqlupdapp)
			end if
			if request("fissoappuntamento")="yes" and isnumeric(request("id"))=true then
				sqlmod="select * from contatti where id=" & cdbl(request("id"))
				set tbcontatti=conn.execute(sqlmod) 
				text_email=trim(senza_apice(tbcontatti("mail")))
				text_telefono=trim(senza_apice(tbcontatti("telefono")))
				text_richiesta=tbcontatti("note")																	
				text_cognome=senza_apice(tbcontatti("cognome"))
				text_nome=senza_apice(tbcontatti("nome"))
				text_indirizzo=senza_apice(tbcontatti("indirizzo"))
				text_citta=senza_apice(tbcontatti("citta"))
				text_provenienza=senza_apice(tbcontatti("provenienza"))
				text_provincia=replace(senza_apice(tbcontatti("provincia")),"%20"," ")
			end if
			text_dataapp=date()
			text_oraapp=time()
			text_luogoapp=text_indirizzo & "  " & text_citta & "  " & text_provincia
else
			errore="false"
			verrore=" "
			rossi=""
			
			text_tipo=trim(senza_apice(Request.Form("tipo")))
			text_titolo=trim(senza_apice(Request.Form("titolo")))
			text_email=trim(senza_apice(Request.Form("email")))
			text_telefono=trim(senza_apice(Request.Form("telefono")))
			text_data=senza_apice(Request.Form("data"))		
			text_richiesta=senza_apice(Request.Form("richiesta"))																		
			text_preventivi=senza_apice(Request.Form("Preventivi"))
			text_cognome=trim(senza_apice(Request.Form("cognome")))
			text_nome=trim(senza_apice(Request.Form("nome")))
			text_indirizzo=senza_apice(Request.Form("Indirizzo"))
			text_citta=senza_apice(Request.Form("Citta"))
			text_cap=senza_apice(Request.Form("Cap"))
			text_provincia=replace(senza_apice(Request.Form("Provincia")),"%20"," ")
			text_dataapp=senza_apice(Request.Form("dataapp"))
			text_oraapp=senza_apice(Request.Form("oraapp"))
			text_provenienza=lcase(Request.Form("provenienza"))
			text_luogoapp=senza_apice(Request.Form("luogoapp"))
			text_noteapp=senza_apice(Request.Form("noteapp"))
			
			 'controllo data
			if isdate(text_dataapp)=false then
				errore="true"
				rossi=rossi & "data ,"
				verrore=verrore & "Data ,"
			else
				text_dataapp=year(text_dataapp) & "/"  & month(text_dataapp) &  "/" & day(text_dataapp)
			end if  
			if text_nome="" then
			 errore="true"
			 rossi=rossi & "nome,"
			 verrore=verrore & "Nome  ,"
			end if  
			if text_cognome="" then
			 errore="true"
			 rossi=rossi & "cognome,"
			 verrore=verrore & "Cognome ,"
			end if  
			if text_telefono="" then
				errore="true"
				rossi=rossi & "telefono,"
				verrore=verrore & "Telefono ,"
			end if  
 


			HTML = ""
			HTML = "<!DOCTYPE HTML PUBLIC -//IETF//DTD HTML//EN>" 
			HTML = HTML & "<html>" 
			HTML = HTML & "<head>" 
			HTML = HTML & "<meta http-equiv=Content-Type>" 
			HTML = HTML & "<link rel=stylesheet href='https://" & linkuserid & "/style.css'></head>" 
			HTML = HTML & "<body class='nero10'>"
			HTML = HTML & "<img src='" & sitourllogo &"'><br>"	
			HTML = HTML & "Cognome : " & text_cognome   & "<br>"
			HTML = HTML & "Nome : " & text_nome   & "<br>"		
			HTML = HTML & "Indirizzo : " & text_indirizzo  & "<br>"								
			HTML = HTML & "Citta     : " & text_citta      & "<br>"						
			HTML = HTML & "Provincia : " & text_provincia  & "<br>"								
			HTML = HTML & "Telefono  : " & text_telefono   & "<br>"								
			HTML = HTML & "Mail      : " & text_email   & "<br>"								
			HTML = HTML & "<hr>"	
			HTML = HTML & "Provenienza : " & text_provenienza & "<br>"
			HTML = HTML & "<hr>"		
			HTML = HTML & "Richiesta : " & text_richiesta & "<br>"			        
			HTML = HTML & "<hr><br>Lo Staff ringrazia <br>Al piu' presto sarai ricontattato<br><br><br>"	
			'HTML = HTML & "<font color=grey size=1 FACE=verdana>Questa newsletter, gratuita ed aperta a tutti gli utenti che ne fanno richiesta, è distribuita, via e-mail, con frequenza quotidiana e contiene le segnalazioni degli aggiornamenti e delle iniziative del sito www.costruttori.it .<br>In riferimento al D. Lgs. 196/2003, i Suoi dati saranno trattati da costruttori.it al solo fine dell'invio della newsletter, con estrema riservatezza, e non verranno divulgati. La newsletter è inviata individualmente ai singoli interessati anche se trattata con l'ausilio di spedizioni collettive.<br>In ogni momento, sarà possibile essere rimossi dall'elenco dei destinatari opt (out) collegandosi a questo link</font> <a href='https://www.costruttori.it/rimuovi.asp'><b><font color=grey size=1 FACE=verdana>rimozione</font></b></a>"																												
			HTML = HTML & "</body>" 
			HTML = HTML & "</html>" 
			if errore="false" and trim(request("tasto"))="invia" then			
					titolobreve="leads"	
					'Rt=SendEmail(spedizionemail,text_email,linkuserid & titolobreve,HTML)
					'Rt2=SendEmail(spedizionemail,spedizionemail,linkuserid & titolobreve,HTML)	
					sql="insert into appuntamenti (idcontatto,data,time,cognome,nome,mail,telefono,indirizzo,citta,provincia,note,provenienza,titolo,esito,noteapp,indirizzoapp,agente) values ('" & session("loginid") & "','"+text_dataapp+"','"+text_oraapp+"','"+text_cognome+"','"+text_nome+"','"+text_email+"','"+text_telefono+"','"+text_indirizzo+"','"+text_citta+"','"+text_provincia+"','"+text_richiesta+"','"+text_provenienza+"','"+text_titolo+"','0','"+text_noteapp+"','"+text_luogoapp+"','"+session("loginnominativo")+"')"
					'response.write(lcase(sql))
					'response.end
					'sql=tosql(sql)
					conn.execute(lcase(sql))
					sqlupdapp="update contatti set appartenenza='" & session("loginnominativo") & " app_fissato ' where id=" & cdbl(request("id"))
					conn.execute(sqlupdapp)
					'response.write(lcase(sqlupdapp))
					'response.end
					'query="repair table contatti"
					'conn.execute(query) 
					'log	 
					loggaVisSchede "fissa appuntamento","insert nuovo appuntamento","appuntamento a " & text_cognome & "  " & text_nome,"inserito appuntamento ",session("loginnominativo")
  					response.Redirect("adappuntamenti.asp")
			else
					titolobreve=" errori durante compilazione "	
					'Rt=SendEmail(spedizionemail,spedizionemail,linkuserid & titolobreve,HTML)
			end if
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
				<!--#include file=top_menu_sotto.inc-->

                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
									
									
									<!--#include file=_leadfissaappuntamento.inc-->

										
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