<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%  
'carrello gestione negozi non presenti a catalogo
session.lcid=1040
dim codice, prodid, prezzo, titolo, vmerchantid, fquantity
codice = request.querystring("codice")
prezzo = request.querystring("prezzo")
titolo = request.querystring("titolo")
quantita = request.querystring("fquantity")
iva= request.querystring("iva")
if trim(iva)="" then iva="si"
t_data=year(date) & month(date) & day(date)	
if trim(quantita)="" or not isnumeric(quantita)  then quantita = 1 
if trim(request.querystring("colore"))<>"" then t_colore = " colore : " & request.querystring("colore")
if trim(request.querystring("taglia"))<>"" then t_taglia = " taglia : " & request.querystring("taglia")
'response.write("ciao----" & t_colore & " colore" )
'response.write("ciao----" & t_taglia & " taglia" )
'response.end
'sessione
text_sessionid=session.sessionid

'profilo cliente
set tb4 = server.createobject("adodb.recordset")
ssql4 = "select prezzo from profilo where codice_isp='" & trim(cstr((codice))) & "' and password1='" & trim(session("chisono")) & "'"
tb4.open ssql4,connm									
if not tb4.eof then
mprezzo2=formatnumber(tb4("prezzo"),2) 
else
mprezzo2=formatnumber(prezzo,2)
end if
tb4.close
		
'controlli vari
text_prezzo=cdbl(mprezzo2)
text_quantita=cdbl(quantita)
text_titolo=cstr(replace(titolo,",","-")) & t_colore & t_taglia


'cerco prodotto su archivio
set tbprodottoman = server.createobject("adodb.recordset")
ssqlprodman = "select * from shop_products where ccode='" & trim(cstr((codice))) & "'"
tbprodottoman.open ssqlprodman,connm
'iva
if tbprodottoman("iva")="si" then 
   scrittaiva=tbprodottoman("aliqiva") & "% aliq iva" 
   text_aliqiva=cdbl(tbprodottoman("aliqiva"))
 else
   scrittaiva="esente iva"
   text_aliqiva=0
end if
'foto
text_urlfoto=tbprodottoman("cimageurl")
if text_quantita>=tbprodottoman("qta1") and tbprodottoman("qta1")>0 then text_prezzo=tbprodottoman("cprice1")
if text_quantita>=tbprodottoman("qta2") and tbprodottoman("qta2")>0 then text_prezzo=tbprodottoman("cprice2")
if text_quantita>=tbprodottoman("qta3") and tbprodottoman("qta3")>0 then text_prezzo=tbprodottoman("cprice3")
tbprodottoman.close

'codice prodotto
if trim(request.querystring("colore"))<>"" then add_colore = "_" & trim(request.querystring("colore"))
if trim(request.querystring("taglia"))<>"" then add_taglia = "_" & trim(request.querystring("taglia"))
'modifica codice prodotto
'codice = codice & add_colore & add_taglia TOLTO
text_qprezzo=text_quantita * text_prezzo

				
'insert su carrello
strsql="insert into carrello (sessionid,codice_isp,descrizione,quantita,prezzo,data,prezzou,blocco,fornitore,urlfoto,iva,aliqiva) values ('" & text_sessionid & "','" & ucase(codice) & "','" & ucase(text_titolo) & "','" & text_quantita & "','" & replace(replace(text_qprezzo,".",""),",",".") & "',current_date,'" & replace(replace(text_prezzo,".",""),",",".") & "','ecommerce','ecommerce','" & text_urlfoto & "','" & iva & "'," & text_aliqiva & ")"
'inserimento
'response.write(strsql)
'response.end
set tbcarins = server.createobject("adodb.recordset")					
tbcarins.open strsql, connm


set cercoprezzo = server.createobject("adodb.recordset")
sql_cercoprezzo = "select sum(prezzo) as sommapc from carrello where sessionid='" & text_sessionid & "'"
'response.write(sql_cercoprezzo)
'response.end
cercoprezzo.open sql_cercoprezzo, connm	
if cercoprezzo("sommapc")=0 or cercoprezzo("sommapc")="" then
	response.write("<font class='rosso'><b>&#8364; 0</b></font>")
else
	response.write("<font class='rosso'><b>&#8364; " & cercoprezzo("sommapc") & "</b></font>")
end if
cercoprezzo.close
%>
<!--#include file="sqlchiudi.inc"-->
	