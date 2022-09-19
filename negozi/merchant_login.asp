<!--#include file="../stat/count.asp"-->
<!--#include file="../popup.inc" -->
<%	
    'Apertura Database Registrazioni
	cDBStatsreg = "../db/registrazione.mdb"
 	strDSNreg =  "Provider=Microsoft.Jet.OLEDB.4.0;" &_
    "Persist Security Info=False;" &_
    "Data Source=" & Server.MapPath(cDBStatsreg)
    
    'Apertura Database Merchant
	cDBStatsmer = "../db/merchant.mdb"
 	strDSNmer =  "Provider=Microsoft.Jet.OLEDB.4.0;" &_
    "Persist Security Info=False;" &_
    "Data Source=" & Server.MapPath(cDBStatsmer)
  
    
	Set cnreg = Server.CreateObject("ADODB.Connection")
	Set cnmer = Server.CreateObject("ADODB.Connection")
	
	'Tabelle Utilita
	Set tbmer = Server.CreateObject("ADODB.Recordset")
	Set tbreg = Server.CreateObject("ADODB.Recordset")
	Set tbtmp = Server.CreateObject("ADODB.Recordset")
	Set tbtmp1 = Server.CreateObject("ADODB.Recordset")
	
	'Apertura Db	
	cnreg.Open strDSNreg
	cnmer.Open strDSNmer
			
	'Settaggio Variabili
	Parcmd=Request("id")
	tx_errore="Inserisci i tuoi DATI!"
	 
	'Flag
	Visuaform=False
			
    
Select Case Trim(Parcmd)

 Case "registrati"
            'Registrazione Variabili da Form  
            tx_login=Cstr(Replace(Request.Form("login"),"'","`"))
			tx_password=Cstr(Trim(Replace(Request.Form("password"),"'","`")))
			Sqlreg="Select * from Registrazione Where Login1='" & tx_login & "' and Password1='" & tx_password & "'"		  
			'response.write(Sqlreg)
			tbreg.Open Sqlreg,cnreg
			
			if tbreg.EOF then
			  Visuaform=true
              tx_errore=" Hai sbagliato inserire i tuoi DATI!"
            else
                'Dati
				text_nome=Tbreg("Nome")
				text_cognome=Tbreg("Cognome")
				text_indirizzo=Tbreg("Indirizzo")
				text_citta=Tbreg("Citta")
				text_provincia=Tbreg("Provincia")
				text_email=Tbreg("Email")
				text_telefono=Tbreg("telefonoabitazione")
				'Inserimento
				Sqltmp="Select * from Merchant Where Login='" & Trim(tx_login) & "'"
				tbtmp.open Sqltmp,cnmer
				'Se presente
				if tbtmp.eof then 
					StrSql="Insert into Merchant (RagioneSoc1,Indirizzo,Citta,Provincia,Email,Telefono,Login,Maxprodotti,Riferimento,Centro1,Centro2) values ('" & text_Nome & " - " & text_Cognome & "','"+text_Indirizzo+"','"+text_Citta+"','"+text_Provincia+"','"+text_Email+"','"+text_telefono+"','"+tx_login+"',50,'" & text_Nome & " - " & text_Cognome & "',10,33)"
					'Open
					tbmer.Open StrSql,cnmer
					tbmer.Close
					Sqltmp1="Select * from Merchant Where Login='" & Trim(tx_login) & "'"
				    tbtmp1.open Sqltmp1,cnmer
				    Session("IDMerchant")=trim(tbtmp1("IDMerchant"))	
				else
				    Session("IDMerchant")=trim(tbtmp("IDMerchant"))	
				end if
												                           
                Session("login")=tx_login
                Session("Password")=tx_password
                
                Response.Redirect "merchant_anagrafica.asp?"
    		end if 
 Case Else
 			
     	    Visuaform=True
		
End Select		    	

'Setta la variabile d'errore
Pass_Errore=Len(Trim(tx_errore))%>  



