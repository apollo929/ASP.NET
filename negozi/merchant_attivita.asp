<%  


    
    'Variabili Connessione Db
	Dim dbc
	Dim dbcmrc 
	  
     cDBStats = "/negozi/db/scart.mdb"
     Sub Openconn
      stringdb= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Persist Security Info=False;" &_
      "Data Source=" & Server.MapPath(cDBStats)
      set dbc = Server.CreateObject("ADODB.Connection")
      dbc.open stringdb
     End Sub
     
     Sub CloseConn()
	  if isobject(dbc) then
		if dbc.State = adStateOpen then
			dbc.Close
		end if
		set dbc = nothing
	  end if
     End sub
     
     
     
     cDBStats1 = "/negozi/db/merchant.mdb"
     Sub Openconnmrc
      stringdb1= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Persist Security Info=False;" &_
      "Data Source=" & Server.MapPath(cDBStats1)
      set dbcmrc = Server.CreateObject("ADODB.Connection")
      dbcmrc.open stringdb1
     End Sub
     
     Sub closeConnmrc()
	  if isobject(dbcmrc) then
		if dbcmrc.State = adStateOpen then
			dbcmrc.Close
		end if
		set dbcmrc = nothing
	  end if
     End sub
     
     
     cDBStats2 = "db/merchant.mdb"
     Sub Openconncar
      stringdb2= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Persist Security Info=False;" &_
      "Data Source=" & Server.MapPath(cDBStats2)
      set dbcmrc = Server.CreateObject("ADODB.Connection")
      dbccar.open stringdb2
     End Sub
     
     Sub closeConncar()
	  if isobject(dbccar) then
		if dbccar.State = adStateOpen then
			dbccar.Close
		end if
		set dbccar = nothing
	  end if
     End sub

	
	Openconn
	Openconnmrc
	  
     
    'Apertura Database Registrazione
	'Obejct Connessione
	'Tabelle DB
	Set Tbpro = Server.CreateObject("ADODB.Recordset")		
	'Tabelle Utilita
	Set tbtmp = Server.CreateObject("ADODB.Recordset")
	Set tbpro = Server.CreateObject("ADODB.Recordset")	
	Set tbreg = Server.CreateObject("ADODB.Recordset")	
	Set tball = Server.CreateObject("ADODB.Recordset")
	Set tbcat = Server.CreateObject("ADODB.Recordset")

	
    'Visuacategorie
    Sqlcat="Select * From Categories order by catdescription"       
    tbcat.Open Sqlcat,dbc
    	
	'Apertura Database Italia
    Set cnitalia = Server.CreateObject("ADODB.Connection")
	cDBStatsita = "/negozi/db/italia.mdb"
    'Apertura Database 
	strDSNita =  "Provider=Microsoft.Jet.OLEDB.4.0;" &_
    "Persist Security Info=False;" &_
    "Data Source=" & Server.MapPath(cDBStatsita)
    cnitalia.open strDSNita
        
    'Visuaprovincie
    Sqlpro="Select * From Province order by Provincia"       
    Tbpro.Open Sqlpro,cnitalia
    
    'Visuaregione
    Sqlreg="Select * From Regioni order by Regione"       
    Tbreg.Open Sqlreg,cnitalia
		
    'Lettura Variabile esterno
	Maxdx=Cint(request("dbcmrct"))
	Parcm=Request("cm")
    Parid=Request("id")
    'Impostazioni Variabili Globali
    Visuamodifica=False
    Visualista=False
    text_errore=" Hai sbagliato inserire "
    text_save=""
    'Sql Merchant
    Sqlmer="Select * From Merchant order by Login"    
    gb_login="marco"

