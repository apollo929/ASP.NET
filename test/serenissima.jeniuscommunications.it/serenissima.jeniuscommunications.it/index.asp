<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->

<%  


    'reset cookies
	Response.Cookies("MyCookie")=""
    sicurezza=True
    'Utente?
    if trim(request("ut"))="psw" then			
			'Sicurezza
	     	if sicurezza=false then
			  Response.Redirect "errore.asp"
			end if 
			session.lcid=1040
			utente=request("utente")
			password=request("password")
			query="Select * from amministratore where utente='" & utente & "' and password='" & password & "'"
			set tbut=connm.execute(query) 	
			if tbut.eof or instr(1,lcase(request("utente")),"or")<>0 or instr(1,lcase(request("password")),"or")<>0 or sicurezza <> True then%>

						<div id="basic" class="well" style="max-width:44em;"> 
							  <a href="contattaci.asp"> <img src="images/pswerrata.jpg" border=0></a><br>
							<button class="basic_close btn btn-default">Chiudi</button>
						</div>	
  <%
			else
			 'session utente
			 session("loginid")=tbut("id")
			 session("logintipo")=tbut("utentetipo")
			 session("loginnominativo")=tbut("nome") & " - " & tbut("cognome")
			 session("loginmail")=tbut("email") 
			 session("logintel")=tbut("telefono") 
			 session("loginprovincia")=tbut("provincia") 
			 session("loginsede")=tbut("sede") 
			 'cookies salvataggio  e reset 
             Response.Cookies("MyCookie")=""
			 Response.Cookies("MyCookie").Expires = DateAdd("d", 1, Date)	 
			 Response.Cookies("MyCookie")("1") = tbut("id")
			 Response.Cookies("MyCookie")("2") = tbut("utentetipo")
			 Response.Cookies("MyCookie")("3") = tbut("nome") & " - " & tbut("cognome")
			 Response.Cookies("MyCookie")("4") = tbut("email") 
			 Response.Cookies("MyCookie")("5") = tbut("telefono") 
			 Response.Cookies("MyCookie")("6") = tbut("provincia")
			 Response.Cookies("MyCookie")("7") = tbut("sede")
			 tbut.close
			 Response.Redirect "admin/adindex.asp?log=ok"
			end if
			
	  End if

       %>


<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.8.2.min.js"></script>
<!-- jQuery Popup Overlay -->
<script src="jquery.popupoverlay.js"></script>
<!-- Set defaults -->
<script>
$(document).ready(function () {
	$.fn.popup.defaults.pagecontainer = '.container'
});
</script><!-- Basic -->
<script>
$(document).ready(function () {
  $('#basic').popup({
	autoopen: true, /* per non far aprire al caricamento impostare su false */
	transition: 'all 0.3s',
	scrolllock: true
  });
});
</script>
<script>
$(document).ready(function () {
  $('#active_bg').popup({
	backgroundactive:true
  });
});
</script>
<body>
    <!--#include file="top.inc" -->
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>AREA RISERVATA</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
                <div class="col-md-4" width="450px" style="background-image:url(images/sfondo-login.gif);background-repeat:no-repeat; background-position:right;background-position:top;">
					
                
                <div class="col-md-8" >
                    <div class="product-content-right">
                        <div class="woocommerce" >	
						
						
				            <center>
																	
										<table width="90%" cellpadding="0"  valign="top" cellspacing="0" class="tx14 nero" border=0>
											<tr><td height="20px"></td></tr>
											<form action="index.asp?ut=psw" method="post" id="formareariservata" name="formareariservata">
											<tr><td align="left"><img src="images/user.gif">   Utente</td></tr>
											<tr><td height="5px"></td></tr>
											<tr><td align="left"><input type="text" name="utente" style="width:200px;height:30px;" maxlength="60" class="bordo_form"></td></tr>
											<tr><td height="5px"></td></tr>
											<tr><td align="left"><img src="images/psw.gif">   Password</td></tr>
											<tr><td height="5px"></td></tr>
											<tr><td align="left"><input type="password" name="password" style="width:200px;height:30px;" maxlength="60" class="bordo_form"></td></tr>
											<tr><td height="10px"></td></tr>
											<tr><td align="left"><input type="submit" value="ACCEDI" class="button"></td></tr>
											</form>
										</table>
										
										<br><br>
										
										<table width="90%" cellpadding="0" cellspacing="0">
											<tr><td height="20px"></td></tr>
											<tr>
												<td align="left">
													<button class="bott_carrellovisua" onClick="top.location.href='contattaci.asp'">&nbsp;REGISTRATI&nbsp;</button><br><br>
													<button class="bott_carrellovisua" onClick="top.location.href='registrazionepersa.asp'">&nbsp;PASSWORD&nbsp;DIMENTICATA&nbsp;</button>
												</td>
											</tr>
											<tr><td height="50px"></td></tr>
											<!----tr>
												<td align="left">
													<button class="bott_carrellovisua" onClick="top.location.href='contattaci.asp'">INSERT.&nbsp;LEAD&nbsp;/CONTATTO&nbsp;</button><br><br>												
												</td>
											</tr--->
										</table>
										<br><br>
						
							 </center>
					
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