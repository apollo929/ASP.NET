<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%  
	session.lcid=1040	
	Dim cod, fquantity, esenteivac, blocco
	cod = Request.QueryString("cod")
	quantita1 = Request.QueryString("fquantity")
	text_sessionid=Session.SessionID				
	Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
	sSQL1 = "select * From prodotti where codice_od='" & Trim(cod) & "' or codice_prodotto='" & Trim(cod) & "'"
	tbprodcatalogo.Open sSQL1, connm
	%>					             
	<!--#include file="ricercacatalogoparametriod.inc" -->   
	<%	
	qtamin=1
    qtamin=cdbl(tbprodcatalogo("AA_Qta_Conf"))
   	ris_text=cstr(cdbl(cdbl(quantita1)/qtamin))
	if instr(ris_text,",")>0 then 
	 conto=true
	 else
	 conto=false
	end if 
	'response.write(ris_text)
	'response.write(conto)
	'response.write(qtamin)
	'response.end
	
	if cdbl(quantita1)>=qtamin and conto=false then 	
		t_data=date()								                    
		text_prezzoo=FormatNumber((Mprezzo2*quantita1),2)
		blocco=tbprodcatalogo("blocco")
		if tbprodcatalogo("aliq_iva")=0 then
		    StrSql="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore,Iva,aliqiva) values ('" & text_sessionid & "','" & Trim(cod) & "','" & Descrizione & "','" & quantita1 & "','" & Replace(Replace(text_prezzoo,".",""),",",".") & "','" & t_data & "','" & Replace(Replace(Mprezzo2,".",""),",",".") & "','" & Blocco & "','od','no',0)"
		else
			StrSql="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore,aliqiva) values ('" & text_sessionid & "','" & Trim(cod) & "','" & Descrizione & "','" & quantita1 & "','" & Replace(Replace(text_prezzoo,".",""),",",".") & "','" & t_data & "','" & Replace(Replace(Mprezzo2,".",""),",",".") & "','" & Blocco & "','od'," & Replace(Replace(tbprodcatalogo("aliq_iva"),".",""),",",".") & ")"
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
			response.Write(ris_text & "&#8364; " & formatnumber(cercoprezzo("sommapc")))
		end if
		cercoprezzo.close
		response.redirect "errore.asp"
	end if	
		
		
		
  %>
  <!--#include file="sqlchiudi.inc" -->