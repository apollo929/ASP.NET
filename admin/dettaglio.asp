<!--#include file="connessionesql.asp" -->
<%on error resume next

if request("id")="" then
	response.Redirect("/")
end if

'#### IMPOSTAZIONI ####

'tabella
tabella="registrazione"

'### CONTROLLI ###
Function tosql(byval txt)
	tosql=trim(replace(txt,"'","`"))
End function

'### set record set
Set rs = Server.CreateObject("ADODB.Recordset")	
'#### delete
if request("del")<>"" then
 	Sqldel="Delete From " & tabella & " where id=" & clng(request("id")) 
	rs.Open Sqldel,Connm
	response.Redirect "adutentipro.asp"
end if

'#### PAGINA ####
if request("act")="" then	
	Sqlpro="Select * From " & tabella & " where id=" & clng(request("id")) 
	rs.Open Sqlpro,Connm
	if rs.eof then
		rs.close
		if request("mod")<>"addnew" then
			response.Redirect("/")
		else
		    'set x addnew
			text_prezzo="PREZZO1"
			text_prezzocwr="PREZZO1"
			text_prezzoisp="PREZZO1"
			text_prezzobuffetti="PREZZO1" 
			check_newsletter="1"
			check_spese="0"
			text_frequenza=0
		end if 
	else
		text_utente=rs("utente1")
		text_password=rs("password2")
		text_email=rs("Email")
		text_telefono=rs("telefono")
		text_azienda=rs("Ragione")
		text_partitaiva=rs("PI")	
		text_codicefiscale=rs("CF")																						
		text_nome=rs("Nome")
		text_cognome=rs("Cognome")
		text_indirizzo=rs("Indirizzo")
		text_citta=rs("Citta")
		text_cap=rs("Cap")
		text_provincia=rs("Provincia")
		text_frequenza=rs("Frequenza")
		text_prezzo=rs("Prezzo")
		text_prezzocwr=rs("Prezzocwr")
		text_prezzoisp=rs("Prezzoisp")
		text_prezzobuffetti=rs("Prezzobuffetti")
		text_nomeagente=rs("Nomeagente")
		text_telefonoagente=rs("TelefonoAgente")
		text_categoriacliente=rs("Categoriacliente")
		check_newsletter=cstr(rs("ricevereofferte"))
		check_spese=cstr(rs("spesedispedizione"))
		if check_newsletter="" then check_newsletter="0"
		if check_spese="" then check_spese="0"
		rs.close
	end if
