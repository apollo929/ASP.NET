<%if trim(session("idpratica"))="" then response.redirect "adindex.asp"%>
<script language="javascript">
	function stampa(divName) {
		 document.getElementById(divName).style.display = "block"; 
		 var printContents = document.getElementById(divName).innerHTML;
		 var originalContents = document.body.innerHTML;
		 document.body.innerHTML = printContents;
		 window.print();
		 document.body.innerHTML = originalContents;
		 document.getElementById(divName).style.display = "none";
		 //location.href = "adinsertpratica4.asp";
         		 
	}
</script>

<div id="corpo_articolo"  style="width:800px;background-color:white;display:none;font-size:10px;">

<table bgcolor="#ffffff" cellspacing="0" cellpadding="0" width="50%" align="left" border=0 style="font-size:9px;">
<tr><td colspan="2"><h1><img width="200px" src="../images/logohome.jpg"></h1></td><td colspan="2" align="right" style="font-size:14px;"><%=session("loginsede")%><br><%=session("loginnominativo")%><br><%=session("logintel")%><br><%=session("loginmail")%></td></tr>
<tr> 
<td align=left>AGENTE KIRON:</td>
<td align=left><input type="text" size="35" id="agente" name="agente" readonly="readonly" value="<%=session("loginnominativo")%>"></td>
<td align=left>DATA PRATICA:</td>
<td align=left><input type="text" size="35" id="datapratica"  name="datapratica" readonly="readonly" value="<%=session("datapratica")%>"></td>
</tr>
<tr><td colspan="4" height="1px"></td></tr>
<tr> 
<td align=left><b>NOME COGNOME:</b></td>
<td align=left><input style="font-size:14px;" type="text" size="35" id="nominativo"  name="nominativo" readonly="readonly" value="<%=cstr(text_nome & " " & text_cognome)%>"></td>


<td align=left>FUNZIONARIO:</td>
<td align=left><input type="text" size="35" id="funzionario"  name="funzionario" value="<%=text_funzionario%>"></td>
</tr>
<tr><td colspan="4" height="1px"></td></tr>
<tr> 
<td align=left><b>N PRATICA:</b></td>
<td align=left><input type="text" size="35" style="font-size:14px;" id="numeropratica"  name="numeropratica" readonly="readonly" value="<%=session("idpratica")%>_<%=session("loginprovincia")%>"></td>
<td align=left>SEGNALATORE:</td>
<td align=left><input type="text" size="35" id="segnalatore"  name="segnalatore" value="<%=text_segnalatore%>"></td>
</tr>
<tr><td colspan="4" height="1px"></td></tr>
<tr><td align=left>TIPO CLIENTE :</td>
<%num=instr(trim(text_tipocliente),"_")-1%>
<td align=left><input type="text" size="35" id="tipocliente"  name="tipocliente" readonly="readonly" value="<%=lcase(mid(trim(text_tipocliente),1,num))%>"></td>
<td align=left></td>
<td align=left></td>
</tr>
<tr><td colspan="4" height="1px"><hr></td></tr>
<tr><td colspan="4" height="1px">

		<table>
		<tr>
				<td>Stato Civile</td>
				<td>Professione</td>
				<td>Reddito</td>
				<td>Cittadinanza</td>
				</tr><tr>
				<td><input type="text" size="15"  readonly="readonly" value="<%=cstr(text_statocivile)%>"></td>
				<td><input type="text" size="35"  readonly="readonly" value="<%=cstr(text_professione)%>"></td>
				<td><input type="text" size="15"  readonly="readonly" value="<%=formatnumber(text_reddito,2)%>"></td>
				<td><input type="text" size="35"  readonly="readonly" value="<%=cstr(text_cittadinanza)%>"></td>
		</tr>
				<tr>
				<td>Tel./Mobile</td>
				<td>Email</td>
				<td>C.fiscale</td>
				<td>Disponibilità Economica :</td>
				</tr><tr>
				<td><input type="text" size="35"  readonly="readonly" value="<%=cstr(text_mobile)%>"></td>
				<td><input type="text" size="15"  readonly="readonly" value="<%=cstr(text_email)%>"></td>
				<td><input type="text" size="15"  readonly="readonly" value="<%=cstr(text_codicefiscale)%>"></td>
				<td><input type="text" size="20" value="<%=formatnumber(text_disponibilita,2)%>"></td>
		</tr>
		</table>

