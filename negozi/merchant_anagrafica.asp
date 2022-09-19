<!--#include virtual="/connessionesql.inc"-->
<%  
    
	Function cheBello(byval testo)
		arparole=split(testo)
		txt=""
		for f=0 to ubound(arparole)
			txt=txt & Ucase(Left(arparole(f),1)) & lcase(mid(arparole(f),2)) & " "
		next
		cheBello=trim(txt)
	end function

	'Tabelle DB
	Set Tbpro = Server.CreateObject("ADODB.Recordset")
	Set Tbproric = Server.CreateObject("ADODB.Recordset")	
	
	'Tabelle Utilita
	Set tbtmp = Server.CreateObject("ADODB.Recordset")
	Set tbpro = Server.CreateObject("ADODB.Recordset")	
	Set tbreg = Server.CreateObject("ADODB.Recordset")	
	Set tball = Server.CreateObject("ADODB.Recordset")
	       
    'Visuaprovincie
    Sqlpro="Select * From Italia_Province order by Provincia"       
    Tbpro.Open Sqlpro,conn   
	
    'Lettura Variabile esterno
	Maxdx=Cint(request("cnt"))
	Parcm=Request("cm")
    Parid=Request("id")
    'Impostazioni Variabili Globali
    Visuamodifica=False
    Visualista=False
    tx_errore=" Hai sbagliato inserire "
    tx_save=""
    'Sql Merchant
    Sqlmer="Select * From Shop_Merchant order by Login"    
    gb_login="marco"
            

Select Case Trim(Parcm)
     		 
   Case "save"
            Sql="Select * From Shop_Merchant Where login='"+gb_login+"'"
			Tbtmp.Open Sql,connm
			text_login=Tbtmp("login")
			text_password=Tbtmp("password")
			text_riferimento=Tbtmp("riferimento")
			text_ragionesociale1=Tbtmp("Ragionesoc1")
			text_maxprodotti=Tbtmp("Maxprodotti")
			'Registrazione
            text_ragione=Replace(Request.Form("ragione"),"'","`")		 
  			text_provincia=Replace(Request.Form("provincia"),"'","`")
  			text_citta=Replace(Request.Form("citta"),"'","`")		 		 
  			text_indirizzo=Replace(Request.Form("indirizzo"),"'","`")
  			text_cap=Replace(Request.Form("cap"),"'","`")		 
  			text_telefono=Replace(Request.Form("telefono"),"'","`")		 
  			text_cellulare=Replace(Request.Form("cellulare"),"'","`")		 
  			text_Email=Replace(Request.Form("Email"),"'","`")		 
  			text_fax=Replace(Request.Form("fax"),"'","`")		 
  			text_partitaiva=Replace(Request.Form("partitaiva"),"'","`")	
  			text_sitointernet=Replace(Request.Form("sitointernet"),"'","`")	 
  			'Controlla i Campi Obbligatori
			If Len(text_indirizzo)< 2 then tx_errore=tx_errore+", l'indirizzo"
			If Len(text_citta)< 2 then tx_errore=tx_errore+", la citta"
			If Len(text_telefono)< 2 then tx_errore=tx_errore+", il telefono"
			If Len(text_cellulare)< 2 then tx_errore=tx_errore+", il cellulare"
			If Instr(text_email,"@")=0 then tx_errore=tx_errore+", l'email"
			If not Isnumeric(text_cap) then tx_errore=tx_errore+", il Cap"
            'Se privo di errori
			If Len(Trim(tx_errore))=22 Then 
			   StrSql="Update Shop_Merchant Set Ragionesoc1='"+text_ragione+"',Provincia='"+text_provincia+"',Citta='"+text_citta+"',Indirizzo='"+text_indirizzo+"',Cap='"+text_cap+"',Telefono='"+text_Telefono+"',Cellulare='"+text_cellulare+"',Fax='"+text_Fax+"',Partitaiva='"+text_partitaiva+"',Email='"+text_email+"',Sitointernet='"+text_sitointernet+"' where Login='"+gb_login+"'" 
			   connm.Execute StrSql 
			   tx_save="Salvataggio Riuscito."
			End if 
			Visuamodifica=True
			
	Case else
            'Assegna le variabili per la modifica.
			Visuamodifica=True  
			Sql="Select * From Shop_Merchant Where login='"+gb_login+"'"
			Tbtmp.Open Sql,connm,1,3
			text_login=Tbtmp("login")
			text_password=Tbtmp("password")
			text_riferimento=Tbtmp("riferimento")
			text_ragionesociale1=Tbtmp("Ragionesoc1")
			text_maxprodotti=Tbtmp("Maxprodotti")
			text_regione=Tbtmp("regione")	 
  			text_provincia=Tbtmp("provincia")
  			text_citta=Tbtmp("citta")
  			text_indirizzo=Tbtmp("indirizzo")
  			text_cap=Tbtmp("cap")
  			text_telefono=Tbtmp("telefono")
  			text_cellulare=Tbtmp("cellulare")
  			text_Email=Tbtmp("Email")
  			text_fax=Tbtmp("fax")
  			text_partitaiva=Tbtmp("partitaiva")
  			text_sitointernet=Tbtmp("sitointernet")
	          
 End Select	
 
 'Visuamerchant
 tball.Open Sqlmer,connm
 Pass_errore=Len(Trim(tx_errore))

 %> 
