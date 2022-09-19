    <div class="footer-top-area">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
					    <table><tr><td><img src=img/convenienza.png></td><td><img src=img/qualita.png></td><td><img src=img/sicurezza.png></td></tr></table>
                        <h2><span ><font color="#F86605"><%=Session("ragionesocialetesto")%></font></span></h2>
                        <p><%=Session("titolofinepagina")%></p>
						<p><a href=mailto:<%=Session("spedizionemail")%> ><%=Session("spedizionemail")%></a></p>
						<p><a href=mailto:<%=Session("stampemail")%> ><%=Session("stampemail")%></a></p>
						<p><a href=mailto:<%=Session("pecmail")%> ><%=Session("pecmail")%></a></p>
                        <div class="footer-social">
                            <a href="<%=Session("facebook")%>" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Utente</h2>
                        <ul><li><a href="azienda.asp">Chi siamo</a></li>
							<li><a href="azienda.asp">Dove ci Trovi</a></li>
                            <li><a href="accedi.asp">Accedi</a></li>
                            <li><a href="listino.asp">Preferiti</a></li>
                            <li><a href="contattaci.asp">Contatti</a></li>
							<li><a href="condizionidivendita.asp">Condizioni di Vendita</a></li>
                            <li><a href="ingresso.asp">Area riservata</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Categorie</h2>
                        <ul>
                            <li><a href="catbuffetti.asp">Buffetti</a></li>
							<li><a href="odcat.asp">Cancelleria</a></li>
							<li><a href="odcartuccemarche.asp">Cartucce</a></li>
                          </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>Iscriviti alla Newsletter e riceverai le nostre migliori offerte!</p>
                        <div class="newsletter-form">
                            <form action="regmail.asp" method="post" id="formnewsletter" name="formnewsletter">
                                <input type="email" id="Email" name="Email" placeholder="Scrivici la tua email">
								Codice di conferma:
								<%'response.write(linkurl)
								if linkurl="contattaci.asp" or linkurl="registrati.asp"  then
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
								<input  type="hidden" id="text_2" maxLength="25" name="cognome" value="iscri.newsletter">
                                <input type="submit" value="Iscriviti">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer top area -->
    
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="copyright">
                        <p>&copy; <%=year(date())%> E-Commerce. All Rights Reserved. <a href="https://www.jeniuscommunications.it" target="_blank">  www.jeniuscommunications.it</a></p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i>
                    </div>
					

					
                </div>
            </div>
        </div>
	
	
    </div> <!-- End footer bottom area -->
   

	<!-- Bootstrap JS form CDN -->
	<script src="js/bootstrap.min.js" ></script>

	<!-- jQuery sticky menu -->
	<script src="js/owl.carousel.min.js" ></script>
	<script src="js/jquery.sticky.js" ></script>

	<!-- jQuery easing -->
	<script src="js/jquery.easing.1.3.min.js" ></script>

	<!-- Main Script -->
	<script src="js/main.js" ></script>

	<!-- Slider -->
	<script src="js/bxslider.min.js"></script>
	<script src="js/script.slider.js"></script>
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-10146041-25"></script>
	<script>window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments);}
	gtag('js',new Date());gtag('config','UA-10146041-25');</script>


<script type="text/javascript">var cookie_policy_url = 'https://nibirumail.com/cookies/policy/?url=<%=Session("sitourl")%>';</script>
<script type="text/javascript" src="https://nibirumail.com/docs/scripts/nibirumail.cookie.min.js"></script>


	<script>(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/it_IT/sdk.js#xfbml=1&version=v2.0";
	fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	</script>
	<script>
	//Get the button
	var mybutton = document.getElementById("myBtn");

	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

	function scrollFunction() {
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	mybutton.style.display = "block";
	} else {
	mybutton.style.display = "none";
	}
	}

	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
	}
	</script>
	
	
	
	<div style="width:60px;position:fixed;top:90%;right:15px;z-index:0;" align="right">
	<a href="https://wa.me/<%=Session("mobile")%>?text=ti%20scrivo%20da%20<%=Session("sitourl")%>" 
	title="Messaggia su WhatsApp" target="_blank">
	<img style="width:50px; height:50px; vertical-align:middle" 
	src="images/whatsapp.png" 
	width="larghezza in px" 
	height="altezza in px" alt="Messaggia su WhatsApp"></a>	
	</div>
	<div style="width:60px;position:fixed;top:90%;right:65px;z-index:0;" align="right">
	<a href="https://www.facebook.com/buffettieste/" title="Facebook" target="_blank">
	<img style="width:50px; height:50px; vertical-align:middle" 
	src="images/facebook.png" 
	width="larghezza in px" 
	height="altezza in px" alt="Messaggia su Facebook"></a>	
	</div>

