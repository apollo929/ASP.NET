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
    
    Function nomeprov(byval nomep)
     Set tbprov = Server.CreateObject("ADODB.Recordset")
     Sql="Select * from Province where ProvinciaId='" & Trim(nomep) & "'"
     tbprov.Open Sql,cncentro
     nomeprov=tbprov("Provincia")
    End  Function
    
    Function nomeprovid(byval nomep)
     Set tbprov = Server.CreateObject("ADODB.Recordset")
     Sql="Select * from Province where Provincia='" & Trim(nomep) & "'"
     tbprov.Open Sql,cncentro
     nomeprovid=tbprov("ProvinciaID")
    End  Function
    
    strDSNcentro = "FILEDSN=C:\inetpub\wwwroot\alleluia\db\centro.dsn"
	'Obejct Connessione
	Set cncentro = Server.CreateObject("ADODB.Connection")
	'Tabelle DB
	'Tabelle Utilita
	Set tbtmp = Server.CreateObject("ADODB.Recordset")
	Set tbprovi = Server.CreateObject("ADODB.Recordset")
	Set tball = Server.CreateObject("ADODB.Recordset")
	cncentro.Open strDSNcentro
	
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
    Sqlmer="Select * From Comuni order by Comune"    

Select Case Trim(Parcm)
   
   Case "new"
            Visuamodifica=True
            text_Comune=""
			text_Nomecentro=""
			text_Nome=""
			text_Cognome=""
			text_Indirizzo=""
			text_Citta=""
			text_Telefono=""
			text_Cellulare=""
			text_Centro="NO"
			 
   Case "mod"
            'Assegna le variabili per la modifica.
			Visuamodifica=True  
			Sql="Select * From Comuni Where Comune='"+Trim(Parid)+"'"
			Tbtmp.Open Sql,cncentro
			text_Comune=Scritta(Tbtmp("Comune"))
			text_Nomecentro=Tbtmp("Nomecentro")
			text_Nome=Tbtmp("Nome")
			text_Cognome=Tbtmp("Cognome")
			text_Indirizzo=Tbtmp("Indirizzo")
			text_Citta=Tbtmp("Citta")
			text_Telefono=Tbtmp("Telefono")
			text_Centro=Tbtmp("Centro")
			text_Cellulare=Tbtmp("Cellulare")
										 
   Case "save"
            'Registrazione variabili da Form
  			text_Nomecentro=Replace(Request.Form("Nomecentro"),"'","`")		 
  			text_Indirizzo=Replace(Request.Form("Indirizzo"),"'","`")		 
  			text_Citta=Replace(Request.Form("Citta"),"'","`")		 
  			'Nome
  			text_Cognome=Replace(Request.Form("Cognome"),"'","`")	
			text_Nome=Replace(Request.Form("Nome"),"'","`")	
			text_Telefono=Replace(Request.Form("Telefono"),"'","`")
			text_Cellulare=Replace(Request.Form("Cellulare"),"'","`")
			text_Centro=Replace(Request.Form("Centro"),"'","`")
			text_Comune=Replace(Request.Form("Comune"),"'","`")
			'Se privo di errori
			 Sql="Select * From Comuni Where Comune = '"+Trim(text_Comune)+"'"
			 Tbtmp.Open Sql,cncentro
			 If Tbtmp.EOF then
			   text_Provincia=Replace(Request.Form("Provincia"),"'","`")
			   StrSql="Insert into Comuni (Comune,Nomecentro,Nome,Cognome,Indirizzo,Citta,Telefono,Cellulare,Centro,ProvinciaId) values ('"+text_Comune+"','"+text_Nomecentro+"','"+text_Nome+"','"+text_Cognome+"','"+text_Indirizzo+"','"+text_Citta+"','" & text_Telefono & "','"+tx_Cellulare+"','"+text_centro+"','"+text_provincia+"')"
			 Else
			   StrSql="Update Comuni Set Nomecentro='"+text_Nomecentro+"',Nome='"+text_Nome+"',Cognome='"+text_Cognome+"',Indirizzo='"+text_Indirizzo+"',Citta='"+text_Citta+"',Telefono='" & text_Telefono & "',Cellulare='" & tx_Cellulare & "',Centro='" & text_centro & "' where Comune = '" & text_comune  & "'" 
			 End if 
			 cncentro.Execute StrSql 
			 tx_save="Salvataggio Riuscito."
			Visualista=True
			Sqlmer="Select * From Comuni order by Comune"
			
	case "delnews"
			Sql="Select * From Comuni "
			Tbtmp.Open Sql,cncentro
			Do while Not tbtmp.eof 
              tx=""
              tx=Request.Form(tbtmp("Comune"))
               if tx="on" then
                StrSql="Delete * From Comuni where Comune='"+trim(tbtmp("Comune"))+"'"
                cncentro.Execute Strsql
               end if
             tbtmp.MoveNext
            Loop	
            Visualista=True	
			
	Case "ric"  
	     'Ricerca per Nome nell'archivio
	     Visualista=True
		 tx_Nome=Request.Form("ricNome")
		 if Trim(tx_Nome)="" then tx_Nome=Session("ric") end if
		 Sqlmer="Select * From Comuni Where Comune Like '%"+Trim(tx_Nome)+"%'"
		 Session("ric")=tx_Nome
	
	Case "ricprov"  
	     'Ricerca per Nome nell'archivio
	     Visualista=True
		 tx_Nome=Request.Form("ricNome")
		 if Trim(tx_Nome)="" then tx_Nome=Session("ric") end if
		 Sqlmer="Select * From Comuni Where Provinciaid = '"+Trim(nomeprovid(trim(tx_Nome)))+"'"	 
		 Session("ric")=tx_Nome
				   			
	Case else		
		 Visualista=True
		 text_Telefono=0
		         
 End Select	
 
 'Visuamerchant
 tball.Open Sqlmer,cncentro
 Pass_errore=Len(Trim(tx_errore))
 
 %>

