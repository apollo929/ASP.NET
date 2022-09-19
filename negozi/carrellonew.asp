<!--#include file="adovbs.inc"-->
<%  
	
	cDBStats = "db/carrello.mdb"
    'Apertura Database Registrazione
	strDSNcar =  "Provider=Microsoft.Jet.OLEDB.4.0;" &_
    "Persist Security Info=False;" &_
    "Data Source=" & Server.MapPath(cDBStats)
    
	Set cn = Server.CreateObject("ADODB.Connection")
	Set cncar = Server.CreateObject("ADODB.Connection")
	'Tabelle Utilita
    Set tbcar = Server.CreateObject("ADODB.Recordset")
		
	'Apertura Db	
	cncar.Open strDSNcar

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.1 Transitional//EN">
<HTML>

<HEAD>
<TITLE>Ufficio Ovest: contatti</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<META NAME="keywords" CONTENT="cartucce , lexmark , cartucce hp , cartucce stampanti , cartucce epson , refill , ricarica cartucce , cartucce lexmark  , cartucce canon , cartucce compatibili , cartucce per stampanti , inchiostro , inchiostri , inchiostro stampanti , cartucce rigenerate , cartucce stampante , rigenerazione cartucce , ricarica cartucce stampanti , cartucce ricaricabili , cartucce inchiostro , cartucce compatibili hp , cartucce stampanti ricariche , stampa foto digitale , cartucce ricaricate , ink refill , refill kit , stampa digitale , canon
ricariche cartucce epson , compatibilità cartucce epson , laboratorio stampa digitale , cartucce cartucce , cartucce ricostruite , rivenditore inchiostro , epson , hp">
<META NAME="Description" CONTENT="www.Ufficio Ovest.it">
<META NAME="Author" CONTENT="WebHouse - 31052 Maserada sul Piave TV">
<link rel="stylesheet" href="_styles.inc">

</HEAD>

<BODY BGCOLOR="#FFFFFF" LEFTMARGIN="0" MARGINWIDTH="0" TOPMARGIN="0" MARGINHEIGHT="0">



					  	<form name="form" action="https://www.ufficiovest.it" method="POST">
						<table border=1 cellspacing=1 cellpadding=2 bordercolorlight=#99CCFF bordercolordark=#FFFFFF width=100% >
						<br>
						<tr>
						<th width="200" align="right" class="navy10" bgcolor="#BBDDFF" ><b>Codice</b> </th>
						<th width="200" align="right" class="navy10" bgcolor="#BBDDFF" ><b>Descrizione</b> </th>
						<th width="20"  align="right" class="navy10" bgcolor="#BBDDFF" ><b>Q.</b> </th>
						<th width="140" align="right" class="navy10" bgcolor="#BBDDFF" ><b>Prezzo totale</b> </th>
						<th width="60"  align="center" class="navy10" bgcolor="#BBDDFF" ><b>Rimuovi</b> </th>
						</tr>
					<%
					
					Sql="Select * from Carrello where Sessionid='" &  Session.SessionID & "' Order by ID Desc"
					tbcar.Open Sql,cncar
					Tot=0
					Do While Not Tbcar.EOF
					  
					  Tot=Tot+Tbcar("prezzo")
					  
					  	%>							
						<tr>
						<td width="200" align="left" class="navy10n" bgcolor=#DDEEFF ><b><%=Tbcar("codice_isp")%></b> </td>
						<td width="200" align="left" class="navy10n" bgcolor=#DDEEFF ><b><%=Tbcar("descrizione")%></b> </td>
						<td width="20"  align="right" class="navy10n" bgcolor=#DDEEFF ><b>PZ.<%=Tbcar("quantita")%></b> </td>
						<td width="140"  align="right" class="navy10n" bgcolor=#DDEEFF ><b>€<%=Tbcar("prezzo")%></b> </td>
						<td width="60"  align="center" class="navy10n" bgcolor=#DDEEFF ><a href=carrello2.asp?tipoID=<%=Tbcar("ID")%>><img border=0 src=img/elimina.gif></a></td>
						</tr>
					<%					
					 Tbcar.MoveNext
					Loop%>		
						<tr>
						<td width="292" height="30" colspan="2" rowspan="2" align="center" valign="middle"  bgcolor=#DDEEFF  >
							<a  class="navy10"  href="carrellonew2.asp">
						 <img src=aagg.gif border=0> 
						  </a>
						</td>
						<td width="292" height="30" class="navy10n" colspan="2" align="right"  bgcolor=#DDEEFF  ><b>Subtotale ordine</b></td>
						<td align="right" class="navy10n" bgcolor=#DDEEFF > <b>€.&nbsp;<%=FormatNUMBER(Tot,2)%></b> </td>
						<td>&nbsp;</td>
						</tr>
						<tr>
						<td width="292" height="30" class="navy10n" colspan="2" align="right"  bgcolor=#DDEEFF  ><b>Spese di Spedizione </b> </td>
						
						<%
						Sped=0
						If Tot>=60 then %>
						<td align="right" class="navy10n" bgcolor=#DDEEFF ><b>Gratis</b></td>
						<% Sped=0
						End if	%>
						
						<%If Tot>=40 and Tot<60 then %>
						<td align="right" class="navy10n" bgcolor=#DDEEFF ><b>€.6</b></td>
						<% Sped=6
						End if	%>


						<%If Tot>0 and Tot<40 then %>
						<td align="right" class="navy10n" bgcolor=#DDEEFF ><b>€.9</b></td>
						<% Sped=9
						End if	%>


						<td>&nbsp;</td>
						</tr>
						
						<tr>
						<td width="292" class="navy10n" bgcolor=#DDEEFF  colspan="2" align="center" valign="middle"  bgcolor=#DDEEFF  ><b>Totale </b>
						</td>
						<td width="292" height="30" class="navy10n" colspan="2" align="right"  bgcolor=#DDEEFF  ><b>Euro</b> </td>
						<td align="right" class="navy10n" bgcolor=#DDEEFF ><b>€.&nbsp;<%=(Tot)+sped%></b></td>
						<td>&nbsp;</td>
						</tr>
						<%Tot1=Tot+sped%>
						<tr>
						<td width="292" class="navy10n" bgcolor=#DDEEFF  colspan="2" align="center" valign="middle"  bgcolor=#DDEEFF  ><b>Totale +Iva 20% </b>
						</td>
						<td width="292" height="30" class="navy10n" colspan="2" align="right"  bgcolor=#DDEEFF  ><b>Euro Iva</b> </td>
						<td align="right" class="navy10n" bgcolor=#DDEEFF ><b>€.&nbsp;<%=FormatNumber((Tot1+ ((Tot1/100)*20)),2)%></b></td>
						<td>&nbsp;</td>
						</tr>
						
						</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" >
				<tr><td>		
				<table width="250" border="1" cellspacing="1" cellpadding="0" Bordercolor=black>
				<tr><td colspan=3 class=bianco11 bgcolor=red>PREZZI SPEDIZIONI</td></tr>
				<tr><td class=nero11>Da €.60 spedizione GRATIS</td></tr>
				<tr><td class=nero11>Da €.40/60 spedizione €.6</td></tr>
				<tr><td class=nero11>Da €.0/40 spedizione €.9</td></tr>
				</table>
				</td><td>
				<a target=_new href=bonifico.asp border=0 ><img src=img/bb.gif border=0></a>
				<a target=_new href=cc.asp border=0 ><img src=img/cc.gif border=0></a>
				</td></tr></table>
					
