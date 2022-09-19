<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.8.2.min.js"></script>
<!-- jQuery Popup Overlay -->
<script src="jquery.popupoverlay.js"></script>

<!-- Set defaults -->
<script>
$(document).ready(function () {
    $.fn.popup.defaults.pagecontainer = '.container'
});
</script><!-- Basic -->

<script>
$(document).ready(function () {
  $('#basic').popup({
    autoopen: true, /* per non far aprire al caricamento impostare su false */
    transition: 'all 0.3s',
    scrolllock: true
  });
});
</script>
<script>
$(document).ready(function () {
  $('#active_bg').popup({
    backgroundactive:true
  });
});
</script>
<%      



Function senza_apice(byval txt)
	lt=len(txt)
	tx=""
	for f=1 to lt
		c=mid(txt,f,1)
		if c="'" then
			c="`"
		end if
		tx=tx+c
	next
	senza_apice=tx
End function

'Invia un'Email
function SendEmail(byval strto, byval strsubject, byval strbody)
		
	dim objMessage
    Set objMessage = CreateObject("CDO.Message")
	objMessage.Subject=strsubject		
	objMessage.ReplyTo = strfrom    
	objMessage.Sender  = strfrom  	
	'::::::::::::::::: ATTENZIONE CAMBIARE MITTENTE :::::::::::::::::
	objMessage.From = "info@hatseries.com"
	objMessage.To = strto
	'::::::::::::::::: ATTENZIONE CAMBIARE MITTENTE :::::::::::::::::       
	objMessage.HTMLBody = strbody
	' Configure the send to use another server
	objMessage.Configuration.Fields.Item _
	("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	' Set the name or IP of the remote SMTP Server
	objMessage.Configuration.Fields.Item _
	("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "out.postassl.it"
	' Set the type of authentication to use, NONE, Basic (Base64 encoded), NTLM
	objMessage.Configuration.Fields.Item _
	("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	' Set your UserID on the SMTP server (some SMTP servers require your e-mail address)
	objMessage.Configuration.Fields.Item _
	("http://schemas.microsoft.com/cdo/configuration/sendusername") = "info@hatseries.com"
	' Set your password on the SMTP server
	objMessage.Configuration.Fields.Item _
	("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "$$Hat001"
	' Set the server port (usually 25)
	objMessage.Configuration.Fields.Item _
	("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
	' Set if the connection should use SSL (False or True)
	objMessage.Configuration.Fields.Item _
	("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
	' Set the connection timeout in seconds
	' (the maximum time CDO will try to establish a connection to the SMTP server)
	objMessage.Configuration.Fields.Item _
	("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
	' Save the new configuration settings
	'attach file			
	objMessage.Configuration.Fields.Update
	objMessage.send
end function
		
Modifica=False	



   if  trim(request("modifica"))="modifica" then
			Modifica=True
   
   else  

	
		if Trim(Request("Id"))<>"" then
			'INSERIMENTO											    			    
			queryu="Select * From Registrazioneint where Id=" & cdbl(Request("Id"))
			SET Tbutu=Connm.EXECUTE(queryu) 							   
			text_utente=Tbutu("utente1")
			text_password=Tbutu("password1")
			text_email=Tbutu("Email")
			text_telefono=Tbutu("telefono")
			text_azienda=Tbutu("Ragione")
			text_partitaiva=Tbutu("PI")	
			text_codicefiscale=Tbutu("CF")																						
			text_nome=Tbutu("Nome")
			text_cognome=Tbutu("Cognome")
			text_indirizzo=Tbutu("Indirizzo")
			text_citta=Tbutu("Citta")
			text_cap=Tbutu("Cap")
			text_provincia=Tbutu("Provincia")	
			text_nazione=Tbutu("Nazione")
		Else			
			text_utente=trim(senza_apice(Request.Form("utente")))
			text_password=trim(senza_apice(Request.Form("password")))
			text_email=trim(senza_apice(Request.Form("Email")))
			text_telefono=trim(senza_apice(Request.Form("telefono")))
			text_azienda=senza_apice(Request.Form("Azienda"))
			text_partitaiva=senza_apice(Request.Form("Partitaiva"))		
			text_codicefiscale=senza_apice(Request.Form("codicefiscale"))	
			text_sdi=senza_apice(Request.Form("sdi"))			
			text_nome=senza_apice(Request.Form("Nome"))
			text_cognome=senza_apice(Request.Form("Cognome"))
			text_nazione=senza_apice(Request.Form("Nazione"))
			text_indirizzo=senza_apice(Request.Form("Indirizzo"))
			text_citta=senza_apice(Request.Form("Citta"))
			text_cap=senza_apice(Request.Form("Cap"))
			text_provincia=senza_apice(Request.Form("Provincia"))
			check_newsletter=request("newsletter")		
			response.write(request("nazione"))
			'response.end
			
			valoreazienda=""
			valoreprivato="checked"
			if check_newsletter="" then check_newsletter="0"			
			
			errore="false"
			'controllo
			if request("tasto")<>"" then				
				verrore=" "
				rossi=""
			    Modifica=True				
				if trim(request("aziendacc"))="1" then
					if text_partitaiva="" then
					 errore="true"
					 rossi=rossi & "partitaiva,"
					 verrore=verrore & "Partitaiva è obbligaoria ,"
					end if  
					valoreazienda="checked"
					valoreprivato=""	
					'response.write(text_provincia & "----------")
					'response.end
					if text_azienda="" then
					 errore="true"
					 rossi=rossi & "ragione sociale,"
					 verrore=verrore & "ragione sociale ,"
					end if 					
				else		
					valoreazienda=""				
					valoreprivato="checked"				
				end if
				if text_codicefiscale="" then
				 errore="true"
				 rossi=rossi & "codicefiscale,"
				 verrore=verrore & "Codicefiscale è obbligatorio ,"
				end if  
				if text_sdi="" then
				 errore="true"
				 rossi=rossi & "sdi,"
				 verrore=verrore & "SDI  è obbligatorio ,"
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
				if text_indirizzo="" then
				 errore="true"
				 rossi=rossi & "indirizzo,"
				 verrore=verrore & "Indirizzo ,"
				end if  
				if text_citta="" then
				 errore="true"
				 rossi=rossi & "citta,"
				 verrore=verrore & "Citta ,"
				end if  
				if text_cap="" then
				 errore="true"
				 rossi=rossi & "cap,"
				 verrore=verrore & "CAP ,"
				end if 				
				if text_provincia="" then
				 errore="true"
				 rossi=rossi & "provincia,"
				 verrore=verrore & "Provincia ,"
				end if  
				num=instr(1,cstr(text_email),"@") 
				if len(trim(text_email))=0 or num=0 then
				 errore="true"
				 rossi=rossi & "email,"
				 verrore=verrore & "Mail ,"
				else
					if text_email="" then
					 errore="true"
					 rossi=rossi & "email,"
					 verrore=verrore & "Mail ,"
					end if   
				end if	
				if text_telefono="" then
				 errore="true"
				 rossi=rossi & "telefono,"
				 verrore=verrore & "Telefono ,"
				end if  

				if request("checktext")<>session("checktext") then
					errore="true"
					rossi=rossi & "codice,"
					verrore=verrore & "Codice di conferma errato , "
				end if
				if request("privacy")<>"1" then
					errore="true"
					verrore=verrore & "Devi accettare il trattamento dei dati personali per poterti iscrivere , "
				end if
			end if
			
			if errore="false" and trim(request("tasto"))="invia" and text_utente<>"" and  text_password<>"" and  text_email<>"" then
													
				query="Select * From Registrazioneint where utente1='" & text_utente & "' or password2='" & text_password & "'"
				SET Tbut=Connm.EXECUTE(query) 
				 
				b=tbut.eof
				if b then
					query="Select * From Registrazione where utente1='" & text_utente & "' or password2='" & text_password & "'"
					SET Tbut=Connm.EXECUTE(query) 
					b=tbut.eof
				end if        	 
				if b then 
			
					'mail=Trim(request.form("mail"))
																		
					HTML = ""
					HTML = "<!DOCTYPE HTML PUBLIC -//IETF//DTD HTML//EN>" 
					HTML = HTML   & "<html>" 
					HTML = HTML   & "<head>" 
					HTML = HTML   & "<meta http-equiv=Content-Type>" 
					HTML = HTML   & "</head>"													
					HTML = HTML & "<body style='font-size=10;color:#000000;font-family:arial;'>"
					HTML = HTML & "<img src='" & sitourl & sitourllogo &"' height='105px;'><br>"	
					HTML = HTML & "<hr style='border-top: 0.2px solid #000000;'>"		
					HTML = HTML & "Rag.Sociale  : " & text_azienda   & "<br>"								
					HTML = HTML & "Partita Iva : " & text_partitaiva & "<br>"		
					HTML = HTML & "Codice fiscale : " & text_codicefiscale & "<br>"	
					HTML = HTML & "SDI : " & text_sdi & "<br>"						
					HTML = HTML & "Nome      : " & text_nome       & "<br>"								
					HTML = HTML & "Cognome   : " & text_cognome    & "<br>"								
					HTML = HTML & "Indirizzo : " & text_indirizzo  & "<br>"								
					HTML = HTML & "Citta     : " & text_citta      & "<br>"		
					HTML = HTML & "Cap     : " & text_cap      & "<br>"							
					HTML = HTML & "Provincia : " & text_provincia  & "<br>"								
					HTML = HTML & "Telefono  : " & text_telefono   & "<br>"								
					HTML = HTML & "Mail      : " & text_email   & "<br><hr style='border-top: 0.2px solid #000000;'>"										
					HTML = HTML & "<b style='font-size=14;color:#000000;font-family:arial;' >Utente: "  & text_utente   & "<br>"								
					HTML = HTML & "Password : "  & text_password   & "</b><br>"	
					HTML = HTML & "<hr style='border-top: 0.2px solid #000000;'><br>"
					HTML = HTML & "<br><a style='font-size=10;color:#000000;' href='" & sitourl & "confermamail.asp?mail=" & trim(text_email) & "'><b> PER ACCEDERE AL SITO DEVI CONFERMARE LA TUA MAIL (CLICCA QUI) </b></a><br><br><br>" 					
					HTML = HTML & "SE VI SONO ERRORI .... <a style='font-size=10;color:#000000;' href='" & sitourl & "contattaci.asp'>CONTATTACI TRAMITE FORM...</a> <br>"																												
					HTML = HTML & "</body>" 
					HTML = HTML & "</html>"
					
					Rt=SendEmail(text_email,"ISCRIZIONE " & titolobreve,HTML)
					Rt1=SendEmail(spedizionemail,"ISCRIZIONE " & titolobreve,HTML)
					
					%>
					<!--#include file="parametriinternet.inc" -->
					
			<%
			        response.Redirect("registratilogin.asp#topage")
			Else 
			errore="true"
			 verrore=verrore & "Nome utente o password non validi o già registrati ,"
			 %>
			 

			   <%Modifica=False%>
			
			<%End if		    
					
			Else 
				
			   %>
						
<%    
		   End If				
		end if
	End If					
    
	'Tabelle Utilita Registrazione
	Set tbpro = Server.CreateObject("ADODB.Recordset")	
	Set tbreg = Server.CreateObject("ADODB.Recordset")	
	Set tbproall = Server.CreateObject("ADODB.Recordset")	
		    
    'Apertura Database Italia
    'Visuaprovincie
    Sqlpro="Select * From Italia_Province order by Provincia"       
    tbpro.Open Sqlpro,conn    

		
	
	%>

<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->  
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>REGISTRATI <%=Session("ragionesocialetesto")%></h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <%if mobile<>"ok" then %> 
    <div class="single-product-area">
	<%else%>
	<div class="single-product-area2">
	<%end if%>
        <div class="zigzag-bottom"></div>
        <div class="container">
                <div class="col-md-4">
				<!--#include file="menusx.inc" -->		
					
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">		
										
							
											     
				<table width="100%" cellpadding="0" cellspacing="0">
			
					<tr>
						<td  valign="top" align="center">
							<table width="98%" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center">
									
										<script language="javascript">
											function mostraazienda(val)		{
											    //alert(val);
												document.getElementById('varcitta_1').style.display = "block";
												if (val === undefined) {
												document.formuu.sdi.value='';	
												}
												else {
												document.formuu.sdi.value=val;	
												};																							
												}
											function mostraprivato()		{
											    //alert(0);
												document.getElementById('varcitta_1').style.display = "none";
												document.formuu.sdi.value="0000000";												
												}												
										</script>										
									
										<form action="registrati.asp?tasto=invia#topage" method="post" id=formuu name=formuu>
										  <table border="0" cellpadding="0" cellspacing="0" width="98%" class="tx1 grigio_scuro">
											<tr> 
											  <td colspan="2" align="center">

											  <%																					  
											  if errore="false" then%>
												 <%If Modifica=false then %>
													<!---font color="#ff0000"><br><strong>REGISTRAZIONE AVVENUTA CON SUCCESSO! ECCO I TUOI DATI!<br>
													LO STAFF RINGRAZIA PER LA SCELTA<br></strong></font--->
												<%End If%>
											  <%else%>
												  <% if request("tasto")<>"" then%>
												  <font color="#ff0000"><b><center class=nero10>Errori >>>><% Response.write(ucase(verrore)) %>    </center></b></font>
												  <%end if%>
											  <%end if%>
											  <% if request("tasto")="BLOCCO" then%>												 
													<div id="basic" class="well" style="max-width:44em;"> 
													<button class="basic_close btn btn-default"><img src="images/modulo-registrati.jpg" border=0></button><br>
													<button class="basic_close btn btn-default">chiudi</button>
													</div>
											  <%end if%>											  
											 </td>
											</tr>
											<tr><td colspan="2" align="center" height="10px"><input     type="radio" <%=valoreazienda%> id="aziendacc" name="aziendacc" value="1" onload="mostraazienda();" onclick="mostraazienda();" ><span class="tx4 grigio">&nbsp;&nbsp;azienda&nbsp;&nbsp;&nbsp;</span><input type="radio" <%=valoreprivato%> id="aziendacc" name="aziendacc" value="99" onload="mostraprivato();" onclick="mostraprivato();"><span class="tx4 grigio">&nbsp;&nbsp;privato&nbsp;&nbsp;&nbsp;</span></td></tr>
											<tr><td colspan="2" height="10px"></td></tr>
											<tr><td colspan="2" height="1px" bgcolor="#ff0000"></td></tr> 
											<tr><td colspan="2" height="10px"></td></tr>
											<tr>
												<td>ISCRIZIONE TIPOLOGIE</td>
												<td>
													<select id="tipoutente" name="tipoutente" style="font-size:18px;">
														<option <%if request("opzione")="1" then response.write("selected")%> value="1">Socio Ordinario   –  AICS 2022 &nbsp;60&nbsp;&#8364.</option>
														<option <%if request("opzione")="2" then response.write("selected")%> value="2">Socio Sostenitore –  AICS 2022 &nbsp;80&nbsp;&#8364.</option>
														<option <%if request("opzione")="3" then response.write("selected")%> value="3">Socio Ordinario   –  AICS 2022 + tessera FMI Member &nbsp;100&nbsp;&#8364.</option>
														<option <%if request("opzione")="4" then response.write("selected")%> value="4">Socio Sostenitore -  AICS 2022 + tessera FMI Member &nbsp;120&nbsp;&#8364.</option>
													</select>
												</td>
											</tr>	
											<tr><td height="5px"></td></tr>											
											<%
											bg=""
											if instr(rossi,"cognome,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>> 
											  <td align=left width="160px">&nbsp;Cognome / Referente:<font color="#ff0000">*</font></td>
											  <td align=left ><input  type="text"  size="35"   id="cognome" maxlength="125" name="cognome" value="<%=text_Cognome%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<%
											bg=""
											if instr(rossi,"nome,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>> 
											  <td align=left >&nbsp;Nome:<font color="#ff0000">*</font></td>
											  <td align=left ><input  type="text"  size="35"   id="nome" maxlength="125" name="nome" value="<%=text_Nome%>"></td>
											</tr>
											<tr><td colspan="2" height="10px"></td></tr>
											<tr><td colspan="2" height="1px" bgcolor="#ff0000"></td></tr> 
											<tr><td colspan="2" height="10px"></td></tr>
											<tr><td colspan="2">
											
											
											<div id="varcitta_1"  style="display:block;">
											<table border="0" cellpadding="0" align="left" cellspacing="0" width="100%" class="tx1 grigio_scuro">
											<%
											bg=""
											if instr(rossi,"ragione sociale,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>>
											  <td width="160px" align="left">&nbsp;Nome Azienda <br>(ragione sociale):<font color="#ff0000">*</font></td>
											  <td align="left" valign="bottom" ><input id="Azienda" size=45 maxlength="125"  type="text"  name="Azienda" value="<%=text_Azienda%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>																							
											<%
											bg=""
											if instr(rossi,"partitaiva,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Partita Iva:<font color="#ff0000">*</font></td>
											  <td align=left ><input size="35"   type="text"  id="Partitaiva" maxlength="125" name="Partitaiva" value="<%=text_Partitaiva%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											</table>
											</div>
											
											
											</td></tr>	
											
											
											
											<%
											bg=""
											if instr(rossi,"codicefiscale,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Cod.Fiscale:<font color="#ff0000">*</font></td>
											  <td align=left ><input size="35"  type="text"   id="Codicefiscale" maxlength="125" name="Codicefiscale" value="<%=text_codicefiscale%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<%
											
											bg=""
											if instr(rossi,"sdi,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Cod.SDI(fatt.elettronica):<font color="#ff0000">*</font></td>
											  <td align=left ><input size="35" type="text"   id="sdi" name="sdi" value="<%=text_sdi%>">
											  </td>
											</tr>
											<tr><td colspan="2" height="10px"></td></tr>
											<tr><td colspan="2" height="1px" bgcolor="#ff0000"></td></tr> 
											<tr><td colspan="2" height="10px"></td></tr>
											<%
											
											bg=""
											if instr(rossi,"indirizzo,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>> 
											  <td align=left >&nbsp;Indirizzo:<font color="#ff0000">*</font></td>
											  <td align=left ><input  type="text"   id="text_3" maxlength="130" name="indirizzo" size=45 value="<%=text_Indirizzo%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<%
											bg=""
											if instr(rossi,"citta,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Città/Comune:<font color="#ff0000">*</font></td>
											  <td align=left ><input  type="text"   size="35" id="citta" name="citta" maxlength="145" value="<%=text_Citta%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<%
											bg=""
											if instr(rossi,"cap,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Cap:<font color="#ff0000">*</font></td>
											  <td align=left ><input  type="text"   size="8" id="cap" name="cap" maxlength="15" value="<%=text_Cap%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
										<%
											bg=""
											if instr(rossi,"nazione,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Nazione:<font color="#ff0000">*</font></td>
											  <td align=left >	
													<select id="nazione" name="nazione" style="text-transform:uppercase;">
													<option value="">seleziona</option>
													<option value="afghanistan">afghanistan</option>
													<option value="albania">albania</option>
													<option value="algeria">algeria</option>
													<option value="andorra">andorra</option>
													<option value="angola">angola</option>
													<option value="antarctica">antartico</option>
													<option value="antigua and barbuda">antigua e barbuda</option>
													<option value="arabia saudita">arabia saudita</option>
													<option value="argentina">argentina</option>
													<option value="armenia">armenia</option>
													<option value="australia">australia</option>
													<option value="australia - isola christmas">australia - isola christmas</option>
													<option value="australia - isola norfolk">australia - isola norfolk</option>
													<option value="australia - isole cocos">australia - isole cocos</option>
													<option value="australia - isole heard e mcdonalds">australia - isole heard e mcdonald</option>
													<option value="austria">austria</option>
													<option value="azerbaijan">azerbaijan</option>
													<option value="bahamas">bahamas</option>
													<option value="bahrain">bahrain</option>
													<option value="bangladesh">bangladesh</option>
													<option value="barbados">barbados</option>
													<option value="belgium">belgio</option>
													<option value="belize">belize</option>
													<option value="benin">benin</option>
													<option value="bhutan">bhutan</option>
													<option value="bielorussia">bielorussia</option>
													<option value="bolivia">bolivia</option>
													<option value="bosnia erzegovina">bosnia erzegovina</option>
													<option value="botswana">botswana</option>
													<option value="brasile">brasile</option>
													<option value="brunei">brunei</option>
													<option value="bulgaria">bulgaria</option>
													<option value="burkina faso">burkina faso</option>
													<option value="burundi">burundi</option>
													<option value="cambodia">cambogia</option>
													<option value="camerun">camerun</option>
													<option value="canada">canada</option>
													<option value="cape verde">capo verde</option>
													<option value="ciad">ciad</option>
													<option value="cile">cile</option>
													<option value="cina">cina</option>
													<option value="cina - hong kong">cina - hong kong</option>
													<option value="china macau">cina - macao</option>
													<option value="cipro">cipro</option>
													<option value="citta' del vaticano">citta' del vaticano</option>
													<option value="colombia">colombia</option>
													<option value="comore">comore</option>
													<option value="corea del nord">corea del nord</option>
													<option value="corea del sud">corea del sud</option>
													<option value="costa d'avorio">costa d'avorio</option>
													<option value="costa rica">costa rica</option>
													<option value="croazia">croazia</option>
													<option value="cuba">cuba</option>
													<option value="danimarca">danimarca</option>
													<option value="danimarca - isole faroe">danimarca - isole faroe</option>
													<option value="dominica">dominica</option>
													<option value="ecuador">ecuador</option>
													<option value="egypt">egitto</option>
													<option value="el salvador">el salvador</option>
													<option value="emirati arabi uniti">emirati arabi uniti</option>
													<option value="eritrea">eritrea</option>
													<option value="estonia">estonia</option>
													<option value="etiopia">etiopia</option>
													<option value="figi">figi</option>
													<option value="filippine">filippine</option>
													<option value="finlandia">finlandia</option>
													<option value="finlandia - isole aland">finlandia - isole aland</option>
													<option value="francia">francia</option>
													<option value="francia - guadalupa">francia - guadalupa</option>
													<option value="francia - guyana francese">francia - guyana francese</option>
													<option value="francia - martinica">francia - martinica</option>
													<option value="francia - mayotte">francia - mayotte</option>
													<option value="francia - nuova caledonia">francia - nuova caledonia</option>
													<option value="francia - polinesia francese">francia - polinesia francese</option>
													<option value="france reunion">francia - reunion</option>
													<option value="ffrancia - saint pierre e miquelon">francia - saint pierre e miquelon</option>
													<option value="francia - territori francesi meridionali">francia - territori francesi meridionali</option>
													<option value="francia - wallis e futuna<">francia - wallis e futuna</option>
													<option value="gabon">gabon</option>
													<option value="gambia">gambia</option>
													<option value="georgia">georgia</option>
													<option value="germania">germania</option>
													<option value="ghana">ghana</option>
													<option value="giamaica">giamaica</option>
													<option value="giappone">giappone</option>
													<option value="gibuti">gibuti</option>
													<option value="giordania">giordania</option>
													<option value="grecia">grecia</option>
													<option value="grenada">grenada</option>
													<option value="groenlandia">groenlandia</option>
													<option value="guatemala">guatemala</option>
													<option value="guinea">guinea</option>
													<option value="guinea equatoriale">guinea equatoriale</option>
													<option value="guinea-bissau">guinea-bissau</option>
													<option value="guyana">guyana</option>
													<option value="haiti">haiti</option>
													<option value="honduras">honduras</option>
													<option value="india">india</option>
													<option value="indonesia">indonesia</option>
													<option value="iran">iran</option>
													<option value="iraq">iraq</option>
													<option value="irlanda">irlanda</option>
													<option value="islanda">islanda</option>
													<option value="isole marshall">isole marshall</option>
													<option value="isole salomone">isole salomone</option>
													<option value="israele">israele</option>
													<option value="italia" selected >italia</option>
													<option value="kazakhstan">kazakistan</option>
													<option value="kenya">kenya</option>
													<option value="kirghizistan">kirghizistan</option>
													<option value="kiribati">kiribati</option>
													<option value="kuwait">kuwait</option>
													<option value="laos">laos</option>
													<option value="lesotho">lesotho</option>
													<option value="lettonia">lettonia</option>
													<option value="libano">libano</option>
													<option value="liberia">liberia</option>
													<option value="libia">libia</option>
													<option value="liechtenstein">liechtenstein</option>
													<option value="lituania">lituania</option>
													<option value="lussemburgo">lussemburgo</option>
													<option value="macedonia">macedonia</option>
													<option value="madagascar">madagascar</option>
													<option value="malawi">malawi</option>
													<option value="maldive">maldive</option>
													<option value="malesia">malesia</option>
													<option value="mali">mali</option>
													<option value="malta">malta</option>
													<option value="morocco">marocco</option>
													<option value="mauritania">mauritania</option>
													<option value="mauritius">mauritius</option>
													<option value="messico">messico</option>
													<option value="micronesia">micronesia</option>
													<option value="moldavia">moldavia</option>
													<option value="mongolia">mongolia</option>
													<option value="montenegro">montenegro</option>
													<option value="mozambique">mozambico</option>
													<option value="myanmar">myanmar</option>
													<option value="namibia">namibia</option>
													<option value="nauru">nauru</option>
													<option value="nepal">nepal</option>
													<option value="nicaragua">nicaragua</option>
													<option value="niger">niger</option>
													<option value="nigeria">nigeria</option>
													<option value="norvegia">norvegia</option>
													<option value="norvegia - isola bouvet">norvegia - isola bouvet</option>
													<option value="norvegia - svalbard">norvegia - svalbard</option>
													<option value="nuova zelanda">nuova zelanda</option>
													<option value="nuova zelanda - isole cook">nuova zelanda - isole cook</option>
													<option value="nuova zelanda - niue">nuova zelanda - niue</option>
													<option value="nuova zelanda - tokelau">nuova zelanda - tokelau</option>
													<option value="olanda">olanda</option>
													<option value="oman">oman</option>
													<option value="paesi bassi">paesi bassi</option>
													<option value="paesi bassi - antille olandesi">paesi bassi - antille olandesi</option>
													<option value="paesi bassi - aruba">paesi bassi - aruba</option>
													<option value="pakistan">pakistan</option>
													<option value="palau">palau</option>
													<option value="palestine">palestina</option>
													<option value="panama">panama</option>
													<option value="papua nuova guinea">papua nuova guinea</option>
													<option value="paraguay">paraguay</option>
													<option value="peru">peru'</option>
													<option value="polonia">polonia</option>
													<option value="puerto rico">porto rico</option>
													<option value="portogallo">portogallo</option>
													<option value="principato di monaco">principato di monaco</option>
													<option value="qatar">qatar</option>
													<option value="regno unito">regno unito</option>
													<option value="regno unito - anguilla">regno unito - anguilla</option>
													<option value="regno unito - bermuda">regno unito - bermuda</option>
													<option value="regno unito - gibilterra">regno unito - gibilterra</option>
													<option value="regno unito - guernsey">regno unito - guernsey</option>
													<option value="regno unito - isola di man">regno unito - isola di man</option>
													<option value="regno unito - isole cayman">regno unito - isole cayman</option>
													<option value="regno unito - isole falkland">regno unito - isole falkland</option>
													<option value="regno unito - isole pitcairn">regno unito - isole pitcairn</option>
													<option value="regno unito - isole sandwich meridionali">regno unito - isole sandwich meridionali</option>
													<option value="regno unito - isole turks e caicos">regno unito - isole turks e caicos</option>
													<option value="regno unito - isole vergini britanniche">regno unito - isole vergini britanniche</option>
													<option value="regno unito - jersey">regno unito - jersey</option>
													<option value="regno unito - montserrat">regno unito - montserrat</option>
													<option value="regno unito - sant'elena">regno unito - sant'elena</option>
													<option value="regno unito - terr. britannico dell'oceano indiano">regno unito - terr. britannico dell'oceano indiano</option>
													<option value="repubblica ceca">repubblica ceca</option>
													<option value="repubblica centrafricana">repubblica centrafricana</option>
													<option value="repubblica del congo">repubblica del congo</option>
													<option value="repubblica democratica del congo (ex zaire)">repubblica democratica del congo (ex zaire)</option>
													<option value="repubblica di san marino">repubblica di san marino</option>
													<option value="repubblica dominicana">repubblica dominicana</option>
													<option value="romania">romania</option>
													<option value="ruanda">ruanda</option>
													<option value="russia">russia</option>
													<option value="sahara occidentale">sahara occidentale</option>
													<option value="saint vincent e grenadines">saint vincent e grenadines</option>
													<option value="samoa">samoa</option>
													<option value="saint vincent e grenadines">san kitts e nevis</option>
													<option value="santa lucia">santa lucia</option>
													<option value="sao tome e principe">sao tome e principe</option>
													<option value="senegal">senegal</option>
													<option value="serbia">serbia</option>
													<option value="seychelles">seychelles</option>
													<option value="sierra leone">sierra leone</option>
													<option value="singapore">singapore</option>
													<option value="siria">siria</option>
													<option value="slovacchia">slovacchia</option>
													<option value="slovenia">slovenia</option>
													<option value="somalia">somalia</option>
													<option value="spagna">spagna</option>
													<option value="sri lanka">sri lanka</option>
													<option value="stati uniti d'america">stati uniti d'america</option>
													<option value="stati uniti d'america - guam">stati uniti d'america - guam</option>
													<option value="stati uniti d'america - isole marianne settentrionali">stati uniti d'america - isole marianne settentrionali</option>
													<option value="stati uniti d'america - isole periferiche secondarie">stati uniti d'america - isole periferiche secondarie</option>
													<option value="stati uniti d'america - isole vergini statunitensi">stati uniti d'america - isole vergini statunitensi</option>
													<option value="stati uniti d'america - samoa americane">stati uniti d'america - samoa americane</option>
													<option value="sud africa">sud africa</option>
													<option value="sudan">sudan</option>
													<option value="suriname">suriname</option>
													<option value="svezia">svezia</option>
													<option value="svizzera">svizzera</option>
													<option value="swaziland">swaziland</option>
													<option value="tagikistan">tagikistan</option>
													<option value="tailandia">tailandia</option>
													<option value="taiwan">taiwan</option>
													<option value="tanzania">tanzania</option>
													<option value="timor dell'est">timor dell'est</option>
													<option value="togo">togo</option>
													<option value="tonga">tonga</option>
													<option value="trinidad e tobago">trinidad e tobago</option>
													<option value="tunisia">tunisia</option>
													<option value="turchia">turchia</option>
													<option value="turkmenistan">turkmenistan</option>
													<option value="tuvalu">tuvalu</option>
													<option value="ucraina">ucraina</option>
													<option value="uganda">uganda</option>
													<option value="ungheria">ungheria</option>
													<option value="uruguay">uruguay</option>
													<option value="uzbekistan">uzbekistan</option>
													<option value="vanuatu">vanuatu</option>
													<option value="venezuela">venezuela</option>
													<option value="vietnam">vietnam</option>
													<option value="yemen">yemen</option>
													<option value="zambia">zambia</option>
													<option value="zimbabwe">zimbabwe</option>
													</select>											
												</tr>
											<tr><td height="5px"></td></tr>											
											<%
											bg=""
											if instr(rossi,"provincia,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Provincia:<font color="#ff0000">*</font></td>
											  <td align=left >
											  <select  id="Provincia" name="Provincia">
											      <option value="ESTERO">ESTERO</option>
												  <option selected value="<%=text_provincia%>" ><%=text_provincia%></option>
												  <% Do While not tbpro.EOF %>
												  <option value="<%=ucase(tbpro("Provincia"))%>"><%=ucase(tbpro("Provincia"))%></option>
												  <% tbpro.MoveNext
													 Loop%>
												</select></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<%
											bg=""
											if instr(rossi,"email,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;E-Mail:<font color="#ff0000">*</font></td>
											  <td align=left ><input   type="text"  id="text_6"   name="email" size=45 value="<%=text_Email%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<%
											bg=""
											if instr(rossi,"telefono,")>0 then
												bg="bgcolor='#ff0000'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Telefono/ Cellulare/ Fax:<font color="#ff0000">*</font></td>
											  <td align=left ><input  type="text"   id="telefono" maxlength="130" name="telefono" size=45 value="<%=text_telefono%>"></td>
											</tr>
											
							
											<tr><td colspan="2" height="10px"></td></tr>
											<tr><td colspan="2" height="1px" bgcolor="#ff0000"></td></tr> 
											<tr><td colspan="2" height="10px"></td></tr>
											
											<tr> 
											  <td valign=center align=left colspan=2> 
											  
											  <table cellspacing="0" cellpadding="0" width="350" class="tx1 grigio_scuro" border="0">
												  <%If Modifica=True then %>
												  <tr> 
													<td colspan="2" align="left"><b class="tx2">LA TUA USER-ID</b></td>
												  </tr>
												  <%Else%>
												  <tr> 
													<td colspan=2 align=left><b>INSERISCI 
													  UNA TUA USER-ID</b></td>
												  </tr>
												  <%End if%>
												  <%
													bg=""
													if instr(rossi,"userid,")>0 then
														bg="bgcolor='#ff0000'"
													end if
													%>
													<tr <%=bg%>>
													<td align=left>&nbsp;Utente<font color="#ff0000">*</font></td>
													<td align=left>&nbsp; <input  type="text"  size="35" id="Utente" maxlength="125" name="Utente" value="<%=text_utente%>"></td>
												  </tr>
												  <tr><td height="5px"></td></tr>
												  <%
													bg=""
													if instr(rossi,"password,")>0 then
														bg="bgcolor='#ff0000'"
													end if
													%>
													<tr <%=bg%>>
													<td align=left>&nbsp;Password<font color="#ff0000">*</font></td>
													<td align=left>&nbsp; <input type="password" size="35" id="Password" maxlength="125" name="Password" value="<%=text_Password%>"></td>
												  </tr>
												  <tr> 
													<td colspan="2" align="left"><br>&nbsp;<strong class="tx2">Codice di conferma:</strong>
														<%
														session("checktext")="" 
														randomize
														session("checktext")=CInt ( ( 9 * Rnd() ) + 0) & CInt ( ( 9 * Rnd() ) + 0) & CInt ( ( 9 * Rnd() ) + 0) & CInt ( ( 9 * Rnd() ) + 0) 
														response.Write("<font class='tx5 arancione_scuro' >" & session("checktext") & "</font>")
														%>
													<br><br>
													</td>
												  </tr>
												  <%
													bg=""
													if instr(rossi,"conferma,")>0 then
														bg="bgcolor='#ff0000'"
													end if
													%>
													<tr <%=bg%>>
													<td colspan=2 align=left>&nbsp;Ricopialo qui <input type="text" size="8"   id="checktext" maxlength="4" name="checktext"></td>
												  </tr>
												</table></td>
											</tr>
											
											
											<tr><td colspan="2" height="10px"></td></tr>
											<tr><td colspan="2" height="1px" bgcolor="#ff0000"></td></tr> 
											<tr><td colspan="2" height="10px"></td></tr>
											
											<tr> 
											<td valign="center" align="left" colspan="2">
											
											<table cellspacing="0" cellpadding="0" width="350" align="left" class="tx1 grigio_scuro">
											<tr>
											  <td align="left">
											  In esecuzione D.Lgs. 30.06.2003 n. 
												196, recante disposizioni a tutela delle persone e degli altri soggetti rispetto 
												al trattamento dei dati personali, dichiaro di aver letto  apposita <A href="privacy.asp" target="_new" class="tx1 azzurro lnk">informativa</A> e fornisco il consenso al trattamento dei miei 
												dati personali.<br>
												<input type="radio" checked id="privacy0" name="privacy" value="1" <% if request("privacy")="1" then response.write " checked=""checked"" "%> >Accetto
											  &nbsp;&nbsp;&nbsp;
											  <input type="radio" id="privacy1" name="privacy" value="0" <% if request("privacy")="0" then response.write " checked=""checked"" "%>  >Non accetto<br><br>
											  </td></tr>
											  <tr><td>
											   Acconsento a ricevere comunicazioni su novità e promozioni 
												aziendali. (Per rimuoversi >>> <a class="tx1 azzurro lnk" href='MAILTO:<%=rimozionemail%>'><%=rimozionemail%></a>
												<br>
												<input type="radio" checked id="newsletter0" name="newsletter" value="1" <% if request("newsletter")="1" then response.write " checked=""checked"" "%> >Accetto
											  &nbsp;&nbsp;&nbsp;
											  <input type="radio" id="newsletter1" name="newsletter" value="0" <% if request("newsletter")="0" then response.write " checked=""checked"" "%> >Non accetto
											   </td>
											  </tr></table>
											</tr>
											<tr><td height="20px"></td></tr>
											<tr><td colspan="2" align="left">&nbsp;<input type="submit"  class="rettangolo_rosso" id="image1" name="image1" value="Registrati ora."></td></tr>
										  </table>
											  <%
											  'response.write(trim(request("aziendacc")))
											  if valoreazienda="checked" then %>										  
												  <script>
												  mostraazienda('<%=text_sdi%>');
												  </script>
											  <%end if
											  if valoreprivato="checked" then %>										  
												  <script>
												  mostraprivato();
												  </script>											  
											  <%end if%>
											  										  
										</form>
										
									
									
									
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td  ></td></tr>
				</table>
							
	
	
                            </div>



                            </div>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>


<!--#include file="foot.inc"-->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->