<% 
   if Session("Utentetipo")<>"Amministratore" then
    Response.Redirect "../ingresso.asp"
   end if
%>
<img src=imgnew/testa.jpg><br>
<table>
<tr>
<td valign="top" width="250px">

	<a class="nero10" href="buffetti-gestione.asp"><img border=0 src=imgnew/tasto.gif>&nbsp;GESTIONE PRODOTTI BUFFETTI</a><br>
	<a class="nero10" href="interni-nuovo.asp"><img border=0 src=imgnew/tasto.gif>&nbsp;NUOVO PRODOTTO INTERNO</a><br>
	<a class="nero10" href="interni-gestione.asp"><img border=0 src=imgnew/tasto.gif>&nbsp;GESTIONE PRODOTTI INTERNI</a><br>
	<HR>
	<a class=nero10 href=/negozi/merchant_anagrafica.asp?><img border=0 src=imgnew/tasto.gif>&nbsp;ECOMMERCE MANUALE X ARTICOLI INTERNI</a><br>
	<HR>
	<a class=nero10 href=adutentireg.asp><img border=0 src=imgnew/tasto.gif>&nbsp;GESTIONE UTENTI AREA RISERVATA</a><br>
	<HR><b>UTENTI SITO WEB</b><BR>
	<a class=nero10 href=adutentinternet.asp?><img border=0 src=imgnew/tasto.gif>&nbsp;GESTIONE UTENTI INTERNET (PAGAMENTO CARTA CREDITO/BONIFICO)</a><br>
	<a class=nero10 href=adutentipro.asp><img border=0 src=imgnew/tasto.gif>&nbsp;GESTIONE UTENTI INTERNI PSW=COD_WINCODOY (PAGAMENTO RIBA RICEVUTA BANCARIA)</a><br>
	<HR>
	<HR><b>UTENTI INTERNET E NON GESTIONE CATEGORIE CLIENTI</b><BR>
	<a class=nero10 href=adcategorieclienti.asp><img border=0 src=imgnew/tasto.gif>&nbsp;CATEGORIE CLIENTI </a><br>
	<a class=nero10 href=adcategorieclientiint.asp><img border=0 src=imgnew/tasto.gif>&nbsp;CATEGORIE CLIENTI INTERNET</a><br>
	<HR><b>GESTIONE AGENTI SITO WEB</b><BR>
	<a class=nero10 href=adagenti.asp?><img border=0 src=imgnew/tasto.gif>&nbsp;GESTIONE AGENTI</a><br>
	<a class=nero10 href=adagentiint.asp?><img border=0 src=imgnew/tasto.gif>&nbsp;GESTIONE AGENTI INTERNET</a><br>
	<HR>
	<a class=nero10 href=adutentireg2.asp?><img border=0 src=imgnew/tasto.gif>&nbsp;GESTIONE CONTATTI RICHIESTE ETC</a><br>
	<HR><b>GESTIONE ORDINI</b><BR>
	<a class=nero10 href=adstorico.asp?><img border=0 src=imgnew/tasto.gif>&nbsp;GESTIONE ORDINI VIA WEB</a><br>
	<HR>
	<a class=nero10 href=adcreafacebookshop.asp?><img border=0 src=imgnew/tasto.gif>&nbsp;FACEBOOK VETRINA (MAGAZINE)</a><br>
	<HR>
	<a class=nero10 href=adutenticollegati.asp><img border=0 src=imgnew/tasto.gif>&nbsp;ULTIMI UTENTI COLLEGATI AL SITO WEB (NEW)</a><br>
	<HR>
	<a class=nero10 href=../index.asp><img border=0 src=imgnew/exit.gif>&nbsp;USCITA (LOGOUT)</a><br>
</td>
<td valign="top">
