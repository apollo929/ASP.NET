<!--#include file="connessionesql.asp" -->

<html>
	<head>
		<title>SITO WEB E-COMMERCE BACK OFFICE.TV</title>
		
		<link href="style.css" rel="stylesheet" type="text/css">
		<script language="JavaScript">
function inserthtml(form,txthtml) {
	document.form1.Foto.value=document.form1.TEXTAREA2.value+txthtml;
	document.form1.Foto.focus();
}

function popupfoto(w, h) { 
	myWin=window.open('','preview', 'width=' + w + ',height=' + h + ',resizable=no,status=no,toolbar=no,menubar=no,scrollbars=yes');
	myWin.document.write('<html><title>Preview</title><body>');
	myWin.document.write('<font face=Verdana Size=2><p align=justify>');
	myWin.document.write(document.form1.TEXTAREA2.value);
	myWin.document.write('<//font><//p>');
	myWin.document.write('</body>');
} 




function insertimage(file) {
	popupimg(400,400);
}

function popupimg(w, h) { 
	myWin=window.open('browseimg.asp','preview', 'width=' + w + ',height=' + h + ',resizable=no,status=no,toolbar=no,menubar=no,scrollbars=yes');
	if (myWin.opener == null) myWin.opener = self;

} 
function Form1_Validator(theForm)
{

  if (number(theForm.prezzoo.value) == "")
  {
    alert("Inserire un valore Numerico per il campo Prezzo.");
    theForm.prezzoo.focus();
    return (false);
  }
  }
  
  </script>
		</head>

