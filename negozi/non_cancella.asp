<!--#include file="../ad/include/admentor2.asp"-->
<%'!--#include file="menu.inc"--%>

<%  'Apertura Database Registrazione
	strDSN = "FILEDSN=C:\inetpub\wwwroot\alleluia\db\registrazione.dsn"
	strDSNscart = "FILEDSN=C:\inetpub\wwwroot\alleluia\db\scart.dsn"
	Set cn = Server.CreateObject("ADODB.Connection")
	Set cnscart = Server.CreateObject("ADODB.Connection")
	
		
	'Tabelle DB
	Set Tbpro = Server.CreateObject("ADODB.Recordset")		
		
	'Tabelle Utilita
	Set tbcat = Server.CreateObject("ADODB.Recordset")
	Set tbpro = Server.CreateObject("ADODB.Recordset")		
		
	cn.Open strDSN
	cnscart.Open strDSNscart
	
	'Visuaprovincie
    Sqlpro="Select * From Province order by Provincia"       
    tbpro.Open Sqlpro,cn

    'Visuacategorie
    Sqlcat="Select * From Categories order by catdescription"       
    tbcat.Open Sqlcat,cnscart



	Maxdx=Cint(request("cnt"))
	Parcm=Request("cm")
    Parid=Request("Id")

    Visuadettaglio=False
    Visuamodifica=False
    Visualista=False
    tx_errore=" Hai sbagliato inserire "
    tx_save=""
    


 Select Case Trim(Parcm)
 
   Case "vis"
			Visuadettaglio=True
			Sql="Select * From Registrazione Where login='"+Trim(Parid)+"' and Network=True and Networkold=False order by Data desc"
			Tball.Open Sql,cn
     
   Case "mod"
            'Assegna le variabili per la modifica.
			Visuamodifica=True  
			Sql="Select * From Registrazione Where login='"+Trim(Parid)+"' and Network=True and Networkold=False order by Data desc"
			Tball.Open Sql,cn
			text_username=Tball("username")
			text_login=Tball("login")
			text_password=Tball("password")
			text_nome=Tball("Nome")
			text_cognome=Tball("Cognome")
			text_sesso=Tball("Sesso")
			If text_sesso="M" then
			 text_M="checked"
			else 
			 text_F="checked"
			end if 
			text_indirizzo=Tball("Indirizzo")
			text_cap=Tball("CAP")
			text_citta=Tball("Citta")
			text_provincia=Tball("Provincia")
			text_email=Tball("Email")
			text_telefono=Tball("telefonoabitazione")
			text_cellulare=Tball("telefonocellulare")
			text_login=Tball("login")
			text_password=Tball("password")
			text_sponsorlogin=Tball("sponsorlogin")
			text_sponsorpassword=Tball("sponsorpassword")
			text_quota=Ccur(Tball("quota"))
			text_dataisc=Tball("data")
			text_datanascita=Tball("datanascita")
			text_d1=Day(text_datanascita)
			text_d2=Month(text_datanascita)
			text_d3=Year(text_datanascita)
			text_partitaiva=Tball("partitaiva")
			text_networkold=Tball("networkold")
			text_chknetworkold=""
	
							 
	Case "save"
	
	
			 'Registrazione variabili da Form
  			 text_login=Replace(Request.Form("login"),"'","`")
  			 text_password=Replace(Request.Form("password"),"'","`")		 
  			 'Ragione Sociale
  			 text_ragionesociale1=Replace(Request.Form("ragionesociale1"),"'","`")		 
  			 text_ragionesociale2=Replace(Request.Form("ragionesociale2"),"'","`")		 
  			 text_ragionesociale3=Replace(Request.Form("ragionesociale3"),"'","`")		 
  			 'Dati Proprietario
  			 text_nome=Replace(Request.Form("nome"),"'","`")		 
  			 text_cognome=Replace(Request.Form("cognome"),"'","`")		   			 
  			 text_indirizzo=Replace(Request.Form("indirizzo"),"'","`")		   			 
  			 text_cap=Replace(Request.Form("cap"),"'","`")		   			 
  			 text_citta=Replace(Request.Form("citta"),"'","`")		   			 
  			 text_provincia=Replace(Request.Form("provincia"),"'","`")		   			 
  			 text_email=Replace(Request.Form("email"),"'","`")		   			 
  			 text_telefono=Replace(Request.Form("telefono"),"'","`")		   			 
			 text_cellulare=Replace(Request.Form("cellulare"),"'","`")		   			 
			 'Partita Iva e Data			 
			 text_partitaiva=Replace(Request.Form("partitaiva"),"'","`")		   			 
			 'Data Iscrizione
			 text_data=Request.Form("data")
			 If Isdate(text_dataisc)=False then 
			   text_data=Date()  
			 End if
			 'Trasformo Data in Americano
			 text_data=trim(year(text_data))+"/"+trim(month(text_data))+"/"+trim(day(text_data))
			 'Data Chiusurada
			 text_datachiusurada=Request.Form("datachiusurada")
			 If Isdate(text_datachiusurada)=False then 
			   text_datachiusurada=Date()  
			 End if
			 'Trasformo Data in Americano
			 text_datachiusurada=trim(year(text_datachiusurada))+"/"+trim(month(text_datachiusurada))+"/"+trim(day(text_datachiusurada))
			 'Data Chiusuraa
			 text_datachiusuraa=Request.Form("datachiusuraa")
			 If Isdate(text_datachiusuraa)=False then 
			   text_datachiusuraa=Date()  
			 End if
			 'Trasformo Data in Americano
			 text_datachiusuraa=trim(year(text_datachiusuraa))+"/"+trim(month(text_datachiusuraa))+"/"+trim(day(text_datachiusuraa))
			 'Testo Chiusura
			 text_testochiusura=Replace(Request.Form("testochiusura"),"'","`")		   			 
			 'Giorno1 Chiusura
			 text_giorno1=Replace(Request.Form("giorno1"),"'","`")		   			 
			 'Giorno2 Chiusura
			 text_giorno2=Replace(Request.Form("giorno2"),"'","`")		   			 
			 'Sito Internet
			 text_sitointernet=Replace(Request.Form("sitointernet"),"'","`")		   			 
			 'Contatto
			 text_contatto=Replace(Request.Form("contatto"),"'","`")		   			 
			 'Max Prodotti
			 text_maxprodotti=Replace(Request.Form("maxprodotti"),"'","`")		   			 
			 'Note
			 text_note=Replace(Request.Form("note"),"'","`")		   			 
			 'Categoria1
			 text_categoria1=Replace(Request.Form("categoria1"),"'","`")		   			 
			 'Categoria2
			 text_categoria2=Replace(Request.Form("categoria2"),"'","`")		   			 
			 'Categoria3
			 text_categoria2=Replace(Request.Form("categoria3"),"'","`")		   			 
			 
				 			 
			 'Controlla i Campi Obbligatori
			 If Len(text_nome)< 2 then tx_errore=tx_errore+", il nome "
			 If Len(text_cognome)< 2 then tx_errore=tx_errore+", il cognome "
             If Len(text_indirizzo)< 2 then tx_errore=tx_errore+", l`indirizzo "
			 If Len(text_citta)<2 then tx_errore=tx_errore+", la citta' "
			 If Len(text_Provincia)< 2 then tx_errore=tx_errore+", la provincia "
			 If Len(text_telefono)<5 then tx_errore=tx_errore+", il telefono "
			 If Not isnumeric(text_cap) then tx_errore=tx_errore+", il cap "
			 
			 'Se privo di errori
			 If Len(Trim(tx_errore))=22 Then 
	            Visuamodifica=True
			    'Trasformo Data in Americano
				text_data=trim(year(text_data))+"/"+trim(month(text_data))+"/"+trim(day(text_data))
				'StrSql="Insert into Registrazione (Username,Nome,Cognome,Sesso,Indirizzo,Cap,Citta,Provincia,Email,Telefonoabitazione,Telefonocellulare,Datanascita,partitaiva,Login,Password,Data,Network,Sponsorlogin,Sponsorpassword,Quota,Networkold) values ('"+text_Username+"','"+text_Nome+"','"+text_Cognome+"','"+text_Sesso+"','"+text_Indirizzo+"','"+text_Cap+"','"+text_Citta+"','"+text_Provincia+"','"+text_Email+"','"+text_telefono+"','"+text_cellulare+"','"+text_datanascita+"','"+text_partitaiva+"','"+text_login+"','"+text_password+"','"+text_data+"',True,'"+text_sponsorlogin+"','"+text_sponsorpassword+"',"+text_quota+","+text_networkold+")"
				'cn.Execute StrSql 
			  else
                Visuamodifica=True         
              End if 
	 			
	Case "ric"  
	            'Ricerca per Cognome nell'archivio
				   			
	Case else		
		
				Visualista=True
      
      
 End Select	
 
 
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
      
      <%'AdminMenu%>
      
      
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
              
                        
             <form action="merchant_adneg.asp?cm=save" method="post" id=form1 name=form1> 
                
              <table border="0" cellPadding="0" cellSpacing="0" width="100%" style="font-family: Verdana; font-size: 8 pt; color: #000000">
				
			  <tr>
              <td>Login: </td>
              <td><input id="login" name="login" maxLength="20" value="<%=text_login%>" size="15"></td>
              </tr>
              
              <tr>
              <td>Password: </td>
              <td><input id="password" name="password"  maxLength="20" value="<%=text_password%>" size="15"></td>
              </tr>	
				
			  <tr>
               <td>Ragione Sociale 1: </td>
               <td><input size=50 maxLength="120" name="ragionesociale1" value="<%=text_ragionesociale1%>"></td>
              </tr>	
              
              <tr>
               <td>Ragione Sociale 2: </td>
               <td><input size=50 maxLength="120" name="ragionesociale2" value="<%=text_ragionesociale2%>"></td>
              </tr>	
              
			  <tr>
               <td>Ragione Sociale 3: </td>
               <td><input size=50 maxLength="120" name="ragionesociale3" value="<%=text_ragionesociale3%>"></td>
              </tr>	
              
              <tr>
               <td>Nome : </td>
               <td><input maxLength="20" name="nome" value="<%=text_nome%>"></td>
              </tr>
              
              <tr>
                <td>Cognome : </td>
                <td><input maxLength="20" name="cognome" value="<%=text_cognome%>"></td>
              </tr>
              
              <tr>
                <td>Indirizzo: </td>
                <td><input maxLength="30" name="indirizzo" size="30" value="<%=text_indirizzo%>"></td>
              </tr>
              
              <tr>
                <td>Cap: </td>
                <td><input maxLength="5" name="cap" size="5" value="<%=text_cap%>"></td>
              </tr>
              
              <tr>
                <td>Città: </td>
                <td><input size="25" maxLength="30" name="citta" value="<%=text_citta%>"></td>
              </tr>
              
			  <tr>
			   <td>Provincia: </td>
			   <td><select id="Provincia" name="Provincia"> 
			   <option selected value><%=text_provincia%></option>
			   <% Do While not Tbpro.EOF %>
			   <option value="<%=Tbpro("Provincia")%>"><%=Tbpro("Provincia")%></option>
			   <% Tbpro.MoveNext
			   Loop%>
			   </select></td>
			  </tr>
			  
              <tr>
              <td>E-Mail: </td>
              <td><input maxLength="50" name="email" size="30" value="<%=text_Email%>"></td>
              </tr>
              
			  <tr>
              <td>Telefono: </td>
              <td><input maxLength="30" name="telefono" value="<%=text_Telefono%>"></td>
              </tr>
              
              <tr>
              <td>Cellulare: </td>
              <td><input name="cellulare" maxLength="30" value="<%=text_Cellulare%>"></td>
              </tr>
              
              <tr>
              <td>Partita Iva: </td>
              <td><input name="partitaiva" maxLength="30" value="<%=text_partitaiva%>"></td>
              </tr>
              
              <tr>
              <td>Data Iscrizione : </td>
              <td><input size="10" id="data" name="data" maxLength="10" value="<%=text_data%>"></td>
              </tr>
                                 
              <tr>
              <td>Data Chiusura da: </td>
              <td><input size="10" id="datachiusurada" name="datachiusurada" maxLength="10" value="<%=text_datachiusurada%>"></td>
              </tr>
              
              <tr>
              <td>Data Chiusura a: </td>
              <td><input size="10" id="datachiusuraa" name="datachiusuraa" maxLength="10" value="<%=text_datachiusuraa%>"></td>
              </tr>
              
              <tr>
              <td>Testo Chiusura : </td>
              <td><input maxLength="100" name="testochiusura" size="50" value="<%=text_testochiusura%>"></td>
              </tr>
              
              <tr><td>Giorno di chiusura N°1: </td><td>
              <select id=Giorno1 name=Giorno1>
              <option selected value="<%=tx_giorno1%>"><%=tx_giorno1%></option>
               <%if Trim(tx_giorno1)<>"Lunedi" then %><option value="Lunedi">Lunedi</option><%end if%>
               <%if Trim(tx_giorno1)<>"Martedi" then %><option value="Martedi">Martedi</option><%end if%>
               <%if Trim(tx_giorno1)<>"Mercoledi" then %><option value="Mercoledi">Mercoledi</option><%end if%>
               <%if Trim(tx_giorno1)<>"Giovedi" then %><option value="Giovedi">Giovedi</option><%end if%>
               <%if Trim(tx_giorno1)<>"Venerdi" then %><option value="Venerdi">Venerdi</option><%end if%>
               <%if Trim(tx_giorno1)<>"Sabato" then %><option value="Sabato">Sabato</option><%end if%>
               <%if Trim(tx_giorno1)<>"Domenica" then %><option value="Domenica">Domenica</option><%end if%>
               </select></td></td>
              </tr>
              
              <tr><td>Giorno di chiusura N°2: </td><td>
              <select id=Giorno2 name=Giorno2>
              <option selected value="<%=tx_giorno2%>"><%=tx_giorno2%></option>
               <%if Trim(tx_giorno2)<>"Lunedi" then %><option value="Lunedi">Lunedi</option><%end if%>
               <%if Trim(tx_giorno2)<>"Martedi" then %><option value="Martedi">Martedi</option><%end if%>
               <%if Trim(tx_giorno2)<>"Mercoledi" then %><option value="Mercoledi">Mercoledi</option><%end if%>
               <%if Trim(tx_giorno2)<>"Giovedi" then %><option value="Giovedi">Giovedi</option><%end if%>
               <%if Trim(tx_giorno2)<>"Venerdi" then %><option value="Venerdi">Venerdi</option><%end if%>
               <%if Trim(tx_giorno2)<>"Sabato" then %><option value="Sabato">Sabato</option><%end if%>
               <%if Trim(tx_giorno2)<>"Domenica" then %><option value="Domenica">Domenica</option><%end if%>
               </select></td></td>
              </tr>                                   
              
              <tr>
              <td>Sito Internet : </td>
              <td><input maxLength="100" name="sitointernet" size="35" value="http:\\<%=text_sitointernet%>"></td>
              </tr>
              
              <tr>
              <td>Contatto : </td>
              <td><input maxLength="100" name="contatto" size="35" value="<%=text_contatto%>"></td>
              </tr>
              
              <tr><td>N° Max Prodotti : </td>
               <td><SELECT name=maxprodotti>
				<%For i=1 to 50%>
				<OPTION value="<%=i%>"><%=i%></OPTION>
				<%Next%>
				</SELECT></td>
              </tr>
              
              <tr><td>Categoria Appartenenza 1 : </td>
               <td><SELECT name=categora1>
				<%Do While Not Tbcat.Eof%>
				<OPTION value="<%=Tbcat("catdescription")%>"><%=Tbcat("catdescription")%></OPTION>
				<% Tbcat.MoveNext
				 Loop%>
				</SELECT></td>
              </tr>
              
              <%Tbcat.MoveFirst%>
              
              <tr><td>Categoria Appartenenza 2 : </td>
               <td><SELECT name=categora2>
				<%Do While Not Tbcat.Eof%>
				<OPTION value="<%=Tbcat("catdescription")%>"><%=Tbcat("catdescription")%></OPTION>
				<% Tbcat.MoveNext
				 Loop%>
				</SELECT></td>
              </tr>
              
               <%Tbcat.MoveFirst%>
              
              <tr><td>Categoria Appartenenza 3 : </td>
               <td><SELECT name=categora1>
				<%Do While Not Tbcat.Eof%>
				<OPTION value="<%=Tbcat("catdescription")%>"><%=Tbcat("catdescription")%></OPTION>
				<% Tbcat.MoveNext
				 Loop%>
				</SELECT></td>
              </tr>
              
              <tr>
              <td>Note : </td>
              <td><textarea name="note" rows=6 cols=35 size="35" value="<%=text_note%>"></textarea></td>
              </tr>
              
                                        
              </table>
                       
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
