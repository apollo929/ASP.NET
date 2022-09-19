<%
'log interventi
sql="insert into logpreventivi (idazienda,idannuncio,ragione,provincia,data) values ('" & session("loginid") & "','" & intid & "','" & session("ragione") & "','" & tbscheda("provincia") & "',current_date)"
conn.execute(sql)%>