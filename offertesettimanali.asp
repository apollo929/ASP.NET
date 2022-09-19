<%
	set tblispro = server.createobject("adodb.recordset")
	sql_lispro="SELECT codice,descrizione,prezzo,prezzoofferta FROM magazinebuffetti order by rand() limit 18"			
	tblispro.open sql_lispro,conn
%>



	<table style="width:820px; margin-left:auto; margin-right:auto; padding:0px; border-spacing:5px;">
		
		<%
		do while not tblispro.eof
		%>
		<tr>
			<td class="coldxoffertesettimana">
				<table style="width:360px;height:110px;padding:0px;border-spacing:0px;">
					<tr>
						<td style="width:80px;vertical-align:top;">
						

								<a href="dettaglibuffettishop.asp?cod=<%=tblispro("codice")%>"><img src="https://www.interlandi.it/foto.asp?cat=catalogobuffetti2016_small&img=<%=tblispro("codice")%>.jpg" border=0></a><br />										
						
						
						</td>
						<td style="vertical-align:top;">codice : <%response.write(lcase(tblispro("codice")))%><br><br />
							<a href="#" target="_self" class="coldxoffertasettimanalnk"><span class="tx12 nero"><%response.write(lcase(tblispro("Descrizione")))%></span></a><br /><br />
							<span class="coldxoffertasettimanaprezzo">&euro;. <strike><%=formatnumber(tblispro("prezzo"),2)%></strike> - <b class=rosso>scontato &euro;.<%=formatnumber(tblispro("prezzoofferta"),2)%></b></span><br /><br />
							<a href="dettaglibuffettishop.asp?cod=<%=tblispro("codice")%>" target="_self" title="Visualizza i dettagli dell'offerta"><img src="images/index/dettagli.jpg" alt="dettagli" /></a><!--<a href="#" target="_self" title="Aggiungi al carrello"><img src="images/index/aggiungi.jpg" alt="aggiungi" /></a>-->
						</td>
					</tr>
				</table>
			</td>
			<%
			tblispro.movenext
			%>
			<td class="coldxoffertesettimana">
				<table style="width:360px;height:110px;padding:0px;border-spacing:0px;">
					<tr>
						<td style="width:80px;vertical-align:top;">
						

								<a href="dettaglibuffettishop.asp?cod=<%=tblispro("codice")%>"><img src="https://www.interlandi.it/foto.asp?cat=catalogobuffetti2016_small&img=<%=tblispro("codice")%>.jpg" border=0></a><br />										
						
						
						</td>
						<td style="vertical-align:top;">codice : <%response.write(lcase(tblispro("codice")))%><br><br />
							<a href="#" target="_self" class="coldxoffertasettimanalnk"><span class="tx12 nero"><%response.write(lcase(tblispro("Descrizione")))%></span></a><br /><br />
							<span class="coldxoffertasettimanaprezzo">&euro;. <strike><%=formatnumber(tblispro("prezzo"),2)%></strike> - <b class=rosso>scontato &euro;.<%=formatnumber(tblispro("prezzoofferta"),2)%></b></span><br /><br />
							<a href="dettaglibuffettishop.asp?cod=<%=tblispro("codice")%>" target="_self" title="Visualizza i dettagli dell'offerta"><img src="images/index/dettagli.jpg" alt="dettagli" /></a><!--<a href="#" target="_self" title="Aggiungi al carrello"><img src="images/index/aggiungi.jpg" alt="aggiungi" /></a>-->
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<%
		tblispro.movenext
		loop
		tblispro.close
		%>
		
	</table>
