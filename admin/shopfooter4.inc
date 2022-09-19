						<div class="col-md-12">
						<div class="latest-product">
						<div class="product-carousel">

							<%
							Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
							queryod="SELECT * FROM prodotti where fornitore like '%od%' and AA_Qta_Conf=1 order by rand() limit 12"
							tbprodcatalogo.Open queryod,connm
							do while not tbprodcatalogo.eof
							codice=tbprodcatalogo("codice_od")
							%>
							<!--#include file="ricercacatalogoparametriod.inc" -->
							<div class="single-product">
								<div class="product-f-image">
								    <img src="images/vuota2.jpg" style="max-width:220px;right:350px;" >
									<img src='foto.asp?cat=catalogoisp\piccole&img=<%=tbprodcatalogo("codice_od")%>.jpg' border=0>
									<img src="images/vuota2.jpg" style="max-width:220px;right:350px;" >
									<div class="product-hover">
										<a href="#" onclick="carrellood('<%=replace(tbprodcatalogo("codice_od")," ","")%>','1')" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> aggiungi</a>
										<a href="oddettagli.asp?cod=<%=tbprodcatalogo("codice_od")%>" class="view-details-link"><i class="fa fa-link"></i> dettagli</a>
									</div>
								</div>
								<h2>codice :<%=tbprodcatalogo("codice_od")%><br><%=ucase(left(tbprodcatalogo("descrizione"),50))%></h2>
								<div class="product-carousel-price">
							<%
							'sconto%
							v1=formatnumber(Mprezzo1,2)
							v2=formatnumber(Mprezzo2,2)
							percsconto=""
							if v1-v2<>0 then percsconto=cstr(formatnumber(((v1-v2)*100)/v1,2)) & "%<br>"
							%>
                            <ins>&#8364;.<%=formatnumber(Mprezzo2,2)%></ins><br><font size=+1 color=darkorange>sconto del <%=percsconto%>%</font><br><del>&#8364;.<%=formatnumber(Mprezzo1,2)%></del>
								</div> 
							</div>					
							<%
							tbprodcatalogo.movenext
							loop
							tbprodcatalogo.close
							%>  
						</div>
						</div>	
						</div>     
						<br><br>