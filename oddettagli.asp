<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
'dettagli buffetti
Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
sSql="select * from prodotti where codice_od='" & Trim(Request("Cod")) & "' limit 1"
tbprodcatalogo.Open sSql, connm
if tbprodcatalogo.eof then response.redirect "articolonontrovato.asp"
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
                        <h2>SHOP <%=ucase(request("cod"))%>&nbsp;&nbsp;<%=Session("ragionesocialetesto")%></h2>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    
    <div class="single-product-area">     
        <div class="container">
            <div class="row">
											<a style="position:relative;top:-80px;" name="odposizione"></a>	
											<div class="single-product">
											<a href="#"><h2>Altre Categorie</h2></a>											
											<%
											'Query
											querylistcat="Select sottocategoria,categoria From prodotti where categoria='" & tbprodcatalogo("categoria") & "' and fornitore like '%od%' and aboliti='0' group by sottocategoria order by sottocategoria"
											Set tblistcat = Server.CreateObject("ADODB.RecordSet")				
											tblistcat.Open querylistcat,connm
											'response.write(querylistcat)
											Do While not (tblistcat.eof)%>
												<div style="height:35px;" class="col-md-2">
												<div class="single-shop-product">
												<%
												Response.Write "<a style='font-size:12px;' class='m_scritte'  href='odlista.asp?sotto=" & replace(tblistcat("sottoCategoria")," ","%20") & "&cat=" & replace(tblistcat("categoria")," ","%20") & "#odposizione'>" & ucase(tblistcat("sottocategoria"))  & "</a>"
												%>
												</div>	
												</div>	
											<%tblistcat.movenext
											Loop
											tblistcat.close
											%>
											<br>
											<br>
										</div>

			
                <div class="col-md-4">
                    
                    <div class="single-sidebar">
                        
						<%
						if mobile<>"ok" then%>
						<a href="#"><h2>Prodotti Simili</h2></a>
						<%						
							'query x nome prodotto
							Set tbprodsimili = Server.CreateObject("ADODB.RecordSet")
							querydp="Select * From prodotti where categoria='" & tbprodcatalogo("categoria") & "' and sottocategoria='" & tbprodcatalogo("sottocategoria") & "' and codice_od<>'' order by codice_od desc LIMIT 20"
							'response.write(querydp)
							'response.end
							tbprodsimili.Open querydp,connm
							Do While not tbprodsimili.eof
							%>
								<div class="thubmnail-recent">
								<a href="oddettagli.asp?cod=<%=tbprodsimili("codice_od")%>#odposizione"><img  style="max-width:80px;" src='foto.asp?cat=catalogoisp\piccole&img=<%=tbprodsimili("codice_od")%>.jpg' border=0></a>
								<h2><a href="oddettagli.asp?cod=<%=tbprodsimili("codice_od")%>#odposizione"><b><%=tbprodsimili("codice_od")%></b><br><%=tbprodsimili("descrizione")%></a></h2>
								<!--#include file="ricercacatalogoparametriodsimili.inc" -->

								<div class="product-sidebar-price">
									<%
									'sconto%
									v1=formatnumber(Mprezzo1,2)
									v2=formatnumber(Mprezzo2,2)
									if v1-v2<>0 then percsconto=cstr(formatnumber(((v1-v2)*100)/v1,2)) & "%<br>"
									%>
									<ins>&#8364;.<%=formatnumber(Mprezzo2,2)%></ins><font color=#072466><%=magazinesconto%><%=percsconto%></font> <del>&#8364;.<%=formatnumber(Mprezzo1,2)%></del>
									<br><font color=#072466><%=valore_iva(tbprodsimili("codice_od"))%></font>
								</div>                             
								</div>
							<%
							tbprodsimili.movenext
							Loop
						end if
						%>						
                    </div>
                </div>
				
				
				<a style="position:relative;top:-80px;" name="odposizione"></a>		
				<form action="javascript: history.back()" method=post id=formback name=formback>
				<input type="submit" value="indietro" name="proceed" class="checkout-button button alt wc-forward"><br><br><br>
				</form>
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="product-breadcroumb">
                            Categoria: <a href="catbuffetti.asp?cat=<%=tbprodcatalogo("Categoria")%>"><%=tbprodcatalogo("Categoria")%></a>. Sottocategoria: <a href="catbuffettilista.asp?cat=<%=tbprodcatalogo("Categoria")%>&id=<%=tbprodcatalogo("SottoCategoria")%>"><%=tbprodcatalogo("SottoCategoria")%></a>                                
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="product-images">
                                    <div class="product-main-img">                                        
											<img onClick="ZoomIn('<%=tbprodcatalogo("codice_od")%>.jpg','od');"  src="foto.asp?cat=catalogoisp&img=<%=tbprodcatalogo("codice_od")%>.jpg" class="demo-img pos-center">
                                    </div>
                                    
                                    <div class="product-gallery">
                                        <img  src='foto.asp?cat=catalogoisp\piccole&img=<%=tbprodcatalogo("codice_od")%>.jpg' class="demo-img pos-center">                       
                                    </div>
                                </div>
								<a href="catbuffettiricerca.asp?codiceispf=<%=tbprodcatalogo("SottoCategoria")%>"><img type="images" src="img/buffettilink.jpg" border=0></a>	
								<a href="catbuffettiricerca.asp?codiceispf=<%=tbprodcatalogo("SottoCategoria")%>"><br>prodotti BUFFETTI : <%=tbprodcatalogo("SottoCategoria")%></a>	
                            </div>
                            
                            <div class="col-sm-6">
                                <div class="product-inner">
                                    <h2 class="product-name"><b>codice : <%=tbprodcatalogo("codice_od")%></b><br>cod. produttore : <%=tbprodcatalogo("partnumber")%><br><br><%=tbprodcatalogo("Descrizione")%></h2>
                                    <div class="product-carousel-price">
									<!--#include file="ricercacatalogoparametriod.inc" -->
									<%
									'sconto%
									v1=formatnumber(Mprezzo1,2)
									v2=formatnumber(Mprezzo2,2)
									if v1-v2<>0 then percsconto=cstr(formatnumber(((v1-v2)*100)/v1,2)) & "%<br>"
									%>
									<ins>&#8364;.<%=formatnumber(Mprezzo2,2)%></ins><font size=+1 color=#072466><%=magazinesconto%><%=percsconto%></font> <del>&#8364;.<%=formatnumber(Mprezzo1,2)%></del>							
									<hr>disponibilita' pezzi  <%=tbprodcatalogo("giacenza")%><hr>
									quantita' minima acquistabile pz.<%=tbprodcatalogo("AA_Qta_Conf")%>
									<br><font size=+1 color=#072466><%=valore_iva(tbprodcatalogo("codice_od"))%></font>
                                    </div>    
                                    
				<div class="product-option-shop">
				<%response.Write "<form name=formb" & counterfrm & " >" %> 
										 <div class="quantity buttons_added">
												<input type="button" onClick="dimqta('qta<%=counterfrm%>')"  class="minus" value="-" >
												<input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" class="input-text qty text" title="Qty" value="1" min="1" step="1">
												<input type="button" onClick="aggqta('qta<%=counterfrm%>')"  class="plus" value="+" >
										</div>
			
					<input type="button" onMouseOver="" border="0" class="shop" onClick="carrellood('<%=tbprodcatalogo("codice_od")%>', document.formb<%=counterfrm%>.qta<%=counterfrm%>.value)" value="">
					<%response.Write("</form>")%>  
					<a href="javascript:opensn('listinovisua.asp?For=od&Op=Ins&Cod_Lis=<%=tbprodcatalogo("codice_od")%>','Dettagli');" class="tx10 nero lnk"><img src="images/preferiti.jpg">AGG. PREFERITI</a>
                                    
                                    <div class="product-inner-category">
                                        <p>Categoria: <a href="catbuffetti.asp?cat=<%=tbprodcatalogo("Categoria")%>"><%=tbprodcatalogo("Categoria")%></a>. Sottocategoria: <a href="catbuffettilista.asp?cat=<%=tbprodcatalogo("Categoria")%>&id=<%=tbprodcatalogo("SottoCategoria")%>"><%=tbprodcatalogo("SottoCategoria")%></a>                                  </div> 
                                    	
                                    <div role="tabpanel">
                                        <ul class="product-tab" role="tablist">
                                            <li role="presentation" class="active"><a href="#" aria-controls="home" role="tab" data-toggle="tab">descrizione</a></li>
											<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">richiedi info prodotto</a></li>                                            
                                        </ul>
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="home">
											</font></font></font>
                                                <h2>Descrizione del prodotto</h2>  
                                                <p><%=tbprodcatalogo("descrizione")%></p>
												<p class="tx10 nero"><%=replace(replace(replace(replace(lcase(tbprodcatalogo("descrizione1")),"-","/"),"div","p"),"cod non found shop.buffetti",""),"class","id")%></p>
												
												
												<p>
												
												
													 
												
												</p>
                                            </div> 
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
							<div role="tabpanel" class="tab-pane fade" id="profile">
							<h2>richiedi info prodotto</h2>
							<div class="submit-review">
								<form action="regmail.asp" method="post" id="formod" name="formod">
								<p><label for="name">nominativo</label> <input name="nome" type="text"></p>
								<p><label for="email">email</label> <input name="email" type="email"></p>
								<p><label for="review">richiesta</label> <textarea name="note" id="" cols="30" rows="10">cod.<%=tbprodcatalogo("codice_od")%></textarea></p>
								Codice di conferma:
								<%'response.write(linkurl)
								if linkurl="contattaci.asp" or linkurl="registrati.asp" or linkurl="software.asp" or linkurl="software1.asp" or linkurl="oddettagli.asp"  then
								'niente
								else
								session("checktext")=""
								randomize
								session("checktext")=CInt ( ( 9 * Rnd() ) + 0) & CInt ( ( 9 * Rnd() ) + 0) & CInt ( ( 9 * Rnd() ) + 0) & CInt ( ( 9 * Rnd() ) + 0) 
								end if
								response.Write("<font class='tx18 rosso'>" & session("checktext") & "</font>")
								%><br>
								Ricopialo qui <input  type="text" size="8" id="checktext" maxlength="4" name="checktext">
								<br><br>
								<p><input type="submit" value="invia richiesta"></p>
								</form>
							</div>
							</div>
                        </div>
									<%if Session("Chisono")<>"" then
                                    loggaVisSchede "od",tbprodcatalogo("codice_od"),tbprodcatalogo("Categoria"),tbprodcatalogo("SottoCategoria"),Session("nomeutente"),Session("Chisono")
									end if
									'chiusura tabelle
									
									tbprodsimili.close%>
									
                                </div>
                            </div>
							
									<h2 class="product-wid-title">Marchi / Brand </h2>
									<div class="single-shop-product">
																<%
																'Query
																querylistcat="Select marchio,sottocategoria,categoria From prodotti where categoria='" & tbprodcatalogo("categoria") & "' and fornitore like '%od%' and aboliti='0' group by marchio order by marchio"
																Set tblistcat = Server.CreateObject("ADODB.RecordSet")				
																tblistcat.Open querylistcat,connm
																'response.write(querylistcat)
																Do While not (tblistcat.eof)%>
																
																
																	<div style="height:25px;" class="col-md-2">
																	<div class="single-shop-product">
																	<%
																	Response.Write "<a class='m_scritte'  href='odmarchio.asp?sotto=" & replace(tblistcat("sottoCategoria")," ","%20") & "&marchio=" & replace(tblistcat("marchio")," ","%20") & "#odposizione'>" & ucase(tblistcat("marchio"))  & "</a>"
																	%>
																	</div>	
															 </div>	
																	
													
																<%tblistcat.movenext
																Loop
																tblistcat.close
																tbprodcatalogo.close%> 
									</div>

				
		</div>
		</div>
	</div>                    
   

<!--#include file="foot.inc"-->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->