<body bgcolor=white class=nero11>
<!--#include file="_menu.inc"-->
<%  




      
     session.lcid=1040
    
    'Variabili Connessione Db
	Dim dbc
	Dim dbc1
	  
     cDBStats = "/db/ovest.mdb"
     cDBStats1 = "/db/new.mdb"
     


     Sub Openconn

      stringdb= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Persist Security Info=False;" &_
      "Data Source=" & Server.MapPath(cDBStats)
      set dbc = Server.CreateObject("ADODB.Connection")
      dbc.open stringdb

     End Sub
     
     Sub CloseConn()

	  if isobject(dbc) then
		if dbc.State = adStateOpen then
			dbc.Close
		end if
		set dbc = nothing
	  end if

     End sub
     
     
     
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
     
     	
     
     Sub InsCartucce
			Openconn1
			   Set Tb1 = Server.CreateObject("ADODB.RecordSet")
			   sSQL = "select * From db_ARTICOLI where Codice_ISP Like '%" & Trim(Request("Preisp")) & "%'" 
			   'response.write(sSql)
			   'response.end
			   Tb1.Open sSQL, dbc1, adOpenStatic, adCmdText
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
			   Closeconn1	
	End sub
     
     
     
         Sub InsModello
			Openconn
			   Set Tb = Server.CreateObject("ADODB.RecordSet")
			   sSQL = "select * From Modello where Tipologia=" & Cint(Request("Id")) 
			   Tb.Open sSQL, dbc, adOpenStatic, adCmdText
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
			   Closeconn	
	End sub 
	
	
	



	
				'trova
				if Trim(request("cerca"))="true" then
						 
				  	Openconn
				  	Set Tb = Server.CreateObject("ADODB.RecordSet")
				  	sSQL = "select * From Modello_Disp where Codice_ISP='" & Trim(Request.form("Codice_ISP")) & "'"
				  	Tb.Open sSQL, dbc, adOpenStatic, adCmdText
													   
													   
				  	If  not Tb.EOF then
										  						
				  	  'Informazioni=replace(Tb("Informazioni"),"'","`")		
				  	  Codice_Ovest=Tb("Codice_Ovest")
				  	  Prezzoo=Tb("Prezzo")
				  	  tx_txt=Tb("UrlFoto")
				  	  data=Tb("Data")
										  
				  	 else
										   
				  	  data=date()  
										               
				  	End if
										               
				  	Closeconn
										               
										               
				  	Openconn1
				  	Set Tb1 = Server.CreateObject("ADODB.RecordSet")
				  	sSQL = "select * From db_ARTICOLI where Codice_ISP='" & Trim(Request.form("Codice_ISP")) & "'"
											
				  	Tb1.Open sSQL, dbc1, adOpenStatic, adCmdText
																
																
																		
				  	If not Tb1.EOF then
				  		Descrizione=replace(Tb1("Descrizione"),"'","`")		
				  		Codice_ISP=Trim(Request.form("Codice_ISP"))
				  		Prezzol=replace(Tb1("PrezzoDiVendita"),",",".")
				  		else  	
				  		Descrizione=" Vuoto "		
				  	end if
																		
				  	Tb1.close
				  	Closeconn1	

					    
				End if
	
	
	
	
	
				'Inserimento ADD Stessa Nuove Info
				if Trim(request("tipo"))="update" then
					
					
				  if Isnumeric(Replace(Request.form("Prezzoo"),",",".")) =true  then	
					  
				    Openconn
					Set Tb = Server.CreateObject("ADODB.RecordSet")
					sSQL = "select * From Modello_Disp where Codice_ISP='" & Trim(Request.form("Codice_ISP")) & "'"
					Tb.Open sSQL, dbc, adOpenStatic, adCmdText
					
					
					session.lcid=1040    
					t_data=cdate(Request.form("data"))
					
					
							   
					If  Tb.EOF then
		
				    
					 		StrSql="Insert into Modello_Disp (Codice_Isp,Informazioni,Codice_Ovest,Prezzo,UrlFoto,Data) values ('" & Request.form("Codice_ISP") & "','" & replace(Request.form("Informazioni"),"'","`") & "','"  & Request.form("Codice_Ovest") & "'," & Replace(Request.form("Prezzoo"),",",".") & ",'" & Request.form("Textarea2") & "','" & t_data & "')"
					 	    response.write("<center><font color=red>Aggiornato</font></center>")
					 	    'response.end
									    
									    
					 		'INSERIMENTO
					 		cDBStats2 = "/db/ovest.mdb"
					 		strDSN= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
					 		"Persist Security Info=False;" &_
					 		"Data Source=" & Server.MapPath(cDBStats2)
					
					 		Set cn = Server.CreateObject("ADODB.Connection")
																    
					 		cn.Open strDSN
											    	 
					 		cn.Execute StrSql
					 		cn.Close
					 		
							

				       else
							'StrSql="Update Articoli Set data=#"+tx_data_frm+"#,titolo='"+tx_titolo+"',sottotitolo='"+tx_sottotitolo+"',testo='"+clearapice(tx_testo)+"',autore='"+tx_autore +"',revisione="+tx_rev+",argomento='"+tx_cat1+"',settore='"+tx_cat2+"' where titolo='"+trim(tx_titolo)+"'"
							StrSql="Update Modello_Disp  Set Codice_Isp='" & Request.form("Codice_ISP") & "',Informazioni='" & replace(Request.form("Informazioni"),"'","`") & "',Codice_Ovest='"  & Request.form("Codice_Ovest") & "',Prezzo=" & Replace(Request.form("Prezzoo"),",",".") & ",Urlfoto='" & Request.form("Textarea2") & "',Data='" & t_data & "' where Codice_ISP='" & Trim(Request.form("Codice_ISP")) & "'" 
							response.write("<center><font color=red>Aggiornato</font></center>")				 	   
							'mod
							cDBStats2 = "/db/ovest.mdb"
							strDSN= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
							"Persist Security Info=False;" &_
							"Data Source=" & Server.MapPath(cDBStats2)
												
							Set cn = Server.CreateObject("ADODB.Connection")
																							    
							cn.Open strDSN
																		    	 
							cn.Execute StrSql
							cn.Close
							
							

									 
				               
				       End if
				           
				            CloseConn	
				            
							cDBStatsn = "/db/ovest.mdb"
							strDSNn= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
							"Persist Security Info=False;" &_
							"Data Source=" & Server.MapPath(cDBStatsn)
												
							Set cn = Server.CreateObject("ADODB.Connection")
							Set Tbn = Server.CreateObject("ADODB.RecordSet")
							sSQL = "select * From Modello_Disp where Codice_ISP='" & Trim(Request.form("Codice_ISP")) & "'"
							cn.Open strDSNn
							Tbn.Open sSQL, cn 
							Informazioni=replace(Tbn("Informazioni"),"'","`")	
							Codice_ISP=Tbn("Codice_ISP")	
							Codice_Ovest=Tbn("Codice_Ovest")
							Prezzoo=replace(Tbn("Prezzo"),",",".")
							tx_txt=Tbn("UrlFoto")
							data=Tbn("Data")
							Tbn.close
							cn.close	      
							
							
							Openconn1
							Set Tb1 = Server.CreateObject("ADODB.RecordSet")
							sSQL = "select * From db_ARTICOLI where Codice_ISP='" & Trim(Request.form("Codice_ISP")) & "'"
																					
							Tb1.Open sSQL, dbc1, adOpenStatic, adCmdText
																										
																										
																												
							If not Tb1.EOF then
								Descrizione=replace(Tb1("Descrizione"),"'","`")		
								Codice_ISP=Trim(Request.form("Codice_ISP"))
								Prezzol=replace(Tb1("PrezzoDiVendita"),",",".")
								else  	
								Descrizione=" Vuoto "		
							end if
																												
							Tb1.close
							Closeconn1	
							
					else 
					
					
					
										Openconn
				  						Set Tb = Server.CreateObject("ADODB.RecordSet")
				  						sSQL = "select * From Modello_Disp where Codice_ISP='" & Trim(Request.form("Codice_ISP")) & "'"
				  						Tb.Open sSQL, dbc, adOpenStatic, adCmdText
																		   
																		   
				  						If  not Tb.EOF then
															  						
				  						  Informazioni=replace(Tb("Informazioni"),"'","`")		
				  						  Codice_Ovest=Tb("Codice_Ovest")
				  						  Prezzoo=Tb("Prezzo")
				  						  tx_txt=Tb("UrlFoto")
				  						  data=Tb("Data")
															  
				  						 else
															   
				  						  data=date()  
															               
				  						End if
															               
				  						Closeconn
															               
				  						Openconn1
				  						Set Tb1 = Server.CreateObject("ADODB.RecordSet")
				  						sSQL = "select * From db_ARTICOLI where Codice_ISP='" & Trim(Request.form("Codice_ISP")) & "'"
																
				  						Tb1.Open sSQL, dbc1, adOpenStatic, adCmdText
				  						If not Tb1.EOF then
				  							Descrizione=replace(Tb1("Descrizione"),"'","`")		
				  							Codice_ISP=Trim(Request.form("Codice_ISP"))
				  							Prezzol=replace(Tb1("PrezzoDiVendita"),",",".")
				  							else  	
				  							Descrizione=" Vuoto "		
				  						end if
																							
				  						Tb1.close
				  						Closeconn1	
					
					
					
					
					       %>
					
					
		                <script language="JavaScript">
                        alert("Inserire un valore numerico per il campo Prezzo ");
                         </script>
		<%			end if		
							
				End if
				
				
    %>



	<FORM name="form2" method="post" action="formstampante.asp?cerca=true"> 
	                        
	                        <table width=90% align=center border=1>
	                        <tr>
							<td class=bianco11 colspan=2 bgcolor=red >Cerca Il Codice_ISP  </td>
							</tr>
							<tr>
							<td class=nero>Codice Isp Cerca :</td>
							<td><input id="text_1" maxLength="25" name="codice_isp" value=<%=codice_isp%> 
							><input type="image" border="0" name="imgsave" src="imgnew/tasto.gif"></td>
							</tr>
							</table>
	</form>						
	
										
							<FORM name="form1" method="post" onsubmit="return Form1_Validator(this)" action="formstampante.asp?tipo=update" >
																	
							<table width=90% align=center name=document border=0>
						    <tr>
						    <td align=center  class=nero>
											
											       
							<tr>
							<td class=nero>Codice Isp:</td>
							<td><input id="text_1" maxLength="25" name="codice_isp" value=<%=codice_isp%> 
							></td>
							</tr>
																				
							<tr>
							<td class=nero>Descrizione </td>
							<td class=nero><textarea CLASS=NERO cols=55 rows=6 name="descrizione" ><%=descrizione%></textarea></td>
							</tr>   
																			
							<tr>
							<td class=nero>Prezzo Listino </td>
							<td class=nero><input id="text_2" maxLength="25" name=prezzol value=<%=prezzol%>></td>
							</tr>   
							
							
						    <tr>
							<td colspan=2><hr></td>
							</tr> 
						
							
							<tr>
							<td class=nero>Codice_Ovest:</td>
							<td><input id="text_2" maxLength="25" name="Codice_Ovest" value=<%=codice_ovest%>
							></td>
							</tr>
													
							<tr>
							<td class=nero>Foto</td>
							<td ><input id="TEXTAREA2" maxLength="255" name="TEXTAREA2" size="80" value="<%=tx_txt%>" ><img border="0" src="img/small_img.gif" onClick="insertimage('red/13.jpg')"><img border="0" src="img/small_preview.gif" onClick="popupfoto(480, 600);"></td>
							</tr>
													
							<tr>
							<td class=nero>Informazioni AGG.</td>
							<td class=nero><textarea CLASS=NERO cols=55 rows=6 name="informazioni" ><%=informazioni%></textarea></td>
							</tr>   
													
							<tr>
							<td class=nero>Prezzo Ovest </td>
							<td class=nero><input id="text_2" maxLength="25" name=prezzoo value=<%=prezzoo%>></td>
							</tr>   
													
							<tr>
							<td class=nero>Data Mod</td>
							<td><input id="text_6" maxLength="30" name="data" size="30" value=<%=data%>></td>
							</tr>
																	  
														 
						       
														
							<tr height=10>
							<td></td>
							<td></td>
							</tr>
																	 
							<tr>
							<td></td>
							<td><input type="image" border="0" name="imgsave" src="images/update.gif"></td>
							</tr>
															 
															 
						</form>
						</td>
						</tr>	
						</table>



</body>
</html>
