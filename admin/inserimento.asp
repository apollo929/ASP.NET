<!--#include file="connessionesql.asp" -->
<%Server.Execute(linkuserid & "\parametriasp.asp")

session.lcid=1040
     
Sub InsCartucce
	Set Tb1 = Server.CreateObject("ADODB.RecordSet")
	sSQL = "select * From db_ARTICOLI where Codice_ISP Like '%" & Trim(Request("Preisp")) & "%'" 
	Tb1.Open sSQL, connm
	If not Tb1.EOF then
	Do While not Tb1.eof
		'Controlla Modello=0
		Codice=trim(Tb1("Codice_Isp"))
		Response.Write "<option value=" & Codice & ">"
		Response.Write Codice & " --- " & mid(Tb1("Descrizione"),1,50)
		Response.Write "</option>"	
		Tb1.movenext
	loop
	else
	Response.Write "<option value=0>"
	Response.Write "------------------"
	Response.Write "</option>"
	end if
	Tb1.close
End sub
     
     
     
Sub InsModello			
	Set Tb = Server.CreateObject("ADODB.RecordSet")
	sSQL = "select * From Modello where Tipologia=" & Cint(Request("Id")) & " order by Modello asc "
	Tb.Open sSQL,conn
	If not Tb.EOF then
		Do While not Tb.eof
			'Controlla Modello=0
			Modello=trim(Tb("Modello"))
			Response.Write "<option value='" & Modello & "'>"
			Response.Write Modello
			Response.Write "</option>"			
			Tb.movenext
		loop
		else
		Response.Write "<option value=0>"
		Response.Write "------------------"
		Response.Write "</option>"
	end if
	Tb.close		
End sub 
	
Set Tb = Server.CreateObject("ADODB.RecordSet")
sSQL = "select * From Modello where ID=" & Cint(Request("Modelloid")) 
Tb.Open sSQL,conn
If not Tb.EOF then
Tipologia_modello=Tb("Modello")		
else  	
Tipologia_modello="Modello non Trovato"		
end if		
Tb.close
	
'Inserimento ADD
if Trim(request("tipo"))="update" then
	Set Tb1 = Server.CreateObject("ADODB.RecordSet")
	sSQL = "select * From db_ARTICOLI where Codice_ISP='" & Trim(Request.form("Cartucce")) & "'"
	Tb1.Open sSQL, connm					
	If not Tb1.EOF then
		Descrizione=replace(Tb1("Descrizione"),"'","`")		
	else  
		Descrizione=" Vuoto "		
	end if						
	Tb1.close
	session.lcid=1040    
	t_data=date()
	StrSql="Insert into Modello_Disp_Add (Modello,Idmodello,Codice_Isp,Descrizione,Data) values ('" & Request.form("Modello") & "','" & Cint(Request("ModelloId")) & "','" & Request.form("Cartucce") & "','" & descrizione & "','" & t_data & "')"
	conn.Execute StrSql
End if     
      
      
      
      
'Inserimento ADD
if Trim(request("tipo"))="updateric" then
	Set Tb1 = Server.CreateObject("ADODB.RecordSet")
	sSQL = "select * From db_ARTICOLI where Codice_ISP='" & Trim(Request.form("Codice_ISP")) & "'"
	Tb1.Open sSQL,connm
	Verifica=False													
	if not Tb1.EOF then
		Descrizione=replace(Tb1("Descrizione"),"'","`")		
		Codice_ISP=Trim(Request.form("Codice_ISP"))
		Prezzol=replace(Tb1("PrezzoDiVendita"),",",".")
		Verifica=True
		else  	
		Descrizione=" Vuoto "	
			%>						
		<script language="JavaScript">
	    alert("Codice Isp non trovato!");
	        </script>
		<%				  			
	end if																		
	Tb1.close

	if Verifica=True then					    
	session.lcid=1040    
	t_data=date()				    
	StrSql="Insert into Modello_Disp_Add (Modello,Idmodello,Codice_Isp,Descrizione,Data) values ('" & Request.form("Modello") & "','" & Cint(Request("ModelloId")) & "','" & Codice_ISP & "','" & descrizione & "','" & t_data & "')"
	conn.Execute StrSql
	End if			
