<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->

<%if Request("Tipo")="Aggiungi" then					
	    err1=false						
		text_sessionid=Session.SessionID 
		VCodice=Request.Form("Codice")
		VCodice=replace(VCodice,"'","''")
		VDescrizione=Request.Form("Descrizione")
		VDescrizione=replace(VDescrizione,"'","''")
		VQuantita=Request.Form("Quantita")
		VPrezzou=Request.Form("Prezzou")
		VQuantita=replace(VQuantita,".",",")
		if VQuantita="" then VQuantita="1"
		if not isnumeric(VQuantita) then VQuantita="1"
		VPrezzou=replace(VPrezzou,".",",")
		if VPrezzou="" then err1=true
		if not isnumeric(VPrezzou) then err1=true		
		if err1=false then
		    VPrezzot=round(cdbl(Vprezzou)*cdbl(VQuantita),2) 
		    VPrezzou=replace(VPrezzou,",",".")
		    VQuantita=replace(VQuantita,",",".")
		    VPrezzot=replace(VPrezzot,",",".")
		    StrSql="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore) values ('" & text_sessionid & "','" & VCodice & "','" & VDescrizione & "','" & VQuantita & "','"& VPrezzot & "','currnet_date','"& VPrezzou & "','Nessuno','Art.Ins.Manualmente')"
		    connm.execute StrSql
	    end if
end if
%><!--#include file="sqlchiudi.inc" --><%
if err1 then %>
    <p><font size=3><br><br>Errore nella quantità o nel prezzo inseriti.</font></p>
    <% Response.redirect "carrellovisua.asp?articolo=Aggiungi&info=" & server.URLEncode("Errore nei dati inseriti, verificare e riprovare")
else
	Response.redirect "carrellovisua.asp"
end if    
%>