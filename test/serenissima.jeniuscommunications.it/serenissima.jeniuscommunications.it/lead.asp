<!--#include file="connessionesql.inc"-->	
<%

	if request("copiare")="si" and isnumeric(request("id"))=true then
		sql="insert into contatti select * from contatti_lead where id=" & cdbl(request("id"))
		'response.write(sql)
		'response.end
		connm.execute(lcase(sql))
		response.Redirect("leadall.asp")			
	end if
 
 	if request("mod")="si" and isnumeric(request("id"))=true then
	    sqlmod="select * from contatti_lead where id=" & cdbl(request("id"))
		set tbcontatti=connm.execute(sqlmod) 
		text_email=trim(senza_apice(tbcontatti("mail")))
		text_telefono=trim(senza_apice(tbcontatti("telefono")))
		text_richiesta=tbcontatti("note")																	
		text_cognome=senza_apice(tbcontatti("cognome"))
		text_nome=senza_apice(tbcontatti("nome"))
		text_indirizzo=senza_apice(tbcontatti("indirizzo"))
		text_citta=senza_apice(tbcontatti("citta"))
		text_provenienza=senza_apice(tbcontatti("provenienza"))
		text_provincia=replace(senza_apice(tbcontatti("provincia")),"%20"," ")
		text_appartenenza=senza_apice(tbcontatti("appartenenza"))
	else
		text_tipo=trim(senza_apice(Request.Form("tipo")))
		text_settori=trim(senza_apice(Request.Form("settori")))
		text_email=trim(senza_apice(Request.Form("email")))
		text_telefono=trim(senza_apice(Request.Form("telefono")))
		text_data=senza_apice(Request.Form("data"))		
		text_richiesta=senza_apice(Request.Form("richiesta"))																		
		text_preventivi=senza_apice(Request.Form("Preventivi"))
		text_cognome=senza_apice(Request.Form("cognome"))
		text_nome=senza_apice(Request.Form("nome"))
		text_indirizzo=senza_apice(Request.Form("Indirizzo"))
		text_citta=senza_apice(Request.Form("Citta"))
		text_cap=senza_apice(Request.Form("Cap"))
		text_appartenenza=senza_apice(Request.Form("appartenenza"))
		text_provincia=replace(senza_apice(Request.Form("Provincia")),"%20"," ")
		'provenienza
		text_provenienza=lcase(Request.Form("provenienza"))
		'date di inizio e fine pubblicazione
		txt_inizio=date 
		txt_fine=txt_inizio+90
		'text_provenienza=mid(text_provenienza,len(text_provenienza)-3,3)
		'response.Write(text_provenienza) 
	end if
 
	errore="false"
	verrore=" "
	rossi=""
	if text_cognome="" then
		errore="true"
		rossi=rossi & "cognome,"
		verrore=verrore & "Cognome ,"
	end if       
	if text_telefono="" then
		errore="true"
		rossi=rossi & "telefono,"
		verrore=verrore & "Telefono "
	end if  	
	if text_provincia="" then
		errore="true"
		rossi=rossi & "provincia,"
		verrore=verrore & "Provincia "
	end if  
   
    
    'controllo
    if trim(request("tasto"))="invia"  then  						
					titolobreve="leads"	
					txt_inizio=year(txt_inizio) & "/"  & month(txt_inizio) &  "/" & day(txt_inizio)
					txt_fine=year(txt_fine) & "/"  & month(txt_fine) &  "/" & day(txt_fine)
					if trim(text_provenienza)="" then text_provenienza="sconosciuta"
					if errore="false" then
					  if cdbl(request("id"))=0 then
						sql="insert into contatti_lead (cognome,nome,mail,telefono,indirizzo,citta,provincia,note,provenienza) values ('"+text_cognome+"','"+text_nome+"','"+text_email+"','"+text_telefono+"','"+text_indirizzo+"','"+text_citta+"','"+text_provincia+"','"+text_richiesta+"','"+text_provenienza+"')"
						'response.write(sql)
						'response.end
						connm.execute(lcase(sql))
						response.Redirect("leadall.asp")
					  else
						sql="update contatti_lead set cognome='"+text_cognome+"',nome='"+text_nome+"',mail='"+text_email+"',telefono='"+text_telefono+"',indirizzo='"+text_indirizzo+"',citta='"+text_citta+"',provincia='"+text_provincia+"',note='"+text_richiesta+"',provenienza='"+text_provenienza+"',appartenenza='"+text_appartenenza+"' where id=" & cdbl(request("id"))
						'response.write(sql)
						'response.end
						'sql=tosql(sql)
						connm.execute(lcase(sql))	
						response.Redirect("leadall.asp")						
					  end if
					end if  
    end if
	

	
	