Select Case Trim(Parcm)
     		 
   Case "save"
             Sql="Select * From Merchant Where login='"+gb_login+"'"
			 Tbtmp.Open Sql,dbcmrc
			 text_login=Tbtmp("login")
			 text_password=Tbtmp("password")
			 text_riferimento=Tbtmp("riferimento")
			 text_ragionesociale1=Tbtmp("Ragionesoc1")
			 
			 'Data Chiusurada
			 text_datachiusurada=Request.Form("datachiusurada")
			 If Isdate(text_datachiusurada)=False then 
			   text_datachiusurada=Date()  
			 End if
			 'Trasformo Data in Americano
			 text_datachiusurada1=trim(year(text_datachiusurada))+"/"+trim(month(text_datachiusurada))+"/"+trim(day(text_datachiusurada))
			 'Data Chiusuraa
			 text_datachiusuraa=Request.Form("datachiusuraa")
			 If Isdate(text_datachiusuraa)=False then 
			   text_datachiusuraa=Date()  
			 End if
			 'Trasformo Data in Americano
			 text_datachiusuraa1=trim(year(text_datachiusuraa))+"/"+trim(month(text_datachiusuraa))+"/"+trim(day(text_datachiusuraa))
			 'Testo Chiusura
			 text_testochiusura=Replace(Request.Form("testochiusura"),"'","`")		   			 
			 'Giorno1 Chiusura
			 text_giorno1=Replace(Request.Form("giorno1"),"'","`")		   			 
			 'Giorno2 Chiusura
			 text_giorno2=Replace(Request.Form("giorno2"),"'","`")		   			 
			 'Note
			 text_note=Replace(Request.Form("note"),"'","`")		   			 
			 'Categoria1
			 text_categoria1=Replace(Request.Form("categoria1"),"'","`")		   			 
			 'Categoria2
			 text_categoria2=Replace(Request.Form("categoria2"),"'","`")		   			 
			 'Categoria3
			 text_categoria3=Replace(Request.Form("categoria3"),"'","`")
			 'Categoria4
			 text_categoria4=Replace(Request.Form("categoria4"),"'","`")		   			 
			 'Categoria5
			 text_categoria5=Replace(Request.Form("categoria5"),"'","`")
			 'Categoria6
			 text_categoria6=Replace(Request.Form("categoria6"),"'","`")
			 salva=false
			 if Trim(text_categoria1)<>"0" then salva=True
			 if Trim(text_categoria2)<>"0" then salva=True
			 if Trim(text_categoria3)<>"0" then salva=True
			 if Trim(text_categoria4)<>"0" then salva=True
			 if Trim(text_categoria5)<>"0" then salva=True
			 if Trim(text_categoria6)<>"0" then salva=True
			 if salva=True then			 
			  StrSql="Update Merchant Set Chiusurada='"+text_datachiusurada1+"',Chiusuraa='"+text_datachiusuraa1+"',Testochiusura='"+text_Testochiusura+"',Giornochiusura1='"+text_Giorno1+"',Giornochiusura2='"+text_Giorno2+"',Centro1='"+text_categoria1+"',Centro2='"+text_categoria2+"',Centro3='"+text_categoria3+"',Centro4='"+text_categoria4+"',Centro5='"+text_categoria5+"',Centro6='"+text_categoria6+"',[Note]='"+text_note+"' where Login='"+gb_login+"'" 
			  dbcmrc.Execute StrSql 
			  text_save="Salvataggio Riuscito."
			 else
			  text_errore="Seleziona almeno un categoria."
			 end if 
			 Visuamodifica=True
			 'riconversione
			 Do While Not Tbcat.Eof
				if Trim(text_categoria1)=Cstr(Tbcat("categoryid")) then text_cat1=Tbcat("catdescription")
				if Trim(text_categoria2)=Cstr(Tbcat("categoryid")) then text_cat2=Tbcat("catdescription")
				if Trim(text_categoria3)=Cstr(Tbcat("categoryid")) then text_cat3=Tbcat("catdescription")
				if Trim(text_categoria4)=Cstr(Tbcat("categoryid")) then text_cat4=Tbcat("catdescription")
				if Trim(text_categoria5)=Cstr(Tbcat("categoryid")) then text_cat5=Tbcat("catdescription")
				if Trim(text_categoria6)=Cstr(Tbcat("categoryid")) then text_cat6=Tbcat("catdescription")
				Tbcat.MoveNext
			Loop
			Tbcat.MoveFirst
			
	Case else
	        
            'Assegna le variabili per la modifica.
			Visuamodifica=True  
			Sql="Select * From Merchant Where login='"+gb_login+"'"
			Tbtmp.Open Sql,dbcmrc
			text_login=Tbtmp("login")
			text_password=Tbtmp("password")
			text_riferimento=Tbtmp("riferimento")
			text_ragionesociale1=Tbtmp("Ragionesoc1")
	'		text_ragionesociale2=Tbtmp("Ragionesoc2")
	'		text_ragionesociale3=Tbtmp("Ragionesoc3")
			'Data Chiusurada
			text_datachiusurada=Tbtmp("chiusurada")
			'Data Chiusuraa
			text_datachiusuraa=Tbtmp("chiusuraa")
			'Testo Chiusura
			text_testochiusura=Tbtmp("testochiusura")
			'Giorno1 Chiusura
			text_giorno1=Tbtmp("giornochiusura1")
			'Giorno2 Chiusura
			text_giorno2=Tbtmp("giornochiusura2")
			'Note
			text_note=Tbtmp("note")
			'Categoria1
			text_categoria1=Tbtmp("centro1")
			
			'Categoria2
			text_categoria2=Tbtmp("centro2")
			'Categoria3
			text_categoria3=Tbtmp("centro3")
			'Categoria4
			text_categoria4=Tbtmp("centro4")
			'Categoria5
			text_categoria5=Tbtmp("centro5")
			'Categoria6
			text_categoria6=Tbtmp("centro6")
			Do While Not Tbcat.Eof
				if Trim(Tbtmp("centro1"))=Cstr(Tbcat("categoryid")) then text_cat1=Tbcat("catdescription")
				if Trim(Tbtmp("centro2"))=Cstr(Tbcat("categoryid")) then text_cat2=Tbcat("catdescription")
				if Trim(Tbtmp("centro3"))=Cstr(Tbcat("categoryid")) then text_cat3=Tbcat("catdescription")
				if Trim(Tbtmp("centro4"))=Cstr(Tbcat("categoryid")) then text_cat4=Tbcat("catdescription")
				if Trim(Tbtmp("centro5"))=Cstr(Tbcat("categoryid")) then text_cat5=Tbcat("catdescription")
				if Trim(Tbtmp("centro6"))=Cstr(Tbcat("categoryid")) then text_cat6=Tbcat("catdescription")
				Tbcat.MoveNext
			Loop
			'If not Tbcat.eof then
			  Tbcat.MoveFirst
			'End if	          
 End Select	
 
 'Visuamerchant
 tball.Open Sqlmer,dbcmrc
 Pass_errore=Len(Trim(text_errore))
 
 
 
 %> 
