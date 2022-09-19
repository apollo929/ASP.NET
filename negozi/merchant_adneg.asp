<!--#include file="../ad/include/admentor2.asp"-->
<!--#include file="_menu.inc"-->

<%

	Function Scritta(byval testo)
		arparole=split(testo & " ")
		txt=""
		for f=0 to ubound(arparole)
			txt=txt & Ucase(Left(arparole(f),1)) & lcase(mid(arparole(f),2)) & " "
		next
		Scritta=trim(txt)
    End function

    'Apertura Database Registrazione
	strDSN = "FILEDSN=C:\inetpub\wwwroot\alleluia\db\merchant.dsn"
	'Obejct Connessione
	Set cn = Server.CreateObject("ADODB.Connection")
	'Tabelle DB
	Set Tbpro = Server.CreateObject("ADODB.Recordset")		
	'Tabelle Utilita
	Set tbtmp = Server.CreateObject("ADODB.Recordset")
	Set tbpro = Server.CreateObject("ADODB.Recordset")	
	Set tbreg = Server.CreateObject("ADODB.Recordset")	
	Set tball = Server.CreateObject("ADODB.Recordset")
	cn.Open strDSN
	
	'Centro
	strDSNcentro = "FILEDSN=C:\inetpub\wwwroot\alleluia\db\centro.dsn"
	'Obejct Connessione
	Set cncentro = Server.CreateObject("ADODB.Connection")
	'Tabelle DB
	Set tbcentro = Server.CreateObject("ADODB.Recordset")
	cncentro.Open strDSNcentro
	Sql="Select * from Comuni where Trim(Centro)='SI' Order by Comune"
	tbcentro.Open Sql,cncentro
		
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
    Sqlmer="Select * From Merchant order by Login"    

