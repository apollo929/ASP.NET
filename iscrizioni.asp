<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html><html>
<!--#include file="head.inc" -->
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->  
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>ISCRIZIONI</h2>
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
                <div class="col-md-4">
				<!--#include file="menusx.inc" -->		 
				
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">	
						<a style="position:relative;top:-80px;" name="topage"></a>
								
									<a style = "font-size: 20px;color:#ffffff" href="registrati.asp?opzione=1"><img src="images/iscriviti-hatseries.jpg"></a>
										<style>
										th{padding: 10px;font-size: 16px;border: 1px black solid;text-align:center;}							
										</style>									
										<table class = "accountType" style = "border: 1px; margin-top:50px; text-align:center;">
											<tr>
												<th height="50px" width="50px" style = "background-color: white;"> <img src="images/logo.jpg" class = "logo"></th>
												<div><th  class = "titles"><a style = "font-size: 20px;color:#ffffff" href="registrati.asp?opzione=1">Socio ordinario</a></th>
												<th class = "titles"><a style = "font-size: 20px;color:#ffffff" href="registrati.asp?opzione=2">Socio sostenitore</a></th>
												<th class = "titles"><a style = "font-size: 20px;color:#ffffff" href="registrati.asp?opzione=3">Socio ordinario<br>+<br>tessera FMI Member</a></th>
												<th class = "titles"><a style = "font-size: 20px;color:#ffffff" href="registrati.asp?opzione=4">Socio sostenitore<br>+<br>tessera FMI Member</a></th>
											</tr>
											<tr>
												<th>Prezzo</th>
												<th style = "font-size: 24px;color:#ff0000">60&nbsp;&#8364.</th>
												<th style = "font-size: 24px;color:#ff0000">80&nbsp;&#8364.</th>
												<th style = "font-size: 24px;color:#ff0000">100&nbsp;&#8364.</th>
												<th style = "font-size: 24px;color:#ff0000">120&nbsp;&#8364.</th>
											</tr>
											<tr>
												<th>Affiliazione all'associazione</th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
											</tr>
											<tr>
												<th>Tessera dell'associazione AICS</th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
											</tr>
											<tr>
												<th>Copertura assicrativa</th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
											</tr>
											<tr>
												<th>Assistenza legale</th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
											</tr>
											<tr>
												<th>Accesso alla sede</th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
											</tr>
											<tr>
												<th>Inviti agli eventi</th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
											</tr>
											<tr>
												<th>Maglietta e adesivo omaggio</th>
												<th><img src="images/x 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
											</tr>
											<tr>
												<th>Precedenza nelle iscrizioni</th>
												<th><img src="images/x 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
											</tr>
											<tr>
												<th>Tesseramento alla<br>federazionemotociclistica</th>
												<th><img src="images/x 45x45.png"></th>
												<th><img src="images/x 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
												<th><img src="images/v 45x45.png"></th>
											</tr>
											<tr>
												<th height="50px" width="50px" style = "background-color: white;"> <img src="images/logo.jpg" class = "logo"></th>
												<div><th  class = "titles"><a style = "font-size: 20px;color:#ffffff" href="registrati.asp?opzione=1">Socio ordinario</a></th>
												<th class = "titles"><a style = "font-size: 20px;color:#ffffff" href="registrati.asp?opzione=2">Socio sostenitore</a></th>
												<th class = "titles"><a style = "font-size: 20px;color:#ffffff" href="registrati.asp?opzione=3">Socio ordinario<br>+<br>tessera FMI Member</a></th>
												<th class = "titles"><a style = "font-size: 20px;color:#ffffff" href="registrati.asp?opzione=4">Socio sostenitore<br>+<br>tessera FMI Member</a></th>
											</tr>
										</table>
								
											
										
											
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
                          