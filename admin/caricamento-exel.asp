<% 

Function senza_apice(byval txt)
	lt=len(txt)
	tx=""
	for f=1 to lt
		c=mid(txt,f,1)
		if c="'" then
			c="`"
		end if
		tx=tx+c
	next
	senza_apice=tx
End function

Set Conn_m=Server.CreateObject("ADODB.connection")
Conn_m.ConnectionString ="server=50.62.146.197;database=dbgenerale;" &_
"user=dbgenerale;password=Genovese001;driver={MySQL ODBC 3.51 Driver};"
Conn_m.Open

Set Conn_i=Server.CreateObject("ADODB.connection")
Conn_i.ConnectionString ="server=50.62.146.197;database=informaticaml;" &_
"user=informaticaml;password=Genovese001;driver={MySQL ODBC 3.51 Driver};"
Conn_i.Open
 

' Set Connection Params 
Set oConn = Server.CreateObject("ADODB.connection") 
oConn.Open "Driver={Microsoft Excel Driver (*.xls)}; DriverId=790;" &_ 
"DBQ=C:\inetpub\vhosts\errebifeltre.com\httpdocs\admin\magazine\maggio2014.xls;" &_ 
"DefaultDir = C:\inetpub\vhosts\errebifeltre.com\httpdocs\admin\magazine\" 

Set RS=Server.CreateObject("ADODB.recordset") 

':::::::::::::::::::: ATTENZIONE ::::::::::::::::::::
':::::::::::::::::::: ATTENZIONE ::::::::::::::::::::

'aggiornare 1 database alla volta

':::::::::::::::::::: ATTENZIONE ::::::::::::::::::::
':::::::::::::::::::: ATTENZIONE ::::::::::::::::::::

RS.open "SELECT codice,descrizione,prezzo,scontato FROM magazine", oConn 

':::::::::::::::::::: ELIMINO PRODOTTI MAGAZINE DBGENERALE ::::::::::::::::::::
'sql_del="delete from magazinebuffetti"
'Conn_m.execute(sql_del)
':::::::::::::::::::: ELIMINO PRODOTTI MAGAZINE DBGENERALE ::::::::::::::::::::

':::::::::::::::::::: ELIMINO PRODOTTI MAGAZINE INFORMATICAML ::::::::::::::::::::
sql_del="delete from magazinebuffetti"
Conn_i.execute(sql_del)
':::::::::::::::::::: ELIMINO PRODOTTI MAGAZINE INFORMATICAML ::::::::::::::::::::
ii=0
do until RS.EOF 
	ii=ii+1
	if rs("codice")<>"" then
		descrizione=senza_apice(rs("descrizione"))
		prezzo=replace(formatnumber(rs("prezzo"),2),",",".")
		scontato=replace(formatnumber(rs("scontato"),2),",",".")
		
		':::::::::::::::::::: INSERISCO PRODOTTI MAGAZINE DBGENERALE ::::::::::::::::::::
		'sql_ins_m="insert into magazinebuffetti (codice,descrizione,prezzo,prezzoofferta) values ('" & rs("codice") & "','" & descrizione & "'," & prezzo & "," & scontato & ")"
		'response.Write("<br> " & ii & ") " & sql_ins_m)
		'Conn_m.execute(sql_ins_m)
		
		
		':::::::::::::::::::: INSERISCO PRODOTTI MAGAZINE INFORMATICAML ::::::::::::::::::::
		sql_ins_i="insert into magazinebuffetti (codice,descrizione,prezzo,prezzoofferta) values ('" & rs("codice") & "','" & descrizione & "'," & prezzo & "," & scontato & ")"
		response.Write("<br> " & ii & ") " & sql_ins_i)
		Conn_i.execute(sql_ins_i)
	end if
	
RS.movenext 
Loop 

'Close the recordset/connection 

RS.Close 
oConn.Close 
Conn_m.close
Conn_i.close
Set RS = Nothing 
Set oConn = Nothing 
Set Conn_m = Nothing 
Set Conn_i = Nothing 

%>