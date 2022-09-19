<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html>
<html lang="en">
<!--#include file="head.inc" -->
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->  
<%
if mobile<>"ok" then %> 
    <div class="promo-area">
<!--#include file="slide_immagini.inc"-->	
    </div>
<%end if%>

    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>HAT SERIES.com</h2>
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
						
						<!--#include file="menusx.inc" -->
						
						
						
						<div class="col-md-8">			 
						<div>					 
							<div class="container">
								<div class="row">
									<div class="col-md-3 col-sm-6">
										<div class="single-promo promo1">
										<p><a href="shopmancat.asp?id=3#primaindietro"><img src="images/sedia.png" width="350" height="350"/></a></p>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="single-promo promo2">
										<p><a href="softwarestampadigitale.asp#primaindietro"><img src="images/carta.jpg" width="380" height="220" /></a></p>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="single-promo promo3">
										   <p><a href="shopmancat.asp?id=14#primaindietro"><img src="images/pulizia.png" width="380" height="220" /></a></p>    
										   </div>
									</div>
								</div>
							</div>
						</div> 
						</div>
                

						<div class="col-md-8">			 
						<div>					 
							<div class="container">
								<div class="row"><br><br><br><br>
									<div class="col-md-3 col-sm-6">
										<div class="single-promo promo4">
										<p><a href="shopmancat.asp?id=1#primaindietro"><img src="images/lavoro.jpg" width="350" height="350"/></a></p>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="single-promo promo5">
										<p><a href="odcat.asp#primaindietro"><img src="images/scuola.jpg" width="380" height="220" /></a></p>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="single-promo promo6">
										   <p><a href="shopmancat.asp?id=2#primaindietro"><img src="images/regalo.jpg" width="380" height="220" /></a></p>    
										   </div>
									</div>
								</div>
							</div>
						</div> 
						</div>
					
 
						<div class="col-md-12">
						<div class="latest-product">
						<div class="product-carousel">
												<%
						'dettagli
						q = chr(34)
						Sql="SELECT shop_products.*, shop_products.ccategory, shop_categories.catdescription from shop_categories INNER JOIN shop_products ON shop_categories.categoryID = shop_products.ccategory WHERE homepage=1 order by rand() asc limit 12" 
						'response.write(sql)
						set rs = server.CreateObject("ADODB.Recordset")
						rs.open Sql,connm
						'response.end
							i=0
							do while not rs.eof
							i=i+1
							'codice=rs("codice")       
							if Trim(Session("Chisono"))<>"" then
								Set Tb3 = Server.CreateObject("ADODB.RecordSet")
								sSQL3 = "select prezzo From profilo where codice_isp='" & Trim(Cstr((rs("ccode")))) & "'"
								Tb3.Open sSQL3,connm									
								if not Tb3.eof then
									Mprezzo2=formatnumber(Tb3("prezzo"),2) 
								else
									Mprezzo2=formatnumber(rs("cprice"),2)
								end if
								Tb3.close
							else
								Mprezzo2=formatnumber(rs("cprice"),2)
							end if
							Mprezzo1=Mprezzo2+20
							'sconto%
							v1=formatnumber(Mprezzo1,2)
							v2=formatnumber(Mprezzo2,2)
							percsconto=formatnumber(((v1-v2)*100)/v1,2)
							%>
							<div class="single-product">
								<div class="thubmnail-recent">
									<img src="images/vuota2.jpg" style="max-width:220px;height:120px;" >
									<a HREF="shopmandett.asp?id=<%=rs("catalogID")%>&subcatid=5#primaindietro"><%newimmagine=replace(rs("cimageurl")," ","%20")%><img  style="max-width:220px;" src='admin/articoli/<%=newimmagine%>'></a>
									<img src="images/vuota2.jpg" style="max-width:220px;height:120px;" >
									<div class="product-hover">
										<a href="#" onclick="carrellomanuale('<%=rs("ccode")%>', '1' , '<%=v2%>' , '<%=rs("cname")%>','<%=rs("iva")%>','','','<%=rs("cimageurl")%>' )" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> aggiungi</a>
										<a href="shopmandett.asp?id=<%=rs("catalogID")%>&subcatid=<%=rs("ccategory")%>#primaindietro" class="view-details-link"><i class="fa fa-link"></i> dettagli</a></div>
								</div>
								<h2>codice :<%=rs("ccode")%><br><%=ucase(left(rs("cname"),50))%></h2>
								<div class="product-carousel-price">
						
                          <ins>&#8364;.<%=v2%></ins><br></div> 
							</div>					
							<%'response.end
							rs.movenext
							loop
							rs.close							
							%>    
						</div>
						</div>	
						</div>                    
						<br><br>
						</div>
						
					
									
				
				
            </div>
        </div>
    </div>
    
<!--#include file="foot.inc"-->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->