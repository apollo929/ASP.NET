<!--#include file=connessionesql.inc-->
<%
on error resume next
if request("tasto")<>"invia" then

			if isnumeric(request("id"))=true then
				sqlmod="select * from appuntamenti where id=" & cdbl(request("id"))
				set tbapp=conn.execute(sqlmod) 
				text_email=trim(senza_apice(tbapp("mail")))
				text_telefono=trim(senza_apice(tbapp("telefono")))
				text_richiesta=tbapp("note")																	
				text_cognome=senza_apice(tbapp("cognome"))
				text_nome=senza_apice(tbapp("nome"))
				text_indirizzo=senza_apice(tbapp("indirizzo"))
				text_citta=senza_apice(tbapp("citta"))
				text_provenienza=senza_apice(tbapp("provenienza"))
				text_provincia=replace(senza_apice(tbapp("provincia")),"%20"," ")
				text_dataapp=senza_apice(tbapp("data"))
				'text_dataapp=year(text_dataapp) & "/"  & month(text_dataapp) &  "/" & day(text_dataapp)
				text_oraapp=senza_apice(tbapp("time"))
				'provenienza
				text_provenienza=lcase(tbapp("provenienza"))
				'luogo app
				text_luogoapp=senza_apice(tbapp("indirizzoapp"))
				text_noteapp=tbapp("noteapp")
				text_titolo=tbapp("titolo")
				text_provincia=tbapp("provincia")
				tbapp.close
			end if
			
