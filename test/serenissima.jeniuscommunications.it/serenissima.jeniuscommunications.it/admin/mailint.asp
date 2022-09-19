		<!--#include file=connessionesql.inc-->
		<%  	
		on error resume next		
		'Invia un'Email
	    function SendEmail(mailfrom,msgto,subj,body ) 
            if msgto="" then exit function
            if mailfrom="" then exit function
            Dim iMsg
            Dim iConf
            Dim Flds
            Dim strHTML
            Dim strSmartHost
            const cdoSendUsingPort = 2
            const cdoSendUsingPickup = 1
            set iMsg = CreateObject("CDO.Message")
            set iConf = CreateObject("CDO.Configuration")
            set Flds = iConf.Fields
            With Flds
	            .Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = cdoSendUsingPickup
	            .Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory")= "C:\Inetpub\mailroot\Pickup"
	            .Update
            End With
            With iMsg
	            Set .Configuration = iConf
	            .To = msgto
	            .From = mailfrom
	            .Subject = subj
	            .HTMLBody = body
	            .Send
            End With
            set iMsg = Nothing
            set iConf = Nothing
            set Flds = Nothing	
        end function
		
		sSQL="insert into mail_annunci(mail) values('" & mailmit & "')"
		conn.Execute(sSQL) 
		
		'Mail
		mail=Trim(request.form("email"))
		mailmit=Trim(request.form("emailmittente"))
		Dim sValue
 		sValue = Replace(Replace(Request.Form("Editor1"),"'","`"),"\","-")
		testoemail=Trim(sValue)
		tx_cognomenome=Trim(request.form("cognomenome"))
		tx_id=Trim(request.form("id"))
		web=Trim(request.form("web"))
		
		'tolgo sito internet dal testo x utilizzare a pagamento
		Set tagliasito=Server.CreateObject("ADODB.Recordset")
		tsql="Select * From lista where Id='" & session("loginid") & "' union Select * From lista1 where id='" & session("loginid") & "' limit 1" 
		tagliasito.open tsql,conn
		if trim(tagliasito("int_abilitato"))=0 then
			l=len(testoemail)			
			a=instr(testoemail,"www")
			testo=mid(testoemail,a,l)	
			b=instr(testo," ")
			if b<>0 then			
				testo3=mid(testoemail,a,b)	
			else
				b=5
				testo3=mid(testoemail,a,b)	
			end if		
			testof=replace(testoemail,testo3," ")
			testoemail=testof
			
			l=len(testoemail)			
			a=instr(testoemail,"www")
			testo=mid(testoemail,a,l)	
			b=instr(testo," ")
			if b<>0 then			
				testo3=mid(testoemail,a,b)	
			else
				b=5
				testo3=mid(testoemail,a,b)	
			end if		
			testof=replace(testoemail,testo3," ")
			testoemail=testof
		end if
							
		HTML = ""
		HTML = "<!DOCTYPE HTML PUBLIC -//IETF//DTD HTML//EN>" 
		HTML = HTML   & "<html>" 
		HTML = HTML   & "<head><style>A:hover {text-decoration: ; color: black}A {color: black;text-decoration: underline;}BODY{FONT-FAMILY: Verdana;FONT-SIZE: 10pt;MARGIN-TOP: 1px</style>" 
		HTML = HTML   & "<meta http-equiv=Content-Type " 
		HTML = HTML   & "</head>" 
		HTML = HTML   & "<body class=nero10 link=black alink=black vlink=black>"
		HTML = HTML   & "<table border=0><tr>" 
		HTML = HTML   & "<td colspan=2><img src='http://www.costruttori.it/annunci/images/costruttori.bmp' border=0></td></tr>" 
		HTML = HTML   & "<tr><td colspan=2><strong><font color=black size=5 FACE=verdana>RICHIESTA DA PREVENTIVI COSTRUTTORI</font></td></tr>" 
		HTML = HTML   & "<tr><td colspan=2><strong>IL MITTENTE DELL'E-MAIL A RICHIESTO INFORMAZIONI SULL'ANNUNCIO CHE HAI INSERITO</strong></td></tr>"
		HTML = HTML   & "<tr><td colspan=2>&nbsp;</td></tr>"
		HTML = HTML   & "<tr><td><b>INFORMAZIONI:</b></td>"					
		HTML = HTML   & "<td><a href=http://www.costruttori.it/interventi/interventidettaglio.asp?id=" & (tx_id) & ">Clicca per visualizzare i dettagli dell'annuncio</a></td></tr>"
		HTML = HTML   & "<tr><td><b>Sei stato contattato da:</b></td><td>" &(session("sesragione"))&"</td></tr>"
		HTML = HTML   & "<tr><td><b>Provincia:</b></td><td>" &(session("sesprovincia"))&"</td></tr>"
		HTML = HTML   & "<tr><td><b>Sito internet:</b></td><td><a href=http://" & web & "><b>" & web & "</b></a></td></tr>"
		HTML = HTML   & "<tr><td><b>Email:</b></td><td>" &(session("sesmail"))&"</td></tr>"	
		HTML = HTML   & "<tr><td><b>E-mail inviata da: </b></td><td><a href=mailto:" & mailmit &">"& mailmit &"</a></td></tr>"
		
		HTML2=HTML
		HTML2= HTML2   & "<tr><td><b>E-mail inviata a: </b></td><td><a href=mailto:" & mail &">"& mail &"</a></td></tr>"
		HTML2= HTML2   & "<tr><td><b>Id del preventivo: </b></td><td>" &(tx_id)& "</td></tr>"
		HTML2 = HTML2   & "<tr><td colspan=2>&nbsp;</td></tr>"
		HTML2 = HTML2   & "<tr><td colspan=2><b>TESTO E-MAIL:</b></td></tr>"
		HTML2 = HTML2   & "<tr><td colspan=2>" & (testoemail) & "</td></tr>"
		HTML2 = HTML2   & "<tr><td colspan=2>&nbsp;</td></tr>"
		HTML2 = HTML2 & "<tr><td colspan=2><font color=grey size=1 FACE=verdana>Questa newsletter, gratuita ed aperta a tutti gli utenti che ne fanno richiesta, è distribuita, via e-mail, con frequenza quotidiana e contiene le segnalazioni degli aggiornamenti e delle iniziative del sito www.costruttori.it .<br>In riferimento al D. Lgs. 196/2003, i Suoi dati saranno trattati da Costruttori.it al solo fine dell'invio della newsletter, con estrema riservatezza, e non verranno divulgati. La newsletter è inviata individualmente ai singoli interessati anche se trattata con l'ausilio di spedizioni collettive.<br>In ogni momento, sarà possibile essere rimossi dall'elenco dei destinatari opt (out) collegandosi a questo link</font> <a href='http://www.costruttori.it/rimuovi.asp'><b><font color=grey size=1 FACE=verdana>rimozione</font></b></a></td></tr>"	
		HTML2= HTML2 & "</table></body></html>"
		
		HTML = HTML   & "<tr><td colspan=2>&nbsp;</td></tr>"
		HTML = HTML   & "<tr><td colspan=2><b>TESTO E-MAIL:</b></td></tr>"
		HTML = HTML   & "<tr><td colspan=2>" & (testoemail) & "</td></tr>"
		HTML = HTML   & "<tr><td colspan=2>&nbsp;</td></tr>"
		
		HTML1=HTML
		HTML1 = HTML1 & "<tr><td colspan=2><font color=grey size=1 FACE=verdana>Questa newsletter, gratuita ed aperta a tutti gli utenti che ne fanno richiesta, è distribuita, via e-mail, con frequenza quotidiana e contiene le segnalazioni degli aggiornamenti e delle iniziative del sito www.costruttori.it .<br>In riferimento al D. Lgs. 196/2003, i Suoi dati saranno trattati da Costruttori.it al solo fine dell'invio della newsletter, con estrema riservatezza, e non verranno divulgati. La newsletter è inviata individualmente ai singoli interessati anche se trattata con l'ausilio di spedizioni collettive.<br>In ogni momento, sarà possibile essere rimossi dall'elenco dei destinatari opt (out) collegandosi a questo link</font> <a href='http://www.costruttori.it/rimuovi.asp'><b><font color=grey size=1 FACE=verdana>rimozione</font></b></a></td></tr>"	
		HTML1=HTML1 & "</table></body></html>"
		
		HTML = HTML   & "<tr><td colspan=2 align=center>Vuoi rispondere alla seguente e-mail??<br><br><a href=mailto:" & mailmit &"><img src='http://www.costruttori.it/annunci/images/btnRespond.gif' border=0></a></td></tr>"
		
		HTML = HTML & "<tr><td colspan=2><font color=grey size=1 FACE=verdana>Questa newsletter, gratuita ed aperta a tutti gli utenti che ne fanno richiesta, è distribuita, via e-mail, con frequenza quotidiana e contiene le segnalazioni degli aggiornamenti e delle iniziative del sito www.costruttori.it .<br>In riferimento al D. Lgs. 196/2003, i Suoi dati saranno trattati da Costruttori.it al solo fine dell'invio della newsletter, con estrema riservatezza, e non verranno divulgati. La newsletter è inviata individualmente ai singoli interessati anche se trattata con l'ausilio di spedizioni collettive.<br>In ogni momento, sarà possibile essere rimossi dall'elenco dei destinatari opt (out) collegandosi a questo link</font><a href='http://www.costruttori.it/rimuovi.asp'><b><font color=grey size=1 FACE=verdana>rimozione</font></b></a></td></tr>"		
		HTML = HTML & "</font></strong></table></body>" 
		HTML = HTML & "</html>" 
			
		Set cerca=Server.CreateObject("ADODB.Recordset")
		s="Select * From lista where Id='"& session("loginid") &"' union Select * From lista1 where id='" & session("loginid") & "' "
		cerca.open s,conn
		f=cerca("conteggio_email")
		ab=cerca("int_abilitato")
		

									
			Rt=SendEmail(mailmit,mail,"Preventivi Costruttori",HTML)
			Rt1=SendEmail("info@costruttori.it",mailmit,"Preventivi Costruttori",HTML1)
			Rt2=SendEmail("info@costruttori.it","info@costruttori.it","Preventivi Costruttori",HTML2)		
		
			
		tagliasito.close
		cerca.close
		response.redirect("thanx.asp")
		%>
<!--#include file=closesql.inc-->