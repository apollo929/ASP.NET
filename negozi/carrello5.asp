<!--#include file="connessionesql.inc" --><!--#include file="adovbs.inc"-->
<%  
     
    session.lcid=1040
    
    'Variabili Connessione Db
	Dim dbc
	Dim dbc1
	Dim dbcisp
	Dim dbc3	Dim dbc4
	Dim Mprezzo
	  

     cDBStats1 = "/db/spicers.mdb"
     cDBStats2 = "/db/new.mdb"
     cDBStats3 = "/db/profilo.mdb"
     cDBStats4 = "/negozi/db/scart.mdb"

'tabella e-commerce utente
Sub Openconn4
	stringdb= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
	"Persist Security Info=False;" &_
	"Data Source=" & Server.MapPath(cDBStats3)
	set dbc4 = Server.CreateObject("ADODB.Connection")
	dbc4.open stringdb
End Sub			     
Sub CloseConn4()
	if isobject(dbc4) then
	if dbc4.State = adStateOpen then
	dbc4.Close
	end if
	set dbc4= nothing
	end if
End sub
'tabella profilo utente
Sub Openconn3
	stringdb= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
	"Persist Security Info=False;" &_
	"Data Source=" & Server.MapPath(cDBStats3)
	set dbc3 = Server.CreateObject("ADODB.Connection")
	dbc3.open stringdb
End Sub			     
Sub CloseConn3()
	if isobject(dbc3) then
	if dbc3.State = adStateOpen then
	dbc3.Close
	end if
	set dbc3= nothing
	end if
End sub
'tabella is products
Sub Openconn2
	stringdb= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
	"Persist Security Info=False;" &_
	"Data Source=" & Server.MapPath(cDBStats2)
	set dbcisp = Server.CreateObject("ADODB.Connection")
	dbcisp.open stringdb
End Sub			     
Sub CloseConn2()
	if isobject(dbcisp) then
	if dbcisp.State = adStateOpen then
	dbcisp.Close
	end if
	set dbcisp= nothing
	end if
End sub
'tabella spicers
Sub Openconn1
	stringdb1= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
	"Persist Security Info=False;" &_
	"Data Source=" & Server.MapPath(cDBStats1)
	set dbc1 = Server.CreateObject("ADODB.Connection")
	dbc1.open stringdb1
End Sub			     
Sub CloseConn1()
	if isobject(dbc1) then
	if dbc1.State = adStateOpen then
	dbc1.Close
	end if
	set dbc1 = nothing
	end if
End sub
'funzione trova profilo	
Function Mod_Prezzo(Byval codice)
		Openconn3
		Set Tbpp = Server.CreateObject("ADODB.RecordSet")
		sSQLp = "select * From Profilo where Codice_ISP='" & Trim(codice) & "' AND password1='" & Trim(Session("Chisono")) & "'"
		Tbpp.Open sSQLp, dbc3,1,adLockReadOnly
		Mprezzo=0
		Mod_Prezzo="False"		
		If not Tbpp.EOF then
		  Mod_Prezzo="True"	
		  Mprezzo=Cdbl(Tbpp("Prezzo"))
		else  	
		  Mod_Prezzo="False"	
		end if
		Tbpp.close
		Closeconn3	
End function

