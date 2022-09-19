<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>CONTATTACI</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
                <div class="col-md-4">
		
					
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">	
						
						
							
			

					
								<br>
								<form action="regmail.asp" method="post" id="formcontatti" name="formcontatti">
								<table width="90%" border="0" align="center" cellpadding="1" cellspacing="0" class="tx1 nero">
																<tr><td colspan="2" height="10px"></td></tr>
								<tr> 
								<td colspan="2" align="left">
								<strong>PER POTER ACCEDERE AL SERVIZIO RICHIEDI UTENTE E PASSWORD COMPILANDO IL SEGUENTE FORM.</strong> 
								<br><br>LA DIREZIONE.</strong></font></p></td>
								</tr>
								<tr><td colspan="2" align="left"><strong>Per informazioni compilate il form: </strong></td></tr>
								<tr><td colspan="2">&nbsp; </td></tr>
								<tr> 
								<td align="left">Nome:<font color="#ff6600">*</font></td>
								<td align="left"><input  type="text" id="text_1" maxLength="25" name="nome"></td>
								</tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<tr> 
								<td align="left">Cognome:<font color="#ff6600">*</font></td>
								<td align="left"><input  type="text" id="text_2" maxLength="25" name="cognome"></td>
								</tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<tr> 
								<td align="left">Indirizzo:<font color="#ff6600">*</font></td>
								<td align="left"><input  type="text" id="text_3" maxLength="30" name="indirizzo" size="30" ></td>
								</tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<tr> 
								<td align="left">Citta':<font color="#ff6600">*</font></td>
								<td align="left"><input  type="text" size="25" id="text_5" name="citta" maxLength="45"></td>
								</tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<tr>
								<td align="left">Provincia:<font color="#0394D8">*</font></td>
								<td align="left">
								<select id="Provincia" name="Provincia">
								<option selected="selected" value="----------SELEZIONA----------">----------SELEZIONA----------</option>	
								<option value="AGRIGENTO">AGRIGENTO</option>							
								<option value="ALESSANDRIA">ALESSANDRIA</option>							
								<option value="ANCONA">ANCONA</option>							
								<option value="AOSTA">AOSTA</option>							
								<option value="AREZZO">AREZZO</option>							
								<option value="ASCOLI PICENO">ASCOLI PICENO</option>							
								<option value="ASTI">ASTI</option>							
								<option value="AVELLINO">AVELLINO</option>							
								<option value="BARI">BARI</option>							
								<option value="BARLETTA-ANDRIA-TRANI">BARLETTA-ANDRIA-TRANI</option>							
								<option value="BELLUNO">BELLUNO</option>							
								<option value="BENEVENTO">BENEVENTO</option>							
								<option value="BERGAMO">BERGAMO</option>							
								<option value="BIELLA">BIELLA</option>							
								<option value="BOLOGNA">BOLOGNA</option>							
								<option value="BOLZANO">BOLZANO</option>							
								<option value="BRESCIA">BRESCIA</option>							
								<option value="BRINDISI">BRINDISI</option>							
								<option value="CAGLIARI">CAGLIARI</option>							
								<option value="CALTANISSETTA">CALTANISSETTA</option>							
								<option value="CAMPOBASSO">CAMPOBASSO</option>							
								<option value="CARBONIA-IGLESIAS">CARBONIA-IGLESIAS</option>							
								<option value="CASERTA">CASERTA</option>							
								<option value="CATANIA">CATANIA</option>							
								<option value="CATANZARO">CATANZARO</option>							
								<option value="CHIETI">CHIETI</option>							
								<option value="COMO">COMO</option>							
								<option value="COSENZA">COSENZA</option>							
								<option value="CREMONA">CREMONA</option>							
								<option value="CROTONE">CROTONE</option>							
								<option value="CUNEO">CUNEO</option>							
								<option value="ENNA">ENNA</option>							
								<option value="FERMO">FERMO</option>							
								<option value="FERRARA">FERRARA</option>							
								<option value="FIRENZE">FIRENZE</option>							
								<option value="FOGGIA">FOGGIA</option>							
								<option value="FORLI">FORLI</option>							
								<option value="FROSINONE">FROSINONE</option>							
								<option value="GENOVA">GENOVA</option>							
								<option value="GORIZIA">GORIZIA</option>							
								<option value="GROSSETO">GROSSETO</option>							
								<option value="IMPERIA">IMPERIA</option>							
								<option value="ISERNIA">ISERNIA</option>							
								<option value="LA SPEZIA">LA SPEZIA</option>							
								<option value="LATINA">LATINA</option>							
								<option value="LECCE">LECCE</option>							
								<option value="LECCO">LECCO</option>							
								<option value="LIVORNO">LIVORNO</option>							
								<option value="LODI">LODI</option>							
								<option value="LUCCA">LUCCA</option>							
								<option value="L`AQUILA">L`AQUILA</option>							
								<option value="MACERATA">MACERATA</option>							
								<option value="MANTOVA">MANTOVA</option>							
								<option value="MASSA CARRARA">MASSA CARRARA</option>							
								<option value="MATERA">MATERA</option>							
								<option value="MEDIO CAMPIDANO">MEDIO CAMPIDANO</option>							
								<option value="MESSINA">MESSINA</option>							
								<option value="MILANO">MILANO</option>							
								<option value="MODENA">MODENA</option>							
								<option value="MONZA - BRIANZA">MONZA - BRIANZA</option>							
								<option value="NAPOLI">NAPOLI</option>							
								<option value="NOVARA">NOVARA</option>							
								<option value="NUORO">NUORO</option>							
								<option value="OGLIASTRA">OGLIASTRA</option>							
								<option value="OLBIA-TEMPIO">OLBIA-TEMPIO</option>							
								<option value="ORISTANO">ORISTANO</option>							
								<option value="PADOVA">PADOVA</option>							
								<option value="PALERMO">PALERMO</option>							
								<option value="PARMA">PARMA</option>							
								<option value="PAVIA">PAVIA</option>							
								<option value="PERUGIA">PERUGIA</option>							
								<option value="PESARO">PESARO</option>							
								<option value="PESARO URBINO">PESARO URBINO</option>							
								<option value="PESCARA">PESCARA</option>							
								<option value="PIACENZA">PIACENZA</option>							
								<option value="PISA">PISA</option>							
								<option value="PISTOIA">PISTOIA</option>							
								<option value="PORDENONE">PORDENONE</option>							
								<option value="POTENZA">POTENZA</option>							
								<option value="PRATO">PRATO</option>							
								<option value="RAGUSA">RAGUSA</option>							
								<option value="RAVENNA">RAVENNA</option>							
								<option value="REGGIO CALABRIA">REGGIO CALABRIA</option>							
								<option value="REGGIO EMILIA">REGGIO EMILIA</option>							
								<option value="RIETI">RIETI</option>							
								<option value="RIMINI">RIMINI</option>							
								<option value="ROMA">ROMA</option>							
								<option value="ROVIGO">ROVIGO</option>							
								<option value="SALERNO">SALERNO</option>							
								<option value="SASSARI">SASSARI</option>							
								<option value="SAVONA">SAVONA</option>							
								<option value="SIENA">SIENA</option>							
								<option value="SIRACUSA">SIRACUSA</option>							
								<option value="SONDRIO">SONDRIO</option>							
								<option value="TARANTO">TARANTO</option>							
								<option value="TERAMO">TERAMO</option>							
								<option value="TERNI">TERNI</option>							
								<option value="TORINO">TORINO</option>							
								<option value="TRAPANI">TRAPANI</option>							
								<option value="TRENTO">TRENTO</option>							
								<option value="TREVISO">TREVISO</option>							
								<option value="TRIESTE">TRIESTE</option>							
								<option value="UDINE">UDINE</option>							
								<option value="VARESE">VARESE</option>							
								<option value="VENEZIA">VENEZIA</option>							
								<option value="VERBANIA">VERBANIA</option>							
								<option value="VERBANO-CUSIO-OSSOLA">VERBANO-CUSIO-OSSOLA</option>							
								<option value="VERCELLI">VERCELLI</option>							
								<option value="VERONA">VERONA</option>							
								<option value="VIBO VALENTIA">VIBO VALENTIA</option>							
								<option value="VICENZA">VICENZA</option>							
								<option value="VITERBO">VITERBO</option>
								</select>
								</td>
								</tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<tr> 
								<td align="left">E-Mail:<font color="#ff6600">*</font></td>
								<td align="left"><input  type="text" id="text_6" maxLength="120" name="email" size="30"></td>
								</tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<tr> 
								<td align="left">Telefono:<font color="#ff6600">*</font></td>
								<td align="left"><input  type="text" id="text_8" name="telefono" maxLength="30"></td>
								</tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<tr> 
								<td align="left">Note:<font color="#ff6600">*</font></td>
								<td align="left"><TEXTAREA CLASS="nero" name="note" rows="4" cols="35"></TEXTAREA></td>
								</tr>
								<tr> 
								<td colspan="2" align="left"><br>&nbsp;<b><font class='tx14 azzurro'>Codice di conferma:</font>

								<%
								session("checktext")="" 

								randomize
								session("checktext")=CInt ( ( 9 * Rnd() ) + 0) & CInt ( ( 9 * Rnd() ) + 0) & CInt ( ( 9 * Rnd() ) + 0) & CInt ( ( 9 * Rnd() ) + 0) 
								response.Write("<font class='tx18 rosso'>" & session("checktext") & "</font>")
								%>
								</font>
								</b><br><br>
								</td>
								</tr>

								<tr>
								<td colspan="2" align="left">&nbsp;Ricopialo qui <input  type="text" size="8" id="checktext" maxlength="4" name="checktext"></td>
								</tr>
								<tr><td colspan="2" height="5px"><br></td></tr>
								<tr> 
								<td>&nbsp;</td>
								<td><input  type="submit" class="button" value="INVIA" name="submit1"></td>
								</tr>								
								<tr> 
								<td colspan="2" align="left"><br>
								In esecuzione D.Lgs. 30.06.2003 n. 196, recante disposizioni a tutela delle petbprodcatalogoone e degli altri soggetti rispetto al trattamento dei dati petbprodcatalogoonali, dichiaro di aver letto l'apposita <A class="tx12 azzurro lnk" href="privacy.asp" target="_new">informativa</A> e fornisco il consenso al trattamento dei miei dati petbprodcatalogoonali. Acconsento a ricevere comunicazioni su novita' e promozioni aziendali.<br>
								Per rimuovetbprodcatalogoi >>> <a class="tx12 azzurro lnk" href='MAILTO:<%=rimozionemail%>'><strong><%=rimozionemail%></strong></a>
								</td>
								</tr>
								</table>
								</form>
													<br>			
				
							
	
	
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