Select Case Trim(Parcm)
   
   Case "new"
            Visuamodifica=True
            text_maxprodotti=200  
			 
   Case "mod"
            'Assegna le variabili per la modifica.
			Visuamodifica=True  
			Sql="Select * From Merchant Where login='"+Trim(Parid)+"'"
			Tbtmp.Open Sql,cn
			text_login=Tbtmp("login")
			text_password=Tbtmp("password")
			text_riferimento=Tbtmp("riferimento")
			text_ragionesociale1=Tbtmp("Ragionesoc1")
			text_ragionesociale2=Tbtmp("Ragionesoc2")
			text_ragionesociale3=Tbtmp("Ragionesoc3")
			text_maxprodotti=Tbtmp("maxprodotti")
			text_centro=Ucase(Tbtmp("Centrocommerciale"))
			text_immagine=lcase(Tbtmp("immagine"))		 
										 
   Case "save"
            'Registrazione variabili da Form
  			text_login=Replace(Request.Form("login"),"'","`")
  			text_password=Replace(Request.Form("password"),"'","`")		 
  			'Ragione Sociale
  			text_ragionesociale1=Replace(Request.Form("ragionesociale1"),"'","`")		 
  			text_ragionesociale2=Replace(Request.Form("ragionesociale2"),"'","`")		 
  			text_ragionesociale3=Replace(Request.Form("ragionesociale3"),"'","`")		 
  			'Riferimento
			text_riferimento=Replace(Request.Form("riferimento"),"'","`")		   			 
			'Max Prodotti
			text_maxprodotti=Cint(Replace(Request.Form("maxprodotti"),"'","`"))
			text_centro=Replace(Request.Form("Centro"),"'","`")	
			'Immagine
			text_immagine=Lcase(Replace(Request.Form("immagine"),"'","`"))
			'Controlla i Campi Obbligatori
			If Len(text_login)< 2 then tx_errore=tx_errore+", la login "
			If Len(text_password)< 2 then tx_errore=tx_errore+", la password "
            'Se privo di errori
			If Len(Trim(tx_errore))=22 Then 
			 Sql="Select * From Merchant Where login='"+Trim(Parid)+"'"
			 Tbtmp.Open Sql,cn
			 d=date()
			 tx_data=trim(year(d))+"/"+trim(month(d))+"/"+trim(day(d))
			 If Tbtmp.EOF then
			   StrSql="Insert into Merchant (Login,Password,Riferimento,Ragionesoc1,Ragionesoc2,Ragionesoc3,Maxprodotti,Data,Centrocommerciale,Immagine) values ('"+text_login+"','"+text_password+"','"+text_riferimento+"','"+text_ragionesociale1+"','"+text_ragionesociale2+"','"+text_ragionesociale3+"'," & text_maxprodotti & ",'"+tx_data+"','"+text_centro+"','"+text_immagine+"')"
			 Else
			   StrSql="Update Merchant Set Login='"+text_login+"',Password='"+text_password+"',Riferimento='"+text_riferimento+"',Ragionesoc1='"+text_ragionesociale1+"',Ragionesoc2='"+text_ragionesociale2+"',Ragionesoc3='"+text_ragionesociale3+"',Maxprodotti=" & text_maxprodotti & ",Data='" & tx_data  & "',Centrocommerciale='" & text_centro & "',Immagine='" & text_immagine & "' where Login='" & Parid  & "'" 
			 End if 
			 cn.Execute StrSql 
			 tx_save="Salvataggio Riuscito."
			End if 
			Visualista=True
			Sqlmer="Select * From Merchant order by data desc"
			
	case "delnews"
			Sql="Select * From Merchant "
			Tbtmp.Open Sql,cn
			Do while Not tbtmp.eof 
              tx=""
              tx=Request.Form(tbtmp("Login"))
               if tx="on" then
                StrSql="Delete * From Merchant where Login='"+trim(tbtmp("Login"))+"'"
                cn.Execute Strsql
               end if
             tbtmp.MoveNext
            Loop	
            Visualista=True	
			
	Case "ric"  
	     'Ricerca per Riferimento nell'archivio
	     Visualista=True
		 tx_riferimento=Request.Form("ricriferimento")
		 Sqlmer="Select * From Merchant Where Riferimento Like '%"+Trim(tx_riferimento)+"%'"
		 
				   			
	Case else		
		 Visualista=True
		 text_maxprodotti=0
          
 End Select	
 
 'Visuamerchant
 tball.Open Sqlmer,cn
 Pass_errore=Len(Trim(tx_errore))
 
 %>

<html>
<head>

<title>primatist.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta NAME="Description" CONTENT="primatist.com il nuovo portale di commercio elettronico che mancava">
<meta NAME="Keywords" CONTENT="commercio elettronico, alimentari, elettronica, abbigliamento, regali">
<style>
BODY
{
    FONT-FAMILY: Verdana;
    FONT-SIZE: 8pt;
    MARGIN-TOP: 1px
}
</style>
</head>
<body bgcolor="#ffffff" link="#7f9186" vlink="#506655">
<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr valign="top">
    <td colspan="2" bgcolor="#d6d8d7"><table width="800" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top" width="242"><A href="../index.asp"><IMG border=0 height=60 src="logo2.gif" width=242></a></td><!--Gestione Banner-->
		<td valign="top">
		<%=GetAdminPagesBannerCode()%>
        </td><!--Fine Gestione Banner-->
        <td valign="top"><IMG height=5 src="spacer.gif" width=90></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td><A href="../index.asp"><IMG alt ="" border=0 height=23 src="Images\homepage.gif" width=141 ></a></td>
    <td bgcolor="#e3e6e5" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td></td>
    <td bgcolor="#e3e6e5" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#e3e6e5">
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td><IMG alt ="" border=0 height=23 hspace=0 src="Images\blank_cyan.gif" style    ="HEIGHT: 23px; WIDTH: 160px" useMap="" width=160 ></td>
        <td></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td bgcolor="#e3e6e5" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="2"><br><IMG alt ="" border=0 height=25 id=IMG2 src="Images\tx_settori.gif" width=106 ></td>
      </tr>
      <tr height="10">
            <td colspan="2"><IMG height=1 src="spacer.gif" width=154>
      </td>
      </tr>
      
      <%AdminMenu%>
      
      
        <TR><td></td></TR>
      <tr>
        <td><IMG height=8 src="spacer.gif" width=8></td>
        <td></FONT></td>
      </tr>
      <tr>
        <td colspan="2"></td>
      </tr>
      <tr>
        <td><IMG height=8 src="spacer.gif" width=8></td>
        <td></td>
      </tr>
      <tr>
        <td colspan="2"></td>
      </tr>
      <tr>
        <td><IMG height=8 src="spacer.gif" width=8></td>
        <td></td>
      </tr>
      <tr>
        <td colspan="2"></td>
      </tr>
      <tr>
        <td><IMG height=8 src="spacer.gif" width=8></td>
        <td><font size="1" face="verdana">&nbsp; <br><br>
        </font></td>
      </tr>
      <tr>
        <td colspan="2"></td>
      </tr>
      <tr>
        <td><IMG height=8 src="spacer.gif" width=8></td>
        <td><font size="1" face="verdana"><A href="oroscopo.asp"><br></a>        </font></td>
      </tr>
      <tr>
        <td colspan="2"></td>
      </tr>
      <tr>
        <td><IMG height=8 src="spacer.gif" width=8></td>
        <td></td>
      </tr>
      <tr>
        <td colspan="2"></td>
      </tr>
    </table>
    <p><br>
