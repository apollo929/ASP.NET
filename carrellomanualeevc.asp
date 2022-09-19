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
'sessione
text_sessionid=session.sessionid
		
'controlli vari
text_prezzo=cdbl(prezzo)
text_quantita=cdbl(quantita)
text_titolo=cstr(replace(titolo,",","-")) 
'iva
if iva="si" then 
   scrittaiva=Session("partitaiva") & "% aliq iva" 
   text_aliqiva=Session("partitaiva")
 else
   scrittaiva="esente iva"
   text_aliqiva=0
end if
'foto
text_urlfoto=request.querystring("cimageurl")
'modifica codice prodotto
'codice = codice & add_colore & add_taglia TOLTO
text_qprezzo=text_quantita * text_prezzo

				
'insert su carrello
strsql="insert into carrello (sessionid,codice_isp,descrizione,quantita,prezzo,data,prezzou,blocco,fornitore,urlfoto,iva,aliqiva) values ('" & text_sessionid & "','" & ucase(codice) & "','" & ucase(text_titolo) & "','" & text_quantita & "','" & replace(replace(text_qprezzo,".",""),",",".") & "',current_date,'" & replace(replace(text_prezzo,".",""),",",".") & "','ecommerce','ecommerce','" & text_urlfoto & "','" & iva & "'," & text_aliqiva & ")"
'inserimento
'response.write(strsql)
'response.end
connm.execute(strsql)


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
	