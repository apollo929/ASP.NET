<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%   
'Variabili Connessione Db
Dim Mprezzo
Dim tipocatalogo

Function fotoshopman(Byval Cod)
	Set tbfoto = Server.CreateObject("ADODB.RecordSet")
	sSql="SELECT cimageurl FROM shop_products where ccode='" & lcase(Trim(Cod)) & "' limit 1"
	tbfoto.Open sSql, connm
	Nome_foto=""
	Tipocatalogo="" 
	if tbfoto.eof then
	    fotoshopman=" "
	else
		fotoshopman=Trim(tbfoto("cimageurl")) 
	end if 	
	tbfoto.Close
End function	

if Request("del")="yes"  then
	'del listino codice spicers
	Set tbdel = Server.CreateObject("ADODB.RecordSet")
	sSQLdel = "Delete From Listino where Id=" & Clng(Request("Cod"))
	tbdel.Open sSQLdel,connm	
else

'response.write("--------------------------------" & trim(Cstr((Request("for")))))

	If trim(Session("Chisono"))="" then 
		txtcodcliente="NN"
		text_sessionid=trim(Session.SessionID)
	else
		txtcodcliente="REG"
		text_sessionid=cstr(Session("Chisono"))
	End if 	
	
	'ricerca codice buffetti
	Set tb1 = Server.CreateObject("ADODB.RecordSet")
	if trim(Cstr((Request("for"))))="buffetti" then
		 sSQL = "select * From prodotti where codice_buf='" & trim(Cstr((Request("Cod_Lis")))) & "'"
		 tb1.Open sSQL,connm	
	end if
	'Ricerca codice od
	if trim(Cstr((Request("for"))))="od" then
		 sSQL = "select * from prodotti where codice_od='" & trim(Cstr((Request("Cod_Lis")))) & "'"
		 tb1.Open sSQL,connm
	end if		
	'Ricerca codice inserito manualmente
	if trim(Cstr((Request("for"))))="shopmanuale" then
		sSQL = "SELECt shop_products.*, shop_products.cname AS descrizione " &_
		" from shop_products WHERE shop_products.ccode='" & trim(Cstr((Request("Cod_Lis")))) & "'"
		tb1.Open sSQL,connm
	end if
	
	txt_fornitore=""
	'response.write("--------------------------------" & sSQL)						
	If not tb1.EOF then
		Descrizione=replace(tb1("Descrizione"),"'","`")		
		Codice_ISP=Replace(trim(Cstr((Request("Cod_Lis")))),"@@","#")
		Fornitore=trim(Cstr((Request("for"))))
		StrSql="Insert into listino (codcliente,password1,codice_isp,Descrizione,Fornitore) values ('" & txtcodcliente & "','" & text_sessionid & "','" & Codice_ISP & "','" & descrizione & "','" & fornitore & "')"
		'INSERIMENtO & VISUALIZZAZIONE
        'response.write("--------------------------------" & StrSql)
		connm.execute(StrSql)		
	else
	 	tb1.close
		sSQL = "select * From prodotti where codice_prodotto='" & trim(Cstr((Request("Cod_Lis")))) & "'"
	 	tb1.Open sSQL,connm
		If not tb1.EOF then
			Descrizione=replace(tb1("Descrizione"),"'","`")		
			Codice_ISP=tb1("codice_prodotto")
			StrSql="Insert into listino (codcliente,password1,codice_isp,Descrizione,Fornitore) values ('" & txtcodcliente & "','" & text_sessionid & "','" & Codice_ISP & "','" & descrizione & "','interno')"
			'INSERIMENtO & VISUALIZZAZIONE
			connm.execute(StrSql)
		end if
		txt_fornitore="interno"
	End if
End if

If trim(Session("Chisono"))="" then 
	txtcodcliente="NN"
	text_sessionid=trim(Session.SessionID)
	sqlvis="Select * from listino where codcliente='NN' and password1='" & text_sessionid & "' GROUP BY codice_isp order by id desc"		
	else
	txtcodcliente="REG"
	text_sessionid=cstr(Session("Chisono"))
	sqlvis="Select * from listino where codcliente='REG' and password1='" & text_sessionid & "' GROUP BY codice_isp order by id desc"        
End if 	
Set tbcarins = Server.CreateObject("ADODB.RecordSet")		
tbcarins.Open sqlvis, connm

%>	
				  		
<!DOCtYPE HtML PUBLIC "-//W3C//DtD HtML 4.1 transitional//EN">
<HtML>
<HEAD>
<!--#include file="head.inc" -->
<tItLE>Aggiunta Listino</tItLE>
</HEAD>
<BODY BGCOLOR="#FFFFFF" LEFtMARGIN="0" MARGINWIDtH="0" tOPMARGIN="0" MARGINHEIGHt="0">
<table cellpadding="0" cellspacing="0" width="100%" height="620px"><tr><td bgcolor="#FFFFFF" valign="top" align="center">

<tABLE width="550" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
        
<tr><td height="20px"></td></tr>            
<%
counterfrm=0
Do While not tbcarins.eof
	Descrizione=trim(replace(replace(replace(tbcarins("Descrizione"),"'","`"),"*"," "),"&"," "))%>
	<tr> 
		<td align="center">
		<% 
		if lcase(tbcarins("fornitore"))="od" then%>
		<img src='foto.asp?cat=catalogoisp\piccole&img=<%=tbcarins("codice_isp")%>.jpg' border="0">											
		<%end if
		if lcase(tbcarins("fornitore"))="buffetti" or lcase(tbcarins("fornitore"))="magazine" then%>
		<img src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbcarins("codice_isp")%>.jpg' border="0">										
		<%end if
		if lcase(tbcarins("fornitore"))="shopmanuale" then%>
		<%
		txt_imm=fotoshopman(trim(tbcarins("codice_isp")))
		newimmagine=replace(txt_imm," ","%20")%>
		<img src='admin/articoli/<%=newimmagine%>'	style="max-width:180px;max-height:120px;">								
		<%end if%>			
		</td>	
		<td><%=tbcarins("codice_isp")%></td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<%counterfrm=counterfrm+1%>
		<td align="left"><%=Descrizione%></td>
		<td><a href="listinovisua.asp?del=yes&cod=<%=tbcarins("id")%>">X</a></td>
	</tr>
	<tr><td height="15px"></td></tr>
	<tr><td colspan="5" height="1px" bgcolor="#009ac5"></td></tr>
	<tr><td height="15px"></td></tr>
<%tbcarins.movenext
Loop%>
</tABLE>
<br><br>



</td></tr></table>

</BODY>
</HtML>
<!--#include file="sqlchiudi.inc" -->
				  		