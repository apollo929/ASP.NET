    <div class="footer-top-area">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
					    <table><tr><td><img src=img/convenienza.png></td><td><img src=img/qualita.png></td><td><img src=img/sicurezza.png></td></tr></table>
                        <br><h2><span ><font color="#E86868"><%=Session("ragionesocialetesto")%></font></span></h2>
                        <p><font color="#C0C0C0"><%=Session("titolofinepagina")%></font></p>
						<p><a style="color:#E86868;" href=mailto:<%=Session("stampemail")%> ><%=Session("stampemail")%></a></p>
						<p><a style="color:#E86868;" href=mailto:<%=Session("pecmail")%> ><%=Session("pecmail")%></a></p>
                        <div class="footer-social">
                            <a href="<%=Session("facebook")%>" style="color:#ffffff" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="<%=Session("instagram")%>" target="_blank" style="color:#ffffff"><i class="fa fa-instagram"></i></a>
                            <a href="<%=Session("youtube")%>" target="_blank" style="color:#ffffff"><i class="fa fa-youtube"></i></a>
                            <a href="<%=Session("linkedin")%>" target="_blank" style="color:#ffffff"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Utente</h2>
                        <ul><!---li><a href="azienda.asp">Chi siamo</a></li>
							<li><a href="azienda.asp">Dove ci Trovi</a></li>
                            <li><a href="accedi.asp">Accedi</a></li>
                            <li><a href="listino.asp">Preferiti</a></li>
                            <li><a href="contattaci.asp">Contatti</a></li>
							<li><a href="condizionidivendita.asp">Condizioni di Vendita</a></li--->
                            <li><a href="ingresso.asp">Area riservata</a></li>
							<li><a href="registrazionepersa.asp#topage">Dimenticato Password</a></li>
							
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Utility</h2>
						<ul>
						<li><a href="accedi.asp#topage">Accedi</a></li>
						<li><a href="carrellovisua.asp#topage">Preventivo</a></li>
						<li><a href="listino.asp#topage#topage">Preferiti</a></li>
						<li><a href="logout.asp#topage#topage">LogOut</a></li>
						</ul>          
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                      <div class="footer-menu">
					<h2 class="footer-wid-title">Privacy</h2>
						<ul>
						<li><a href="privacypolicy.asp#topage" > Privacy Policy</a></li>
						<li><a href="privacy.asp#topage" > Politica qualita', ambiente, salute e sicurezza</a></li>
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
                        <p>&copy; Copyright Silko <%=year(date())%> Cap. Sociale i.v. &#8364;.50.000.000 Societa' a Socio Unico REA: MI n&deg; 2507533. All Rights Reserved. <br><br><a style="font-size:10px;" href="http://lapisgroup.it/it/">produced by Lapis sas</a></p>
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


<div style="width:60px;position:fixed;top:90%;right:15px;z-index:9999;" align="right">
<a href="<%=Session("instagram")%>" title="Facebook" target="_blank">
<img style="width:50px;height:50px; vertical-align:middle" 
src="images/instagram.png" 
width="larghezza in px" 
height="altezza in px" alt="Messaggia su WhatsApp"></a>	
</div>
<div style="width:60px;position:fixed;top:90%;right:65px;z-index:9999;" align="right">
<a href="<%=Session("facebook")%>" title="Facebook" target="_blank">
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
	


 
