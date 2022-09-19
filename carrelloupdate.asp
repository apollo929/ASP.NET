<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%                 	 
    'carrello
    Set tbcar = Server.CreateObject("ADODB.Recordset")  
    Sql="Select * from Carrello where codice_isp='" & trim(request("codid")) & "' and Sessionid='" &  Session.SessionID & "'"
	tbcar.Open Sql,connm
	'numerica quantita'
	if isnumeric(request.form("qta" & trim(request("id")))) then
	    qta=clng(request.form("qta" & trim(request("id"))))
	else
	    qta=1
	end if
	
	'response.write(qta)
	'response.end
	prezzotot=formatnumber(qta*tbcar("prezzou"),2)
	
	Sqldelupd="delete from carrello where codice_isp='" &  trim(request("codid")) & "' and Sessionid='" &  Session.SessionID & "'" 
	connm.Execute(Sqldelupd)
	'response.write("---" & Sqldelupd)
	t_data=date()
	sqlinsertupd="insert into carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore,Urlfoto,Iva,aliqiva) values ('" & Session.SessionID & "','" & tbcar("codice_isp") & "','" & tbcar("descrizione") & "','" & qta & "','" & Replace(Replace(prezzotot,".",""),",",".") & "',current_date,'" & Replace(Replace(tbcar("prezzou"),".",""),",",".") & "','" & tbcar("Blocco") & "','" & tbcar("fornitore") & "','" & tbcar("urlfoto") & "','" & tbcar("iva") & "'," & Replace(Replace(tbcar("aliqiva"),".",""),",",".") & ")" 
	'response.write("---" & sqlinsertupd)
	'response.end
	connm.Execute(sqlinsertupd)	
   	tbcar.close
	
    Response.redirect "carrellovisua.asp"
%>
<!--#include file="sqlchiudi.inc"-->	