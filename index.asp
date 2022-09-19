<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html>
<html lang="en">
<!--#include file="head.inc" -->
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->  
<%if mobile<>"ok" then %> 
    <div   style="background:#515151;">
<!--#include file="slide_immagini.inc"-->	
    </div>
<%end if%>

    <div class="promo-area" style="background:#ffffff;">

    </div>	
    
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
						
						
						
									<!--==================================================-->
									<!----START BLOG  Section ----->
									<!--===================================================-->

										<div class="blog-section style-ten upper pt-100 pb-70" >
											<div class="container">
												<div class="row align-items-center">
													<div class="col-lg-9">
														<div class="section-head mb-10">
															<h5>// DIVERTITI CON  NOI....</h5>
															<h4>HATSERIES .... il massimo dell'avventura.</h4>
														</div>
													</div>
													<div class="col-lg-3">
													
													</div>
												</div>
												<div class="row pt-45">
													<div class="col-lg-4 col-md-6">
														<div class="single-blog-box">
															<div class="single-blog-thumb">
																<a href="eventi.asp?#topage"><img src="imageshome/3.jpeg" style="border-radius:2%;" alt=""></a>
															</div>
															<div class="single-blog-content">
																<div class="blog-meta-box">
																	<div style="background:#ff0000;color:#ffffff;" class="blog-meta-title">
																		<a href="eventi.asp?#topage"><h3>eventi</h3>
																		<span><%=year(date)%></span></a>
																	</div>
																</div>
																<div class="single-blog-title">
																	<span>EVENTI</span>
																	<a href="eventi.asp?#topage"><h2>Partecipa hai nostri Eventi. Adrenalina pura....</h2></a>
																</div>
																<div class="single-blog-btn">
																	<a href="eventi.asp?#topage">READ MORE <img src="images/blog-arrows.png" border="0"></a>
																</div>
															</div>
														</div>
													</div>
													<div class="col-lg-4 col-md-6">
														<div class="single-blog-box">
															<div class="single-blog-thumb">
																<a href="eventi.asp"><img src="imageshome/5.jpeg" style="border-radius:2%;" alt=""></a>
															</div>
															<div class="single-blog-content">
																<div class="blog-meta-box">
																	<div >
																		<a href="eventi.asp"><center><img src="imageshome/icona1.png" style="border-radius:10%;" alt=""></center></a>
																	</div>
																</div>
																<div class="single-blog-title">
																	<span>VIAGGI</span>
																	<a href="eventi.asp"><h2>Partecipa ai nostri viaggi all' insegna dell' avventura.</h2></a>
																</div>
																<div class="single-blog-btn">
																	<a href="eventi.asp">READ MORE <img src="images/blog-arrows.png" border="0"></a>
																</div>
															</div>
														</div>
													</div>
													<div class="col-lg-4 col-md-6">
														<div class="single-blog-box">
															<div class="single-blog-thumb">
																<a href="eventi.asp"><img src="imageshome/2.jpeg" style="border-radius:2%;" alt=""></a>
															</div>
															<div class="single-blog-content">
																<div class="blog-meta-box">
																	<div >
																		<a href="eventi.asp"><center><img src="imageshome/icona2.png" style="border-radius:10%;" ></center></a>
																	</div>
																</div>
																<div class="single-blog-title">
																	<span>CORSI</span>
																	<a href="eventi.asp"><h2>Partecipa ai nostri corsi con i migliori professionisti.</h2></a>
																</div>
																<div class="single-blog-btn">
																	<a href="eventi.asp">READ MORE <img src="images/blog-arrows.png" border="0"></a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
									<!--==================================================-->
									<!----END BLOG  Section ----->
									<!--===================================================-->
										
						</div>


						<div class="col-md-8">			 
						
						
						
								<!--==================================================-->
								<!----START BLOG  Section ----->
								<!--===================================================-->

							<div class="blog-section style-ten upper pt-100 pb-70" >
								<div class="container">
									<div class="row align-items-center">
										<div class="col-lg-9">
											<div class="section-head mb-10">
												<h5>// I NOSTRI GADGET <h5>
												<h4>Entra nel nostro gruppo.</h4>
											</div>
										</div>
										<div class="col-lg-3">
										
										</div>
									</div>
									<div class="row pt-45">
										<div class="col-lg-4 col-md-6">
											<div class="single-blog-box">
												<div class="single-blog-thumb">
													<a href="shopmancat.asp#topage"><img src="imageshome/4.jpeg" style="border-radius:2%;"  alt=""></a>
												</div>
												<div class="single-blog-content">
													<div class="blog-meta-box">
														<div class="blog-meta-title">
															<a href="shopmancat.asp#topage"><h3>GAD</h3>
															<span>GET</span></a>
														</div>
													</div>
													<div class="single-blog-title">
														<span>GADGET</span>
														<a href="shopmancat.asp#topage"><h2>Scegli un gadget HATserie, ed entri nel nostro TEAM.</h2></a>
													</div>
													<div class="single-blog-btn">
														<a href="shopmancat.asp#topage">READ MORE <img src="images/blog-arrows.png" border="0"></a>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-4 col-md-6">
											<div class="single-blog-box">
												<div class="single-blog-thumb">
													<a href="iscrizioni.asp#topage"><img src="imageshome/6.jpeg" style="border-radius:2%;" alt=""></a>
												</div>
												<div class="single-blog-content">
													<div class="blog-meta-box">
																	<div >
																		<center><a href="iscrizioni.asp#topage"><img src="imageshome/icona3.png" style="border-radius:10%;" ></a></center>
																	</div>
													</div>
													<div class="single-blog-title">
														<span>ISCRIVITI & REGISTRATI</span>
														<a href="iscrizioni.asp#topage"><h2>Entra nel nostro formidabile Gruppo di appassionati.</h2></a>
													</div>
													<div class="single-blog-btn">
														<a href="iscrizioni.asp#topage">READ MORE <img src="images/blog-arrows.png" border="0"></a>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-4 col-md-6">
											<div class="single-blog-box">
												<div class="single-blog-thumb">
													<a href="contattaci.asp#topage"><img src="imageshome/1.jpeg" style="border-radius:2%;" alt=""></a>
												</div>
												<div class="single-blog-content">
													<div class="blog-meta-box">
																	<div >
																		<center><a href="contattaci.asp#topage"><img src="imageshome/icona4.png" style="border-radius:10%;" ></a></center>
																	</div>
													</div>
													<div class="single-blog-title">
														<span>CONTATTACI</span>
														<a href="contattaci.asp#topage"><h2>Per informazioni su Viaggi, Corsi ed Eventi scrivici .</h2></a>
													</div>
													<div class="single-blog-btn">
														<a href="contattaci.asp#topage">READ MORE <img src="images/blog-arrows.png" border="0"></a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
								<!--==================================================-->
								<!----END BLOG  Section ----->
								<!--===================================================-->
												
						</div>					 
							
			 
						</div>
						</div>
						
					
									
				
				
            </div>
        </div>
    </div>
    	<div id=row style="background:url(images/sfondoprimafinale.png) no-repeat center /cover scroll;height:688px;">


					<div class="choose-area style-two pt-100 pb-100">
						<div class="container">
							<div class="row align-items-center">
								<div class="col-lg-6 col-md-6"></div>
								<div class="col-lg-6 col-md-6">
									<div class="content-wrapper">
										<div class="section-head mb-30"><br><br>
										<br><br>
											<h5 style="color:#ffffff;">// PERCHE' SCEGLIERE NOI.</h5>
											<h3 style="color:#ffffff;">ci sono molte ragioni</h3>
											<h2 style="color:#ff0000;">HAT<span>Series.com</span></h2>
											<div class="section-content-text">
												<p>testo........................................................</p>
											<br><br></div>
										</div>
										<div class="row pt-10">
											<div class="col-lg-5 col-md-6">
												<div class="choose-single-box">
													<div class="choose-content">
														<div class="choose-title">
															<h4 class="text-white">STRONG ADVENTURE</h4>
														</div>
														<div class="choose-single-btn">
															<a href="#"><img src="images/blog-arrows.png" border="0"></a>
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-5 col-md-6">
												<div class="choose-single-box">
													<div class="choose-content">
														<div class="choose-title">
															<h4 class="text-white">FUN IN MOTORCYCLE</h4>
														</div>
														<div class="choose-single-btn">
															<a href="#"><img src="images/blog-arrows.png" border="0"></a>
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-5 col-md-6">
												<div class="choose-single-box">
													<div class="choose-content">
														<div class="choose-title">
															<h4 class="text-white">PASSION AND MOTORS</h4>
														</div>
														<div class="choose-single-btn">
															<a href="#"><img src="images/blog-arrows.png" border="0"></a>
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-5 col-md-6">
												<div class="choose-single-box">
													<div class="choose-content">
														<div class="choose-title">
															<h4 class="text-white">NEW EXPERIENCES</h4>
														</div>
														<div class="choose-single-btn">
															<a href="#"><img src="images/blog-arrows.png" border="0"></a>
														</div>
													</div>
												</div>
											</div>
										</div>
								 
									</div>
								</div>
							</div>
						</div>
					</div>
		
		
		</div>
		
		
		
		
		<div id=row style="background:#ffffff;height:688px;"> 
						<div class="col-md-12"><br>
						<h2>ultimi prodotti inseriti</h2>
						<div class="latest-product">
						<div class="product-carousel">
					 
							 				
							<%
						'dettagli
						q = chr(34)
						Sql="SELECT shop_products.*, shop_products.ccategory, shop_categories.catdescription from shop_categories INNER JOIN shop_products ON shop_categories.categoryID = shop_products.ccategory WHERE homepage=1 order by rand() asc limit 18" 
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
							<div class="single-product" style="height:580px;" >
								<div class="thubmnail-recent">
								
									<a HREF="shopmandett.asp?id=<%=rs("catalogID")%>&subcatid=5#topage"><%newimmagine=replace(rs("cimageurl")," ","%20")%><img  style="max-height:430px;" src='admin/articoli/<%=newimmagine%>'></a>
								
									<div class="product-hover">
										<!---a href="#" onclick="carrellomanuale('<%=rs("ccode")%>', '1' , '<%=v2%>' , '<%=rs("cname")%>','<%=rs("iva")%>','','','<%=rs("cimageurl")%>' )" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> aggiungi</a--->
										<a href="shopmandett.asp?id=<%=rs("catalogID")%>&subcatid=<%=rs("ccategory")%>#topage" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> aggiungi</a>
										<a href="shopmandett.asp?id=<%=rs("catalogID")%>&subcatid=<%=rs("ccategory")%>#topage" class="view-details-link"><i class="fa fa-link"></i> dettagli</a></div>
								</div>
								<center><h2>codice :<%=rs("ccode")%><br><%=ucase(left(rs("cname"),50))%></h2>
								<div class="product-carousel-price">
						
                          <ins>&#8364;.<%=v2%></ins><br></div> </center>
							</div>					
							<%'response.end
							rs.movenext
							loop
							rs.close							
							%>    
						</div>
						</div>	
						</div>  
			</div>						
						<br><br>
		
<!--#include file="foot.inc"-->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->