</p>    </td>



		<td valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="500" bgcolor="#eae6dd" valign="top">
          
          </td>
        </tr>

        <tr>
        <td valign="top" bgcolor="#ffffff">
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          
          <font face="Verdana" color="#000000" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Benvenuto <%=Session("fullname")%></u></font><br><br>
          
            <tr>
              <td width="5">&nbsp;</td><td>
                           
             
             <!------ Merchant ------>   
             <!------ Merchant ------>  
			<%If Pass_errore<>22 Then	'Ci sono Errori	%>
			   <table border="0" cellPadding="0" cellSpacing="0" width="100%" style="font-family: Verdana; font-size: 8 pt; color: #000000">    
			   <tr><td><font color="red"><strong><%=tx_errore%></strong></td></tr></font>
			   </table>
			<%End If%>
								
			<%'Messaggio Salvataggio Effettuato
			If Trim(tx_save)<>"" Then	%>
			   <table border="0" cellPadding="0" cellSpacing="0" width="100%" style="font-family: Verdana; font-size: 8 pt; color: #000000">    
			   <tr><td><font color="red"><strong><%=tx_save%></strong></td></tr></font>
			   </table>
			<%End If%>	      
				                   
				                   
             
             <%if  Visualista=True  then %>
             <form action="merchant_adneg.asp?cm=ric" method="post" id=form2 name=form2>
			 <table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#b0a8a0" style="font-family: Verdana; font-size: 10 pt; color: #000000">
			 <tr><td>Ricerca per Riferimento&nbsp;<input type="text" name="ricriferimento">&nbsp;&nbsp;<input type="image" border="0" name="imggo" src="Images/go.gif" ></font></td>
			 </tr>
			 </table>
			 </form>
		     <% If not Tball.eof then        %>	
		 	 <form action="merchant_adneg.asp?cm=delnews" method="post" id=form1 name=form1> 
		     <table border="1" cellPadding="0" cellSpacing="0" width="100%" style="font-family: Verdana; font-size: 10 pt; color: #000000">    
		     <tr>
		     <td bgcolor="#d8d3cf">Elimina</td>
		     <td align="center" bgcolor="#d8d3cf">Login</td>
		     <td align="center" bgcolor="#d8d3cf">Password</td>
		     <td align="center" bgcolor="#d8d3cf">Riferimento</td>
		     <td align="center" width=230  bgcolor="#d8d3cf">Rag. Sociale 1</td>
		     <td align="center" width=230  bgcolor="#d8d3cf">Rag. Sociale 2</td>
		     <td align="center" width=230  bgcolor="#d8d3cf">Rag. Sociale 3</td>
		     <td align="center" bgcolor="#d8d3cf">Centro Commerciale</td>
		     <td align="center" bgcolor="#d8d3cf">Citta</td>
		     </tr>
		     <% 
		     if Maxdx>0 and not Tball.EOF then
			   Tball.MoveFirst
    		   counter=0
			   do while not Tball.eof 
				  counter=counter+1
				  Tball.movenext
				  if counter>=Maxdx then exit do
			   loop
			 end if
			 
		     count=0
		     do while not Tball.eof and  count<>20
		      count=count+1   %>
		      <tr>
		      <td bgcolor="#eae6dd" align="center"><INPUT type="checkbox" id="<%=tball("login")%>"  name="<%=tball("login")%>"></td>
		      <td bgcolor="#eae6dd"><a style="font-family: Verdana; font-size: 10 pt; color: #000000" href="merchant_adneg.asp?cm=mod&id=<%=Tball("login")%>"><%=Scritta(Tball("login"))%></td>
		      <td bgcolor="#eae6dd"><%=Scritta(Tball("Password"))%>&nbsp;</td>
		      <td bgcolor="#eae6dd"><%=Scritta(Tball("Riferimento"))%>&nbsp;</td>
		      <td bgcolor="#eae6dd"><%=Scritta(Tball("Ragionesoc1"))%>&nbsp;</td>
		      <td bgcolor="#eae6dd"><%=Scritta(Tball("Ragionesoc2"))%>&nbsp;</td>
		      <td bgcolor="#eae6dd"><%=Scritta(Tball("Ragionesoc3"))%>&nbsp;</td>
		      <td bgcolor="#eae6dd"><%=Tball("Centrocommerciale")%>&nbsp;</td>
		      <td bgcolor="#eae6dd"><%=Tball("Citta")%>&nbsp;</td>
		      </tr>
		      <% Tball.movenext
		      loop     %>
               </table>
                <table border="0" cellPadding="0" cellSpacing="0" width="100%" style="font-family: Verdana; font-size: 10 pt; color: #000000">  
                <tr><td width=700></td>
                 <% if  Maxdx>=20 then %>
                <td><a align="right" href="merchant_adneg.asp?cnt=<%=Maxdx-20%>"><img align="right" alt="Indietro" border="0" src="Images\_prev.gif" ></a></td>
                <% end if%>
                <% if  not Tball.EOF then %>
                <td><a align="right" href="merchant_adneg.asp?cnt=<%=Maxdx+20%>"><img align="right" alt="Avanti" border="0" src="Images\_next.gif" ></a></td>
                <% end if%>
		       </tr>
                </table>
             <%Else %>   
                 <table border="0" cellPadding="0" cellSpacing="0" width="100%" style="font-family: Verdana; font-size: 10 pt; color: #000000">    
		         <tr><td>&nbsp;</td></tr>
		         <tr><td>Nessun nominativo trovato. </td></tr>
		         <tr><td colspan=8>&nbsp;</td></tr>
		         </table>
			 <%End if %> 
			 <%End if %>
             
                        
              
            <%if  Visuamodifica=True  then %>
			  <form action="merchant_adneg.asp?cm=save" method="post" id=form1 name=form1> 
              <table border="0" cellPadding="0" cellSpacing="0" width="100%" style="font-family: Verdana; font-size: 8 pt; color: #000000">
			  <tr>
              <td>Login: </td>
              <td><input id="login" name="login" maxLength="20" value="<%=text_login%>" size="15"></td>
              </tr>
              <tr><td height=5></td></tr>
              <tr>
              <td>Password: </td>
              <td><input id="password" name="password"  maxLength="20" value="<%=text_password%>" size="15"></td>
              </tr>	
              <tr><td height=5></td></tr>
		      <tr>
              <td>Riferimento : </td>
              <td><input maxLength="100" name="riferimento" id="riferimento" size="50" value="<%=text_riferimento%>"></td>
              </tr>
              <tr><td height=5></td></tr>	
			  <tr>
              <td>Ragione Sociale 1: </td>
              <td><input size=50 maxLength="120" name="ragionesociale1" value="<%=text_ragionesociale1%>"></td>
              </tr>	
              <tr><td height=5></td></tr>
              <tr>
              <td>Ragione Sociale 2: </td>
              <td><input size=50 maxLength="120" name="ragionesociale2" value="<%=text_ragionesociale2%>"></td>
              </tr>	
              <tr><td height=5></td></tr>
			  <tr>
              <td>Ragione Sociale 3: </td>
              <td><input size=50 maxLength="120" name="ragionesociale3" value="<%=text_ragionesociale3%>"></td>
              </tr>	
              <tr>
              <td>Url Immagine: </td>
              <td><input size=35 maxLength="35" name="immagine" value="<%=text_immagine%>"></td>
              </tr>	
              <tr><td height=5></td></tr>             
              <tr><td>N° Max Prodotti : </td>
              <td><SELECT name=maxprodotti >
                          <OPTION selected value="<%=text_maxprodotti%>"><%=text_maxprodotti%></OPTION>
			  <%For i=0 to 2000 step 10%>
			  <OPTION value="<%=i%>"><%=i%></OPTION>
			  <%Next%>
			  </SELECT></td>
              </tr>
              <tr><td height=5></td></tr>             
              <tr><td>Centro Commerciale : </td>
              <td><SELECT name=centro >
              <OPTION selected value="<%=text_centro%>"><%=text_centro%></OPTION>
			  <%Do while not Tbcentro.eof%>
			  <OPTION value="<%=Ucase(Tbcentro("Comune"))%>"><%=Ucase(Tbcentro("Comune") & "  --- " & Tbcentro("Nomecentro"))%></OPTION>
			  <%
			  Tbcentro.MoveNext
			   Loop%>
			  </SELECT></td>
              </tr>
              </table>
              <%end if%>
              
              <table border="0" cellPadding="0" cellSpacing="0" width="100%" style="font-family: Verdana; font-size: 8 pt; color: #000000">
              <input type="hidden" name="id" value=<%=text_login%>>
              <tr><td height=10 colspan=5></td></tr>             
              <tr>
              <td align=left><a href="merchant_adneg.asp?cm=new"><img border=0 src="images/bot_nuovo.gif"></a></td>
              <%if Visualista=False then %><td align=left><input type=image src="images/bot_save.gif"></td><%end if%>
              <%if Visuamodifica=False then %><td align=left><input type=image src="Images/bot_delete.gif" border=0><%end if%></td>
              <td width=250>&nbsp;</td>
              </tr>             
              </table>
              
              </form>
                       
	     <!------ Merchant ------>   
             <!------ Merchant ------>      
              
              
              			       
              </td>
              <td width="5" ></td>
            </tr>
          </table></td>
          
        </tr>
      </table>
    
    </td>
  </tr>
  <tr>
    <td valign="top"></td>
    <td valign="top" align="right"><br>
    <A href="javascript:history.back()"><font face="Verdana" size="1">indietro</font></a><br>
    <br>
    </td>
  </tr>
  <tr >
    <td valign="top" colspan="2">
    <table width="800" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#eae6dd">
      <tr>
        <td><A href="mappa.asp"><IMG alt ="" border=0 height=23 src="Images\mappasito.gif" width=177 ></a></td>
        <td><A href="contattaci.asp"><IMG alt ="" border=0 height=23 src="Images\contattaci.gif" width=177 ></a></td>
        <td><A href="contatti.asp"><IMG alt ="" border=0 height=23 src="Images\contatti.gif" width=177 ></a></td>
        <td><A href="crediti.asp"><IMG alt ="" border=0 height=23 src="Images\crediti.gif" width=177 ></a></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
<p align="center"><br><br><font face="verdana" size="1"><a href="http://www.primatist.com/azienda.asp">2001 Primatist SpA</a></font></p>
</body>
</html>
