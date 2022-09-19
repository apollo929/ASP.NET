<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
on error resume next

if trim(Session("Chisono"))="" then response.redirect "accedi.asp"

if Trim(Session("Internet"))<>"TRUE" then
		'DBUTENTE INTERNO							    			    
		queryu="Select * From Registrazione where password1='" & Session("Chisono") & "'"
		Set Tbutu = Server.CreateObject("ADODB.Recordset")	
		Tbutu.Open Queryu,Connm
		if not Tbutu.eof then 									
			text_utente=Tbutu("utente1")
			text_password=Tbutu("password1")
			text_email=Tbutu("Email") & " "
			text_telefono=Tbutu("telefono") & " "
			text_azienda=Tbutu("Ragione") & " "	
			text_partitaiva=Tbutu("PI")	& " "																							
			text_nome=Tbutu("Nome") & " "
			text_cognome=Tbutu("Cognome") & " "	
			text_indirizzo=Tbutu("Indirizzo")& " "
			text_citta=Tbutu("Citta") & " "	
			text_cap=Tbutu("Cap") & " "
			text_provincia=Tbutu("Provincia") & " "
			text_prezzo=Tbutu("Prezzo")
			text_prezzoisp=Tbutu("Prezzoisp")
		end if

else
		'UTENTE INTERNET
												    			    
		queryu="Select * From Registrazioneint where password1='" & Session("Chisono") & "'"
		SET Tbutu=Connm.EXECUTE(queryu) 		
		if not Tbutu.eof then 
			text_utente=Tbutu("utente1")
			text_password=Tbutu("password1")
			text_email=Tbutu("Email") & " "
			text_telefono=Tbutu("telefono") & " "
			text_azienda=Tbutu("Ragione") & " "	
			text_partitaiva=Tbutu("PI")	& " "																							
			text_nome=Tbutu("Nome") & " "
			text_cognome=Tbutu("Cognome") & " "	
			text_indirizzo=Tbutu("Indirizzo")& " "
			text_citta=Tbutu("Citta") & " "	
			text_cap=Tbutu("Cap") & " "
			text_provincia=Tbutu("Provincia") & " "
			text_prezzo=Tbutu("Prezzo")
			text_prezzoisp=Tbutu("Prezzoisp")
		end if

end if 
    
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.1 Transitional//EN">
<HTML>
<HEAD>
<TITLE><%=titolopagina%></TITLE>
<META NAME="keywords" CONTENT="cartucce , lexmark , cartucce hp , cartucce stampanti , cartucce epson , refill , ricarica cartucce , cartucce lexmark  , cartucce canon , cartucce compatibili , cartucce per stampanti , inchiostro , inchiostri , inchiostro stampanti , cartucce rigenerate , cartucce stampante , rigenerazione cartucce , ricarica cartucce stampanti , cartucce ricaricabili , cartucce inchiostro , cartucce compatibili hp , cartucce stampanti ricariche , stampa foto digitale , cartucce ricaricate , ink refill , refill kit , stampa digitale , canon
ricariche cartucce epson , compatibilità cartucce epson , laboratorio stampa digitale , cartucce cartucce , cartucce ricostruite , rivenditore inchiostro , epson , hp">
<!--#include file="head.inc"-->	
</HEAD>
<BODY BGCOLOR="#FFFFFF" LEFTMARGIN="0" MARGINWIDTH="0" TOPMARGIN="0" MARGINHEIGHT="0">
<table width="100%" bgcolor="#FFFFFF"><tr>
<td width="20px"></td>
<td align="left">

	<table cellspacing="0" cellpadding="0" width="300px" border="1" class="tx14 nero">
		<tr><td colspan="2" height="10px">numero ordine <b><%=request("nordine")%></b></td></tr>
		<tr>
			<td class="tx18 rosso"><b>Totale + Iva</b><br></td>
			<td class="tx18 rosso" align="right"><b>&#8364;.&nbsp;<%=session("totcarta")%></b></td>
		</tr>

	</table>
	<br><br>
		
	<table width="600px" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td valign="top">	
	<b><font color=red>ORDINE INVIATO ALL'AMMINISTRATORE CLICCA PER IL PAGAMENTO.</b></font>
	<form action="https://www.paypal.com/it/cgi-bin/webscr" method="post" ID=Form1>
	<input type="hidden" name="cmd" value="_ext-enter" ID=Hidden1>
	<input type="hidden" name="redirect_cmd" value="_xclick" ID=Hidden6> 
	<input type="hidden" name="business" value="<%=Session("cartadicredito")%>" ID=Hidden2>
	<input type="hidden" name="item_name" value="<%=Session("titolobreve")%>" ID=Hidden3>
	<input type="hidden" name="currency_code" value="EUR" ID=Hidden4>
	<input type="hidden" name="email" value="<%=ucase(text_Email)%>" ID=Hidden7>
	<input type="hidden" name="first_name" value="<%=ucase(text_Nome)%>" ID=Hidden8>
	<input type="hidden" name="last_name" value="<%=ucase(text_Cognome)%>" ID=Hidden9>
	<input type="hidden" name="address1" value="<%=ucase(text_Indirizzo)%>" ID=Hidden10>
	<input type="hidden" name="city" value="<%=ucase(text_Citta)%>" ID=Hidden11>
	<input type="hidden" name="state" value="italy" ID=Hidden12>
	<input type="hidden" name="zip" value="<%=ucase(text_Cap)%>" ID=Hidden13>
	<input type="hidden" name="amount" value="<%=Replace(session("totcarta"),",",".")%>" ID=Hidden5>
	<input type="image" src="images/paga-con-paypal.png" name="submit" alt="PayPal. È un sistema rapido, gratuito e sicuro." ID=Image1>
	</form><br>		
	</td></tr></table>
	<br><br>
	<!--#include file="ituoidati.inc" -->
</td>
</tr></table>
</BODY>
</HTML>
