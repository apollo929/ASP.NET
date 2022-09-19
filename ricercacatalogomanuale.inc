<%
' ricerca catalogo
if not tbprodcatalogo.eof then
									'se prezzo particolare per utente			
									if trim(session("chisono"))<>"" then
										set tb3 = server.createobject("adodb.recordset")
										ssql3 = "select prezzo from profilo where codice_isp='" & trim(cstr((tbprodcatalogo("ccode")))) & "' and password1='" & trim(session("chisono")) & "'"
										'response.write(ssql3)
										tb3.open ssql3,connm									
										if not tb3.eof then
											mprezzo2=formatnumber(tb3("prezzo"),2) 
										else
											mprezzo2=formatnumber(tbprodcatalogo("cprice"),2)
										end if
										tb3.close
									else
										mprezzo2=formatnumber(tbprodcatalogo("cprice"),2)
									end if
									mprezzo1=formatnumber(tbprodcatalogo("cprice"),2)
									
									'zoom
									counterfrm=counterfrm+1
									%>		

									
									<div style="height:680px;" class="col-md-3">
									<div class="single-shop-product">
											
											<div class="product-upper"><br><br>
												<a href="shopmandett.asp?id=<%=tbprodcatalogo("catalogid")%>&subcatid=<%=catid%>"><%newimmagine=replace(tbprodcatalogo("cimageurl")," ","%20")%><img src='admin/articoli/<%=newimmagine%>' style="max-width:220px;max-height:160px;"></a>	<br><br>
											</div>
											<a href="shopmandett.asp?id=<%=tbprodcatalogo("catalogid")%>&subcatid=<%=catid%>"><b><%=tbprodcatalogo("ccode")%></b><br><p><font color="#0000000"><%=mid(ucase(tbprodcatalogo("cname")),1,22)%></font></p></a> 
											
											<div class="product-carousel-price">

										<%if trim(tbprodcatalogo("cstock"))="on" then%>
										<img src="images/pmag1.png"><br>
										<%else%>
										<img src="images/pmag2.png"><br>
										<%end if%>	
										<%if trim(tbprodcatalogo("coffmag"))="on" then%>
									    <img src="images/promo.png"><br>
										<%end if%>	
											<%
											if tbprodcatalogo("iva")="si" then 
											   scrittaiva=tbprodcatalogo("aliqiva") & "% aliq iva" 
											 else
											   scrittaiva="esente iva"
											end if
											'sconto%
											if tbprodcatalogo("cpriceofferta")=0 then 
											  v1=formatnumber(mprezzo2,2)
											else
											  v1=formatnumber(tbprodcatalogo("cpriceofferta"),2)	
										    end if
											v2=formatnumber(mprezzo2,2)
											percsconto=formatnumber(((v1-v2)*100)/v1,2)
											if v1=v2 then 
											%>
											<ins>&#8364;.<%=v1%></ins>&nbsp;&nbsp;<%=scrittaiva%><br>
											<%else%>
											<del>&#8364;.<%=v2%>&nbsp;&nbsp;<%=scrittaiva%></del><br>
											<ins>&#8364;.<%=v1%></ins>&nbsp;&nbsp;<%=scrittaiva%><br>
											<%end if%>								
											<%
											'### quantita' price
											if tbprodcatalogo("cprice1")>0  and tbprodcatalogo("qta1")>0 then
											  response.write("per n&#176;" & tbprodcatalogo("qta1") & " pezzi &#8364;." & formatnumber(tbprodcatalogo("cprice1"),2) & "<br>")
											end if
											if tbprodcatalogo("cprice2")>0  and tbprodcatalogo("qta2")>0 then
											  response.write("per n&#176;" & tbprodcatalogo("qta2") & " pezzi &#8364;." & formatnumber(tbprodcatalogo("cprice2"),2) & "<br>")
											end if											
											if tbprodcatalogo("cprice3")>0  and tbprodcatalogo("qta3")>0 then
											  response.write("per n&#176;" & tbprodcatalogo("qta3") & " pezzi &#8364;." & formatnumber(tbprodcatalogo("cprice3"),2))
											end if											
											
											'### quantita' price
											%>	</div> 										
											<div class="product-option-shop">
											    <%response.write "<form name=formmanuale" & counterfrm & " >" 
																							'colore
											 t_como_colore=""
											 t_como_colore=replace(tbprodcatalogo("colore"),"-"," ")
											if trim(t_como_colore)<>"" then
												response.write("<hr>colore :	")
												response.write("<select  id='colore" & counterfrm & "' name='colore" & counterfrm & "'>")
												aring=""
												aring=split(t_como_colore," ")						
												for f=0 to ubound(aring)
													if trim(aring(f))<>""  then
														response.write("<option value='" & trim(aring(f)) & "'>" & trim(aring(f)) & "</option>")
													end if
												next
												response.write("</select>")
											else	
											 'response.write("<hr>")
											 response.write("<input type=hidden id='colore" & counterfrm & "' name='colore" & counterfrm & "'>")
											end if			
											'taglie
											 t_como_taglie=""
											 t_como_taglie=replace(tbprodcatalogo("taglia"),"-"," ")
											if trim(t_como_taglie)<>"" then
												response.write("<hr>taglia :	")
												response.write("<select id='taglia" & counterfrm & "' name='taglia" & counterfrm & "' >")
												aring=""
												aring=split(t_como_taglie," ")						
												for f=0 to ubound(aring)
													if trim(aring(f))<>""  then
														response.write("<option value='" & trim(aring(f)) & "'>" & trim(aring(f)) & "</option>")
													end if
												next
												response.write("</select>")
											else
											 'response.write("<hr>") 								
											 response.write("<input type=hidden  id='taglia" & counterfrm & "' name='taglia" & counterfrm & "'>")
											end if
											response.write("<hr>") 
												
												%> 
												
												<div class="quantity buttons_added">
												<input type="button" onclick="dimqta('qta<%=counterfrm%>')"  class="minus" value="-" >
												<input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" class="input-text qty text" title="qty" value="1" min="1" step="1">
												<input type="button" onclick="aggqta('qta<%=counterfrm%>')"  class="plus" value="+" >
												</div>
												<input type="button" onmouseover="" border="0" class="shop" onclick="carrellomanuale('<%=tbprodcatalogo("ccode")%>',document.formmanuale<%=counterfrm%>.qta<%=counterfrm%>.value ,'<%=v1%>','<%=tbprodcatalogo("cname")%>','<%=tbprodcatalogo("iva")%>',document.formmanuale<%=counterfrm%>.colore<%=counterfrm%>.value,document.formmanuale<%=counterfrm%>.taglia<%=counterfrm%>.value,'<%=tbprodcatalogo("cimageurl")%>')" >
												<%response.write("</form>")%>
												<hr>
												<a href="javascript:opensn('listinovisua.asp?for=shopmanuale&op=ins&cod_lis=<%=tbprodcatalogo("ccode")%>','dettagli');" class="tx10 nero"><img src="images/preferiti.jpg">agg. preferiti</a>
												<br><br><br><br>
											</div>  
											
									</div>		
									</div>	
<%
end if%>
