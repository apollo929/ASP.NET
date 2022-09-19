<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
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
                        <h2>ACCEDI AL SITO WEB</h2>
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
            <div class="row">
                <div class="col-md-4">
                    <div class="single-sidebar" style="width:220px;left:0px">
                    </div>
                </div>		 
				
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">		
						
						
						<a style="position:relative;top:-80px;" name="topage"></a>	
						
														<table width="90%" height="39px" cellpadding="0" cellspacing="0" style="background-color:#f3f3f4;border-radius:5px;-webkit-border-radius:5px;-moz-border-radius:5px;">
											<tr><td class="tx16 nero grassetto"><div style="position:relative;left:20px;">ACCEDI</div></td></tr>
										</table>
										
										<table width="90%" cellpadding="0" cellspacing="0" class="tx14 nero">
											<tr><td height="20px"></td></tr>
											<form action="clienti.asp?ut=psw" method="post" id="Form2" name="form1">
											<tr><td align="left">UTENTE</td></tr>
											<tr><td height="5px"></td></tr>
											<tr><td align="left"><input type="text" name="utente" style="width:200px;height:30px;" maxlength="60" class="bordo_form"></td></tr>
											<tr><td height="5px"></td></tr>
											<tr><td align="left">PASSWORD</td></tr>
											<tr><td height="5px"></td></tr>
											<tr><td align="left"><input type="password" name="password" style="width:200px;height:30px;" maxlength="60" class="bordo_form"></td></tr>
											<tr><td height="10px"></td></tr>
											<tr><td align="left"><input type="submit" style="padding: 0;border: none;color:#ffffff;width:200px;height:45px;" value="ACCEDI" class="button"></td></tr>
											</form>
										</table>
										<br><br>
										<table width="90%" height="39px" cellpadding="0" cellspacing="0" style="background-color:#f3f3f4;border-radius:5px;-webkit-border-radius:5px;-moz-border-radius:5px;">
											<tr><td class="tx16 nero grassetto"><div style="position:relative;left:20px;">REGISTRATI / RECUPERA PASSWORD</div></td></tr>
										</table>
										
										<table width="90%" cellpadding="0" cellspacing="0">
											<tr><td height="20px"></td></tr>
											<tr>
												<td align="left">
													<button class="bott_carrellovisua" style="padding:0;border:none;width:220px;height:45px;" onClick="top.location.href='registrati.asp'">&nbsp;REGISTRATI&nbsp;</button><br><br>
													<button class="bott_carrellovisua" style="padding:0;border:none;width:220px;height:45px;  onClick="top.location.href='registrazionepersa.asp'">&nbsp;PASSWORD&nbsp;DIMENTICATA&nbsp;</button>
												</td>
											</tr>
										</table>
										<br><br>

							<br>
							
								
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
                          