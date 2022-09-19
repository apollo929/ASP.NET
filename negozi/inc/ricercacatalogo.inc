<%' Ricerca Catalogo
         
                 
                   if not Tbmod_isp.Eof then 
                   
                   		
					
					%>

								<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="1" >



								<TR>
								<TH class=navy11n>Marca</TH><TH class=navy11n>Codice Articolo</TH>
								<TH class=navy11n>Prezzo</TH>
								<TH class=navy11n>Descrizione</TH>
								<TH class=navy11n>Quantità</TH>
								</TR>
																
						<%
						
						counterfrm=1
						
						Do While not Tbmod_isp.eof
						
						counterfrm=counterfrm+1
						
						Descrizione=Trim(replace(replace(replace(Tbmod_isp("Descrizione"),"'","`"),"*"," "),"&"," "))
						
						Mprezzo1=Tbmod_isp("Prezzo1")
						
						'Se vuoto
						if Trim(Ucase(Session("Prezzo")))="" then 
						  Mprezzo2=Tbmod_isp("Prezzo1")
						end if							
						if Trim(Ucase(Session("Prezzo")))="PREZZO1" then 
						  Mprezzo2=Tbmod_isp("Prezzo1")
						end if
						if Trim(Ucase(Session("Prezzo")))="PREZZO2" then 
						  Mprezzo2=Tbmod_isp("Prezzo2")
						end if
						if Trim(Ucase(Session("Prezzo")))="PREZZO3" then 
						  Mprezzo2=Tbmod_isp("Prezzo3")
						end if
						if Trim(Ucase(Session("Prezzo")))="PREZZO4" then 
						  Mprezzo2=Tbmod_isp("Prezzo4")
						end if
						if Trim(Ucase(Session("Prezzo")))="PREZZO5" then 
						  Mprezzo2=Tbmod_isp("Prezzo5")
						end if
					    
					    if Tbmod_isp("Prezzo")=0 then
						 Mprezzo1=0
						 Mprezzo2=0
						end if
					    
					    if cstr((Tbmod_isp("blocco")))<>"Falso" then
							Mprezzo1=Tbmod_isp("PREZZO1")
							Mprezzo2=Tbmod_isp("PREZZO2")
					    end if			
		
						%>				
								
								<TR><TH class=gray9>
								<%=Tbmod_isp("Marchio")%>
								</TH>
								
								
								<TH class=gray9>		
										<%=Tbmod_isp("Spicers")%>
								</TH>
								

								<TH class=gray9 align=right>	
										€.&nbsp;<%=FormatNumber(Mprezzo1,2)%><br>			
										<b class=orange9>Scontato<br>
										€.&nbsp;<%=FormatNumber(Mprezzo2,2)%></b>
								</TH>
											
								
											
										<TH align=left class=gray9>
										<%=Descrizione%></TH>
										<TH class=gray9>
										<form action=carrello2.asp?cod=<%=Tbmod_isp("Spicers")%> method=POST name=form<%=counterfrm%> onSubmit='return checkItems(form<%=counterfrm%>)'>
										<input maxLength=2 name=fquantity size=2 value='1'></th><TH class=gray9>
										<input type=image border=0 src='img2/icon_shoppingcart4.gif' id=image1 name=image1></a></TH></TR>
										<tr height=1><th colspan=6><hr></th></tr>
								</form>


								
								
						


                         <%
                               Tbmod_isp.movenext
                               Loop
                         %>




								</TABLE>
                    <%end if%>

<br><br>