<html>
<head>
<title>primatist.com</title>
<script language="JavaScript">
			function checkItems(formobj)
			    {
			    {
			    Comune = formobj.Comune.value;
				if (Comune== "")
				{	alert("Scrivi il Comune");
					formobj.Comune.focus();
					return false
				}else
				Nomecentro = formobj.Nomecentro.value;
				if (Nomecentro == "")
				{	alert("Scrivi il Nome del Centro");
					formobj.Nomecentro.focus();
					return false
				}else
			    Nome = formobj.Nome.value;
				if (Nome =="" )
				{	alert("Scrivi il tuo Nome");
					formobj.Nome.focus();
					return false
				}else
				{
				Cognome = formobj.Cognome.value;
				if (Cognome == "")
				{	alert("Scrivi il tuo Cognome");
					formobj.Cognome.focus();
					return false
				}else
				{
					Indirizzo = formobj.Indirizzo.value;
				if (Indirizzo == "")
				{	alert("Scrivi il tuo Indirizzo");
					formobj.Indirizzo.focus();
					return false
				}else
				{
					Citta = formobj.Citta.value;
				if (Citta == "")
				{	alert("Scrivi la tua Citta'");
					formobj.Citta.focus();
					return false
				}else	
				{
					Telefono = formobj.Telefono.value;
				if (Telefono == "")
				{	alert("Scrivi il tuo telefono");
					formobj.Telefono.focus();
					return false
				}else		
				{
					Cellulare = formobj.Cellulare.value;
				if (Cellulare == "")
				{	alert("Scrivi il numero di cellulare");
					formobj.Cellulare.focus();
					return false
				}else
				    return true
					}}}}}
				}
			
			}
		</script>
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
             <form action="merchant_adcentro.asp?cm=ric" method="post" id=form2 name=form2>
			 <table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#b0a8a0" style="font-family: Verdana; font-size: 10 pt; color: #000000">
			 <tr><td>Ricerca per Comune&nbsp;<input type="text" name="ricNome">&nbsp;&nbsp;<input type="image" border="0" name="imggo" src="Images/go.gif" ></font></td> </form>
			 <form action="merchant_adcentro.asp?cm=ricprov" method="post" id=form2 name=form2>
			 <td>Ricerca per Provincia&nbsp;<input type="text" name="ricNome">&nbsp;&nbsp;<input type="image" border="0" name="imggo" src="Images/go.gif" ></font></td>
			 </form>
			 </tr>
			 </table>
			<% If not Tball.eof then        %>	
		 	 <form action="merchant_adcentro.asp?cm=delnews" method="post" id=form1 name=form1> 
		     <table border="1" cellPadding="0" cellSpacing="0" width="100%" style="font-family: Verdana; font-size: 10 pt; color: #000000">    
		     <tr>
		     <td align=center bgcolor="#d8d3cf">Elimina</td>
		     <td align="center" bgcolor="#d8d3cf">Comune</td>
		     <td align="center" bgcolor="#d8d3cf">Nomecentro</td>
		     <td align="center" bgcolor="#d8d3cf">Nome</td>
		     <td align="center" width=230  bgcolor="#d8d3cf">Cognome</td>
		     <td align="center" width=230  bgcolor="#d8d3cf">Indirizzo</td>
		     <td align="center" width=230  bgcolor="#d8d3cf">Citta'</td>
		     <td align="center" bgcolor="#d8d3cf">Provincia</td>
		     <td align="center" bgcolor="#d8d3cf">Centro</td>
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
		     do while not Tball.eof and  count<>40
		      count=count+1   %>
		      <tr>
		      <td align=center bgcolor="#eae6dd" align="center"><INPUT type="checkbox" id="<%=tball("Comune")%>"  name="<%=tball("Comune")%>"></td>
		      <td align=center bgcolor="#eae6dd"><a style="font-family: Verdana; font-size: 10 pt; color: #000000" href="merchant_adcentro.asp?cm=mod&id=<%=Tball("Comune")%>"><%=Scritta(Tball("Comune"))%></td>
		      <td align=center bgcolor="#eae6dd"><%=Scritta(Tball("Nomecentro"))%>&nbsp;</td>
		      <td align=center bgcolor="#eae6dd"><%=Scritta(Tball("Nome"))%>&nbsp;</td>
		      <td align=center bgcolor="#eae6dd"><%=Scritta(Tball("Cognome"))%>&nbsp;</td>
		      <td align=center bgcolor="#eae6dd"><%=Scritta(Tball("Indirizzo"))%>&nbsp;</td>
		      <td align=center bgcolor="#eae6dd"><%=Scritta(Tball("Citta"))%>&nbsp;</td>
		      <td align=center bgcolor="#eae6dd"><%=nomeprov(Tball("ProvinciaId"))%>&nbsp;</td>
		      <td align=center bgcolor="#eae6dd"><%=Tball("Centro")%>&nbsp;</td>
		      </tr>
		      <% Tball.movenext
		      loop     %>
               </table>
                <table border="0" cellPadding="0" cellSpacing="0" width="100%" style="font-family: Verdana; font-size: 10 pt; color: #000000">  
                <tr><td width=100%></td>
                <% if  Maxdx>=40 then %>
                <td><a align="right" href="merchant_adcentro.asp?cnt=<%=Maxdx-40%>&cm=<%=Parcm%>"><img align="right" alt="Indietro" border="0" src="Images\_prev.gif" ></a></td>
                <% end if%>
                <% if  not Tball.EOF then %>
                <td><a align="right" href="merchant_adcentro.asp?cnt=<%=Maxdx+40%>&cm=<%=Parcm%>"><img align="right" alt="Avanti" border="0" src="Images\_next.gif" ></a></td>
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
			  <form action="merchant_adcentro.asp?cm=save" method=POST name=formpay  onSubmit='return checkItems(formpay)'>
              <table border="0" cellPadding="0" cellSpacing="0" width="100%" style="font-family: Verdana; font-size: 8 pt; color: #000000">
			  <tr>
              <td>Comune: </td>
              <%if Parcm="new" then%>
              <td><input id="Comune" name="Comune" maxLength="20" value="<%=text_Comune%>" size="55"></td>
              <%else%>
              <td><input disabled id="Comune" name="Comune" maxLength="20" value="<%=text_Comune%>" size="55"></td>
              <input type="hidden"  id="Comune" name="Comune" maxLength="20" value="<%=text_Comune%>" size="55">
              <%end if%>
              </tr>
              <%if Parcm="new" then%>
              <tr><td>Provincia</td>
              <td><SELECT name=Provincia >
              <%
              Sql="Select * from Province Order by Provincia"
              tbprovi.Open Sql,cncentro              
              Do while not tbprovi.eof%>
			  <OPTION value="<%=Scritta(tbprovi("ProvinciaId"))%>"><%=Scritta(tbprovi("Provincia"))%></OPTION>
			  <%tbprovi.movenext
			    Loop%>
			  </SELECT></td></tr>
              <%end if%>
              
              <tr><td height=5></td></tr>
              <tr>
              <td>Nomecentro: </td>
              <td><input id="Nomecentro" name="Nomecentro"  maxLength="60" value="<%=text_Nomecentro%>" size="55"></td>
              </tr>	
              <tr><td height=5></td></tr>
		      <tr>
              <td>Nome : </td>
              <td><input maxLength="100" name="Nome" id="Nome" size="50" value="<%=text_Nome%>"></td>
              </tr>
              <tr><td height=5></td></tr>	
			  <tr>
              <td>Cognome: </td>
              <td><input size=50 maxLength="120" name="Cognome" value="<%=text_Cognome%>"></td>
              </tr>	
              <tr><td height=5></td></tr>
              <tr>
              <td>Indirizzo: </td>
              <td><input size=50 maxLength="120" name="Indirizzo" value="<%=text_Indirizzo%>"></td>
              </tr>	
              <tr><td height=5></td></tr>
			  <tr>
              <td>Citta': </td>
              <td><input size=50 maxLength="120" name="Citta" value="<%=text_Citta%>"></td>
              </tr>	
              <tr>
              <td>Telefono: </td>
              <td><input size=25 maxLength="120" name="Telefono" value="<%=text_Telefono%>"></td>
              </tr>	
              <tr>
              <td>Cellulare: </td>
              <td><input size=25 maxLength="120" name="Cellulare" value="<%=text_Cellulare%>"></td>
              </tr>
              <tr>
              <td>E' un centro? </td>
              <td>
              <SELECT id=centro name=centro><OPTION value="<%=text_Centro%>"><%=text_Centro%></OPTION>
			  <OPTION value='SI'>SI</OPTION>
			  <OPTION value='NO'>NO</OPTION>
			  </SELECT></td>
              </tr>
              </table>
              <%end if%>
              
              <table border="0" cellPadding="0" cellSpacing="0" width="100%" style="font-family: Verdana; font-size: 8 pt; color: #000000">
              <input type="hidden" name="id" value="<%=text_Comune%>">
              <tr><td height=10 colspan=5></td></tr>             
              <tr>
              <td align=left><a href="merchant_adcentro.asp?cm=new"><img border=0 src="images/bot_nuovo.gif"></a></td>
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
