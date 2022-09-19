<%
namedbmysql="dbhatseries"
linkuserid="https://shop.hatseries.com"

'Connessione SQL Generale 
Set Conn=Server.CreateObject("ADODB.connection")
conn.ConnectionString ="server=localhost;database=" & namedbmysql & ";" &_
"user=" & namedbmysql & ";password=0Ave1g8^;driver={MySQL ODBC 3.51 Driver};"
conn.Open

'Cliente Buffetti 
Set Connm=Server.CreateObject("ADODB.connection")
connm.ConnectionString ="server=localhost;database=" & namedbmysql & ";" &_
"user=" & namedbmysql & ";password=0Ave1g8^;driver={MySQL ODBC 3.51 Driver};"
connm.Open

'Cliente Buffetti Net Amministrativa
strConnect="server=localhost;database=" & namedbmysql & ";" &_
"user=" & namedbmysql & ";password=0Ave1g8^;driver={MySQL ODBC 3.51 Driver};"

strConnect2="server=localhost;database=informaticaml;" &_
"user=informaticaml;password=Genovese001;driver={MySQL ODBC 3.51 Driver};"



function toSql(a)
    if isnull(a) then a =""
    a=replace(a,"\","")
    a=replace(a,"'","\'")
    toSql = a
end function

function senza_apice(byval txt)
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
end function


sub loggaVisSchede(fornitore1,codice1,categoria1,descrizione1,utente1,password1)
    connm.execute "insert into statschede (data,fornitore,codice,categoria,descrizione,utente,password) values (" & _
        "current_timestamp," & _
        "'" & tosql(fornitore1) & "'," & _
        "'" & tosql(codice1) & "'," & _
         "'" & tosql(categoria1) & "'," & _
          "'" & tosql(descrizione1) & "'," & _
           "'" & tosql(utente1) & "'," & _
            "'" & tosql(password1) & "')"
end sub
%>