End if
    
'Inserimento ADD Stessa St
if Trim(request("tipo"))="updatest" then
	session.lcid=1040    
	t_data=date()    
	StrSql="Insert into Modello_Disp_Add (Modello,Idmodello,Codice_Isp,Descrizione,Data) values ('" & Request.form("Modello") & "','" & Cint(Request("ModelloId")) & "','Stampante','" & Request.form("Modello") & "','" & t_data & "')"
	conn.Execute StrSql
End if   

'Inserimento Del
if Trim(request("del"))<>"" then
	sSQL = "Delete  From Modello_Disp_Add where Id=" & Cint(Request("del")) 
	conn.Execute sSQL     
end if
    %>

<html>
	<head>
		<title>SITO WEB E-COMMERCE BACK OFFICE</title>
		
		<link href="style.css" rel="stylesheet" type="text/css">
		<script language="javascript">
			function sottocategorie(formname) {
				pos = eval("document." + formname + ".categorie.selectedIndex");
				val = eval("document." + formname + ".categorie.options["+ pos + "].value");
				asp = "selsottocategoria.asp?id="+val;
				w=window.open(asp,"SottoCategoria","width=350,height=150,menubar=no,scrollbar=auto,resizable=no");
			}
			function articoli(formname) {
				pos   = eval("document." + formname + ".categorie.selectedIndex");
				val   = eval("document." + formname + ".categorie.options["+ pos + "].value");
				valsc = eval("document." + formname + ".sottocategoriaid.value");
				asp = "selarticolo.asp?id="+val+"&sid="+valsc;
				w=window.open(asp,"Articoli","width=600,height=550,menubar=no,scrollbar=auto,resizable=no");
			}
			function visuaimg(formname) {
			   	idsc = eval("document." + formname + ".codarticolo.value");
				asp = "visuarticolo.asp?id=" + idsc;
				w=window.open(asp,"Visualizzazione","width=200,height=250,menubar=no,scrollbar=auto,resizable=no");
			}
			function immagine(formname) {
				asp = "selimmagine.asp";
				w=window.open(asp,"Immagine","width=600,height=600,menubar=no,scrollbar=auto,resizable=no");
			}
			


			function checkart(formobj)
			   
			    {
			    nome = formobj.categorie.value;
				if (nome =="" )
				{
					alert(" categorie ");
					formobj.categorie.focus();
					return false
				}else
				{
				cognome = formobj.sottocategoria.value;
				if (cognome == "")
				{	alert("sottocategoria");
					return false
				}else
				{
				cap = formobj.desarticolo.value;
				if (cap == "")
				{	alert("Descrizione Obbligatoria");
					formobj.desarticolo.focus();
					return false
				}else
				{
					Prezzo = formobj.prezzo.value;
				if (isNaN(Prezzo)== true)
				{	alert("Inserisci il Prezzo");
					formobj.prezzo.focus();
					return false
				}else	
					return true
					}}
				}
			
			}



		</script>
		</head>

<body bgcolor=white class=nero11>
<!--#include file="_menu.inc"-->	
<%
if Trim(Request("Sos"))<>"" then
  Response.write "Codice da Eliminare <b>" & request("Sos") & "</b><br>"
end if
%>
										
<FORM name="form" method="post" action="inserimento.asp?id=<%=Cint(Request("Id"))%>&tipo=updatest&modelloid=<%=Cint(Request("Modelloid")) %>&Preisp=<%=request("Preisp")%>" >
<br><a class="nero11" href="javascript:history.back()"><STRONG class="nero11"><U>INDIETRO</a></U></STRONG>											
<table width=100% border=1 cellpadding=0 cellspacing=0>

