<%  

if Request("TipoId")="" then	
	 	

	
					Tipoperazione=(Request.ServerVariables("REQUEST_METHOD"))
					TipoID=Cint(Request.Form("id"))
					ID=Cint(Request.Form("ccode"))
					'text_descrizione=Replace(Tbprod("Cname"),"'","`")
					text_quantita=Cint(Request.Form("fquantity"))
					Merchid=Cint(Request("merchid"))
					text_prezzo=Cdbl(Request.Form("fprice"))
					text_titolo=Request.Form("Titolo")
					text_qprezzo=text_quantita * text_prezzo
					text_sessionid=Session.SessionID
	
					t_data=date()
	
					StrSql="Insert into Carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data) values ('" & text_sessionid & "','" & ID & "','" & text_titolo & "','" & text_quantita & "','" & text_qprezzo & "','" & t_data & "')"
					response.write(StrSql)
					response.end				
					'cncar.Execute(StrSql)
	
    else
	                	 
					'Cancella Articolo
					cDBStats2 = "db/carrello.mdb"
					strDSN= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
					"Persist Security Info=False;" &_
					"Data Source=" & Server.MapPath(cDBStats2)
						
					Set cn = Server.CreateObject("ADODB.Connection")
																	    
					cn.Open strDSN
												    	 
					'Cancella Articolo
					Sql="Delete From Carrello Where Id=" & Cint(Request("TipoId"))
					cn.Execute Sql
	
	End if
	
	
	Response.redirect "carrellonew2.asp"
	
%>
