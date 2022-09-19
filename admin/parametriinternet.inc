<%

'parametri internet prezzi
'OD
Session("Priceisp")="PREZZO1"
'spicers
Session("Prezzo")="PREZZO1"
'buffetti
Session("PrezzoBuffetti")="PREZZO1"
'cwr
Session("Prezzocwr")="NESSUNOLISTINO"
'registrazione Internet
Session("tipoutente")="registrazioneint"
'generali
Session("Internet")="TRUE"
Session("nomeutente")=text_utente
'query inserimento																					    
StrSql="Insert into Registrazioneint (Nome,Cognome,Indirizzo,citta,provincia,telefono,Utente1,Email,Password1,Password2,Ragione,Sede,PI,CF,Cap,Prezzo,Prezzoisp,PrezzoBuffetti,Prezzocwr,Frequenza,data,ricevereofferte) values ('" & text_nome & "','" & text_cognome & "','" & text_indirizzo & "','" & text_citta & "','" & text_provincia & "','" & text_telefono & "','" & text_utente & "','" & text_email & "','" & text_password & "','" & text_password & "','" & text_azienda & "','" & text_indirizzo & "','" & text_partitaiva & "','" & text_codicefiscale & "','" & text_cap & "','" & Session("Prezzo") & "','" & Session("Priceisp") & "','" & Session("PrezzoBuffetti") & "','" & Session("Prezzocwr") & "',1,current_date," & check_newsletter & ")"
Connm.Execute StrSql		
'setta password1(rif.wincody) come idutente_int
Connm.Execute "update registrazioneint set password1=concat(id,'_int') where Utente1='" & text_utente & "' and Password2='" & text_password & "'"
'trova password per ordine
set tblast=Connm.execute("Select Utente1,Password1,Password2 from registrazioneint where Utente1='" & text_utente & "' and Password2='" & text_password & "'")
Session("chisono")=tblast("Password1")
tblast.close
%>
