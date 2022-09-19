<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%  
session.lcid=1040	
Dim cod, fquantity, esenteivac, blocco
cod = Request.QueryString("cod")
quantita1 = cdbl(Request.QueryString("fquantity"))
esenteivac = Request.QueryString("esenteivac")
blocco = Request.QueryString("blocco")
text_sessionid=Session.SessionID
txt_fornitore="Buffetti"
					
Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
sSQL1 = "select * From prodotti where codice_buf='" & Trim(cod) & "' or codice_prodotto='" & Trim(cod) & "'"
tbprodcatalogo.Open sSQL1, connm
%>					             
<!--#include file="ricercacatalogoparametribuffetti.inc" -->   
<%
'response.write("----" & Mprezzo2 & "mg")	
t_data=date()								                    
blocco=tbprodcatalogo("blocco")
text_prezzoo=FormatNumber((Mprezzo2*quantita1),2)
if boolmagazine="false" then 
	if quantita1=>cdbl(tbprodcatalogo("qta2")) and quantita1<>1 and cdbl(tbprodcatalogo("qta2"))<>1 then
		Mprezzo2=FormatNumber(tbprodcatalogo("p2"),2)
		text_prezzoo=FormatNumber(Mprezzo2*quantita1,2)	
		'response.write("p2")		
	end if
	if quantita1=>cdbl(tbprodcatalogo("qta3")) and quantita1<>1 and cdbl(tbprodcatalogo("qta3"))<>1 then
		Mprezzo2=FormatNumber(tbprodcatalogo("p3"),2)
		text_prezzoo=FormatNumber(Mprezzo2*quantita1,2)		
		'response.write("p3")
	end if
	if quantita1=>cdbl(tbprodcatalogo("qta4")) and quantita1<>1 and cdbl(tbprodcatalogo("qta4"))<>1 then
		Mprezzo2=FormatNumber(tbprodcatalogo("p4"),2)
		text_prezzoo=FormatNumber(Mprezzo2*quantita1,2)		
		'response.write("p4")
	end if
	if quantita1=>cdbl(tbprodcatalogo("qta5")) and quantita1<>1 and cdbl(tbprodcatalogo("qta5"))<>1 then
		Mprezzo2=FormatNumber(tbprodcatalogo("p5"),2)
		text_prezzoo=FormatNumber(Mprezzo2*quantita1,2)	
		'response.write("p5")		
	end if
else
	blocco="Magazine"
	txt_fornitore="Magazine"		
end if  


if tbprodcatalogo("aliq_iva")=0 then
 StrSql="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore,Iva,aliqiva) values ('" & text_sessionid & "','" & Trim(cod) & "','" & Descrizione & "','" & quantita1 & "','" & Replace(Replace(text_prezzoo,".",""),",",".") & "','" & t_data & "','" & Replace(Replace(Mprezzo2,".",""),",",".") & "','" & Blocco & "','" & txt_fornitore & "','no',0)"
else
 StrSql="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore,aliqiva) values ('" & text_sessionid & "','" & Trim(cod) & "','" & Descrizione & "','" & quantita1 & "','" & Replace(Replace(text_prezzoo,".",""),",",".") & "','" & t_data & "','" & Replace(Replace(Mprezzo2,".",""),",",".") & "','" & Blocco & "','" & txt_fornitore & "'," & Replace(Replace(tbprodcatalogo("aliq_iva"),".",""),",",".") & ")"
end if 
Set Tbcarins = Server.CreateObject("ADODB.RecordSet")					
Tbcarins.Open StrSql, connm	
'response.write(StrSql)
'response.end

text_sessionid=Session.SessionID
set cercoprezzo = server.createobject("adodb.recordset")
SQL_cercoprezzo = "select sum(prezzo) as sommapc,count(*) as sommaitem from carrello where sessionid='" & text_sessionid & "'"
cercoprezzo.open SQL_cercoprezzo, connm	
session("sommaitem")=cercoprezzo("sommaitem")
if cercoprezzo.eof or cercoprezzo("sommapc")="" or isnull(cercoprezzo("sommapc"))=true then
	response.Write("&euro; 0,00")
else
	response.Write("&#8364; " & formatnumber(cercoprezzo("sommapc")))
end if
cercoprezzo.close
'response.end
		
		
		
  %><!--#include file="sqlchiudi.inc" -->