</td></tr>	
<tr>
<td  align=left >Indirizzo:<font color="#FF0000"></font></td>
<td  align=left > <input  type="text" id="text_3" maxlength="245" name="indirizzo" size="55" value="<%=text_Indirizzo%>"></td>
		<td  align=left >Citta'/Comune:<font color="#FF0000"></font></td>
		<td  align=left > <input  type="text" size="55" id="citta" name="citta" maxlength="245" value="<%=text_Citta%>"></td>	
		</tr>
		<tr><td colspan="4" height="1px"></td></tr>						
		<tr>		
		<td  align=left >Cap:<font color="#FF0000"></font></td>
		<td  align=left > <input  type="text" size="8" id="cap" name="cap" maxlength="15" value="<%=text_Cap%>"></td>

		<td align="left">Provincia:<font color="#FF0000"></font></td>
		<td align="left"> 
			<select  type="select" id="Provincia" name="Provincia">
				<%if trim(text_provincia)<>"" then%>
				<option  selected="selected" value="<%=text_provincia%>"><%=ucase(text_provincia)%></option>						
				<%end if%>							

			</select>
		</td>	
		</tr>
<tr><td colspan="4" height="1px"><hr></td></tr>
		
		
		<tr><td colspan="6" >
		
		
	  <table cellpadding="0" cellspacing="0" border="0" style="font-size:9px;">																
		<tr><td colspan="2" height="2px"></td></tr>
		<tr>
		<td  align=left >Prima Casa:</td><td>
		<select  type="select" id="primacasa" name="primacasa">
				<%if trim(text_primacasa)<>"" then%>
				<option  selected="selected" value="<%=text_primacasa%>"><%=ucase(text_primacasa)%></option>			
				<%end if%>	
				<option value="si">SI</option>	
				<option value="no">NO</option>
				</select></td>
		<td width="15px"></td>
		<td  align=left >Anni Mutuo:</td><td>
		<select  type="select" id="annimutuo" name="annimutuo">
				<%if trim(text_annimutuo)<>"" then%>
				<option  selected="selected" value="<%=text_annimutuo%>"><%=ucase(text_annimutuo)%></option>					
				<%end if
				for i=1 to 40
				%>	
				<option  value="<%=i%>"><%=i%></option>	
				<%next %>
		</select>
		</td>
		</tr>
		<tr><td colspan="2" height="2px"></td></tr>
									<tr>
		<td  align=left >Valore Immobile:<font color="#FF0000"></font></td><td><input  type="text" id="valimmobile"  size="20" name="valimmobile" value="<%=formatnumber(text_valimmobile,2)%>"></td>
		<td width="15px"></td>
		<td  align=left ></td>
		</tr>
		<tr><td colspan="2" height="2px"></td></tr>
		<tr>
		<td  align=left >Prezzo Immobile:<font color="#FF0000"></font></td><td><input  type="text" id="impimmobile"  size="20" name="impimmobile" value="<%=formatnumber(text_impimmobile,2)%>"></td>
		<td width="15px"></td>
		<td  align=left >Importo Mutuo:<font color="#FF0000"></font></td><td><input  type="text" id="impmutuo"  name="impmutuo" value="<%=formatnumber(text_impmutuo,2)%>"></td>
		</tr>
		<tr><td colspan="2" height="2px"></td></tr>
		<tr>							
		<td  align=left >LTC:<font color="#FF0000"></font></td><td><input type="text" id="lvtltc"  name="lvtltc"  value="<%=formatnumber(text_lvtltc,2)%>"></td>
		<td width="15px"></td>
		<td  align=left >LTV:<font color="#FF0000"></font></td><td><input type="text" id="lvt"  name="lvt"  value="<%=formatnumber(text_lvt,2)%>"></td>
		</tr>
		<tr><td colspan="2" height="2px"></td></tr>
		<tr>
		<td  align=left >Tasso:</td><td>
		<select  type="select" id="tasso" name="tasso">
				<%if trim(text_tasso)<>"" then%>
				<option  selected="selected" value="<%=text_tasso%>"><%=ucase(text_tasso)%></option>			
				<%end if
					sqlmutuo="select distinct descrizione from tipomutuo order by descrizione"
					set tbm=conn.execute(sqlmutuo)									
				do while not tbm.eof%>	
				<option value="<%=ucase(tbm("descrizione"))%>"><%=ucase(tbm("descrizione"))%></option>								
				<%tbm.movenext
				loop
				tbm.close%>									
				</select></td>
		</tr>
		<tr><td colspan="2" height="2px"></td></tr>
		<tr>
		<td  align=left >Importo Rata Desiderata</td><td><input   size="20" type="text" id="impratades" name="impratades"  value="<%=formatnumber(text_impratades,2)%>"></td>
		</tr>
		</table>
		</td></tr>
		<tr>
		<td  align=left >Numero Figli:</td><td>
		<select  type="select" id="nfiglis" name="nfiglis">
			<%if trim(text_nfiglis)<>"" then%>
			<option  selected="selected" value="<%=text_nfiglis%>"><%=ucase(text_nfiglis)%></option>	
			<%end if%>		
			<option  value="0">0</option>
			<option  value="1">1</option>	
			<option  value="2">2</option>	
			<option  value="3">3</option>	
			<option  value="4">4</option>	
			<option  value="5">5</option>	
			<option  value="6">6</option>
			<option  value="7">7</option>
			<option  value="8">8</option>
			<option  value="9">9</option>
			<option  value="10">10</option>								
			</select></td>
		<td  align=left >Attuale Abitazione:</td><td>
		<select  type="select" id="attualeabitazione" name="attualeabitazione">							
				<%if trim(text_attualeabitazione)<>"" then%>
				<option  selected="selected" value="<%=text_attualeabitazione%>"><%=ucase(text_attualeabitazione)%></option>					
				<%end if%>	
				<option  value="AFFITTO">AFFITTO</option>										
				<option value="PROPRIETA">PROPRIETA</option>
				<option value="PRES. FAM NON ONEROSO">PRES. FAM NON ONEROSO</option>
				<option value="OSPITE NON ONEROSO">OSPITE NON ONEROSO</option>
				</select></td></tr>
				<tr><td colspan="4" height="1px"></td></tr>
		<tr>
		<td  align=left >Se affitto indicare importo mensile:</td>
		<td  align=left > <input  type="text" id="impaffitto"   size="20" name="impaffitto"  value="<%=formatnumber(text_impaffitto,2)%>"></td>
		<td  align=left >Se alimenti importo mensile:</td>
		<td  align=left > <input  type="text" id="impalimenti"  size="20" name="impalimenti"  value="<%=formatnumber(text_impalimenti,2)%>"></td>
		</tr>
		<tr><td colspan="4" height="1px"></td></tr>
		<tr>
		<td  align=left >Appoggio Bancario:</td>
		<td  align=left > <input  type="text" id="appbanca"   name="appbanca" size=65 value="<%=text_appbanca%>"></td>
		</tr>
		
		<tr><td colspan="2" height="3px"></td></tr>	
		<tr><td colspan="4" >
		<table border="0" width="100%" bgcolor="#eeeeee">
		<tr><td width="100%" bgcolor="#eeeeee" height="1px"></td></tr>
		</table>
		</td></tr>
		<tr><td colspan="2" height="3px"></td></tr>	
		
		<tr>
		<td  align=left >Finanziamenti in Corso :
									<br>	
		<select  type="select" id="finanziamenti" name="finanziamenti" onchange="mostra('var_1');">
				<%if trim(text_finanziamenti)<>"" then%>
				<option  selected="selected" value="<%=text_finanziamenti%>"><%=ucase(text_finanziamenti)%></option>	
				<%end if%>
				<option value="no">NO</option>										
				<option value="si">SI</option>	
				</select></td></td><td>
		
		<%if trim(text_finanziamenti)<>"si" then%>
		<div id="var_1"  style="display:none;">	
		<%else%>
		<div id="var_1"  style="display:block;">										
		<%end if%>
									