else
    text_utente=trim(tosql(Request.Form("utente")))    
	text_password=trim(tosql(Request.Form("password")))
	text_riferimentowincody=trim(tosql(Request.Form("riferimentowincody")))
	text_email=trim(tosql(Request.Form("Email")))
	text_telefono=trim(tosql(Request.Form("telefono")))
	text_azienda=tosql(Request.Form("Azienda"))
	text_partitaiva=tosql(Request.Form("Partitaiva"))		
	text_codicefiscale=tosql(Request.Form("codicefiscale"))																		
	text_nome=tosql(Request.Form("Nome"))
	text_cognome=tosql(Request.Form("Cognome"))
	text_indirizzo=tosql(Request.Form("Indirizzo"))
	text_citta=tosql(Request.Form("Citta"))
	text_cap=tosql(Request.Form("Cap"))
	text_provincia=tosql(Request.Form("Provincia"))		
    text_frequenza=trim(tosql(Request.Form("Frequenza")))
	text_prezzo=trim(tosql(Request.Form("Prezzo")))
	text_prezzocwr=trim(tosql(Request.Form("Prezzocwr")))
	text_prezzoisp=trim(tosql(Request.Form("Prezzoisp")))
	text_prezzobuffetti=trim(tosql(Request.Form("Prezzobuffetti")))
	text_nomeagente=trim(tosql(Request.Form("Nomeagente")))
	text_telefonoagente=trim(tosql(Request.Form("TelefonoAgente")))
	text_categoriacliente=trim(tosql(Request.Form("Categoriacliente")))
	check_newsletter=cstr(trim(tosql(Request.Form("newsletter"))))
	check_spese=cstr(trim(tosql(Request.Form("spese"))))
   	
	'controlli
	rossi=""	
	errore=false
	'check controllo
	if check_newsletter="on" then 
	  check_newsletter=1
	else
	  check_newsletter=0
	end if  
	if check_spese="on" then 
	  check_spese=1
	else
	  check_spese=0
	end if
	'controllo frequenza  
	if text_frequenza<>"" then 
	 if not isnumeric(text_frequenza) then 
	   errore=true
	   rossi=rossi & "frequenza,"
	   'text_frequenza=0
	 end if
	end if
		
	'##verifica univocità password2
	'if text_password<>"" then
	'	rs.open "select password2 from registrazione  where id<>" & clng(request("id")) & " and password2='" & text_password & "' union select password2 from registrazioneint where id<>" & clng(request("id")) & " and password2='" & text_password & "'",connm
	'	if not rs.eof then
	'		errore=true
	'		rossi=rossi & "password,"
	'		perrp="<b><font color='red'>La password è già presente in archivio</font></b>"
	'	end if
	'	rs.close
	'else	
	' if request("mod")="addnew" then
	'	errore=true
	'	rossi=rossi & "password,"
	'	perrp="<b><font color='red'>La password è vuota</font></b>"
	' end if	
	'end if
	'##verifica univocità rif.wincdoy
	if text_riferimentowincody<>"" then
		rs.open "select password1 from registrazione  where password1='" & text_riferimentowincody & "' union select password1 from registrazioneint where password1='" & text_riferimentowincody & "'",connm
		if not rs.eof then
			errore=true
			rossi=rossi & "rif.wincdoy,"
			perrw="<b><font color='red'>Rif.Wincody è già presente in archivio</font></b>"
		end if
		rs.close
	else	
	 if request("mod")="addnew" then
		errore=true
		rossi=rossi & "rif.wincdoy,"
		perrw="<b><font color='red'>Rif.Wincody è vuoto</font></b>"
	 end if	
	end if	
	'##verifica univocità utente1
	if text_utente<>"" then
		rs.open "select utente1 from registrazione  where id<>" & clng(request("id")) & " and  utente1='" & text_utente & "' union select utente1 from registrazioneint where id<>" & clng(request("id")) & " and  utente1='" & text_utente & "'",connm
		if not rs.eof then
			errore=true
			rossi=rossi & "utente,"
			perru="<b><font color='red'>Utente già presente in archivio</font></b>"
		end if
		rs.close
	else	
	 if request("mod")="addnew" then
		errore=true
		rossi=rossi & "utente,"
		perru="<b><font color='red'>Utente vuoto</font></b>"
	 end if	
	end if

	if text_azienda<>"" then
		if text_partitaiva="" then
		 'errore=true
		 rossi=rossi & "partitaiva,"
		end if  
		if text_codicefiscale="" then
		 'errore=true
		 rossi=rossi & "codicefiscale,"
		end if  
	end if
	if text_nome="" then
	 'errore=true
	 rossi=rossi & "nome,"
	end if  
	if text_cognome="" then
	 'errore=true
	 rossi=rossi & "cognome,"
	end if  
	if text_indirizzo="" then
	 'errore=true
	 rossi=rossi & "indirizzo,"
	end if  
	if text_citta="" then
	 'errore=true
	 rossi=rossi & "citta,"
	end if  
	if text_cap="" then
	 errore=true
	 rossi=rossi & "cap,"
	end if  
	if text_provincia="" then
	 errore=true
	 rossi=rossi & "provincia,"
	end if  
	num=instr(1,cstr(text_email),"@") 
	if len(trim(text_email))=0 or num=0 then
	 errore=true
	 rossi=rossi & "email,"
	else
		if text_email="" then
		 errore=true
		 rossi=rossi & "email,"
		end if   
	end if	
	if text_telefono="" then
	 'errore=true
	 rossi=rossi & "telefono,"
	end if  
	if not errore then
		'se nuovo
		'se nuovo
		'se nuovo
		if request("mod")="addnew" then
		    'se nuovo
			StrSql="Insert into Registrazione (Nome,Cognome,Indirizzo,citta,provincia,telefono,Utente1,Email,Password1,Password2,Ragione,Sede,PI,CF,Cap,Prezzo,Prezzoisp,PrezzoBuffetti,Prezzocwr,Frequenza,data,ricevereofferte,nomeagente,telefonoagente,categoriacliente) values ('" & text_nome & "','" & text_cognome & "','" & text_indirizzo & "','" & text_citta & "','" & text_provincia & "','" & text_telefono & "','" & text_utente & "','" & text_email & "','" & text_riferimentowincody & "','" & text_password & "','" & text_azienda & "','" & text_indirizzo & "','" & text_partitaiva & "','" & text_codicefiscale & "','" & text_cap & "','" & text_prezzo & "','" & text_prezzoisp & "','" & text_prezzobuffetti & "','" & text_prezzocwr & "','" & check_spese & "',current_date,'" & check_newsletter & "','" & text_nomeagente & "','" & text_telefonoagente & "','" & text_categoriacliente & "')"
		else
			'se modifica
			'se modifica
			'se modifica
			StrSql="update " & tabella & " set Nome='" & text_nome & "', Cognome='" & text_cognome & "' ,Indirizzo='" & text_indirizzo & "' ,citta='" & text_citta & "' ,provincia='" & text_provincia & "' ,telefono='" & text_telefono & "' ,Email='" & text_email & "',Sede='" & text_indirizzo & "',PI='" & text_partitaiva & "',CF='" & text_codicefiscale & "',Cap='" & text_cap & "', ricevereofferte='" & check_newsletter & "' " 
			'psw
			if request("password")<>"" then
				StrSql= StrSql & ", password2='" & text_password & "' "
			end if
			'utente
			if request("utente")<>"" then
				StrSql= StrSql & ", utente1='" & text_utente & "' "
			end if
			StrSql=StrSql & ",spesedispedizione='" & check_spese & "',prezzo='" & text_prezzo & "' ,prezzoisp='" & text_prezzoisp & "',prezzocwr='" & text_prezzocwr & "',prezzobuffetti='" & text_prezzobuffetti & "',prezzocwr='" & text_prezzocwr & "',frequenza=" & cdbl(text_frequenza) & " "
			StrSql=StrSql & ",nomeagente='" & text_nomeagente & "',telefonoagente='" & text_telefonoagente & "' ,categoriacliente='" & text_categoriacliente & "',ragione='" & text_azienda & "' " 
			StrSql= StrSql & "where id=" & clng(request("id"))
		end if	
		'response.write(StrSql)		
		Connm.Execute StrSql
		'response.end
		response.Redirect "adutentipro.asp"		
	end if									
