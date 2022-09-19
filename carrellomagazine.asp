<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%  

	Dim cod, fquantity,valore_aliqiva
	cod = Request.QueryString("cod")
	fquantity = Request.QueryString("fquantity")
	
	Set tbmagazine = Server.CreateObject("ADODB.RecordSet")
    sSQL1 = "select * From magazinebuffetti  where codice='" & Trim(cod) & "' limit 1"
	tbmagazine.Open sSQL1, conn			       
	text_sessionid=Session.SessionID	
	if isnumeric(fquantity)=true then
			quantita1=Cint(fquantity)     
	else
			quantita1=1
	end if
	if quantita1=0 then quantita1=1
	text_prezzo=FormatNumber(tbmagazine("Prezzoofferta"),2)
	text_prezzoo=FormatNumber((text_prezzo*quantita1),2)
	blocco="Magazine"

	valore_aliqiva=0
 	Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
	sSQLiva = "select aliq_iva from prodotti where codice_buf='" & Trim(cod) & "' limit 1"
	'response.write(sSQLiva)
	tbprodcatalogo.Open sSQLiva, connm
	if not tbprodcatalogo.eof then 
	  valore_aliqiva=tbprodcatalogo("aliq_iva")
	  else
	  valore_aliqiva=0
    end if	  
	tbprodcatalogo.close
	if valore_aliqiva=0 then
	StrSql="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore,Iva,aliqiva) values ('" & text_sessionid & "','" & Trim(cod) & "','" & tbmagazine("Descrizione") & " - Prodotto Offerta Magazine','" & quantita1 & "','" & Replace(Replace(text_prezzoo,".",""),",",".") & "',current_date,'" & Replace(Replace(text_prezzo,".",""),",",".") & "','" & Blocco & "','Magazine','no',0)"
	else
	StrSql="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore,Iva,aliqiva) values ('" & text_sessionid & "','" & Trim(cod) & "','" & tbmagazine("Descrizione") & " - Prodotto Offerta Magazine','" & quantita1 & "','" & Replace(Replace(text_prezzoo,".",""),",",".") & "',current_date,'" & Replace(Replace(text_prezzo,".",""),",",".") & "','" & Blocco & "','Magazine','si'," & Replace(Replace(valore_aliqiva,".",""),",",".") & ")"
   	end if
	'INSERIMENTO CARRELLO
    'response.write(StrSql)
	'response.end
	connm.Execute(StrSql)
	
	
	Response.Buffer = True
	Response.Expires = 0

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
	
	'if request("info")="red" then response.redirect "carrellovisua.asp"

%><!--#include file="sqlchiudi.inc" -->