<html>
	<head>
	<title>Gestione Negozio</title>	
	<link href="/admin/style.css" rel="stylesheet" type="text/css">
	</head>
	<body bgcolor=white>
		<table width="800" border="0" cellspacing="0" cellpadding="0" align="left" id=TABLE2>
			<tr valign="top">
				<td width="200" height=900 bgcolor="white">
				<!--#include file="_menusxme.inc" -->
				</td>
				<!--I: Parte Centrale-->				
				<td width="540" bgcolor="white">
					<font size="1">
					<table valign="top" width="100%"  cellpadding="0" cellspacing="0" border=0>
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
		  <%If Pass_errore<>22 Then	'Ci sono Errori	%>
			   <table border="0" cellPadding="0" cellSpacing="0" width="100%">
			   <tr><td><font color="Darkorange"><strong><%=tx_errore%></strong></td></tr></font>
			   </table>
		  <%End If%>
		  <%'Messaggio Salvataggio Effettuato
			If Trim(tx_save)<>"" Then	%>
			   <table border="0" cellPadding="0" cellSpacing="0" width="100%">    
			   <tr><td><font color="Darkorange"><strong><%=tx_save%></strong></td></tr></font>
			   </table>
		  <%End If%>	      
	      <%If  Visuamodifica=True  then %>
			  <form action="merchant_anagrafica.asp?cm=save" method="post" id=form1 name=form1> 
              <table border="0" cellPadding="0" cellSpacing="0" width="100%">
			  <tr><td width=30% class=navy10n> Riferimento: </td>
              <td class=navy10n> <%=text_riferimento%></font></td>
              </tr>
              <tr><td height=5></td></tr>	
			  <tr>
              <td class=navy10n> Ragione Sociale<br>Cognome & Nome:</td>
              <td class=navy10n><input class=navy10n maxLength="100" name="ragione" size="30" value="<%=text_ragionesociale1%>" ></b></font></td>
              </tr>	
              <tr>
				<td height=10></td>
				<td></td>
			  </tr>
              <tr>
			  <td class=navy10n> Provincia:</font></td>
			  <td class=navy10n width="180"><input class=navy10n id="provincia" name="provincia" value="<%=text_provincia%>"> 
		
			  </td>
			  </tr>
			  <tr>
                <td class=navy10n> Indirizzo:</font></td>
                <td><input class=navy10n maxLength="100" name="indirizzo" size="30" value="<%=text_indirizzo%>"></td>
              </tr>
			  <tr>
                <td class=navy10n> Cap:</font></td>
                <td><input class=navy10n maxLength="5" name="cap" size="5" value="<%=text_cap%>"></td>
              </tr>
			  <tr>
                <td class=navy10n> Città:</font></td>
                <td><input class=navy10n size="25" maxLength="130" name="citta" value="<%=text_citta%>"></td>
              </tr>
              <tr>
				<td height=10></td>
				<td></td>
			  </tr>
              <tr>
              <td class=navy10n> Telefono:</font></td>
              <td><input class=navy10n maxLength="130" name="telefono" value="<%=text_Telefono%>"></td>
              </tr>
              <tr>
              <td></td>
              <td><input class=navy10n name="cellulare" type="hidden" value="00000"></td>
              </tr>
              <tr>
              <td class=navy10n> Fax:</font></td>
              <td><input class=navy10n name="fax" maxLength="30" value="<%=text_fax%>"></td>
              </tr>
              <tr>
				<td height=10></td>
				<td></td>
			  </tr>
              <tr>
              <td class=navy10n> E-Mail:</font></td>
              <td><input class=navy10n maxLength="150" name="email" size="30" value="<%=text_Email%>"></td>
              </tr>
              <tr>
              <td class=navy10n> Sito Internet:</font></td>
              <%if Len(text_sitointernet)>0 then %>
              <td><input class=navy10n maxLength="100" name="sitointernet" size="30" value="<%=text_sitointernet%>"></td>
              <%else%>
              <td><input class=navy10n maxLength="100" name="sitointernet" size="30" value="http:\\<%=text_sitointernet%>"></td>
              <%end if%>
              </tr>
              <tr>
				<td height=10></td>
				<td></td>
			  </tr>
			  <tr>
              <td class=navy10n> Partita Iva<br>Facoltativa:</font></td>
              <td><input class=navy10n name="partitaiva" maxLength="30" value="<%=text_partitaiva%>"></td>
              </tr>
              </table>
              <table border="0" cellPadding="0" cellSpacing="0" width="100%">
              <tr><td height=10 colspan=5></td></tr>             
              <tr>
              <td></td>
              <td width=250>&nbsp;</td>
              </tr>             
              </table>
              <p align=center><input class=navy10n type=image src='/admin/imgnew/salva.gif' id=image1 name=image1></p>
              </form>
              <%End if%>
		   <!------ Merchant ------>   
           <!------ Merchant ------>    				
	
						</td>
						<td width=5><td>
								</tr>
							</table>
						
							</td>
						</tr>
					</table>
					</font>
				
				<!--F: Parte Centrale-->					
				</td>
				<td height="172" bgcolor="<%=color3%>" width="284">
				<!--I: Parte Destra-->
				<!--I: Parte Destra-->
				<!--I: Parte Destra-->
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id=TABLE1>
					<tr>
						<td valign="center" bgcolor="<%=color3%>">
						</td>
					</tr>					
					<tr>
						<td colspan="2">
						</td>
					</tr>
					</table>								
				<!--F: Parte Destra-->
				<!--F: Parte Destra-->
				<!--F: Parte Destra-->
			</TD>
			</TR>
</TABLE>
</body>
</html>