cDBStatsst = "/db/storico.mdb"
'Apertura Database Storico
strDSNcarst =  "Provider=Microsoft.Jet.OLEDB.4.0;" &_
"Persist Security Info=False;" &_
"Data Source=" & Server.MapPath(cDBStatsst)							    
Set cnst = Server.CreateObject("ADODB.Connection")
Set tbst = Server.CreateObject("ADODB.Recordset")
'Apertura db storico	
cnst.Open strDSNcarst
'sql valore in storico cod articolo															
Sql="Select * from Storico where id=" & Cint(Request("cod"))
tbst.Open Sql,cnst
'valore del codice
codice_ric=trim(tbst("codice_isp"))'response.write(tbst("fornitore"))
if trim(tbst("fornitore"))<>"" then

	if lcase(tbst("fornitore"))="esprinet" then		Set Tb = Server.CreateObject("ADODB.RecordSet")
		sSQL = "select * From ArtEsprinet where codice_articolo='" & Trim(codice_ric) & "'"
		Tb.Open sSQL, conn
		t_data=date()
		text_sessionid=Session.SessionID
		quantita1=Cint(request.form("fquantity"))
		prezzo_finale_euro=Tb("prezzo_finale_euro")
		text_prezzo=FormatNumber((prezzo_finale_euro + ((prezzo_finale_euro/100)*(Ricaricoinfo-Cint(Session("Scontoinfo"))))),2)
		text_prezzoo=FormatNumber((text_prezzo*quantita1),2)
		blocco="Nessuno"
		Descrizione=Trim(replace(replace(replace(Lcase(Tb("Descrizione_estese")),"'","`"),"*"," "),"&"," ")) & ""
		StrSql="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore) values ('" & text_sessionid & "','" & Trim(codice_ric) & "','" & Descrizione & "','" & quantita1 & "','" & text_prezzoo & "','" & t_data & "','" & text_prezzo & "','" & Blocco & "','Esprinet')"		
	end if	  
	if lcase(tbst("fornitore"))="spicers" then			Openconn1								
		Set Tbmod_isp = Server.CreateObject("ADODB.RecordSet")
		sSQL1 = "select * From spicers where spicers='" & Trim(codice_ric) & "'"
		Tbmod_isp.Open sSQL1, dbc1%>					             
		<!--#include file="ricercacatalogoparametri.inc" -->   
		<%		t_data=date()
		text_sessionid=Session.SessionID								                    
		quantita1=Cint(request.form("fquantity"))
		text_prezzoo=FormatNumber((Mprezzo2*quantita1),2)
		blocco=Trim(request.form("blocco"))
		StrSql="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore) values ('" & text_sessionid & "','" & Trim(codice_ric) & "','" & Descrizione & "','" & quantita1 & "','" & text_prezzoo & "','" & t_data & "','" & Mprezzo2 & "','" & Blocco & "','Spicers')"
		CloseConn1		   
	end if	  
	if lcase(tbst("fornitore"))="isp" then			Openconn2					
			Set Tabellaisp = Server.CreateObject("ADODB.RecordSet")
			sSQL1 = "select * From db_ARTICOLI where Codice_ISP='" & replace(cstr(Trim(codice_ric))," ","+") & "'"
			Tabellaisp.Open sSQL1, dbcisp			      						
			 if not Tabellaisp.EOF then
			    Descrizione=""
			    Descrizione=Trim(replace(replace(replace(Tabellaisp("Descrizione"),"'","`"),"*"," "),"&"," "))	
			   else  
			    'errore
			    response.redirect "errore.asp?id=carrello5"   		    	
			 end if			
   		 	t_data=date()
			text_sessionid=Session.SessionID  %>                  
			<!--#include file="ricercacispparametri.inc" -->
			<%			   
			'Prezzo a zero
			Mprezzo=0
			codiceprofilo=Cstr(Mod_Prezzo(Trim(codice_ric)))					 			
			if Trim(codiceprofilo)="True" then
			text_prezzoo= FormatNumber(Mprezzo,2)*Cint(Request.Form("fquantity"))
			text_prezzoou= FormatNumber(Mprezzo,2)
			txt_blocco="Profilo_Utente"
			else		    
				if  Trim(Session("Chisono"))="" then
				text_prezzoo=FormatNumber(Mprezzo1,2)*Cint(Request.Form("fquantity"))
				text_prezzoou= FormatNumber(Mprezzo1,2)				else
				text_prezzoo=FormatNumber(Mprezzo2,2)*Cint(Request.Form("fquantity"))				text_prezzoou= FormatNumber(Mprezzo2,2)
				end if			
			end if 						         
			'Carrello isp      
			txt_fornitore="ISP"
			txt_blocco="Nessuno"			                    
			StrSql="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore) values ('" & text_sessionid & "','" & Tabellaisp("Codice_ISP") & "','" & Descrizione & "','" & Request.Form("fquantity") & "','" & text_prezzoo & "','" & t_data & "','" & text_prezzoou & "','" & txt_blocco & "','" & txt_fornitore & "')"
			Tabellaisp.Close
			CloseConn2						if lcase(tbst("fornitore"))="ecommerce" then				Openconn4								
			Set Tbec = Server.CreateObject("ADODB.RecordSet")
			sSQL = "select * From products where ccode='" & Trim(codice_ric) & "'"
			Tbec.Open sSQL, dbc4			t_data=date()
			text_sessionid=Session.SessionID								                    
			quantita1=Cint(request.form("fquantity"))
			text_prezzoo=FormatNumber((tbec("cprice")*quantita1),2)
			blocco="Nessuno"
			StrSql="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore) values ('" & text_sessionid & "','" & Trim(codice_ric) & "','" & tbec("cdescription") & "','" & quantita1 & "','" & text_prezzoo & "','" & t_data & "','" & tbec("cprice") & "','" & Blocco & "','Ecommerce')"
			CloseConn4		   
		end if			
	end if
	
	'response.write(Cint(Request("cod")))	response.write(StrSql)
	response.end  
	'INSERIMENTO CARRELLO
	cDBStatscar = "/db/carrello.mdb"
	strDSNcar= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
	"Persist Security Info=False;" &_
	"Data Source=" & Server.MapPath(cDBStatscar)													
	Set cncar = Server.CreateObject("ADODB.Connection")
	cncar.Open strDSNcar																							    	 
	cncar.Execute StrSql
	cncar.Close  
  else
 Response.redirect "errore.asp?id=carrello5"end if
tbst.Closecnst.Close
Response.redirect "carrellonew2.asp" %>
	
