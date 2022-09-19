<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
	<div id="basic" class="well" style="max-width:48em;">
								<a href="carrellovisua.asp"><button class="basic_close btn btn-default">vai al carrello</button></a>
								<a href="#" onclick="document.getElementById('divcarrello').style.visibility ='hidden';"><button class="basic_close btn btn-default">chiudi</button></a>
	                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                        <tr>
											<th class="product-remove">&nbsp;</th>
											<th class="product-thumbnail">&nbsp;</th>
											<th class="product-name">prodotto</th>
											<th class="product-thumbnail">u.&#8364.;</th>
											<th class="product-thumbnail">qta</th>
											<th class="product-thumbnail">iva</th>
											<th class="product-thumbnail">tot.&#8364.;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<%
										
										session.lcid=1040
										'DOPPI BUFFETTI
										Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
										'DOPPI BUFFETTI
										Set tbcardoppi = Server.CreateObject("ADODB.Recordset")  
										Sqldoppi="SELECT carrello.codice_isp,carrello.descrizione,carrello.blocco,carrello.fornitore,carrello.iva,sum(quantita) as num,prodotti.p1,prodotti.p2,prodotti.p3,prodotti.p4,prodotti.p5,prodotti.qta1,prodotti.qta2,prodotti.qta3,prodotti.qta4,prodotti.qta5,prodotti.aliq_iva  FROM carrello inner join prodotti ON carrello.codice_isp = prodotti.codice_buf where (Sessionid='" &  Session.SessionID & "' and (carrello.fornitore='Buffetti' or carrello.fornitore='Magazine' )) GROUP BY carrello.codice_isp  HAVING num >= 1  ORDER BY num desc;"
										tbcardoppi.Open Sqldoppi,connm
										'response.write(sqldoppi)
										'response.end
										txt_fornitore="Buffetti"
										t_data=date()
										Do While Not tbcardoppi.EOF 
											if  cdbl(tbcardoppi("num"))=>cdbl(tbcardoppi("qta1")) then
												Mprezzo2=FormatNumber(tbcardoppi("p1"),2)
												text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
											end if										
											if  cdbl(tbcardoppi("num"))=>cdbl(tbcardoppi("qta2")) and cdbl(tbcardoppi("qta2"))<>1 then
												Mprezzo2=FormatNumber(tbcardoppi("p2"),2)
												text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)	
											end if
											if  cdbl(tbcardoppi("num"))=>cdbl(tbcardoppi("qta3")) and cdbl(tbcardoppi("qta3"))<>1 then
												Mprezzo2=FormatNumber(tbcardoppi("p3"),2)
												text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
											end if
											if  cdbl(tbcardoppi("num"))=>cdbl(tbcardoppi("qta4")) and cdbl(tbcardoppi("qta4"))<>1 then
												Mprezzo2=FormatNumber(tbcardoppi("p4"),2)
												text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
												'response.write(tbcardoppi("qta4"))											
											end if
											if  cdbl(tbcardoppi("num"))=>cdbl(tbcardoppi("qta5")) and cdbl(tbcardoppi("qta5"))<>1 then
												Mprezzo2=FormatNumber(tbcardoppi("p5"),2)
												text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
												'response.write(tbcardoppi("qta5"))
											end if
											
											'::::::::::::::::::::::::: PREZZO MAGAZINE :::::::::::::::::::::::::
											'::::::::::::::::::::::::: PREZZO MAGAZINE :::::::::::::::::::::::::
												boolmagazine="false"
												magqta=1
												magazinesconto="<br>"
												Set tbmagazine = Server.CreateObject("ADODB.RecordSet")
												sSQLmag = "select * From magazinebuffetti  where codice='" & Trim(tbcardoppi("codice_isp")) & "' limit 1"
												tbmagazine.Open sSQLmag, conn			       
												if not tbmagazine.eof  then 
												 Mprezzo1=tbmagazine("Prezzo")
												 Mprezzo2=tbmagazine("Prezzoofferta")
												 text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
												 boolmagazine="true"
												else
												 magazinesconto=""
												end if 
											'::::::::::::::::::::::::: PREZZO MAGAZINE :::::::::::::::::::::::::
											'::::::::::::::::::::::::: PREZZO MAGAZINE :::::::::::::::::::::::::	

											
											'::::::::::::::::::::::::: PREZZO PROFILO (inizio) :::::::::::::::::::::::::
											'::::::::::::::::::::::::: PREZZO PROFILO (inizio) :::::::::::::::::::::::::
											if Trim(Session("Chisono"))<>"" then
												querypro="Select * From PROFILO where (codice_isp='" & Trim(tbcardoppi("codice_isp")) & "') AND password1='" & Trim(Session("Chisono")) & "'"
												'response.write(querypro)
												'response.end
												Set Tbpro = Server.CreateObject("ADODB.RecordSet")
												Tbpro.Open querypro, connm
												if not Tbpro.eof then													
													Mprezzo2=formatnumber(Tbpro("prezzo"),2)
													text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
												end if
												Tbpro.close
											end if	
											'::::::::::::::::::::::::: PREZZO PROFILO (fine) :::::::::::::::::::::::::
											'::::::::::::::::::::::::: PREZZO PROFILO (fine) :::::::::::::::::::::::::
											'elimina record doppi
											Sqldeldoppi="delete from carrello where codice_isp='" &  tbcardoppi("codice_isp") & "' and Sessionid='" &  Session.SessionID & "'" 
											connm.Execute(Sqldeldoppi)
											sqlinsertdoppi="insert into carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore,Iva,aliqiva) values ('" & Session.SessionID & "','" & tbcardoppi("codice_isp") & "','" & tbcardoppi("descrizione") & "','" & tbcardoppi("num") & "','" & Replace(Replace(text_prezzoo,".",""),",",".") & "','" & t_data & "','" & Replace(Replace(Mprezzo2,".",""),",",".") & "','" & tbcardoppi("Blocco") & "','" & txt_fornitore & "','" & tbcardoppi("iva") & "'," & Replace(Replace(tbcardoppi("aliq_iva"),".",""),",",".") & ")" 
											connm.Execute(sqlinsertdoppi)
											tbcardoppi.MoveNext
										loop
										tbcardoppi.close
										'DOPPI BUFFETTI
										'DOPPI BUFFETTI

										'DOPPI OD	
										'DOPPI OD											
										Sqldoppi="SELECT carrello.codice_isp,carrello.descrizione,carrello.blocco,carrello.fornitore,carrello.iva,sum(quantita) as num,prodotti.aliq_iva  FROM carrello inner join prodotti ON carrello.codice_isp = prodotti.codice_od where (Sessionid='" &  Session.SessionID & "' and carrello.fornitore='od') GROUP BY carrello.codice_isp  HAVING num >= 1  ORDER BY num desc;"
										tbcardoppi.Open Sqldoppi,connm
										'response.write(sqldoppi)
										'response.end
										txt_fornitore="od"
										t_data=date()
										Do While Not tbcardoppi.EOF 
											'::::::::::::::::::::::::: PREZZO OD :::::::::::::::::::::::::
											'::::::::::::::::::::::::: PREZZO OD :::::::::::::::::::::::::
											sSQLdelprod = "select * From prodotti where codice_od='" & Trim(tbcardoppi("codice_isp"))  & "' or codice_prodotto='" & Trim(tbcardoppi("codice_isp"))  & "' limit 1 "
											tbprodcatalogo.Open sSQLdelprod, connm
											%>					             
											<!--#include file="ricercacatalogoparametriod.inc" -->   
											<%
											text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
											tbprodcatalogo.close	
											'elimina record doppi
											Sqldeldoppi="delete from carrello where codice_isp='" &  tbcardoppi("codice_isp") & "' and Sessionid='" &  Session.SessionID & "'" 
											connm.Execute(Sqldeldoppi)
											sqlinsertdoppi="insert into carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore,Iva,aliqiva) values ('" & Session.SessionID & "','" & tbcardoppi("codice_isp") & "','" & tbcardoppi("descrizione") & "','" & tbcardoppi("num") & "','" & Replace(Replace(text_prezzoo,".",""),",",".") & "','" & t_data & "','" & Replace(Replace(Mprezzo2,".",""),",",".") & "','" & tbcardoppi("Blocco") & "','" & txt_fornitore & "','" & tbcardoppi("iva") & "'," & Replace(Replace(tbcardoppi("aliq_iva"),".",""),",",".") & ")" 
											connm.Execute(sqlinsertdoppi)
											'response.write(sqlinsertdoppi)
											'response.end
											'::::::::::::::::::::::::: PREZZO OD :::::::::::::::::::::::::
											'::::::::::::::::::::::::: PREZZO OD :::::::::::::::::::::::::
										tbcardoppi.MoveNext
										loop
										tbcardoppi.close
										'DOPPI OD	
										'DOPPI OD	

										'DOPPI ECOMMERCE	
										'DOPPI ECOMMERCE										
										Sqldoppi="SELECT carrello.codice_isp,carrello.descrizione,carrello.prezzou,carrello.blocco,carrello.fornitore,carrello.urlfoto,carrello.iva,sum(quantita) as num,shop_products.aliqiva  FROM carrello inner join shop_products  ON carrello.codice_isp = shop_products.ccode  where (Sessionid='" &  Session.SessionID & "' and carrello.fornitore='ecommerce') GROUP BY carrello.codice_isp  HAVING num >= 1  ORDER BY num desc;"
										tbcardoppi.Open Sqldoppi,connm
										'response.write(sqldoppi)
										'response.end
										txt_fornitore="ecommerce"
										t_data=date()
										Do While Not tbcardoppi.EOF 										
										    text_quantita=cdbl(tbcardoppi("num"))
											if text_quantita>1 then																			
												'::::::::::::::::::::::::: PREZZO ecommerce :::::::::::::::::::::::::
												'::::::::::::::::::::::::: PREZZO ecommerce :::::::::::::::::::::::::
												'profilo cliente
												set tb4 = server.createobject("adodb.recordset")
												ssql4 = "select prezzo from profilo where codice_isp='" & tbcardoppi("codice_isp") & "' and password1='" & trim(session("chisono")) & "'"
												tb4.open ssql4,connm									
												if not tb4.eof then
												mprezzo2=formatnumber(tb4("prezzo"),2) 
												else
												mprezzo2=formatnumber(tbcardoppi("prezzou"),2)
												end if
												tb4.close
												'controlli vari
												text_prezzo=cdbl(mprezzo2)													
												'cerco prodotto su archivio
												set tbprodottoman = server.createobject("adodb.recordset")
												ssqlprodman = "select * from shop_products where ccode='" & tbcardoppi("codice_isp") & "'"
												tbprodottoman.open ssqlprodman,connm
												'response.write(ssqlprodman)												
												'iva
												if tbprodottoman("iva")="si" then 
												   scrittaiva=tbprodottoman("aliqiva") & "% aliq iva" 
												   text_aliqiva=cdbl(tbprodottoman("aliqiva"))
												 else
												   scrittaiva="esente iva"
												   text_aliqiva=0
												end if											
												if text_quantita>=tbprodottoman("qta1") and tbprodottoman("qta1")>0 then text_prezzo=tbprodottoman("cprice1")
												if text_quantita>=tbprodottoman("qta2") and tbprodottoman("qta2")>0 then text_prezzo=tbprodottoman("cprice2")
												if text_quantita>=tbprodottoman("qta3") and tbprodottoman("qta3")>0 then text_prezzo=tbprodottoman("cprice3")
												'response.write("-----------------" & text_prezzo)	
												tbprodottoman.close												
												text_prezzoo=FormatNumber((text_prezzo*text_quantita),2)
												'elimina record doppi
												Sqldeldoppi="delete from carrello where codice_isp='" &  tbcardoppi("codice_isp") & "' and Sessionid='" &  Session.SessionID & "'" 
												connm.Execute(Sqldeldoppi)
												t_data=date()
												sqlinsertdoppi="insert into carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Data,Prezzou,Blocco,Fornitore,Urlfoto,Iva,aliqiva) values ('" & Session.SessionID & "','" & tbcardoppi("codice_isp") & "','" & tbcardoppi("descrizione") & "','" & tbcardoppi("num") & "','" & Replace(Replace(text_prezzoo,".",""),",",".") & "','" & t_data & "','" & Replace(Replace(text_prezzo,".",""),",",".") & "','" & tbcardoppi("blocco") & "','" & txt_fornitore & "','" & tbcardoppi("urlfoto") & "','" & tbcardoppi("iva") & "'," & Replace(Replace(tbcardoppi("aliqiva"),".",""),",",".") & ")" 
												connm.Execute(sqlinsertdoppi)
												'response.write(Sqldeldoppi)
												'response.write(sqlinsertdoppi)
												'response.end
												'::::::::::::::::::::::::: PREZZO ecommerce :::::::::::::::::::::::::
												'::::::::::::::::::::::::: PREZZO ecommerce :::::::::::::::::::::::::
											end if
										tbcardoppi.MoveNext
										loop
										tbcardoppi.close
										'DOPPI ECOMMERCE
										'DOPPI ECOMMERCE
										
										
										Set tbcar = Server.CreateObject("ADODB.Recordset")
										Sql="select id,sessionid,codice_isp,descrizione,sum(quantita) as quantita,sum(prezzo) as prezzo,data,prezzou,blocco,fornitore,urlfoto,iva,aliqiva from Carrello where Sessionid='" &  Session.SessionID & "' GROUP BY codice_isp Order by ID Desc"
										tbcar.Open Sql,connm
										'response.write(sql)
										'Totali
										Tot1=0
										Tot=0
										Totesc=0
										cont_art=0
										
										Do While Not Tbcar.EOF
										cont_art=cont_art+cdbl(Tbcar("quantita"))
										'Dic. iva
										dicituraiva=""
										if Trim(Tbcar("iva"))="si" then
											Tot=Tot+(Tbcar("prezzo")*(Tbcar("aliqiva")/100)+Tbcar("prezzo")) 										
										else 
											dicituraiva="<br>esente&nbsp;iva"
											Totesc=Totesc+Tbcar("prezzo")
										end if 
										'response.write(tot & "<br>")
										'response.write(totesc)
										'response.end
										%>
										<form action=carrelloupdate.asp?id=<%=Tbcar("codice_isp")%> method=post id=formupd<%=Tbcar("id")%> name=formupd<%=Tbcar("id")%>>
                                        <tr class="cart_item">
                                            <td class="product-remove">
                                                <a title="Remove this item" class="remove" href="carrellovisua.asp?tipoID=<%=Tbcar("id")%>">X</a> 
                                            </td>
										
                                            <td class="product-thumbnail">
                                                 <a href="ricercagenerica.asp?terms=<%=tbcar("codice_isp")%>" >											
												<% 
												if lcase(tbcar("fornitore"))="od" then%>
												<img src='foto.asp?cat=catalogoisp\piccole&img=<%=tbcar("codice_isp")%>.jpg'  class="shop_thumbnail" border="0">												
												<%end if
												if lcase(tbcar("fornitore"))="buffetti" or lcase(tbcar("fornitore"))="magazine" then%>
												<img src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbcar("codice_isp")%>.jpg' class="shop_thumbnail" border="0">											
												<%end if
												if lcase(tbcar("fornitore"))="ecommerce"   then%>
												<img src='admin/articoli/<%=replace(tbcar("urlfoto")," ","%20")%>'>											
												<%end if%>													
												</a>
                                            </td>

                                            <td class="tx10">
                                                cod.<%=Tbcar("codice_isp")%> - <%=mid(Tbcar("descrizione"),1,40)%>
                                            </td>

                                            <td class="product-price">
                                                <span class="amount">&#8364;.<%=Formatnumber(Tbcar("prezzou"),2)%><%=dicituraiva%></span> 
                                            </td>
                                             
                                            <td class="product-quantity">
                                                   <%=Tbcar("quantita")%>
                                            </td>
											
											 <td class="product-subtotal">
                                                <span class="amount"><%=dicituraiva%><%if trim(dicituraiva)="" then response.write(Formatnumber(tbcar("aliqiva"),2) & "%")%></span>										
                                            </td>

                                            <td class="product-subtotal">
                                                <span class="amount">&#8364;.<%=Formatnumber(Tbcar("prezzo"),2)%></span>										
                                            </td>									
                                        </tr>
									
									<%
									
									if Tbcar.eof then
									%>
									<tr class="cart_item">
										<td class="product-remove">
											<a title="Remove this item" class="remove" href="#">×</a> 
										</td>

										<td class="product-thumbnail">
										   </td>

										<td class="product-name">
										
										
										</td>

										<td class="product-price">
											<span class="amount">&#8364;.0,00</span> 
										</td>

										<td class="product-quantity">
											<div class="quantity buttons_added">										
												<input type="number" size="4" class="input-text qty text" title="Qty" value="1" >
												</div>
										</td>

										<td class="product-subtotal">
											<span class="amount">&#8364;.0,00</span> 
										</td>
									</tr>
									<%
									'response.end
									end if
										Tbcar.MoveNext
									Loop
									session("sommaitem")=cont_art
									Tbcar.close
									'response.end
									%>

                                    </tbody>
                                </table>
								<table cellspacing="1" valign="top" cellpadding="1" width="100%" border="0" class="tx14 nero">
									<tr>
										<td><b>Totale ordine</b><br></td>
										<td align="right"><b>&#8364;.&nbsp;<%=Formatnumber(Tot+Totesc,2)%></b></td>
									</tr>
									<tr>
										<td><b>Spese di Spedizione</b></td>
										<td align="right">
											<b><%'spese di spedizione
											'Session("tot")=tot
											%>
											<!--#include file="spese.asp" --> </b>
										</td>
									</tr>
									<tr>
										<td><b>Totale</b><br></td>
										<td align="right"><b>&#8364;.&nbsp;<%=Formatnumber(((Tot+Totesc)+Session("CostoSpese")),2)%></b></td>
									</tr>
									<%totcarta=Formatnumber(((Tot+Totesc)+Session("CostoSpese")),2)%>
									<tr>
										<td class="rosso"><b>Totale + Iva</b><br></td>
										<td class="rosso" align="right"><b>&#8364;.&nbsp;<%=totcarta%></b></td>
									</tr>
									  <% session("totcarta")=totcarta%> 
								</table>
								<%if Session("Chisono")="" then%>
								<a href="registrati.asp"><button class="basic_close btn btn-default">non sei registrato >>> registrati ora!</button></a>
								<a href="accedi.asp"><button class="basic_close btn btn-default">se sei registrato >>> accedi</button></a><br>
								<a href="registrazionepersa.asp"><button class="basic_close btn btn-default">password dimenticata</button></a>
								<%end if%>
								<a href="carrellovisua.asp"><button class="basic_close btn btn-default">vai al carrello</button></a>
								<a href="#" onclick="document.getElementById('divcarrello').style.visibility ='hidden';"><button class="basic_close btn btn-default">chiudi</button></a>
</div>

<!--#include file="sqlchiudi.inc" -->