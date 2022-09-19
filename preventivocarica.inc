<% 
    'on error goto 0
    
    if lcase(Session("nomeutente"))="preventivo" then
    %>
    Devi specificare in che utente deve essere salvato questo preventivo. <a href="carrellonew2.asp"><u>Indietro</u></a>
    <form method="post">
    Password:<input type="text" name="password" value="<%=request("password")%>"/><br />
    <input type="submit" value="procedi" />
    </form>
    <%'Session("Chisono")
    end if
    connm.execute "delete from salvapreventivo where data<current_timestamp-interval 1 month"
      
    if request("del")<>"" then
    connm.execute "delete from salvapreventivo where sessionid='" & request("del") & "'"
    end if
    
	Set Tbut = Server.CreateObject("ADODB.Recordset")	
	if lcase(Session("nomeutente"))="preventivo" then		
	    text_password=request("password")
	else
	    text_password=Session("Chisono")
	end if
	query="Select * From Registrazione where password1='" & text_password & "'"
	Tbut.Open query,connm
	if Tbut.eof then
	    Tbut.close
		query="Select * From Registrazioneint where password1='" & text_password & "'"
	    Tbut.Open query,connm
	end if
	if Tbut.eof  then   
		if request("password")<>"" then 
		    response.write "Utente non trovato"
		else
		    response.write "Nessun preventivo da caricare"
		end if
	else
	
            'UTENTE INTERNO
            nomeutente =  Trim(Tbut("utente1"))
            Chisono=Trim(Tbut("password1")) 
            tbut.close
            
        if request("load")<>"" then
            Set Tbcar = Server.CreateObject("ADODB.Recordset")
            Sql="Select * from SalvaPreventivo where Sessionid='" &  request("load") & "' Order by ID Desc"
            Tbcar.Open Sql,connm
        	
            connm.execute "delete from carrello where sessionid='" & Session.SessionID & "'"
        	
            Do while not Tbcar.EOF
            StrSqlins="Insert into carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Iva,Fornitore) values ('" & Session.SessionID & "','" & Tbcar("Codice_ISP") & "','" & Tbcar("Descrizione") & "','" & Tbcar("quantita") & "','" & Replace(Tbcar("prezzo"),",",".") & "',current_timestamp,'" & Replace(Tbcar("prezzou"),",",".") & "','" & Tbcar("blocco") & "','" & Tbcar("iva") & "','" & Tbcar("fornitore") & "')"
            connm.Execute StrSqlins
            'response.write(StrSqlins)
            Tbcar.MoveNext
            Loop
            response.redirect "carrellovisua.asp"
        end if

        if text_password<>"" then
            'Tabelle Utilita
            Set Tbcar = Server.CreateObject("ADODB.Recordset")
                
            Sql="Select distinct(sessionid),data from SalvaPreventivo where utente='" &  text_password & "' group by utente,sessionid  Order by data Desc"
            'response.write sql
            Tbcar.Open Sql,connm
            if not Tbcar.EOF then 
            %>
            <table width="600px" CELLSPACING="2" CELLPADDING="2" border="0" class="tx12 nero">
			<tr><td hright="10px"></td></tr>
	        <tr>
				<td class="tx14 nero grassetto" align="center">Utente</td>
				<td class="tx14 nero grassetto" align="center">Numero</td>
				<td class="tx14 nero grassetto" align="center">Data</td>
				<td class="tx14 nero grassetto" align="center">&nbsp;</td>
				<td class="tx14 nero grassetto" align="center">&nbsp;</td>
            </tr>
			<tr><td hright="10px"></td></tr>
			
            <%Do until Tbcar.EOF%>
            <tr>
				<td><%=ucase(nomeutente)%></td>
				<td><%=tbcar("sessionid")%></td>
				<td><%=tbcar("data")%></td>
				<td align="center"><a href="preventivocarica.asp?password=<%=request("password")%>&del=<%=tbcar("sessionid") %>"><font color="red">X</font></a></td>
				<td align="center"><button class="bott_carrellovisua" onClick="top.location.href='preventivocarica.asp?password=<%=request("password")%>&load=<%=tbcar("sessionid") %>'">&nbsp;&nbsp;CARICA&nbsp;&nbsp;PREVENTIVO</button></td>
            </tr>
            <%
            Tbcar.MoveNext
			if not Tbcar.eof then
			%>
			<tr><td height="5px"></td></tr>
			<tr><td colspan="5" height=1px" bgcolor="#009ac5"></td></tr>
			<tr><td height="5px"></td></tr>
			<%
			end if
            Loop
            
            %>
            </table>
        <%end if
          tbcar.close
        end if
   end if
 %>