<%
								session.lcid=1040    
								'DB TIPO DOCUMENTI
								Set Grid = Server.CreateObject("Persits.Grid")
								'Connessione
								Grid.Connect strConnect, "", ""
								Grid.SQL=""
								Grid.SQL = "select tipologia,debitoresiduo,importorata,scadenza,istituto,note from pratiche_finanziarie where nometabella='pratiche' and idpratica=" & session("idpratica") & " group by importorata order by importorata desc"
								Grid.Cols("tipologia").Caption="&nbsp;&nbsp;&nbsp;&nbsp;tipologia&nbsp;&nbsp;&nbsp;&nbsp;"
								Grid.Cols("istituto").Caption="&nbsp;&nbsp;&nbsp;&nbsp;istituto&nbsp;&nbsp;&nbsp;&nbsp;"
								Grid.Cols("note").Caption="&nbsp;&nbsp;&nbsp;&nbsp;note&nbsp;&nbsp;&nbsp;&nbsp;"
								Grid.Cols("importorata").Caption="&nbsp;imp.&nbsp;rata&nbsp;"
								Grid.Cols("debitoresiduo").Caption="&nbsp;deb.&nbsp;residuo&nbsp;"											
								'MAX RECORD
								Grid.MaxRows=40							
						
								' Enable sorting
								Grid.ColRange(1,33).CanSort = False
								Grid.ColRange(1,33).Cell.Align = "left"
								'Grid.Cols("utentetipo").Cell.Align = "center"
								'Grid.Cols("email").Cell.Align = "center"
								' Set Colors
								Grid.ColRange(1,33).Header.BGColor = "#f6f6f6"
								Grid.ColRange(1,33).Header.Font.Face = "sans-serif"
								Grid.ColRange(1,33).Cell.Font.Face = "sans-serif"
								Grid.ColRange(1,33).Cell.Font.Size = "1"
								Grid.ColRange(1,33).Header.Font.Size = "1"
								Grid(0).Header.BGColor = "#f6f6f6"
								Grid(999).Header.BGColor = "#f6f6f6"
										
								' Specify location of button images
								Grid.ImagePath = "images/"
								' Set <TABLE> attributes
								Grid.Table.Border = 1
								Grid.Table.CellSpacing = 0
								Grid.Table.CellPadding =0
									
								Grid.readonly = true
								Grid.Display
								Grid.Disconnect

								Set Grid = Nothing
								
							%>
		</div>
		</tr>
		<tr><td colspan="4" height="1px"><hr></td></tr>
		<tr><td colspan="4" height="2px">
		<%
			'controllo db
			sqlcall="select * from pratiche_cointestatario where idpratica=" & trim(session("idpratica")) & " limit 1"
			set tbcoint=conn.execute(sqlcall)
			text_nome=trim(tbcoint("nome"))
			text_cognome=trim(tbcoint("cognome"))
			text_tipolavoratore=trim(tbcoint("tipocliente"))
			text_email=trim(tbcoint("mail"))
			text_telefono=trim(tbcoint("mobile"))
			text_codicefiscale=tbcoint("codfiscale")		
			text_statocivile=tbcoint("statocivile")
			text_professione=tbcoint("professione")
			text_reddito=tbcoint("reddito")
			text_cittadinanza=tbcoint("cittadinanza")	
			text_finanziamenti=tbcoint("finanziamenti")				
			tbcoint.close
		%>
		<table>
		<tr>
				<td>Nome & Cognome (cointestatario)</td>
				<td>Stato Civile</td>
				<td>Professione</td>
				<td>Reddito</td>
				<td>Cittadinanza</td>
				</tr><tr>
				<td><input type="text" size="35"  readonly="readonly" value="<%=cstr(text_nome & " " & text_cognome)%>"></td>
				<td><input type="text" size="15"  readonly="readonly" value="<%=cstr(text_statocivile)%>"></td>
				<td><input type="text" size="35"  readonly="readonly" value="<%=cstr(text_professione)%>"></td>
				<td><input type="text" size="15"  readonly="readonly" value="<%=formatnumber(text_reddito,2)%>"></td>
				<td><input type="text" size="35"  readonly="readonly" value="<%=cstr(text_cittadinanza)%>"></td>
		</tr>
				<tr>
				<td>Tel./Mobile</td>
				<td>Email</td>
				<td>C.fiscale</td>
				<td></td>
				</tr><tr>
				<td><input type="text" size="35"  readonly="readonly" value="<%=cstr(text_mobile)%>"></td>
				<td><input type="text" size="15"  readonly="readonly" value="<%=cstr(text_email)%>"></td>
				<td><input type="text" size="15"  readonly="readonly" value="<%=cstr(text_codicefiscale)%>"></td>
				<td></td>
				<td></td>
		</tr>
		</table>
		</td></tr>
			<tr>
		<td  align=left >Finanziamenti in Corso :
									<br>	
		<select  type="select" id="finanziamenti" name="finanziamenti" onchange="mostra('var_1');">
				<%if trim(text_finanziamenti)<>"" then%>
				<option  selected="selected" value="<%=text_finanziamenti%>"><%=ucase(text_finanziamenti)%></option>	
				<%end if%>
				<option value="no">NO</option>										
				<option value="si">SI</option>	
				</select></td></td><td>
		
		<%if trim(text_finanziamenti)<>"si" then%>
		<div id="var_1"  style="display:none;">	
		<%else%>
		<div id="var_1"  style="display:block;">										
		<%end if%>
									