<!--Shop Italian Genovese Marco-->
<!--#include file="_colors.inc"-->
<!--#include file="_money.inc"-->
<!--#include file="_images.inc"-->
<!--#include file="stat/count.asp"-->
<html>
	<head>
				<title>Gestione Negozio</title>
	
		<link rel="stylesheet" href="/style.css">
	</head>
	<body bgcolor=white>
		<!--#include file="_menutop.inc" -->
			<tr valign="top">
				<td width="200" height=900 bgcolor="white">
					<!--#include file="_menusxme.inc" -->
				</td>
				<!--I: Parte Centrale-->				
				<td width="540" bgcolor="white">
					<font size="1">
					<table valign="top" width="100%"  cellpadding="0" cellspacing="0">
						<tr>
							<td class=orange14 align=center valign="middle" height="48" bgcolor="white">
							 <img border=0 src='/admin/imgnew/testapiccolo.jpg'>
							</td>
						</tr>
						<tr>
							<td>
							<table border=0 cellPadding="0" cellSpacing="0" name="documento" width="100%" valign="top">
								<tr>
									<td width=5><td>
									<td>
		
										
		  <!------ Merchant ------>   
          <!------ Merchant ------> 
		  <!------ Merchant ------>   
          <!------ Merchant ------>  
		  <%If Pass_errore<>22 Then	'Ci sono Errori	%>
			   <table border="0" cellPadding="0" cellSpacing="0" width="100%">    
			   <tr><td><font color="red"><strong><%=text_errore%></strong></td></tr></font>
			   </table>
		  <%End If%>
		  <%'Messaggio Salvataggio Effettuato
			If Trim(text_save)<>"" Then	%>
			   <table border="0" cellPadding="0" cellSpacing="0" width="100%">    
			   <tr><td><font color="red"><strong><%=text_save%></strong></td></tr></font>
			   </table>
		  <%End If%>	      
	      <%If  Visuamodifica=True  then %>
			  <form action="merchant_attivita.asp?cm=save" method="post" id=form1 name=form1> 
              <table border="0" cellPadding="0" cellSpacing="0" width="100%">
			  <tr><td class=navy10n width=200><font size=2>Riferimento:<br></td>
              <td class=navy10n> <%=text_riferimento%></td>
              </tr>
              <tr><td height=8></td></tr>	
			  <tr>
              <td class=navy10n> Ragione Sociale/Cognome Nome:<br></td>
              <td class=navy10n> <b><%=text_ragionesociale1%></b></td>
              </tr>	
              <tr><td height=8></td></tr>
              <!---tr>
              <td></td><br>
              <td class=navy10n> <b><%=text_ragionesociale2%></b></td>
              </tr>	
              <tr><td height=8></td></tr>
			  <tr>
              <td><br></td>
              <td class=navy10n> <b><%=text_ragionesociale3%></b></td>
              </tr>	
              <tr>
              <td class=navy10n> Chiuso x Ferie da:</td>
              <td align=left valign=middle><input size="10" id="datachiusurada" name="datachiusurada" maxLength="10" value="<%=text_datachiusurada%>"><a href=javascript:openWindow('calendario.asp?id=datachiusurada')><img src=img/ico_freccia.gif border=0 alt="Seleziona Data"></a></td><td></td>
              </tr>
              
              <tr>
              <td align=middle><font size=2></td>
              <td align=left valign=middle><input size="10" id="datachiusuraa" name="datachiusuraa" maxLength="10" value="<%=text_datachiusuraa%>"><a href=javascript:openWindow('calendario.asp?id=datachiusuraa')><img src=img/ico_freccia.gif border=0 alt="Seleziona Data"></a></td><td ></td>
              </tr>
              <tr>
              <td class=navy10n> Testo Chiusura:</td>
              <td colspan=2><input maxLength="100" name="testochiusura" size="28" value="<%=text_testochiusura%>"></td>
              </tr>
              <tr><td height=10></td></tr>
              <tr><td class=navy10n> Giorni Chiusura: </td><td colspan=2>
              <SELECT class=navy10n id=Giorno1 name=Giorno1>
               <%if Len(text_giorno1)>0 then %>
                <option selected value="<%=text_giorno1%>"><%=text_giorno1%></option>
               <%end if%> 
               <%if Trim(text_giorno1)<>"Lunedì" then %><option value="Lunedi">Lunedì</option><%end if%>
               <%if Trim(text_giorno1)<>"Martedì" then %><option value="Martedi">Martedì</option><%end if%>
               <%if Trim(text_giorno1)<>"Mercoledì" then %><option value="Mercoledi">Mercoledì</option><%end if%>
               <%if Trim(text_giorno1)<>"Giovedì" then %><option value="Giovedi">Giovedì</option><%end if%>
               <%if Trim(text_giorno1)<>"Venerdì" then %><option value="Venerdi">Venerdì</option><%end if%>
               <%if Trim(text_giorno1)<>"Sabato" then %><option value="Sabato">Sabato</option><%end if%>
               <%if Trim(text_giorno1)<>"Domenica" then %><option value="Domenica">Domenica</option><%end if%>
               </select></td></td>
              </tr>
              <tr><td height=8></td></tr>
              <tr><td class=navy10n> </td><td colspan=2>
              <SELECT class=navy10n id=Giorno2 name=Giorno2>
              <%if Len(text_giorno2)>0 then %>
              <option selected value="<%=text_giorno2%>"><%=text_giorno2%></option>
              <%end if%> 
               <%if Trim(text_giorno2)<>"Lunedì" then %><option value="Lunedi">Lunedì</option><%end if%>
               <%if Trim(text_giorno2)<>"Martedì" then %><option value="Martedi">Martedì</option><%end if%>
               <%if Trim(text_giorno2)<>"Mercoledì" then %><option value="Mercoledi">Mercoledì</option><%end if%>
               <%if Trim(text_giorno2)<>"Giovedì" then %><option value="Giovedi">Giovedì</option><%end if%>
               <%if Trim(text_giorno2)<>"Venerdì" then %><option value="Venerdi">Venerdì</option><%end if%>
               <%if Trim(text_giorno2)<>"Sabato" then %><option value="Sabato">Sabato</option><%end if%>
               <%if Trim(text_giorno2)<>"Domenica" then %><option value="Domenica">Domenica</option><%end if%>
               </select></td></td>
              </tr--->                                   
              <tr><td height=10></td></tr>
              <tr><td class=navy10n> Categorie: </td>
              <td colspan=2><SELECT class=navy10n id=categoria1 name=categoria1>
               <%if Len(text_cat1)>0 then %>
              <option selected value="<%=text_categoria1%>"><%=text_cat1%></option>
              <%end if%>
               <OPTION value="0">Nessuna</OPTION>
				<%Do While Not Tbcat.Eof%>
				<OPTION value="<%=Tbcat("categoryid")%>"><%=Tbcat("catdescription")%></OPTION>
				<% Tbcat.MoveNext
				 Loop%>
				</SELECT></td>
              </tr>
              
              <%
              
            'If not Tbcat.eof then
			  Tbcat.MoveFirst
			'End if	   
			
              %>
              <tr><td height=8></td></tr>
              <tr><td></td>
               <td colspan=2><SELECT class=navy10n id=categoria2 name=categoria2>
               <%if Len(text_cat2)>0 then %>
              <option selected value="<%=text_categoria2%>"><%=text_cat2%></option>
              <%end if%> 
               <OPTION value="0">Nessuna</OPTION>
				<%Do While Not Tbcat.Eof%>
				<OPTION value="<%=Tbcat("categoryid")%>"><%=Tbcat("catdescription")%></OPTION>
				<% Tbcat.MoveNext
				 Loop%>
				</SELECT></td>
              </tr>
              
               <%
               
            'If not Tbcat.eof then
			  Tbcat.MoveFirst
			'End if	
               
               
               %>
              <tr><td height=8></td></tr>
              <tr><td></td>
              <td colspan=2><SELECT class=navy10n id=categoria3 name=categoria3>
              <%if Len(text_cat3)>0 then %>
              <option selected value="<%=text_categoria3%>"><%=text_cat3%></option>
              <%end if%>
               <OPTION value="0">Nessuna</OPTION>
				<%Do While Not Tbcat.Eof%>
				<OPTION value="<%=Tbcat("categoryid")%>"><%=Tbcat("catdescription")%></OPTION>
				<% Tbcat.MoveNext
				 Loop%>
				</SELECT></td>
              </tr>
              
                <%
               
            'If not Tbcat.eof then
			  Tbcat.MoveFirst
			'End if	
               
               
               %>
              <tr><td height=8></td></tr>
              <tr><td></td>
              <td colspan=2><SELECT class=navy10n id=categoria4 name=categoria4>
              <%if Len(text_cat4)>0 then %>
              <option selected value="<%=text_categoria4%>"><%=text_cat4%></option>
              <%end if%>
              <OPTION value="0">Nessuna</OPTION>
				<%Do While Not Tbcat.Eof%>
				<OPTION value="<%=Tbcat("categoryid")%>"><%=Tbcat("catdescription")%></OPTION>
				<% Tbcat.MoveNext
				 Loop%>
				</SELECT></td>
              </tr>
              
			                <%
               
            'If not Tbcat.eof then
			  Tbcat.MoveFirst
			'End if	
               
               
               %>
              <tr><td height=8></td></tr>
              <tr><td></td>
              <td colspan=2><SELECT class=navy10n id=categoria5 name=categoria5>
              <%if Len(text_cat5)>0 then %>
              <option selected value="<%=text_categoria5%>"><%=text_cat5%></option>
              <%end if%>
               <OPTION value="0">Nessuna</OPTION>
				<%Do While Not Tbcat.Eof%>
				<OPTION value="<%=Tbcat("categoryid")%>"><%=Tbcat("catdescription")%></OPTION>
				<% Tbcat.MoveNext
				 Loop%>
				</SELECT></td>
              </tr>
              
                            <%
               
            'If not Tbcat.eof then
			  Tbcat.MoveFirst
			'End if	
               
               
               %>
              <tr><td height=8></td></tr>
              <tr><td></td>
              <td colspan=2><SELECT class=navy10n id=categoria6 name=categoria6>
              <%if Len(text_cat6)>0 then %>
              <option selected value="<%=text_categoria6%>"><%=text_cat6%></option>
              <%end if%>
               <OPTION value="0">Nessuna</OPTION>
				<%Do While Not Tbcat.Eof%>
				<OPTION value="<%=Tbcat("categoryid")%>"><%=Tbcat("catdescription")%></OPTION>
				<% Tbcat.MoveNext
				 Loop%>
				</SELECT></td>
              </tr>
              <tr><td height=10></td></tr>
              <tr>
              <td valign=top><font size=2>Note: </td>
              <td colspan=2><textarea name="note" rows=6 cols=24 size="32" value="<%=text_note%>"><%=text_note%></textarea></td>
              </tr>
              </table>
              <table border="0" cellPadding="0" cellSpacing="0" width="100%">
              <tr><td height=10 colspan=5></td></tr>             
              <tr>
              <td width=250>&nbsp;</td>
              </tr>             
              </table>
              <p align=center><input type=image src='/admin/imgnew/salva.gif' id=image1 name=image1></p>
              </form>
              <%End if
              'Chiusura
              closeConncar
              closeConn
              
              
              
              %>
		   <!------ Merchant ------>   
           <!------ Merchant ------>    				
	
						</td><td width=5></td>
								</tr>
							</table>
						
							</td>
						</tr>
					</table>
					</font>
				
				<!--F: Parte Centrale-->					
				</td>
				<td height="172" bgcolor="<%=color3%>" width="284">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id=TABLE1>
					<!--#include file="_menusearch.inc" -->
					<tr>
						<td colspan="2">
						</td>
					</tr>
				</table>
				<!--I: Parte Destra-->
				<!--I: Parte Destra-->
				<!--I: Parte Destra-->
				
								
				<!--F: Parte Destra-->
				<!--F: Parte Destra-->
				<!--F: Parte Destra-->
			</TD>
			</TR>
</TABLE>
</body>
</html>

