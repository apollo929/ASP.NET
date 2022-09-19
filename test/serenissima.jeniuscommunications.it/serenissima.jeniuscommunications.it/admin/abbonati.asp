<!--#include file=connessionesql.inc-->
<!DOCTYPE html>
<html lang="en">
    <head>
	<!--#include file=metatag.inc-->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Startmin - Bootstrap Admin Theme</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">
		
		<!-- Price CSS -->
        <link href="css/style.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
	<%
if session("Ragione")="" then response.redirect("../login.asp")
if session("loginid")="" then response.Redirect("../login.asp")
intid=request("id")%>

 
        <div id="wrapper">

            <!-- Navigation -->
			<!--#include file=topmenu.inc-->
				<!--#include file=navbarback.inc-->		
					
            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header"></h1>
                        </div>

<div id="generic_price_table">   
<section>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <!--PRICE HEADING START-->
                    <div class="price-heading clearfix">
                        <h1>Acquista uno dei nostri pacchetti preventivi</h1>
                    </div>
                    <!--//PRICE HEADING END-->
                </div>
            </div>
        </div>
        <div class="container">
            
            <!--BLOCK ROW START-->
            <div class="row">
                <div class="col-md-3">
                
                	<!--PRICE CONTENT START-->
                    <div class="generic_content clearfix">
                        
                        <!--HEAD PRICE DETAIL START-->
                        <div class="generic_head_price clearfix">
                        
                            <!--HEAD CONTENT START-->
                            <div class="generic_head_content clearfix">
                            
                            	<!--HEAD START-->
                                <div class="head_bg"></div>
                                <div class="head">
                                    <span>PACCHETTO 1.0</span>
                                </div>
                                <!--//HEAD END-->
                                
                            </div>
                            <!--//HEAD CONTENT END-->
                            
                            <!--PRICE START-->
                            <div class="generic_price_tag clearfix">	
                                <span class="price">
                                    <span class="sign">eur.</span>
                                    <span class="currency">15</span>
                                    <span class="cent">.00</span>
                                    <span class="month"><br><br>1 preventivi<br>costo singolo preventivo eur.15.00</span>
                                </span>
                            </div>
                            <!--//PRICE END-->
                            
                        </div>                            
                        <!--//HEAD PRICE DETAIL END-->
                        
                        <!--FEATURE LIST START-->
                        <div class="generic_feature_list">
                                  <p align=left>              
                                &nbsp;&nbsp;&nbsp;1. visualizzare tutti i dati del <br>&nbsp;&nbsp;&nbsp;potenziale cliente<br><br>
                                &nbsp;&nbsp;&nbsp;2. visualizzazione numero di telefono<br><br>
                                &nbsp;&nbsp;&nbsp;3. visualizzazione indirizzo mail<br><br>
                                &nbsp;&nbsp;&nbsp;4. visualizzare la descrizione <br>&nbsp;&nbsp;&nbsp;dell'intervento<br><br></p>
                          
                        </div>
                        <!--//FEATURE LIST END-->
                        <!--BUTTON START-->
                        <div class="generic_price_btn clearfix">
                        	<a class="" href="">
								<form action="https://www.paypal.com/it/cgi-bin/webscr" method="post" ID=Form1>
								<input type="hidden" name="cmd" value="_ext-enter" ID=Hidden1>
								<input type="hidden" name="redirect_cmd" value="_xclick" ID=Hidden6> 
								<input type="hidden" name="business" value="direzione@costruttori.it" ID=Hidden2>
								<input type="hidden" name="item_name" value="PACCHETTO 1.0 €15.00" ID=Hidden3>
								<input type="hidden" name="currency_code" value="EUR" ID=Hidden4>								
								<input type="hidden" name="email" value="<%=session("sesmail")%>" ID=Hidden7>						
								<input type="hidden" name="country" value="IT" ID=Hidden11>
								<input type="hidden" name="city" value="<%=session("sesprovincia")%>" ID=Hidden11>
								<input type="hidden" name="state" value="italy" ID=Hidden12>							
								<input type="hidden" name="night_phone_a" value="<%=session("telefono")%>" ID=Hidden12>
								<input type="hidden" name="amount" value="15.00" ID=Hidden5>								
								<input type="hidden" name="tax_rate" value="22" ID=Hidden5>
								<input type="hidden" value="http://www.preventivicostruttori.it/preventivi/cartadicredito.asp?id=<%=session("loginid")%>&amount=20" name="return">
								<input type="image" src="https://www.paypalobjects.com/it_IT/IT/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - Il sistema di pagamento online più facile e sicuro!">
								</form></a>
                        </div>
                        <!--//BUTTON END-->
						<div>
						<p align=left>
						&nbsp;pagamento con bonifico eur.15+iva
						<br><br>
						&nbsp;CASSA DI RISPARMIO DEL VENETO<br><br>
						&nbsp;intestazione: COSTRUTTORI s.r.l.<br>
						&nbsp;iban:  IT59J0306962189100000002969 <br>
						&nbsp;bic: BCITITMM<br>
						&nbsp;causale: PACCHETTO 1.0 <br>&nbsp;CLIENTE <%=session("loginid")%></p>
						</div>
                        
                    </div>
                    <!--//PRICE CONTENT END-->
                        
                </div>
				
				             <div class="col-md-3">
                
                	<!--PRICE CONTENT START-->
                    <div class="generic_content clearfix">
                        
                        <!--HEAD PRICE DETAIL START-->
                        <div class="generic_head_price clearfix">
                        
                            <!--HEAD CONTENT START-->
                            <div class="generic_head_content clearfix">
                            
                            	<!--HEAD START-->
                                <div class="head_bg"></div>
                                <div class="head">
                                    <span>PACCHETTO 7.0</span>
                                </div>
                                <!--//HEAD END-->
                                
                            </div>
                            <!--//HEAD CONTENT END-->
                            
                            <!--PRICE START-->
                            <div class="generic_price_tag clearfix">	
                                <span class="price">
                                    <span class="sign">eur.</span>
                                    <span class="currency">70</span>
                                    <span class="cent">.00</span>
                                    <span class="month"><br><br>8 preventivi<br>costo singolo preventivo eur.8.75</span>
                                </span>
                            </div>
                            <!--//PRICE END-->
                            
                        </div>                            
                        <!--//HEAD PRICE DETAIL END-->
                        
                        <!--FEATURE LIST START-->
                        <div class="generic_feature_list">
                                  <p align=left>              
                                &nbsp;&nbsp;&nbsp;1. visualizzare tutti i dati del <br>&nbsp;&nbsp;&nbsp;potenziale cliente<br><br>
                                &nbsp;&nbsp;&nbsp;2. visualizzazione numero di telefono<br><br>
                                &nbsp;&nbsp;&nbsp;3. visualizzazione indirizzo mail<br><br>
                                &nbsp;&nbsp;&nbsp;4. visualizzare la descrizione <br>&nbsp;&nbsp;&nbsp;dell'intervento<br><br></p>
                        </div>
                        <!--//FEATURE LIST END-->
                        
                        <!--BUTTON START-->
                        <div class="generic_price_btn clearfix">
                        	<a class="" href="">
								<form action="https://www.paypal.com/it/cgi-bin/webscr" method="post" ID=Form1>
								<input type="hidden" name="cmd" value="_ext-enter" ID=Hidden1>
								<input type="hidden" name="redirect_cmd" value="_xclick" ID=Hidden6> 
								<input type="hidden" name="business" value="direzione@costruttori.it" ID=Hidden2>
								<input type="hidden" name="item_name" value="PACCHETTO 7.0 €70.00" ID=Hidden3>
								<input type="hidden" name="currency_code" value="EUR" ID=Hidden4>
								<input type="hidden" name="email" value="<%=session("sesmail")%>" ID=Hidden7>						
								<input type="hidden" name="country" value="IT" ID=Hidden11>
								<input type="hidden" name="city" value="<%=session("sesprovincia")%>" ID=Hidden11>
								<input type="hidden" name="state" value="italy" ID=Hidden12>							
								<input type="hidden" name="night_phone_a" value="<%=session("telefono")%>" ID=Hidden12>
								<input type="hidden" name="amount" value="70.00" ID=Hidden5>								
								<input type="hidden" name="tax_rate" value="22" ID=Hidden5>
								<input type="hidden" value="http://www.preventivicostruttori.it/preventivi/cartadicredito.asp?id=<%=session("loginid")%>&amount=160" name="return">
								<input type="image" src="https://www.paypalobjects.com/it_IT/IT/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - Il sistema di pagamento online più facile e sicuro!">
								</form></a>
                        </div>
                        <!--//BUTTON END-->
						<div>
						<p align=left>
						&nbsp;pagamento con bonifico eur.70+iva
						<br><br>
						&nbsp;CASSA DI RISPARMIO DEL VENETO<br><br>
						&nbsp;intestazione: COSTRUTTORI s.r.l.<br>
						&nbsp;iban:  IT59J0306962189100000002969 <br>
						&nbsp;bic: BCITITMM<br>
						&nbsp;causale: PACCHETTO 7.0 <br>&nbsp;CLIENTE <%=session("loginid")%></p>
						</div>
                        
                    </div>
                    <!--//PRICE CONTENT END-->
                        
                </div>
           	
                
                <div class="col-md-3">
                
                	<!--PRICE CONTENT START-->
                    <div class="generic_content active clearfix">
                        
                        <!--HEAD PRICE DETAIL START-->
                        <div class="generic_head_price clearfix">
                        
                            <!--HEAD CONTENT START-->
                            <div class="generic_head_content clearfix">
                            
                            	<!--HEAD START-->
                                <div class="head_bg"></div>
                                <div class="head">
                                    <span>PACCHETTO 10.0</span>
                                </div>
                                <!--//HEAD END-->
                                
                            </div>
                            <!--//HEAD CONTENT END-->
                            
                            <!--PRICE START-->
                            <div class="generic_price_tag clearfix">	
                                <span class="price">
                                    <span class="sign">eur.</span>
                                    <span class="currency">150</span>
                                    <span class="cent">.00</span>
                                    <span class="month"><br><br>20 preventivi<br>costo singolo preventivo eur.7.50</span>
                                </span>
                            </div>
                            <!--//PRICE END-->
                            
                        </div>                            
                        <!--//HEAD PRICE DETAIL END-->
                        
                        <!--FEATURE LIST START-->
                        <div class="generic_feature_list">
                                  <p align=left>              
                                &nbsp;&nbsp;&nbsp;1. visualizzare tutti i dati del <br>&nbsp;&nbsp;&nbsp;potenziale cliente<br><br>
                                &nbsp;&nbsp;&nbsp;2. visualizzazione numero di telefono<br><br>
                                &nbsp;&nbsp;&nbsp;3. visualizzazione indirizzo mail<br><br>
                                &nbsp;&nbsp;&nbsp;4. visualizzare la descrizione <br>&nbsp;&nbsp;&nbsp;dell'intervento<br><br></p>
                        </div>
                        <!--//FEATURE LIST END-->
                        
                        <!--BUTTON START-->
                        <div class="generic_price_btn clearfix">
						
						<a class="" href="">
								<form action="https://www.paypal.com/it/cgi-bin/webscr" method="post" ID=Form1>
								<input type="hidden" name="cmd" value="_ext-enter" ID=Hidden1>
								<input type="hidden" name="redirect_cmd" value="_xclick" ID=Hidden6> 
								<input type="hidden" name="business" value="direzione@costruttori.it" ID=Hidden2>
								<input type="hidden" name="item_name" value="PACCHETTO 10.0 €150.00" ID=Hidden3>
								<input type="hidden" name="currency_code" value="EUR" ID=Hidden4>
								<input type="hidden" name="email" value="<%=session("sesmail")%>" ID=Hidden7>						
								<input type="hidden" name="country" value="IT" ID=Hidden11>
								<input type="hidden" name="city" value="<%=session("sesprovincia")%>" ID=Hidden11>
								<input type="hidden" name="state" value="italy" ID=Hidden12>							
								<input type="hidden" name="night_phone_a" value="<%=session("telefono")%>" ID=Hidden12>
								<input type="hidden" name="amount" value="150.00" ID=Hidden5>								
								<input type="hidden" name="tax_rate" value="22" ID=Hidden5>
								<input type="hidden" value="http://www.preventivicostruttori.it/preventivi/cartadicredito.asp?id=<%=session("loginid")%>&amount=400" name="return">
								<input type="image" src="https://www.paypalobjects.com/it_IT/IT/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - Il sistema di pagamento online più facile e sicuro!">
								</form></a>
                        </div>
                        <!--//BUTTON END-->
						<div>
						<p align=left>
						&nbsp;pagamento con bonifico eur.150+iva
						<br><br>
						&nbsp;CASSA DI RISPARMIO DEL VENETO<br><br>
						&nbsp;intestazione: COSTRUTTORI s.r.l.<br>
						&nbsp;iban:  IT59J0306962189100000002969 <br>
						&nbsp;bic: BCITITMM<br>
						&nbsp;causale: PACCHETTO 10.0 <br>&nbsp;CLIENTE <%=session("loginid")%></p>
						</div>
                        
                    </div>
                    <!--//PRICE CONTENT END-->
                        
                </div>
                <div class="col-md-3">
                
                	<!--PRICE CONTENT START-->
                    <div class="generic_content clearfix">
                        
                        <!--HEAD PRICE DETAIL START-->
                        <div class="generic_head_price clearfix">
                        
                            <!--HEAD CONTENT START-->
                            <div class="generic_head_content clearfix">
                            
                            	<!--HEAD START-->
                                <div class="head_bg"></div>
                                <div class="head">
                                    <span>PACCHETTO 50S</span>
                                </div>
                                <!--//HEAD END-->
                                
                            </div>
                            <!--//HEAD CONTENT END-->
                            
                            <!--PRICE START-->
                            <div class="generic_price_tag clearfix">	
                                <span class="price">
                                    <span class="sign">eur.</span>
                                    <span class="currency">500</span>
                                    <span class="cent">.00</span>
                                    <span class="month"><br><br>100 preventivi<br>costo singolo preventivo eur.5.00</span>
                                </span>
                            </div>
                            <!--//PRICE END-->
                            
                        </div>                            
                        <!--//HEAD PRICE DETAIL END-->
                        
                        <!--FEATURE LIST START-->
                        <div class="generic_feature_list">
                                  <p align=left>              
                                &nbsp;&nbsp;&nbsp;1. visualizzare tutti i dati del <br>&nbsp;&nbsp;&nbsp;potenziale cliente<br><br>
                                &nbsp;&nbsp;&nbsp;2. visualizzazione numero di telefono<br><br>
                                &nbsp;&nbsp;&nbsp;3. visualizzazione indirizzo mail<br><br>
                                &nbsp;&nbsp;&nbsp;4. visualizzare la descrizione <br>&nbsp;&nbsp;&nbsp;dell'intervento<br><br></p>
                        </div>
                        <!--//FEATURE LIST END-->
                        
                        <!--BUTTON START-->
                        <div class="generic_price_btn clearfix">
                        	<a class="" href="">
								<form action="https://www.paypal.com/it/cgi-bin/webscr" method="post" ID=Form1>
								<input type="hidden" name="cmd" value="_ext-enter" ID=Hidden1>
								<input type="hidden" name="redirect_cmd" value="_xclick" ID=Hidden6> 
								<input type="hidden" name="business" value="direzione@costruttori.it" ID=Hidden2>
								<input type="hidden" name="item_name" value="PACCHETTO 500.s €500.00" ID=Hidden3>
								<input type="hidden" name="currency_code" value="EUR" ID=Hidden4>
								<input type="hidden" name="email" value="<%=session("sesmail")%>" ID=Hidden7>						
								<input type="hidden" name="country" value="IT" ID=Hidden11>
								<input type="hidden" name="city" value="<%=session("sesprovincia")%>" ID=Hidden11>
								<input type="hidden" name="state" value="italy" ID=Hidden12>							
								<input type="hidden" name="night_phone_a" value="<%=session("telefono")%>" ID=Hidden12>
								<input type="hidden" name="amount" value="500.00" ID=Hidden5>								
								<input type="hidden" name="tax_rate" value="22" ID=Hidden5>
								<input type="hidden" value="http://www.preventivicostruttori.it/preventivi/cartadicredito.asp?id=<%=session("loginid")%>&amount=2000" name="return">
								<input type="image" src="https://www.paypalobjects.com/it_IT/IT/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - Il sistema di pagamento online più facile e sicuro!">
								</form></a>
                        </div>
                        <!--//BUTTON END-->
						<div>
						<p align=left>
						&nbsp;pagamento con bonifico eur.500+iva
						<br><br>
						&nbsp;CASSA DI RISPARMIO DEL VENETO<br><br>
						&nbsp;intestazione: COSTRUTTORI s.r.l.<br>
						&nbsp;iban:  IT59J0306962189100000002969 <br>
						&nbsp;bic: BCITITMM<br>
						&nbsp;causale: PACCHETTO 500s <br>&nbsp;CLIENTE <%=session("loginid")%></p>
						</div>
                    </div>
                    <!--//PRICE CONTENT END-->
                        
                </div>
            </div>	
            <!--//BLOCK ROW END-->
            <br><br>
	
        </div>

		                        <!----div class="generic_price_btn clearfix">
                        	<a class="" href="">
								<form action="https://www.paypal.com/it/cgi-bin/webscr" method="post" ID=Form1>
								<input type="hidden" name="cmd" value="_ext-enter" ID=Hidden1>
								<input type="hidden" name="redirect_cmd" value="_xclick" ID=Hidden6> 
								<input type="hidden" name="business" value="direzione@costruttori.it" ID=Hidden2>
								<input type="hidden" name="item_name" value="test 1.0" ID=Hidden3>
								<input type="hidden" name="currency_code" value="EUR" ID=Hidden4>								
								<input type="hidden" name="email" value="<%=session("sesmail")%>" ID=Hidden7>						
								<input type="hidden" name="country" value="IT" ID=Hidden11>
								<input type="hidden" name="city" value="<%=session("sesprovincia")%>" ID=Hidden11>
								<input type="hidden" name="state" value="italy" ID=Hidden12>							
								<input type="hidden" name="night_phone_a" value="<%=session("telefono")%>" ID=Hidden12>
								<input type="hidden" name="amount" value="1.00" ID=Hidden5>								
								<input type="hidden" name="tax_rate" value="22" ID=Hidden5>
								<input type="hidden" value="http://www.preventivicostruttori.it/preventivi/cartadicredito.asp?id=<%=session("loginid")%>&amount=20" name="return">
								<input type="image" src="https://www.paypalobjects.com/it_IT/IT/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - Il sistema di pagamento online più facile e sicuro!">
								</form></a--------->
                        </div>
		
		
    </section>             
							
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/startmin.js"></script>

    </body>
</html>