<%
								session.lcid=1040    
								'DB TIPO DOCUMENTI
								Set Grid = Server.CreateObject("Persits.Grid")
								'Connessione
								Grid.Connect strConnect, "", ""
								Grid.SQL=""
								Grid.SQL = "select tipologia,debitoresiduo,importorata,scadenza,istituto,note from pratiche_finanziarie where nometabella='pratiche_cointestatario' and idpratica=" & session("idpratica") & " group by importorata order by importorata desc"
								Grid.Cols("tipologia").Caption="&nbsp;&nbsp;&nbsp;&nbsp;tipologia&nbsp;&nbsp;&nbsp;&nbsp;"
								Grid.Cols("istituto").Caption="&nbsp;&nbsp;&nbsp;&nbsp;istituto&nbsp;&nbsp;&nbsp;&nbsp;"
								Grid.Cols("note").Caption="&nbsp;&nbsp;&nbsp;&nbsp;note&nbsp;&nbsp;&nbsp;&nbsp;"
								Grid.Cols("importorata").Caption="&nbsp;imp.&nbsp;rata&nbsp;"
								Grid.Cols("debitoresiduo").Caption="&nbsp;deb.&nbsp;residuo&nbsp;"											
								'MAX RECORD
								Grid.MaxRows=40							
						
								' Enable sorting
								Grid.ColRange(1,33).CanSort = False
								Grid.ColRange(1,33).Cell.Align = "left"
								'Grid.Cols("utentetipo").Cell.Align = "center"
								'Grid.Cols("email").Cell.Align = "center"
								' Set Colors
								Grid.ColRange(1,33).Header.BGColor = "#f6f6f6"
								Grid.ColRange(1,33).Header.Font.Face = "sans-serif"
								Grid.ColRange(1,33).Cell.Font.Face = "sans-serif"
								Grid.ColRange(1,33).Cell.Font.Size = "1"
								Grid.ColRange(1,33).Header.Font.Size = "1"
								Grid(0).Header.BGColor = "#f6f6f6"
								Grid(999).Header.BGColor = "#f6f6f6"
										
								' Specify location of button images
								Grid.ImagePath = "images/"
								' Set <TABLE> attributes
								Grid.Table.Border = 1
								Grid.Table.CellSpacing = 0
								Grid.Table.CellPadding =0
									
								Grid.readonly = true
								Grid.Display
								Grid.Disconnect

								Set Grid = Nothing
								
							%>
		</div>
		</tr>
		<tr><td  height="1px"><hr></td></tr>
		<tr>
		<td  align=left >Compenso Kiron:<font color="#FF0000"></font></td>
		<td  align=left > <input type="text" id="compenso"  size="5" name="compenso" value="<%=text_compenso%>">%</td>
		</tr>
		<tr><td colspan="2" height="2px"></td></tr>
		<tr>
		<td  align=left ><span class="bold">Note&nbsp;Pratica&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
		<td  align=left ><textarea name="note" rows="2" cols="55" ><%=text_note%></textarea></td>
		</tr>   

		<tr><td colspan="2" height="10px"></td></tr>
		</table>
		
		</div>
								 
			
