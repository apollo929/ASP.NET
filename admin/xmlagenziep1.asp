<html>
<head>
	<title>www.costruttori.it</title>
	<LINK rel="stylesheet" href="styles.css">
</head>
<body  bgcolor=LightGoldenrodYellow>
<p><br>
<!-- #include file=_menu.inc --->
</p>
<br>
<%

function tosql(s)
	s=replace(s,"\","")
	s=replace(s,"'","\'")
	tosql=s
end function

'connessione database
Set conn=Server.CreateObject("ADODB.connection")
conn.ConnectionString ="Driver={MySQL ODBC 3.51 Driver};server=LOCALHOST;db=costruttori;uid=costruttori;pwd=Genovese001;"
conn.Open

server.scripttimeout=1800
set objHTTP = server.createobject("Msxml2.ServerXMLHTTP")
set tb = Server.CreateObject("ADODB.Recordset")
SQL="Select * From lista"
tb.Open Sql,conn
strPost="http://www.portaliimmobiliari.com/AUTOMAZIONI/Export/registrazioni/AGENZIE_ATTIVE_379.xml"
objHTTP.open "GET", strPost, false
objHTTP.setRequestHeader "Host", "http://www.costruttori.it"
objHTTP.setRequestHeader "Connection", "close"
objHTTP.setRequestHeader "Accept-Encoding", "gzip"
objHTTP.setRequestHeader "Accept", "image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */*"
objHTTP.setRequestHeader "Accept-Language", "it"
objHTTP.setRequestHeader "User-Agent", "Mozilla/4.0"
objHTTP.setRequestHeader "Referer", "http://www.costruttori.it"
objHTTP.send()
Doc = cstr(lcase(objHTTP.responsetext)) 
Doc_t=""		
Doc_t=Replace(doc,chr(10),";")

valore = Split(Doc_t,";")
i=1
ok=request("inserisci")
for a=0 to ubound(valore)	
	'response.write("<br>" & a)
    valore(a)=replace(replace(valore(a),"<![cdata[",""),"]]>","")
    response.Write("<br>" & valore(a))
	
	if i=15 then
	'id
	idazienda=valore(a-(i-4))
	idazienda=replace(replace(idazienda,"<id_agenzia>",""),"</id_agenzia>","")
	'response.write("<br>" & idazienda)
	idazienda=idazienda*10
	'response.write("<br>" & idazienda)
	
	'indirizzo
	indirizzo=valore(a-(i-6))
	indirizzo=replace(replace(replace(replace(replace(indirizzo,"<indirizzo>",""),"</indirizzo>",""),chr(34),""),chr(13),""),"'"," ")
	
	'comune
	comune=valore(a-(i-7))
	comune=replace(replace(replace(replace(replace(comune,"<comune>",""),"</comune>",""),chr(34),""),chr(13),""),"'"," ")
	
	'provincia
	provincia=valore(a-(i-8))
	provincia=replace(replace(replace(replace(provincia,"<provincia>",""),"</provincia>",""),chr(34),""),chr(13),"")
	
	'appartenenza1
	appartenenza1=valore(a-(i-9))
	appartenenza1=replace(replace(replace(replace(appartenenza1,"<regione>",""),"</regione>",""),chr(34),""),chr(13),"")
	
	'cap
	cap=valore(a-(i-10))
	cap=replace(replace(replace(replace(replace(cap,"<codice_comune>",""),"</codice_comune>",""),chr(34),""),chr(13),""),"'","")
	
	'telefono
	telefono=valore(a-(i-11))
	telefono=replace(replace(replace(replace(telefono,"<telefono>",""),"</telefono>",""),chr(34),""),chr(13),"")
	
	'fax
	fax=valore(a-(i-12))
	fax=replace(replace(replace(replace(fax,"<fax>",""),"</fax>",""),chr(34),""),chr(13),"")
	
	'mail
	mail=valore(a-(i-13))
	mail=replace(replace(replace(replace(mail,"<mail>",""),"</mail>",""),chr(34),""),chr(13),"")
	
	'ragione1
	ragione1=valore(a-(i-5))
	ragione1=replace(replace(replace(replace(replace(ragione1,"<nominativo>",""),"</nominativo>",""),chr(34),""),chr(13),""),"'"," ")
	
	sql="insert into lista (indirizzo,comune,provincia,appartenenza1,cap,telefono,fax,mail,ragione1,username,psw,categoria1,Convalida,visibile,portale_immobiliare) values ('" & indirizzo & "','" & comune & "','" & provincia & "','" & appartenenza1 & "','" & cap & "','" & telefono & "','" & fax & "','" & mail & "','" & ragione1 & "','" & idazienda & "','" & idazienda & "','Agenzia Immobiliare','True',1," & idazienda & ")"
'	response.write("---" & i)
	response.write("<br><br>")
	response.write("<br>" & sql)
'	response.write("<br><br>")

	'set tbverifica = Server.CreateObject("ADODB.Recordset")
	'sqlverifica="select id from lista where id='" & idazienda & "' union select id from lista1 where id='" & idazienda & "' "
	'tbverifica.Open sqlverifica,conn
	'if ok=2 and tbverifica.eof  then
    conn.Execute(sql)
	'end if
	i=0
	end if
	

	i=i+1
next 
if ok=2 then
	ok=0
	<!-- #include file=closesql.inc --->
	response.Redirect("ok.asp")
end if
%>
<table width="100%">
	<tr>
		<td align="center"><a href="xmlagenzie.asp?inserisci=2" class="nero11"><b>Inserimento agenzie</b></a></td>
	</tr>
</table>
</BODY>
</HTML>
<!-- #include file=closesql.inc --->