<BR><BR><p align="justify" class=nero10>
<b>[FATTURAZIONE]</b>
Ad ogni ordine effettuato nel ns sito, o per email,fax o per telefono, corrisponde IN OGNI CASO (privati o titolari di Partita IVA) la fattura accompagnatoria di vendita che viene SEMPRE INVIATA per email .<br>
<b>[MODALITA' DI VENDITA]</b>
Le forme di pagamento accettate da <b>WWW.UFFICIOVEST.IT </b>sono tramite Carta di Credito (Visa, MasterCard),e Bonifico Bancario.<br>
Nel caso di pagamento tramite Carta di Credito, l'accredito verra' effettuato solo al momento della spedizione della merce.<br>
Con il pagamento tramite bonifico bancario, la spedizione della merce avverra' esclusivamente solo dopo che UFFICIOVEST avra' ricevuto via fax conferma dell'avvenuto pagamento tramite copia del bonifico rilasciata dalla banca.<br> Se la conferma di pagamento non sara' inviata entro tre giorni dalla data di ricezione, l'ordine sara' ritenuto annullato.<br>
Il bonifico bancario deve essere emesso a favore di:
						<table width="280" border="1" cellspacing="1" cellpadding="0" Bordercolor=black>
						<tr><td colspan=3 class=bianco11 bgcolor=red>BONICIO BANCARIO</td></tr>
						<tr><td class=nero11>BANCA CENTRO MARCA</td></tr>
						<tr><td class=nero11>ABI 08749 CAB 51960</td></tr>
						<tr><td class=nero11>C/C 17912 CIN=K</td></tr>
						</table>

<b>WWW.UFFICIOVEST.IT </b>fa presente che Gli acquisti tramite carta di credito sono regolati tramite un POS VIRTUALE garantito da un certificato digitale Thawte a 128 bit. Pertanto, le transazioni sono criptate ed i dati contenuti sono del tutto protetti e, di conseguenza, riservati.<br>
Inoltre, gli altri metodi di pagamento come anche l'invio dei dati anagrafici, sono garantiti da un certificato digitale Thawte a 128 bit, sotto il dominio WWW.UFFICIOVEST.IT, messo a disposizione dei propri utenti da parte di UFFICIO OVEST
E' possibile verificare la transazione sicura tramite l'icona di un lucchetto chiuso (o di una chiave) che il browser visualizza nella barra della finestra (in basso).<br>
				
				</font></p>

		

</BODY>
</HTML>
