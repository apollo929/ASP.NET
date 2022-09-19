<tr> 
<td colspan="2" align="center">
<%if request("tasto")<>"" then%>
<font color="red"><b><center class=nero10>Errori >>>><% Response.write(verrore)%>    </center></b></font>
<%end if%>
</td>
</tr>
<tr> 
<td align=left>AGENTE KIRON:</td>
<td align=left><input type="text" size="35" id="agente" name="agente" readonly="readonly" value="<%=session("loginnominativo")%>"></td>
</tr>
<tr><td colspan="2" height="5px"></td></tr>
<tr> 
<td align=left>N PRATICA :</td>
<td align=left><input type="text" size="35" id="numeropratica"  name="numeropratica" readonly="readonly" value="<%=session("idpratica")%>_<%=session("loginprovincia")%>"></td>
</tr>
<tr><td colspan="2" height="5px"></td></tr>		
<tr> 
<td align=left>DATA PRATICA :</td>
<td align=left><input type="text" size="35" id="datapratica"  name="datapratica" readonly="readonly" value="<%=session("datapratica")%>"></td>
</tr>
<tr><td colspan="2" ><hr></td></tr>								
<%
bg=""
if instr(rossi,"cognome,")>0 then
bg="bgcolor='#ff0000'"
end if
%>
<tr <%=bg%>> 
<td align=left>Cognome:<font color="#FF0000">*</font></td>
<td align=left><input type="text" size="35" id="cognome"   name="cognome" value="<%=text_cognome%>"></td>
</tr>
<tr><td colspan="2" height="5px"></td></tr>
<%
bg=""
if instr(rossi,"nome,")>0 then
bg="bgcolor='#ff0000'"
end if
%>
<tr <%=bg%>> 
<td align="left">Nome:<font color="#FF0000">*</font></td>
<td align="left"> <input  type="text" size="35" id="nome"   name="nome" value="<%=text_nome%>"></td>
</tr>
<tr><td colspan="2" height="5px"><hr></td></tr>	
<tr> 
<td align=left>Tipologia Lavoratore:</td>							
<td align=left><select  type="select" id="tipolavoratore" name="tipolavoratore" >
<%
if trim(text_tipolavoratore)<>"" then							
		num=instr(trim(text_tipolavoratore),"_")-1
		%>
		<option  selected="selected" value="<%=ucase(trim(text_tipolavoratore))%>"><%=ucase(mid(trim(text_tipolavoratore),1,num))%></option>
	<%						
end if
sqltl="select distinct descrizione,categoria from tipolavoratore order by descrizione"
set tbtl=conn.execute(sqltl)									
do while not tbtl.eof%>	
<option value="<%response.write(ucase(tbtl("descrizione")) & "_" & ucase(tbtl("categoria")))%>"><%=ucase(tbtl("descrizione"))%></option>								
<%tbtl.movenext
loop
tbtl.close%>							
</select>
</td>
</tr>
<tr><td colspan="2" ><hr></td></tr>
<tr>
<td  align=left >Stato Civile:</td><td>
<select  type="select" id="statocivile" name="statocivile">
<%if trim(text_statocivile)<>"" then%>
<option  selected="selected" value="<%=text_statocivile%>"><%=ucase(text_statocivile)%></option>					
<%end if%>	
<option value="CELIBE">CELIBE</option>	
<option value="NUBILE">NUBILE</option>
<option value="CONIUGATO">CONIUGATO</option>
<option value="CONIUGATO">CONIUGATA</option>
<option value="DIVORZIATO">DIVORZIATO</option>
<option value="DIVORZIATA">DIVORZIATA</option>
<option value="VEDOVO">VEDOVO</option>
<option value="VEDOVA">VEDOVA</option>
</select></td></tr>
<tr><td colspan="2" height="5px"></td></tr>												
<tr>
<td  align=left >Professione:<font color="#FF0000"></font></td>
<td  align=left > <input type="text" size="35" id="professione"   name="professione" value="<%=text_professione%>"></td>
</tr>
<tr><td colspan="2" height="5px"></td></tr>
<tr>
<td  align=left >Cittadinanza:</td><td>
<select  type="select" id="cittadinanza" name="cittadinanza">
<%if trim(text_cittadinanza)<>"" then%>
<option  selected="selected" value="<%=text_cittadinanza%>"><%=ucase(text_cittadinanza)%></option>					
<%end if%>	
<option value="ITALIANA">ITALIANA</option>	
<option value="EUROPEA">EUROPEA</option>
<option value="EXTRA EUROPEA">EXTRA EUROPEA</option>
<option value="EXTRA EUROPEA OCCIDENTALE">EXTRA EUROPEA OCCIDENTALE</option>
</select></td></tr>
<tr><td colspan="2" height="5px"></td></tr>												
<tr>
<tr><td colspan="2" height="5px"></td></tr>
<tr>							
<%
bg=""
if instr(rossi,"codicefiscale,")>0 then
bg="bgcolor='#ff0000'"
end if
%>
<tr <%=bg%>>
<td  align=left >Cod.Fiscale:<font color="#FF0000"></font></td>
<td  align=left > <input type="text" size="35" id="Codicefiscale"   name="Codicefiscale" value="<%=text_codicefiscale%>"></td>
</tr>
<tr><td colspan="2" height="5px"></td></tr>


