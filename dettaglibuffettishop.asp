<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
'dettagli buffetti
Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
sSql="select * from prodotti where Codice_buf='" & Trim(Request("Cod")) & "' limit 1"
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
                        <h2>Shop Codice Buffetti <%=ucase(Trim(Request("Cod")))%></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
 
                    
                    <div class="single-sidebar">
                        <a style="position:relative;top:-80px;" name="buffposizione"></a>
						<%
						if mobile<>"ok" then%>
						<h2 class="sidebar-title">Prodotti Simili</h2>
						<% 
						   
							'query x nome prodotto
							Set tbprodsimili = Server.CreateObject("ADODB.RecordSet")
							querydp="select * From prodotti where codice_buf<>'' and codice_buf like '" & mid(Trim(Request("Cod")),1,4) & "%' order by codice_buf desc LIMIT 20"
							'response.Write(querydp)
							tbprodsimili.Open querydp,connm
							
							Do While not tbprodsimili.eof
							%>
								<div class="thubmnail-recent">
								<a href="dettaglibuffettishop.asp?cod=<%=tbprodsimili("codice_buf")%>#buffposizione"><img  style="max-width:80px;" src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbprodsimili("Codice_buf")%>.jpg' border=0></a>
								<h2><a href="dettaglibuffettishop.asp?cod=<%=tbprodsimili("codice_buf")%>#buffposizione"><b><%=tbprodsimili("codice_buf")%></b><br><%=tbprodsimili("descrizione")%></a></h2>
								
								<!--#include file="ricercacatalogoparametribuffettisimili.inc" -->
								<div class="product-sidebar-price">
								<ins>&#8364;.<%=formatnumber(Mprezzo2,2)%></ins><font color=#072466><%=magazinesconto%><br><del>&#8364;.<%=formatnumber(tbprodsimili("prezzo_vendita_buffetti"),2)%></del></font>
								</div>                             
								</div>
							<%
							tbprodsimili.movenext
							Loop
							 
						end if%>
						
                    </div>
                </div>
				
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
                                       <img  onClick="ZoomIn('<%=tbprodcatalogo("codice_buf")%>.jpg','buffetti');"  src='foto.asp?cat=catalogobuffetti2016_big&img=<%=tbprodcatalogo("Codice_buf")%>.jpg' class="demo-img pos-center" border=0>
                                    </div>
                                    
                                    <div class="product-gallery">
                                        <img  src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbprodcatalogo("Codice_buf")%>.jpg' class="demo-img pos-center" border=0>                       
                                    </div>
                                </div>
                            </div>
                           
                            <div class="col-sm-6">
                                <div class="product-inner">
                                    <h2 class="product-name">codice : <%=tbprodcatalogo("codice_buf")%><br>cod. produttore : BUFFETTI<br><br><%=tbprodcatalogo("Descrizione")%></h2>
									 
									<%
									if cdbl(tbprodcatalogo("puntibuffetti"))=1 then %>
									<img type="images" src="img/buffettipunto.jpg">
									<%end if	
									%>		
									
                                    <div class="product-carousel-price">
									<!--#include file="ricercacatalogoparametribuffetti.inc" -->
										
											<ins>&#8364;.<%=formatnumber(Mprezzo2,2)%></ins><font size=+1 color=#072466><%=magazinesconto%><br><del>&#8364;.<%=formatnumber(tbprodcatalogo("prezzo_vendita_buffetti"),2)%></del></font>
											<%if cdbl(tbprodcatalogo("qta2"))>1 and boolmagazine="false" then
													response.write("<br>per n&#176;" & tbprodcatalogo("qta2") & " pezzi &#8364;." & FormatNumber(tbprodcatalogo("p2"),2))						
												end if
												if cdbl(tbprodcatalogo("qta3"))>1 and boolmagazine="false" then
													response.write("<br>per n&#176;" & tbprodcatalogo("qta3") & " pezzi &#8364;." & FormatNumber(tbprodcatalogo("p3"),2))						
												end if
												if cdbl(tbprodcatalogo("qta4"))>1 and boolmagazine="false" then
													response.write("<br>per n&#176;" & tbprodcatalogo("qta4") & " pezzi &#8364;." & FormatNumber(tbprodcatalogo("p4"),2))						
												end if
												if cdbl(tbprodcatalogo("qta5"))>1 and boolmagazine="false" then
													response.write("<br>per n&#176;" & tbprodcatalogo("qta5") & " pezzi &#8364;." & FormatNumber(tbprodcatalogo("p5"),2))						
												end if
												
												%>
												<hr>
												<%if boolmagazine="false" then %>
												quantita' minima acquistabile pz.1<br>
												<%end if%>
												<br><font size=+1 color=#072466><%=valore_iva(tbprodcatalogo("codice_buf"))%></font>
                                    </div>    
                                    
				<div class="product-option-shop">
				<%response.Write "<form name=formb" & counterfrm & " >" %> 
										 <div class="quantity buttons_added">
													<input type="button" onClick="dimqta('qta<%=counterfrm%>')"  class="minus" value="-" >
													<%if boolmagazine="false" and magqta=1 then %>
                                                    <input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" class="input-text qty text" title="Qty" value="1" min="1" step="1">
													<%else%>
													<input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" class="input-text qty text" title="Qty" value="<%=magqta%>" min="<%=magqta%>" step="<%=magqta%>">
													<%end if%>
													<input type="button" onClick="aggqta('qta<%=counterfrm%>')"  class="plus" value="+" >
										</div>
			
					<input type="button" onMouseOver="" border="0" class="shop" onClick="carrellobuffetti('<%=tbprodcatalogo("codice_buf")%>', document.formb<%=counterfrm%>.qta<%=counterfrm%>.value)" value="">
					<%response.Write("</form>")%> 
<a href="javascript:opensn('listinovisua.asp?For=buffetti&Op=Ins&Cod_Lis=<%=tbprodcatalogo("Codice_buf")%>','Dettagli');" class="tx10 nero lnk"><img src="images/preferiti.jpg">AGG. PREFERITI</a>					
                                    
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
								<p><label for="review">richiesta</label> <textarea name="note" id="" cols="30" rows="10">cod.<%=tbprodcatalogo("codice_buf")%></textarea></p>
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
							loggaVisSchede "buffetti",tbprodcatalogo("codice_buf"),tbprodcatalogo("Categoria"),tbprodcatalogo("SottoCategoria"),Session("nomeutente"),Session("Chisono")
							end if
							'chiusura tabelle
							tbprodcatalogo.close
							tbprodsimili.close%>
                        

						
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