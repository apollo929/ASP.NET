<%
'Gestione Errori
'On Error Resume Next

'Connessione SQL Lufficio
Set conn=Server.CreateObject("ADODB.connection")
Conn.ConnectionString ="server=208.109.198.20;database=3d;" &_
"user=user3d;password=Genovese001;driver={MySQL ODBC 3.51 Driver};"
conn.Open


%>
 