<%
bg=""
if instr(rossi,"indirizzo,")>0 then
bg="bgcolor='#ff0000'"
end if
%>
<tr <%=bg%>> 
<td  align=left >Indirizzo:<font color="#FF0000"></font></td>
<td  align=left > <input  type="text" id="text_3" maxlength="245" name="indirizzo" size="55" value="<%=text_Indirizzo%>"></td>
</tr>
<tr><td colspan="2" height="5px"></td></tr>
<%
bg=""
if instr(rossi,"citta,")>0 then
bg="bgcolor='#ff0000'"
end if
%>
<tr <%=bg%>>
<td  align=left >Citta'/Comune:<font color="#FF0000"></font></td>
<td  align=left > <input  type="text" size="55" id="citta" name="citta" maxlength="245" value="<%=text_Citta%>"></td>
</tr>
<tr><td colspan="2" height="5px"></td></tr>
<%
bg=""
if instr(rossi,"cap,")>0 then
bg="bgcolor='#ff0000'"
end if
%>
<tr <%=bg%>>
<td  align=left >Cap:<font color="#FF0000"></font></td>
<td  align=left > <input  type="text" size="8" id="cap" name="cap" maxlength="15" value="<%=text_Cap%>"></td>
</tr>
<tr><td colspan="2" height="5px"></td></tr>
<%
bg=""
if instr(rossi,"provincia,")>0 then
bg="bgcolor='#ff0000'"
end if
%>
<tr <%=bg%>>
<td align="left">Provincia:<font color="#FF0000"></font></td>
<td align="left"> 
<select  type="select" id="Provincia" name="Provincia">
<%if trim(text_provincia)<>"" then%>
<option  selected="selected" value="<%=text_provincia%>"><%=ucase(text_provincia)%></option>						
<%end if%>									
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
<%
bg=""
if instr(rossi,"email,")>0 then
bg="bgcolor='#ff0000'"
end if
%>
<tr <%=bg%>>
<td align="left">E-Mail:<font color="#FF0000"></font></td>
<td align="left"> <input  type="text" id="text_6" maxlength="130" name="email" size=35 value="<%=text_Email%>"></td>
</tr>
<tr><td colspan="2" height="5px"></td></tr>
<%
bg=""
if instr(rossi,"telefono,")>0 then
bg="bgcolor='#ff0000'"
end if
%>
<tr <%=bg%>>
<td  align=left >Telefono/Cellulare:<font color="#FF0000"></font></td>
<td  align=left > <input  type="text" id="telefono" maxlength="130" name="telefono" size=35 value="<%=text_telefono%>"></td>
</tr>
<tr><td colspan="2" height="5px"><hr></td></tr>
<tr>
<td  align=left >Reddito:<font color="#FF0000"></font></td>
<td  align=left > <input type="text" size="35" id="reddito" size="20" name="reddito" value="<%=formatnumber(text_reddito,2)%>"></td>
</tr>
<tr><td colspan="2" height="5px"></td></tr>
<tr>
<td  align=left >Disponibilità Economica :</td>
<td  align=left > 					
<input  type="text"  id="disponibilita"  name="disponibilita"  size="20" value="<%=formatnumber(text_disponibilita,2)%>"></td>
</tr>