%>
<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<title>LEAD GENERATION</title>
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
<body>
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>LEAD</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
                <div class="col-md-4" width="450px" >
					
                
                <div class="col-md-8" >
                    <div class="product-content-right">
                        <div class="woocommerce" >	
						
						
				            <center>
																	
							<form name="formlead1" action="lead.asp?tasto=invia&id=<%=cdbl(request("id"))%>" method="post" >
						    <table style="width:400px;" border=0 cellpadding="2" cellspacing="2">
							
                                <%if errore<>"false" then%>				  
                                    <% if request("tasto")<>"" then%>
                                        <tr><td colspan="2">
                                            <font color="red" size="2"><strong><center>Errori >>>><% Response.write(verrore)%></center></strong></font>
                                        </td></tr>
                                    <%end if%>
                                    <%end if%>	
                                <tr>
								<td style="width:150px; text-align:right;" ><span class="bold">PROVENIENZA&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
								<td style="text-align:left;">
								
										<select  type="select" id="provenienza" name="provenienza">
								    <%if trim(text_provenienza)<>"" then%>
									<option  selected="selected" value="<%=text_provenienza%>"><%=ucase(text_provenienza)%></option>			
									<%end if%>	
									<option value="SUBITO.IT">SUBITO.IT</option>
									<option value="CASA.IT">CASA.IT</option>	
									<option value="IMMOBILIARE.IT">IMMOBILIARE.IT</option>
									<option value="KIJIJI.IT">KIJIJI.IT</option>
									<option value="BAKEKA.IT">BAKEKA.IT</option>	
									<option value="IDEALISTA.IT">IDEALISTA.IT</option>	
									</select>	
							    </td></tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="width:150px; text-align:right;" ><span class="bold">COGNOME&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
                                    <td><input type="text"  name="cognome" style="border:1px solid #abadb3;" size="30" ID="Text1" value="<%=text_cognome%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<tr>
                                    <td style="width:150px; text-align:right;" ><span class="bold">NOME&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
                                    <td><input type="text"  name="nome" style="border:1px solid #abadb3;" size="30" ID="Text1" value="<%=text_nome%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="text-align:right;" ><span class="bold">E-MAIL&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
                                    <td><input type="text"  name="email" style="border:1px solid #abadb3;" size="60" ID="Text2" value="<%=text_email%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="text-align:right;" ><span class="bold">TELEFONO&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
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
											<option selected="selected" value=<%=ucase(text_provincia)%> > <%=ucase(text_provincia)%></option> 
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
								<%if cdbl(request("id"))>0 then	%>	
									<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
								<td style="width:150px; text-align:right;" ><span class="bold">ESITO&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
								<td style="text-align:left;">
								
										<select  type="select" id="appartenenza" name="appartenenza">
								    <%if trim(text_appartenenza)<>"" then%>
									<option  selected="selected" value="<%=text_appartenenza%>"><%=ucase(text_appartenenza)%></option>			
									<%end if%>	
									<option value="LIBERO">LIBERO</option>
									<option value="DA RICHIAMARE">DA RICHIAMARE</option>	
									<option value="NON INTERESSATO">NON INTERESSATO</option>
									<option value="ESITO OK">OK ESITO POSITIVO</option>
									<option value="AGENZIA IMMMOBILIARE">AGENZIA IMMMOBILIARE</option>
									</select>	
							    </td></tr>
							
                                <%end if%>								
                                <tr>
                                    <td style="height:20px; text-align:center;" colspan="2" class="preventivicoldxnero1">
                                        <br><input type="submit" value=" INS. MODIFICA LEAD/CONTATTO" border="0" class="btn btn-primary"></span>
                                        <br><br>
										
			
					                                    </td>
                                </tr>
	
                            </table>
                            </form>
						
							 </center>
					
                            </div>



                            </div>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>



  </body>
</html>
<!--#include file="sqlchiudi.inc"-->					