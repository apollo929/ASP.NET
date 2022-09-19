<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%

if request("tipoID")<>"" then
    'perfetto
    sqlfind="select * from carrello where id='" & request("tipoID") & "' limit 1"
	set tbfind= server.CreateObject("ADODB.Recordset")
	tbfind.open sqlfind,connm
	if tbfind.eof then 
	  cod_trovato=""
	else
      cod_trovato=tbfind("codice_isp")
    end if	
	sqldel="delete from carrello where (codice_isp='" & cod_trovato & "' or codice_isp='" & trim(request("cod")) & "') and Sessionid='" &  Session.SessionID & "'"
	connm.execute(sqldel)
	tbfind.close
	response.Redirect("carrellovisua.asp")
end if

if request.querystring("ritiro")<>""  then 
    session("txt_ritiro")=request.querystring("ritiro")
	session("txt_checked")=""
end if	
if session("txt_ritiro")="ritirosede" then session("txt_checked")="checked"

if session("txt_ritiro")="no" then 
    session("txt_checked")=""
    session("txt_ritiro")=""
end if
%>
<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->  
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>CHECK OUT CARRELLO</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <%if mobile<>"ok" then %> 
    <div class="single-product-area">
	<%else%>
	<div class="single-product-area2">
	<%end if%>
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
						
						<!--#include file="menusx.inc" -->	
					
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
						<a style="position:relative;top:-80px;" name="topage"></a>
						
						        <h2><%=request("info")%></h2>
								<table cellspacing="0"  cellpadding=0 border=0 align=right>
									<tr>
									<th ></th>
									<th ></th>
									<th >
									<div class="coupon">
									<form action=carrellostampa.asp method=post id=formceck name=formceck>
									<input type="submit" value="Stampa Carrello" name="proceed" class="checkout-button button alt wc-forward">
									</form>
									</div>
									</th>
									<th>&nbsp;</th>
									<th >
									<div class="coupon">
									<form action=carrellosvuota.asp method=post id=formceck name=formceck>
									<input type="submit" value="Svuota Carrello " name="proceed" class="checkout-button button alt wc-forward">
									</form>
									</div>
									</th>	
									</tr>
									<tr><th height=5px></th></tr>
								</table>
	                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                        <tr>
											<th class="product-remove">&nbsp;</th>
											<th class="product-thumbnail">&nbsp;</th>
											<th class="product"  >prodotto</th>
											<th class="product-thumbnail">u.&#8364.;</th>
											<th class="product-thumbnail">qta</th>
											<th class="product-thumbnail">iva</th>
											<th class="product-thumbnail">tot.&#8364.;</th>
											<th class="product-thumbnail"></th>
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
									
										
										
										Set tbcarstd = Server.CreateObject("ADODB.Recordset")
										Sql="select id,sessionid,codice_isp,descrizione,sum(quantita) as quantita,sum(prezzo) as prezzo,data,prezzou,blocco,fornitore,urlfoto,iva,aliqiva from Carrello where Sessionid='" &  Session.SessionID & "' GROUP BY codice_isp Order by ID Desc"
										tbcarstd.Open Sql,connm
										'response.write(sql)
										'Totali
										Tot1=0
										Tot=0
										Totesc=0
										cont_art=0
										
										Do While Not tbcarstd.EOF
										cont_art=cont_art+cdbl(tbcarstd("quantita"))
										'Dic. iva
										dicituraiva=""
										if Trim(tbcarstd("iva"))="si" then
											Tot=Tot+(tbcarstd("prezzo")*(tbcarstd("aliqiva")/100)+tbcarstd("prezzo")) 										
										else 
											dicituraiva="<br>esente&nbsp;iva"
											Totesc=Totesc+tbcarstd("prezzo")
										end if 
										'response.write(tot & "<br>")
										'response.write(totesc)
										'response.end
										%>
										<form action="carrelloupdate.asp?codid=<%=tbcarstd("codice_isp")%>&id=<%=tbcarstd("id")%>" method=post id="formupd<%=tbcarstd("id")%>" name="formupd<%=tbcarstd("id")%>">
                                        <tr class="cart_item">
                                            <td class="product-remove">
                                                <a title="Remove this item" class="remove" href="carrellovisua.asp?tipoID=<%=tbcarstd("ID")%>&cod=<%=tbcarstd("codice_isp")%>">X</a> 
                                            </td>
										
                                            <td class="product-thumbnail">
                                                 <a href="ricercagenerica.asp?terms=<%=tbcarstd("codice_isp")%>" >											
												<% 
												if lcase(tbcarstd("fornitore"))="od" then%>
												<img src='foto.asp?cat=catalogoisp\piccole&img=<%=tbcarstd("codice_isp")%>.jpg'  class="shop_thumbnail" border="0">												
												<%end if
												if lcase(tbcarstd("fornitore"))="buffetti" or lcase(tbcarstd("fornitore"))="magazine" then%>
												<img src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbcarstd("codice_isp")%>.jpg' class="shop_thumbnail" border="0">											
												<%end if 
												if lcase(tbcarstd("fornitore"))="ecommerce"   then%>
												<img src='admin/articoli/<%=replace(tbcarstd("urlfoto")," ","%20")%>'>											
												<%end if%>													
												</a>
                                            </td>

                                            <td class="tx10">
                                                <b><%=tbcarstd("codice_isp")%></b><br><%=Tagliatesto(tbcarstd("descrizione"),40)%>
                                            </td>

                                            <td class="product-price">
                                                <span class="amount">&#8364;.<%=Formatnumber(tbcarstd("prezzou"),2)%><%=dicituraiva%></span> 
                                            </td>
                                             
                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    <input type="button" onClick="dimqta('qta<%=tbcarstd("id")%>')"; class="minus" value="-" >
                                                    <input type="number" size="6" style="width:57px" class="input-text qty text" id="qta<%=tbcarstd("id")%>" name="qta<%=tbcarstd("id")%>" value="<%=tbcarstd("quantita")%>" min="1" step="1">
                                                    <input type="button" onClick="aggqta('qta<%=tbcarstd("id")%>')";  class="plus" value="+" >
                                                </div>
                                            </td>


											
											 <td class="product-subtotal">
                                                <span class="amount"><%=dicituraiva%><%if trim(dicituraiva)="" then response.write(Formatnumber(tbcarstd("aliqiva"),2) & "%")%></span>										
                                            </td>
											
											                                            <td class="product-price">
                                                <span class="amount">&#8364;.<%=Formatnumber(tbcarstd("prezzo"),2)%><%=dicituraiva%></span> 
                                            </td>
                                             
											
											<td class="product-subtotal">
														<input type="submit" style="width:80px;font-size:8px;" value="aggiorna" name="aggiorna" class="button">												
                                            </td>
                                        </tr>
										</form>
									<%
									
									if tbcarstd.eof then
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
												<input type="button" class="minus" value="-">
												<input type="number" size="4" class="input-text qty text" title="Qty" value="1" min="0" step="1">
												<input type="button" class="plus" value="+">
											</div>
										</td>

										<td class="product-subtotal">
											<span class="amount">&#8364;.0,00</span> 
										</td>
									</tr>
									<%
									'response.end
									end if
										tbcarstd.MoveNext
									Loop									
									tbcarstd.close
									session("sommaitem")=cont_art
									%>

                                    </tbody>
                                </table>
								           
								            <div class="coupon">
											 <%if session("coupon")="" then  %>  
                                                <div class="coupon">
                                                    <label for="coupon_code">Coupon:</label>
													<form action=coupon.asp method=post id=formcoupon name=formcoupon>
                                                    <input type="text" placeholder="Coupon code" value="" id="coupon_code" class="input-text" name="coupon_code">
                                                    <input type="submit" value="Applica il Coupon" name="apply_coupon" class="button">
													</form>
                                                </div>
												<%end if%>
												<hr>
											
												<form action=cartadicreditoinvio.asp method=post id=formceck name=formceck>
												<input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
													<input type="image" name="submit" src="images/paga-con-paypal.png" border="0" alt="Submit" >
												</form><br>

                                            </div>
											<div class="coupon">
												<form action=bonificoinvio.asp method=post id=formceck name=formceck>
												<input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
												<input type="submit" style="width:360px;background:#ff0000;" value="Checkout - Bonifico ### INVIA ORDINE ###" name="proceed" class="checkout-button button alt wc-forward">
												</form><br>
											</div>
																						<!---div class="coupon">
												<form action=paganegozioinvio.asp method=post id=formceck name=formceck>
												<input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
												<input type="submit" style="background: #F86605;" value="Checkout - RITIRA & PAGA IN NEGOZIO (0 spese di spedizione) ### INVIA ORDINE ###" name="proceed" class="checkout-button button alt wc-forward">
												</form><br>
											</div--->
											<%if Session("tipoutente")="registrazione" then %>
											
											<!---div class="coupon">
												<form action=ribainvio.asp method=post id=formceck name=formceck>
												<input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
												<input type="submit" style="background: #F86605;" value="Checkout - RIBA/BONIFICO (prezzo concordato) ### INVIA ORDINE ###" name="proceed" class="checkout-button button alt wc-forward">
												</form><br>
											</div---->
											<%end if%>	


											<script>
											function formSubmit2(val) 		{
											swal({
											  title: "tipo di consegna ?",
											  text: "inserire se si vuole ritirare in NEGOZIO ,spedire nella propria sede o in altra sede",
											  icon: "warning",
											  buttons: true,
											buttons: {
											defeat: "spedizione in altra sede",
											spedsede: "spedizione nella mia sede",
											sped3: "RITIRO in negozio ",
											cancel: "esci...",
											},
											})
											.then((value) => {
											switch (value) {

											case "sped3":
											// document.myform.submit();
											var im = document.getElementById("consegna");
											//if (im.checked == true){
											document.getElementById("consegna").checked = true;
											location.href = 'carrellovisua.asp?ritiro='+val;										
											//} else {
											//document.getElementById("consegna").checked = false;
											//}
											//alert('marco3');
											//var im=document.getElementById('consegna').checked;
											//var checked = $(document.getElementById('consegna')).is(':checked');									
											//alert(im);
											//alert(checked);
											//location.href = 'adappuntamentiKO.asp?appuntamento=yes&id='+id;
											return true;

											case "defeat":
											//swal("inserire il NUOVO indirizzo di consegna",content: "input");
											swal("inserire  indirizzo di spedizione:", {
											  content: "input",
											})
											.then((value) => {
											  location.href = 'carrellovisua.asp?ritiro='+`${value}`;
											});
											return false;
											
											case "spedsede":
											document.getElementById("consegna").checked = false;
											location.href = 'carrellovisua.asp?ritiro=no';											
											return true;
											
											default:									
											//document.getElementById("consegna").checked = false;								
											return false;	
											
											}
											});
											}	
											</script>		

							
											<hr>											
											<input class='quantity buttons_added' type="checkbox" <%=session("txt_checked")%>  onclick="formSubmit2('ritirosede');" id="consegna" name="consegna" value="negozio">
											<a id="consegna" name="consegna"  class="tx12 azzurro lnk" href="javascript:formSubmit2('ritirosede');">&nbsp;CONSEGNA IN NEGOZIO</a><br>
											<%=ucase(session("txt_ritiro"))%>
											<hr>											
											
											
										    <!---div class="coupon">
												<form action=preventivosalva.asp method=post id=formceck name=formceck>
												<input type="submit" value="Salva Preventivo / Carrello " name="proceed" class="checkout-button button alt wc-forward">
												</form><br>
											</div>
										   <div class="coupon">
												<form action=preventivocarica.asp method=post id=formceck name=formceck>
												<input type="submit" value="Lista Preventivi / Carrello SALVATI " name="proceed" class="checkout-button button alt wc-forward">
												</form><br>
											</div--->
                                    
                         

                            <div class="cart-collaterals">
									<%if Trim(request("articolo"))="Aggiungi" then%>
											<!--#include file="carrellovisuaagg.inc" -->
										<%else %>
											<!---a class="tx12 azzurro lnk" href="carrellovisua.asp?articolo=Aggiungi"><div class='quantity buttons_added'><input type='button' class='plus' value='+' ></div>&nbsp;AGGIUNGI ARTICOLO MANUALMENTE</a---><br><br>
										<%end if %>
							
							
							<div class="cart_totals ">
                                <h2>Totale</h2>

												<table cellspacing="0" cellpadding="0" width="100%" border="1" class="tx14 nero">
													<tr>
														<td><b>Subtotale ordine</b><br></td>
														<td align="right"><b>&#8364;.&nbsp;<%=FormatNUMBER(Tot+Totesc,2)%></b></td>
													</tr>
													<%
														'totale senza spese di spedizione
														if session("coupon")="" then 
															Session("tot")=Tot+Totesc
															txt_coupon="tot."
														else
															Session("tot")=(Tot+Totesc)-(((Tot+Totesc)/100)*session("coupon"))
															Tot=(Tot)-(((Tot)/100)*session("coupon"))
															Totesc=(Totesc)-(((Totesc)/100)*session("coupon"))
															txt_coupon="COUPON ATTIVO SCONTO del " & session("coupon") & "% "
														end if
														%>
													<tr><td colspan="2" height="10px"></td></tr>
													<tr>
														<td><b><b><%response.write(txt_coupon)%></b></b><br></td>
														<td align="right"><b>&#8364;.&nbsp;<%=FormatNUMBER(Tot+Totesc,2)%></b></td>
													</tr>
													<tr>
														<td><b>Spese di Spedizione</b></td>
														<td align="right" class="tx2 grigioscuro">
															<b>
															<!--#include file="spese.asp" --> </b>
														</td>
													</tr>
													<tr><td colspan="2" height="10px"></td></tr>
													<tr>
														<td><b>Totale</b><br></td>
														<td align="right"><b>&#8364;.&nbsp;<%=Formatnumber(((Tot+Totesc)+Session("CostoSpese")),2)%></b></td>
														<%'response.write(Session("CostoSpese"))
														%>
													</tr>
													<tr><td colspan="2" height="10px"></td></tr>
													<%totcarta=Formatnumber(((Tot+Totesc)+Session("CostoSpese")),2)%>
													<tr>
														<td class="rosso"><b>Totale + Iva</b><br></td>
														<td class="rosso" align="right"><b>&#8364;.&nbsp;<%=totcarta%></b></td>
													</tr>
                                                      <% session("totcarta")=totcarta%> 
												</table>
												<br><br>
												<!--#include file="spesegrafica.asp" --> 
												<br><br>
												<!--#include file="datibonifico.asp" --> 
                            </div>



                            </div>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>


<!--#include file="foot.inc"-->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->