end if							

'agente
Set rsag = Server.CreateObject("ADODB.Recordset")									
Set rscat = Server.CreateObject("ADODB.Recordset")	
rsag.Open "select * from agente order by agente" ,connm
rscat.Open "select * from categorie order by categoriacliente ",connm

%>



<html>
<head>
	<title>SITO WEB E-COMMERCE BACK OFFICE</title>
	<LINK rel="stylesheet" href="style.css">
	<script language="JavaScript" src="calendar.js"></script>
</head>
<body  bgcolor='moccasin' >
<table width=100% height=100% bgcolor='moccasin'>
<tr><td colspan=2><img src='imgnew/testa.jpg'><br></td></tr>
<tr><td width=25></td>
<td valign=top width=550 height=100% bgcolor='moccasin'>
            <!-- qui va inserito la tabella centrale  ed eventualmente un'immagine di sfondo da applicare al td sopra -->
            <form action="dettaglio.asp?act=1&id=<%=request("id")%>&mod=<%=request("mod")%>" method="post" id=formuu name=formuu>
					<table align=left border="0" cellpadding="0" cellspacing="0" width="500" bgcolor=moccasin>
					<tr> 
					<td  colspan="2" ><hr></td>
					</tr>               
					<%
					bg=""
					if instr(rossi,"azienda,")>0 then
					bg="bgcolor='#f0d0d0'"
					end if
					%>
					<tr <%'=bg%>> 
					<td  align=left ><b>NOME AZIENDA:</b></td>
					<td  align=left valign="bottom" >
					<input  size="35" type="text"  id=Text1 maxlength="125" name="azienda" value="<%=text_azienda%>">
					</td>
					</tr>
					<%
					bg=""
					if instr(rossi,"cognome,")>0 then
					bg="bgcolor='#f0d0d0'"
					end if
					%>
					<tr <%'=bg%>>  
					<td  align=left >Cognome/Referente:<font color="#FF0000"></font></td>
					<td  align=left ><input  size="35" type="text"  id="cognome" maxlength="125" name="cognome" value="<%=text_Cognome%>"></td>
					</tr>
					<%
					bg=""
					if instr(rossi,"nome,")>0 then
					bg="bgcolor='#f0d0d0'"
					end if
					%>
					<tr <%'=bg%>> 
					<td  align=left >Nome:<font color="#FF0000"></font></td>
					<td  align=left ><input  size="35" type="text"  id="nome" maxlength="125" name="nome" value="<%=text_Nome%>"></td>
					</tr>
					<%
					bg=""
					if instr(rossi,"partitaiva,")>0 then
					bg="bgcolor='#f0d0d0'"
					end if
					%>
					<tr <%'=bg%>>  
					<td  align=left >Partita Iva:<font color="#FF0000"></font></td>
					<td  align=left ><input size="35" type="text"  id="Partitaiva" maxlength="125" name="Partitaiva" value="<%=text_Partitaiva%>"></td>
					</tr>
					<%
					bg=""
					if instr(rossi,"codicefiscale,")>0 then
					bg="bgcolor='#f0d0d0'"
					end if
					%>
					<tr <%'=bg%>>  
					<td  align=left >Cod.Fiscale:<font color="#FF0000"></font></td>
					<td  align=left ><input size="35" type="text"  id="Codicefiscale" maxlength="125" name="Codicefiscale" value="<%=text_codicefiscale%>"></td>
					</tr>
					<%
					bg=""
					if instr(rossi,"indirizzo,")>0 then
					bg="bgcolor='#f0d0d0'"
					end if
					%>
					<tr <%'=bg%>> 
					<td  align=left >Indirizzo/Sede dell'azienda:<font color="#FF0000"></font></td>
					<td  align=left ><input type="text"  id="text_3" maxlength="130" name="indirizzo" size=45 value="<%=text_Indirizzo%>"></td>
					</tr>
					<%
					bg=""
					if instr(rossi,"citta,")>0 then
					bg="bgcolor='#f0d0d0'"
					end if
					%>
					<tr <%'=bg%>> 
					<td  align=left >Città/Comune:<font color="#FF0000"></font></td>
					<td  align=left ><input type="text"  size="35" id="citta" name="citta" maxlength="145" value="<%=text_Citta%>"></td>
					</tr>
					<%
					bg=""
					if instr(rossi,"cap,")>0 then
					bg="bgcolor='#f0d0d0'"
					end if
					%>
					<tr <%=bg%>>  
					<td  align=left >Cap:<font color="#FF0000">*</font></td>
					<td  align=left ><input type="text"  size="35" id="cap" name="cap" maxlength="15" value="<%=text_Cap%>"></td>
					</tr>
					<%
					bg=""
					if instr(rossi,"provincia,")>0 then
					bg="bgcolor='#f0d0d0'"
					end if
					%>
					<tr <%=bg%>>  
					<td  align=left >Provincia:<font color="#FF0000">*</font></td>
					<td  align=left ><input type="text"  size="55" id=Text2 name="Provincia" maxlength="115" value="<%=text_provincia%>"> 
					</td>
					</tr>
					<%
					bg=""
					if instr(rossi,"email,")>0 then
					bg="bgcolor='#f0d0d0'"
					end if
					%>
					<tr <%=bg%>>  
					<td  align=left >E-Mail:<font color="#FF0000">*</font></td>
					<td  align=left ><input type="text"  id="text_6" maxlength="130" name="email" size=45 value="<%=text_Email%>"></td>
					</tr>
					<%
					bg=""
					if instr(rossi,"telefono,")>0 then
					bg="bgcolor='#f0d0d0'"
					end if
					%>
					<tr <%'=bg%>>  
					<td  align=left >Telefono/ Cellulare/ Fax:<font color="#FF0000"></font></td>
					<td  align=left ><input type="text"  id="telefono" maxlength="130" name="telefono" size=45 value="<%=text_telefono%>">
					<hr>Utente/PassWord</td>
					</tr>
    				<tr>
					<td ><b>Utente</b><font color="#FF0000">*</font></td>
					<td ><%=perru%><INPUT TYPE="TEXT" NAME="utente" VALUE="<%=text_utente%>" ID=TEXT9></td>
					</tr>
					<tr> 
					<td  align=left ><b>Cambia password:</b><font color="#FF0000">*</font></td>
					<td  align=left valign="bottom" ><%=perrp%><input  size="16" type="text"  id="password" maxlength="125" name="password" value="<%=text_Password%>">
					</td>
					</tr>
					<%if request("mod")="addnew" then%>
					<tr> 
					<td  align=left ><b>Riferimento Wincody:</b><font color="#FF0000">*</font></td>
					<td  align=left valign="bottom" ><%=perrw%><input  size="16" type="text"  id="riferimentowincody" maxlength="125" name="riferimentowincody" value="<%=text_riferimentowincody%>">
					<hr>
					</td>
					</tr>
					<%end if%>
					<%
					bg=""
					if instr(rossi,"frequenza,")>0 then
					bg="bgcolor='#f0d0d0'"
					end if
					%>
					<tr <%=bg%>>
					<td >Frequenza<font color="#FF0000">*</font></td>
					<td ><INPUT TYPE="TEXT" NAME="frequenza" VALUE="<%=text_frequenza%>" ID=TEXT9><hr></td>
					</tr>
					<tr>
					<td ><b>Prezzo ADVEO (ELIMINATA)</b><font color="#FF0000">*</font></td>
					<td ><SELECT NAME="prezzo" ID=prezzo>
					<OPTION selected VALUE="<%=text_prezzo%>"><%=text_prezzo%></OPTION>
					<OPTION VALUE="PREZZO1">PREZZO1</OPTION>
					<OPTION VALUE="PREZZO2">PREZZO2</OPTION>
					<OPTION VALUE="PREZZO3">PREZZO3</OPTION>
					<OPTION VALUE="PREZZO4">PREZZO4</OPTION>
					<OPTION VALUE="PREZZO5">PREZZO5</OPTION>
					</SELECT><hr></td>
					</tr>
					<tr>
					<td ><b>Prezzo OD</b><font color="#FF0000">*</font></td>
					<td ><SELECT NAME="prezzoisp" ID=prezzoisp>
					<OPTION selected VALUE="<%=text_prezzoisp%>"><%=text_prezzoisp%></OPTION>
					<OPTION VALUE="PREZZO1">PREZZO1</OPTION>
					<OPTION VALUE="PREZZO2">PREZZO2</OPTION>
					<OPTION VALUE="PREZZO3">PREZZO3</OPTION>
					<OPTION VALUE="PREZZO4">PREZZO4</OPTION>
					<OPTION VALUE="PREZZO5">PREZZO5</OPTION>
					</SELECT><hr></td>
					</tr>					
					<tr>
					<td ><b>Prezzo CWR (ELIMINATA)</b><font color="#FF0000">*</font></td>
					<td ><SELECT NAME="prezzocwr" ID=prezzocwr>
					<OPTION selected VALUE="<%=text_prezzocwr%>"><%=text_prezzocwr%></OPTION>
					<OPTION VALUE="PREZZO1">PREZZO1</OPTION>
					<OPTION VALUE="PREZZO2">PREZZO2</OPTION>
					<OPTION VALUE="PREZZO3">PREZZO3</OPTION>
					<OPTION VALUE="PREZZO4">PREZZO4</OPTION>
					<OPTION VALUE="PREZZO5">PREZZO5</OPTION>
					</SELECT><hr></td>
					</tr>	
					<tr>
					<td ><b>Prezzo BUFFETTI</b><font color="#FF0000">*</font></td>
					<td ><SELECT NAME="prezzobuffetti" ID=prezzobuffetti>
					<OPTION selected VALUE="<%=text_prezzobuffetti%>"><%=text_prezzobuffetti%></OPTION>
					<OPTION VALUE="PREZZO1">PREZZO1</OPTION>
					<OPTION VALUE="PREZZO2">PREZZO2</OPTION>
					<OPTION VALUE="PREZZO3">PREZZO3</OPTION>
					<OPTION VALUE="PREZZO4">PREZZO4</OPTION>
					<OPTION VALUE="PREZZO5">PREZZO5</OPTION>
					</SELECT></b><hr></td>
					</tr>				
					<tr>
					<td >Nome Agente</td>
					<td ><SELECT NAME="nomeagente" ID=nomeagente>
					<OPTION selected VALUE="<%=text_nomeagente%>"><%=text_nomeagente%></OPTION>
					<%do while not rsag.eof%>
					<OPTION VALUE="<%=rsag("agente")%>"><%=rsag("agente")%></OPTION>
					<%rsag.MoveNext
					  loop%>
					</SELECT></td>
					</tr>
					<tr>
					<td >Telefono Agente</td>
					<td ><INPUT TYPE="TEXT" NAME="telefonoagente" VALUE="<%=text_telefonoagente%>" ID=telefonoagente></td>
					</tr>
					<tr>
					<td >Categoria Cliente</td>
					<td ><SELECT NAME="categoriacliente" ID=categoriacliente>
					<OPTION selected VALUE="<%=text_categoriacliente%>"><%=text_categoriacliente%></OPTION>
					<%do while not rscat.eof%>
					<OPTION VALUE="<%=rscat("categoriacliente")%>"><%=rscat("categoriacliente")%></OPTION>
					<%rscat.MoveNext
					  loop%>
					</SELECT></td>
					</tr>
					<tr><td COLSPAN=2><HR></td></tr>
					<tr>
					<td >Ricevere Email via Internet</td>
					<td >
					<%
					'response.Write(check_newsletter)
					if check_newsletter="0" then%>
					<INPUT TYPE="CHECKBOX" NAME="newsletter" ID=newsletter>
					<%else%>
					<INPUT TYPE="CHECKBOX" checked NAME="newsletter" ID=newsletter>
					<%end if%>
					</td>
					</tr>
					<tr><td COLSPAN=2><HR></td></tr>
					<tr>
					<td >Abilito/Disabilito le Spese di Spedizione</td>
					<td >
					<%
					'response.Write(check_spese)
					if check_spese="0" then%>
					<INPUT TYPE="CHECKBOX" NAME="spese" ID=spese>
					<%else%>
					<INPUT TYPE="CHECKBOX" checked NAME="spese" ID=spese>
					<%end if%>
					</td>
					</tr>
					<tr><td COLSPAN=2><HR></td></tr>
					<tr>
					<td ><B >OPERAZIONI</B></td>
					<td ALIGN=LEFT><INPUT type="submit" value="Save" ID=Save></form>
					<form action="dettaglio.asp?id=<%=request("id")%>&del=<%=request("id")%>" method="post" id=formd name=formd>
					<INPUT type="submit" value="Delete" ID=delete>
					</form>
					</td></tr>	
					<tr><td  width=250><B >USCITA SENZA MODIFICHE</b><img width=200 height=1 src='images/frecciaw.gif'></td>
					<td ><a href=adutentipro.asp? ><img src='images/senzamodifiche.gif' border=0 ></a></td>
					</tr>
				  	</table>	  
				  
				

</td></tr></table>
</BODY>
</HTML>
<!--#include file="sqlchiudi.inc" -->