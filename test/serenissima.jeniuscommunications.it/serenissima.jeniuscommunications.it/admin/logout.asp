<!--#include file=connessionesql.inc-->
<%
sito=request("web")
'inizializzo le variabili session
session("loginid")=""
session("logintipo")=""
session("loginnominativo")=""
session("loginmail")="" 
session("logintel")=""
session("loginprovincia")=""
session("loginsede")=""
Response.Cookies("MyCookie")=""

'repair  database
conn.Execute("repair table pratiche")
conn.Execute("repair table contatti")
conn.Execute("repair table appuntamenti")
conn.Execute("repair table promemoria")
conn.Execute("repair table pratiche_finanziarie")
conn.Execute("repair table pratiche_documenti")
conn.Execute("repair table tipodocumenti")
conn.Execute("repair table tipodocimmobile")
conn.Execute("repair table tipomutuo")
conn.Execute("repair table tipolead")
conn.Execute("repair table tipolead")
conn.Execute("repair table pratiche_cointestatario")
conn.Execute("repair table pratiche_cointestatario2")
conn.Execute("repair table pratiche_cointestatario3")
conn.Execute("repair table pratiche_cointestatario4")
conn.Execute("repair table pratiche_persona1")
conn.Execute("repair table pratiche_persona2")
conn.Execute("repair table contatti_lead")
conn.Execute("repair table amministratore")
conn.Execute("repair table statschede")
conn.Execute("repair table pratiche_documentiimmobile")
conn.Execute("repair table banca_lista")


%>
<!--#include file=closesql.inc-->
<%response.redirect("../index.asp")%>
