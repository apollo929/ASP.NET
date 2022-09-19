						<form name="formleadsins" action="adaggiuntaleads.asp?tasto=invia" method="post" >
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
									<%end if
									    'PROVENIENZA
										sqllead="select descrizione from tipolead order by descrizione"
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
											<option selected="selected" value=<%=ucase(session("loginprovincia"))%> > <%=ucase(session("loginprovincia"))%></option> 
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
								<tr><td colspan="2" height="25px"></td></tr>			
							    <tr><td height="10px"><font color="#FF0000">*</font>campi obbligatori</td></tr>
								<tr>
                                    <td style="text-align:right;" ><span class="bold">NOTE&nbspTIPO&nbsp;CONTATTO&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
                                    <td style="text-align:left;"><textarea name="richiesta" rows="2" cols="55" ><%=text_richiesta%></textarea></td>
                                </tr>                
                                <tr>
                                    <td style="height:20px; text-align:center;" colspan="2" class="preventivicoldxnero1">
									<br>
									<button onclick="formSubmitLead();"  class="btn btn-primary" type="button">
									<i class="fa fa-user fa-fw"></i>INSERIMENTO LEAD/CONTATTO
									</button>	
									<br><br>
									</td>
                                </tr>
	
                            </table>
                            </form>