<tr><td colspan=3 align=center><b>Modello Utilizzato <%=Tipologia_modello%> Marca <%=request("Preisp")%></b></td></tr>
<tr>
<td ><b><INPUT class=navy10n type="image" border="0" name="imgsave" src="img/_piu.gif">Cartuccie Uguali a>>> </b></td>

													<td class=navy10n >
														 Modello: 
													</td>
													<td class=navy10n >

<SELECT class=navy10n  id=modello name=modello 
>
<option selected value="<%=Tipologia_modello%>"><%=Tipologia_modello%></option>

<%insmodello%>
</SELECT>
													</td>
											
</tr>
							
										</FORM>	



<!---FORM name="form" method="post" action="inserimento.asp?id=<%=Cint(Request("Id"))%>&tipo=update&modelloid=<%=Cint(Request("Modelloid")) %>&Preisp=<%=request("Preisp")%>" >
										
<tr>
<td ><b><INPUT class=navy10n type="image" border="0" name="imgsave" src="img/_piu.gif"><td class=navy10n >
Cartucce da Aggiungere: 
</td>
<td class=navy10n >

<SELECT class=navy10n  id=cartucce name=cartucce
><%'inscartucce%>
</SELECT>
</td>
											

												</b></td></tr>
							
										</FORM-------->										
												
												
<FORM name="form" method="post" action="inserimento.asp?id=<%=Cint(Request("Id"))%>&tipo=updateric&modelloid=<%=Cint(Request("Modelloid")) %>&Preisp=<%=request("Preisp")%>" >
										
<tr>
<td ><b><INPUT class=navy10n type="image" border="0" name="imgsave" src="img/_piu.gif"><td class=navy10n >
Cartucce da Aggiungere: 
</td>
<td class=navy10n >
<input id="text_1" maxLength="25" name="codice_isp" >
</td>
											

												</b></td></tr>
							
										</FORM>														
</table>


<TABLE BORDER="1" CELLSPACING="1" CELLPADDING="1">
<TR><TH BGCOLOR="#B0B0FF">&nbsp;</TH>
<TH BGCOLOR="#B0B0FF"><FONT FACE="Verdana">

		
		Modello</FONT></TH><TH BGCOLOR="#B0B0FF"><FONT FACE="Verdana">

		
		IdModello</FONT></TH><TH BGCOLOR="#B0B0FF"><FONT FACE="Verdana">

		
		Codice_ISP</FONT></TH><TH BGCOLOR="#B0B0FF"><FONT FACE="Verdana">

		
		Descrizione</FONT></TH></TR>


<%' 
         
		
			   Set Tbmod = Server.CreateObject("ADODB.RecordSet")
			   sSQL = "select * From Modello_Disp_Add where Idmodello=" & Cint(Request("modelloId")) 
			   Tbmod.Open sSQL, conn
			   If not Tbmod.EOF then

			   	Do While not Tbmod.eof
			   	   Descrizione=""
                   Descrizione=replace(Tbmod("Descrizione"),"'","`")
%>


<TR><TH BGCOLOR="#B0B0FF"><a href="inserimento.asp?id=<%=Cint(Request("Id"))%>&del=<%=Tbmod("Id")%>&modelloid=<%=Cint(Request("Modelloid")) %>&Preisp=<%=request("Preisp")%>"><img src=images/delete.gif border=0></a></TH>
<TH BGCOLOR="#B0B0FF"><FONT FACE="Verdana">

		
		<%=Tbmod("Modello")%></FONT></TH><TH BGCOLOR="#B0B0FF"><FONT FACE="Verdana">

		
		<%=Tbmod("idmodello")%></FONT></TH><TH BGCOLOR="#B0B0FF"><FONT FACE="Verdana">

		
		<%=Tbmod("Codice_ISP")%></FONT></TH><TH BGCOLOR="#B0B0FF"><FONT FACE="Verdana">

		
		<%=Descrizione%></FONT></TH></TR>





<%

	
			   		Tbmod.movenext
			   	loop
			   else
			   	
			   	
			   end if

			   Tbmod.close
		

%>

</TABLE>

</body>
</html>