else
			
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
			text_dataapp=cdate(senza_apice(Request.Form("dataapp")))
			text_dataapp=year(text_dataapp) & "/"  & month(text_dataapp) &  "/" & day(text_dataapp)
			text_oraapp=senza_apice(Request.Form("oraapp"))
			'provenienza
			text_provenienza=lcase(Request.Form("provenienza"))
			'luogo app
			text_luogoapp=senza_apice(Request.Form("luogoapp"))
			text_noteapp=senza_apice(Request.Form("noteapp"))


			errore="false"
			verrore=" "
			rossi=""
			if text_cognome="" then
				errore="true"
				rossi=rossi & "cognome,"
				verrore=verrore & "Cognome ,"
			end if   
			if text_nome="" then
				errore="true"
				rossi=rossi & "nome,"
				verrore=verrore & "Nome ,"
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
					'sql="insert into appuntamenti (data,time,cognome,nome,mail,telefono,indirizzo,citta,provincia,note,provenienza,titolo,esito,noteapp,indirizzoapp) values ('"+text_dataapp+"','"+text_oraapp+"','"+text_cognome+"','"+text_nome+"','"+text_email+"','"+text_telefono+"','"+text_indirizzo+"','"+text_citta+"','"+text_provincia+"','"+text_richiesta+"','"+text_provenienza+"','"+text_titolo+"','0','"+text_noteapp+"','"+text_luogoapp+"')"
					'response.write(lcase(sql))
					'response.end
					sql="update appuntamenti set cognome='"+text_cognome+"',nome='"+text_nome+"',mail='"+text_email+"',telefono='"+text_telefono+"',indirizzo='"+text_indirizzo+"',citta='"+text_citta+"',provincia='"+text_provincia+"',note='"+text_richiesta+"',provenienza='"+text_provenienza+"',esitodesc='libero',titolo='"+text_titolo+"',time='"+text_oraapp+"',data='"+text_dataapp+"',noteapp='"+text_noteapp+"' where id=" & cdbl(request("id"))                    
					'response.write(sql)
					'response.end
					conn.execute(lcase(sql))
					'query="repair table contatti"
					'conn.execute(query) 
					'log	 
					loggaVisSchede "modifica appuntamento","modifica appuntamento","appuntamento a " & text_cognome & "  " & text_nome,"modifica appuntamento ",session("loginnominativo")
					'response.Redirect("adappuntamenti.asp")
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
								<script>
								function formSubmit2() 		{
									swal("modifica appuntamento ?", {
								  buttons: {
									cancel: "non modificare",
									defeat: "modifica appuntamento",
								  },
								})
								.then((value) => {
								  switch (value) {
								 
									case "defeat":
									document.myform.submit();
									return true;
									
									default:
									return false;
									//location.href = 'adappuntamentiKO.asp?appuntamento=yes&id='+id; 
									
								  }
								});}
								function formSubmit(vlink) 
								
																{
									swal("Inserire appuntamento su GOOGLE CALENDAR ?", {
								  buttons: {
									cancel: "non inserire",
									defeat: "inserire appuntamento",
								  },
								})
								.then((value) => {
								  switch (value) {
								 
									case "defeat":
									   location.target = "_blank";
									   location.href = 'https://www.google.com/calendar/event?action=TEMPLATE&'+vlink;
									   location.target = "_blank";
							
									  break;
									default:
									return false;
									//location.href = 'adappuntamentiKO.asp?appuntamento=yes&id='+id; 
									
								  }
								});}
						
								function doSomething(id)
								{
									swal("Inserire la pratica ?", {
								  buttons: {
									annulla: "non INTERESSATO ! ",
									
									catch: {
									  text: "CI PENSA...richiamare",
									  value: "catch",
									},
									defeat: "INSERIMENTO PRATICA >>> ",
									cancel: "annulla operazione",
								  },
								})
								.then((value) => {
								  switch (value) {
								 
									case "defeat":
									    location.href = 'adinsertpratica1.asp?appuntamento=yes&tasto=invia&id='+id;  
									  break;
								 
									case "catch":
									  swal("attenzione!", "pratica non inserita", "success");
									  location.href = 'adappuntamentiKO.asp?appuntamento=forse&id='+id; 
									  break;
									  
									  case "annulla":
									    location.href = 'adappuntamentiKO.asp?appuntamento=yes&id='+id; 

								 
									default:
									    return false;
										break;
									
									
								  }
								});}
								</script>						
									
						    	<form name="myform" id="myform" action="adappuntamentivisua.asp?tasto=invia&id=<%=cdbl(request("id"))%>" method="post" >
																
						    <table style="width:400px;" border=0 align="left" cellpadding="0" cellspacing="0">
							    
                                <%if errore<>"false" then%>				  
                                    <% if request("tasto")<>"" then%>
                                        <tr><td colspan="2">
                                            <font color="red" size="2"><strong><center>Errori >>>><% Response.write(verrore)%></center></strong></font>
                                        </td></tr>
                                    <%end if%>
                                    <%end if%>	
                                <tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="width:150px; text-align:right;" ><span class="bold">DATA&nbsp;APPUNTAMENTO&nbsp;:<font color="#FF0000">*</font>&nbsp;&nbsp;</span>
									
									</td>
                                    <td>
									<input type="date" id="dataapp" name="dataapp" style="border:1px solid #abadb3;" value="<%=(year(text_dataapp) & "-"  & right("0" & month(text_dataapp),2) &  "-" & right("0" & day(text_dataapp),2))%>" size="30">
								
									</td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="width:150px; text-align:right;" ><span class="bold">ORA&nbsp;APPUNTAMENTO&nbsp;:&nbsp;&nbsp;</span></td>
                                    <td><input type="time"  name="oraapp" style="border:1px solid #abadb3;" value="<%=text_oraapp%>" /></td>							
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<td style="width:150px; text-align:right;" ><span class="bold">TITOLO&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
								<td style="text-align:left;">
									<select  type="select" id="titolo" name="titolo">
								    <%if trim(text_titolo)<>"" then%>
									<option  selected="selected" value="<%=text_titolo%>"><%=ucase(text_titolo)%></option>			
									<%end if																
										'finanziamento
										sqlfin="select descrizione from tipofinanziamento order by descrizione"
										set tbf=conn.execute(sqlfin)									
										do while not tbf.eof%>	
										<option value="<%=ucase(tbf("descrizione"))%>"><%=ucase(tbf("descrizione"))%></option>								
										<%tbf.movenext
										loop
										tbf.close
										%>
									</select>	
							    </td></tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="width:150px; text-align:right;" ><span class="bold">LUOGO&nbsp;APPUNTAMENTO&nbsp;:&nbsp;&nbsp;</span></td>
                                    <td><input type="text"  name="luogoapp" style="border:1px solid #abadb3;" size="70" value="<%=trim(text_luogoapp)%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="width:150px; text-align:right;" ><span class="bold">NOTE&nbsp;APPUNTAMENTO&nbsp;:&nbsp;&nbsp;</span></td>
                                    <td><textarea name="noteapp" rows="2" cols="55" ><%=text_noteapp%></textarea></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<td style="width:150px; text-align:right;" ><span class="bold">PROVENIENZA&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
								<td style="text-align:left;">
								
									<select  type="select" id="provenienza" name="provenienza">
								    <%if trim(text_provenienza)<>"" then%>
									<option  selected="selected" value="<%=text_provenienza%>"><%=ucase(text_provenienza)%></option>			
									<%end if
									sqllead="select distinct descrizione from tipolead order by descrizione"
									set tbl=conn.execute(sqllead)
									
									do while not tbl.eof%>	
									<option value="<%=ucase(tbl("descrizione"))%>"><%=ucase(tbl("descrizione"))%></option>
								
									<%tbl.movenext
									loop
									tbl.close%>
									</select>	
							    </td></tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="width:150px; text-align:right;" ><span class="bold">COGNOME&nbsp;&nbsp;:<font color="#FF0000">*</font>&nbsp;&nbsp;</span></td>
                                    <td><input type="text"  name="cognome" style="border:1px solid #abadb3;" size="30" ID="Text1" value="<%=text_cognome%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<tr>
                                    <td style="width:150px; text-align:right;" ><span class="bold">NOME&nbsp;&nbsp;:<font color="#FF0000">*</font>&nbsp;&nbsp;</span></td>
                                    <td><input type="text"  name="nome" style="border:1px solid #abadb3;" size="30" ID="Text1" value="<%=text_nome%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="text-align:right;" ><span class="bold">E-MAIL&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
                                    <td><input type="text"  name="email" style="border:1px solid #abadb3;" size="60" ID="Text2" value="<%=text_email%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="text-align:right;" ><span class="bold">TELEFONO&nbsp;&nbsp;:<font color="#FF0000">*</font>&nbsp;&nbsp;</span></td>
                                    <td><input  type="text" name="telefono" style="border:1px solid #abadb3;" size="15" ID="Text3" value="<%=text_telefono%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="text-align:right;" ><span class="bold">INDIRIZZO&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
                                    <td><input type="text" name="indirizzo" style="border:1px solid #abadb3;" size="45" ID="Text4" value="<%=text_indirizzo%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="text-align:right;" ><span class="bold">CITTA'&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
                                    <td><input type="text"  name="citta" style="border:1px solid #abadb3;" size="45" ID="Text5" value="<%=text_citta%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td  style="text-align:right;" ><span class="bold">PROVINCIA&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
                                    <td>
                                        <SELECT name="provincia" id="provincia" class="preventivicoldxnero1">
											<%if trim(text_provincia)<>"" then%>
											<option  selected="selected" value="<%=text_provincia%>"><%=ucase(text_provincia)%></option>			
											<%end if%>
                                            <option value=AGRIGENTO>AGRIGENTO</option>
                                            <option value=ALESSANDRIA>ALESSANDRIA</option>
                                            <option value=ANCONA>ANCONA</option>
                                            <option value=AOSTA>AOSTA</option>
                                            <option value=AREZZO>AREZZO</option>
                                            <option value=ASCOLI%20PICENO>ASCOLI PICENO</option>
                                            <option value=ASTI>ASTI</option>
                                            <option value=AVELLINO>AVELLINO</option>
                                            <option value=BARI>BARI</option>
                                            <option value=BARLETTA-ANDRIA-TRANI>BARLETTA-ANDRIA-TRANI</option>
                                            <option value=BELLUNO>BELLUNO</option>
                                            <option value=BENEVENTO>BENEVENTO</option>
                                            <option value=BERGAMO>BERGAMO</option>
                                            <option value=BIELLA>BIELLA</option>
                                            <option value=BOLOGNA>BOLOGNA</option>
                                            <option value=BOLZANO>BOLZANO</option>
                                            <option value=BRESCIA>BRESCIA</option>
                                            <option value=BRINDISI>BRINDISI</option>
                                            <option value=CAGLIARI>CAGLIARI</option>
                                            <option value=CALTANISSETTA>CALTANISSETTA</option>
                                            <option value=CAMPOBASSO>CAMPOBASSO</option>
                                            <option value=CARBONIA-IGLESIAS>CARBONIA-IGLESIAS</option>
                                            <option value=CASERTA>CASERTA</option>
                                            <option value=CATANIA>CATANIA</option>
                                            <option value=CATANZARO>CATANZARO</option>
                                            <option value=CHIETI>CHIETI</option>
                                            <option value=COMO>COMO</option>
                                            <option value=COSENZA>COSENZA</option>
                                            <option value=CREMONA>CREMONA</option>
                                            <option value=CROTONE>CROTONE</option>
                                            <option value=CUNEO>CUNEO</option>
                                            <option value=ENNA>ENNA</option>
                                            <option value=ESTERO-CARINZIA>ESTERO-CARINZIA</option>
                                            <option value=ESTERO-CROAZIA>ESTERO-CROAZIA</option>
                                            <option value=ESTERO-FRANCIA>ESTERO-FRANCIA</option>
                                            <option value=ESTERO-ISTRIA>ESTERO-ISTRIA</option>
                                            <option value=ESTERO-SLOVENIA>ESTERO-SLOVENIA</option>
                                            <option value=ESTERO-SVIZZERA>ESTERO-SVIZZERA</option>
                                            <option value=FERMO>FERMO</option>
                                            <option value=FERRARA>FERRARA</option>
                                            <option value=FIRENZE>FIRENZE</option>
                                            <option value=FOGGIA>FOGGIA</option>
                                            <option value=FORLI>FORLI</option>
                                            <option value=FROSINONE>FROSINONE</option>
                                            <option value=GENOVA>GENOVA</option>
                                            <option value=GORIZIA>GORIZIA</option>
                                            <option value=GROSSETO>GROSSETO</option>
                                            <option value=IMPERIA>IMPERIA</option>
                                            <option value=ISERNIA>ISERNIA</option>
                                            <option value=LA%20SPEZIA>LA SPEZIA</option>
                                            <option value=LATINA>LATINA</option>
                                            <option value=LECCE>LECCE</option>
                                            <option value=LECCO>LECCO</option>
                                            <option value=LIVORNO>LIVORNO</option>
                                            <option value=LODI>LODI</option>
                                            <option value=LUCCA>LUCCA</option>
                                            <option value=L`AQUILA>L`AQUILA</option>
                                            <option value=MACERATA>MACERATA</option>
                                            <option value=MANTOVA>MANTOVA</option>
                                            <option value=MASSA%20CARRARA>MASSA CARRARA</option>
                                            <option value=MATERA>MATERA</option>
                                            <option value=MEDIO%20CAMPIDANO>MEDIO CAMPIDANO</option>
                                            <option value=MESSINA>MESSINA</option>
                                            <option value=MILANO>MILANO</option>
                                            <option value=MODENA>MODENA</option>
                                            <option value=MONZA%20-%20BRIANZA>MONZA - BRIANZA</option>
                                            <option value=NAPOLI>NAPOLI</option>
                                            <option value=NOVARA>NOVARA</option>
                                            <option value=NUORO>NUORO</option>
                                            <option value=OGLIASTRA>OGLIASTRA</option>
                                            <option value=OLBIA-TEMPIO>OLBIA-TEMPIO</option>
                                            <option value=ORISTANO>ORISTANO</option>
                                            <option value=PADOVA>PADOVA</option>
                                            <option value=PALERMO>PALERMO</option>
                                            <option value=PARMA>PARMA</option>
                                            <option value=PAVIA>PAVIA</option>
                                            <option value=PERUGIA>PERUGIA</option>
                                            <option value=PESARO>PESARO</option>
                                            <option value=PESARO URBINO>PESARO URBINO</option>
                                            <option value=PESCARA>PESCARA</option>
                                            <option value=PIACENZA>PIACENZA</option>
                                            <option value=PISA>PISA</option>
                                            <option value=PISTOIA>PISTOIA</option>
                                            <option value=PORDENONE>PORDENONE</option>
                                            <option value=POTENZA>POTENZA</option>
                                            <option value=PRATO>PRATO</option>
                                            <option value=RAGUSA>RAGUSA</option>
                                            <option value=RAVENNA>RAVENNA</option>
                                            <option value=REGGIO CALABRIA>REGGIO CALABRIA</option>
                                            <option value=REGGIO%20EMILIA>REGGIO EMILIA</option>
                                            <option value=RIETI>RIETI</option>
                                            <option value=RIMINI>RIMINI</option>
                                            <option value=ROMA>ROMA</option>
                                            <option value=ROVIGO>ROVIGO</option>
                                            <option value=SALERNO>SALERNO</option>
                                            <option value=SASSARI>SASSARI</option>
                                            <option value=SAVONA>SAVONA</option>
                                            <option value=SIENA>SIENA</option>
                                            <option value=SIRACUSA>SIRACUSA</option>
                                            <option value=SONDRIO>SONDRIO</option>
                                            <option value=TARANTO>TARANTO</option>
                                            <option value=TERAMO>TERAMO</option>
                                            <option value=TERNI>TERNI</option>
                                            <option value=TORINO>TORINO</option>
                                            <option value=TRAPANI>TRAPANI</option>
                                            <option value=TRENTO>TRENTO</option>
                                            <option value=TREVISO>TREVISO</option>
                                            <option value=TRIESTE>TRIESTE</option>
                                            <option value=UDINE>UDINE</option>
                                            <option value=VARESE>VARESE</option>
                                            <option value=VENEZIA>VENEZIA</option>
                                            <option value=VERBANIA>VERBANIA</option>
                                            <option value=VERBANO-CUSIO-OSSOLA>VERBANO-CUSIO-OSSOLA</option>
                                            <option value=VERCELLI>VERCELLI</option>
                                            <option value=VERONA>VERONA</option>
                                            <option value=VIBO VALENTIA>VIBO VALENTIA</option>
                                            <option value=VICENZA>VICENZA</option>
                                            <option value=VITERBO>VITERBO</option>
                                        </SELECT>
                                    </td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<tr>
                                    <td style="text-align:right;" ><span class="bold">NOTE&nbspTIPO&nbsp;CONTATTO&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
                                    <td style="text-align:left;"><textarea name="richiesta" rows="2" cols="55" ><%=text_richiesta%></textarea></td>
                                </tr> 
								<tr><td colspan="3" height="10px"><font color="#FF0000">*</font>campi obbligatori</td></tr>	
								
								<tr><td colspan="2" height="25px"></td></tr>	
                                <tr>
								<td colspan="2" >
								
									<table>
									<tr>
									<td style="text-align:left;">
									<button type="button" onclick="formSubmit2('<%=cdbl(request("id"))%>');" class="btn btn-primary" >MODIFICA&nbsp;APPUNTAMENTO&nbsp;</button>
									</td>	
									<td width="25px">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td style="text-align:left;">
									<%
									vdata=cstr((year(text_dataapp) & right("0" & month(text_dataapp),2) & day(text_dataapp)))
									vluogo=cstr(trim(text_luogoapp))
									vtitolo="KIRON-" & ucase(session("loginprovincia")) & "-" &  cstr(trim(text_titolo))
									vdettagli="APPUNTAMENTO con  : " & ucase(text_cognome) & "  " & ucase(text_nome) & "<br>NOTE : " & text_noteapp
									vora=replace(cstr(text_oraapp),":","")
									if len(vora)=4 then vora=vora & "00"
									vora12=cstr(cint(mid(vora,1,2))+1)
									if len(vora12)=1 then vora12="0" & cstr(vora12)
									vorad=vora12 & mid(vora,3,4)
									vlink="dates=" &  vdata & "T" & vora & "%2F" & vdata & "T" & vorad & "&text=" & vtitolo & "&location=" & vluogo & "&details=" & vdettagli
									vlink=replace(vlink," ","%20")
									%>
									<button type="button" onclick="doSomething('<%=cdbl(request("id"))%>');" class="btn btn-primary" >ESITO&nbsp;APPUNTAMENTO&nbsp;</button>
									</td>
									<td width="25px">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>
									<button type="button" onclick="formSubmit('<%=vlink%>');" class="btn btn-primary" >INSERIMENTO&nbsp;GOOGLE&nbsp;CALENDAR</button>
									<td></tr>
									</table>
									
								</td>
                                </tr>
                            </table>
                            </form>	
								<!---button class="btn btn-primary" onclick="doSomething()">&nbsp;ESITO&nbsp;APPUNTAMENTO&nbsp;</button--->
										
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