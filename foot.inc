    
	
<div id=row style="background:#ff0000;height:3px;"></div>
    <div class="footer-top-area" style="background: url(images/mondo.png) no-repeat center /cover scroll">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
					
                        <h1><span style="color:#ff8c00;"><img src=images/logofooter.png></span></h1>
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
						<table>
						<tr><td> 
						  <div class="footer-menu">
					
                        <ul><li>
						</li>
                        </ul>  <br><br>                      
                      </div>
						</td></tr>
						<tr><td><img src=images/privacy.png></td></tr>
						</table>
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
                        <h2 class="footer-wid-title">Shop online</h2>
                        <ul>
                            <li><a href="shopmancat.asp#primaindietro">Shop Gadget</a</li>
					
                          </ul>          
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                      <div class="footer-menu">
					<h2 class="footer-wid-title">Privacy</h2>
						<ul>
						<li><a href="privacy.asp#topage" > Privacy Policy</a></li>
						<li><a href="contattaci.asp#topage" target="_blank">Contattaci</a></li>
						</ul>  
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
                        <p>&copy; <%=year(date())%> E-Commerce. All Rights Reserved. <a href="https://www.webhousesas.net" target="_blank">www.webhousesas.net</a>
						<font color="#FFFFFF"><br>&copy; tutti i marchi presenti nel sito sono da considerarsi dei legittimi proprietari.</font></p>
					</div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <!---i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i--->
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


	<div style="width:60px;position:fixed;top:90%;right:15px;z-index:0;" align="right">
	<a href="https://wa.me/393357260239?text=ti%20scrivo%20da%20www.hatseries.com" 
	title="Messaggia su WhatsApp" target="_blank">
	<img style="width:50px; height:50px; vertical-align:middle" 
	src="images/whatsapp.png" 
	width="larghezza in px" 
	height="altezza in px" alt="Messaggia su WhatsApp"></a>	
	</div>
	<div style="width:60px;position:fixed;top:90%;right:65px;z-index:0;" align="right">
	<a href="https://www.facebook.com/hatseries/" title="Facebook" target="_blank">
	<img style="width:50px; height:50px; vertical-align:middle" 
	src="images/facebook.png" 
	width="larghezza in px" 
	height="altezza in px" alt="Messaggia su Facebook"></a>	
	</div>
		
<script type="text/javascript">var cookie_policy_url = 'https://nibirumail.com/cookies/policy/?url=<%=Session("sitourl")%>';</script>
<script type="text/javascript" src="https://nibirumail.com/docs/scripts/nibirumail.cookie.min.js"></script>


<script>(function(d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) return;
js = d.createElement(s); js.id = id;
js.src = "//connect.facebook.net/it_IT/sdk.js#xfbml=1&vetbprodcatalogoion=v2.0";
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
menu = document.getElementsByClassName('main-menu')[0];
menu.onclick=function(event) {
	menu.style.display = 'none';
}
toggle = document.getElementById('menu-toggle');
toggle.onclick=function(event) {
  menu.style.display = 'block';
}
</script>
	


 