<!--Shop Italian Genovese Marco-->
<!--#include file="_colors.inc"-->
<!--#include file="_money.inc"-->
<!--#include file="_images.inc"-->

<html>
	<head>
		<title>Shopitalian.it</title>
		<!--#include file="_marketing.inc" -->
		<link rel="stylesheet" href="_styles.inc">
	</head>
	<body bgcolor="<%=color1%>" link="<%=color1%>" vlink="<%=color1%>">
		<!--#include file="_menutop.inc" -->
			<tr valign="top">
				<td width="141" height=900 bgcolor="<%=color4%>">
					<!--#include file="_menusx.inc" -->
				</td>
				<!--I: Parte Centrale-->				
				<td width="440" bgcolor="<%=color1%>">
					<font size="1">
					<table valign="top" width="100%"  cellpadding="0" cellspacing="0">
						<tr>
							<td class=orange14 align=center valign="middle" height="48" bgcolor="<%=color3%>">
							 <b>Shop-ONLINE</b>
							</td>
						</tr>
						<tr>
							<td>
							<table name="documento" width="100%">
								<tr>
									<td>
									
									
									
			<!---- Parte in Mezzo ------->
			<!---- Parte in Mezzo ------->
			<!---- Parte in Mezzo ------->
			<!---- Parte in Mezzo ------->
			<%If Visuaform=True  then %>
	        
						<form action="merchant_login.asp?id=registrati" method="post" id=form1 name=form1>  
						<br>
						<%'Se vi sono errori scrivili!!
						If Pass_errore<>22 Then	'Ci sono Errori	%>
						<table><tr><td><font color="Darkorange" style="font-size:13px"><strong><%Response.write(tx_errore)%></td></tr></strong></font></td></tr></table>
						<%End If%>
						<table border="1"  bordercolor=<%=color4%> cellPadding="0" cellSpacing="0" width="350"   >                                       
						<tr><td bgColor=<%=color4%>  Class=BIANCO10 vAlign="top" width="481"><img alt src="images\sopradx.gif" WIDTH="8" HEIGHT="8">&nbsp;LA VENDITA ONLINE SHOP-ONLINE</td></tr>
						<tr><td>
						<table border=0 width=100% >
						<tr><td align=center class=menuprod15><STRONG>LOGIN</STRONG></td><td>&nbsp;<input CLASS=NERO10 id="login1" name="login" value="<%=text_login%>" maxLength="15" size="15"></td><td width=30%>&nbsp;</td></tr>
						<tr><td>&nbsp;</td></tr>
						<tr><td width=100% align=center class=menuprod15><STRONG>PASSWORD</STRONG></td><td>&nbsp;<input CLASS=NERO10 id="password" name="password" type="password" maxLength="15" size="15"></td><td width=30%>&nbsp;</td></tr>
						<tr><td><center><input type="image" src="img/bottone_invia.gif" name="submitgif"></center></td></tr>
						</table>
						</td></tr></table>
						<center><br></center>
						</form> 
						<center>
						<embed  bgcolor="#FFFFFF"  width=350 height=300 src="../flash/vetrina.swf" quality="high"></embed></center>
																										   	
			<% End if %>
            <!---- Parte in Mezzo ------->
			<!---- Parte in Mezzo ------->
			<!---- Parte in Mezzo ------->
			<!---- Parte in Mezzo ------->
			
			
			
									</td>
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
				<!--F: Parte Destra-->
			</TD>
			</TR>
			<tr valign="top">
				<td rowspan="2" bgcolor="<%=color3%>" width="51">
				</td>
<tr valign="top">
	<td >
    </td>
	<%'!--#include file="_menuiconetwork.inc" --%>
    </tr>
	<tr valign="top">
		<td colspan="2" bgcolor="<%=color3%>">
		</td>
		<td bgColor="<%=color3%>" width="200"></td>
	</tr>
	<tr vAlign="top">
		<td colSpan="3">&nbsp;</td>
	</tr>
</TABLE>
<!--#include file="_menubot.inc" -->
</body>
</html>

