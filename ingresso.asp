<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<%

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
			query="Select * From Amministratore where utente='" & utente & "' and password='" & password & "'"
			SET Tbut=connm.EXECUTE(query) 	
			if Tbut.eof or instr(1,lcase(request("utente")),"or")<>0 or instr(1,lcase(request("password")),"or")<>0 or sicurezza <> True then%>
					<script>   
					h=screen.width;   
					v=screen.height;   
					statuswin = window.open('', 'Stato', 'scrollbars=no,resizable=no,width=200,height=80');
					po=(h/2)-100;   
					pv=(v/2)-40;   
					statuswin.moveTo(po,pv);   
					statuswin.document.writeln('<html><head><title>Attendi...</title><link rel=stylesheet href=<%=sitourl%>/style.css></head><body bgcolor=<%=colorpopup%>>');   
					statuswin.document.writeln('<table width=100% height=100% bgcolor=<%=colorpopup%>><tr><td><strong valign=middle align=center >');   
					statuswin.document.writeln('<b><br>utente o password<br>errati!riprova</b>');   
					statuswin.document.writeln('</strong></td></tr></table></body></html>');   
					</script>	
  <%
			else
			 Session("Utentetipo")=Tbut("Utentetipo")
			 Response.Redirect "admin/adutentipro.asp?"
			end if
			
	  End if

       %>
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->  
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Accedi</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
                <div class="col-md-4">
			 
					
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">	
						
						
				
																	
										<table width="90%" cellpadding="0" cellspacing="0" class="tx14 nero">
											<tr><td height="20px">AREA RISERVATA</td></tr>
											<form action="ingresso.asp?ut=psw" method="post" id="Form2" name="form1">
											<tr><td align="left">Utente</td></tr>
											<tr><td height="5px"></td></tr>
											<tr><td align="left"><input type="text" name="utente" style="width:200px;height:30px;" maxlength="60" class="bordo_form"></td></tr>
											<tr><td height="5px"></td></tr>
											<tr><td align="left">Password</td></tr>
											<tr><td height="5px"></td></tr>
											<tr><td align="left"><input type="password" name="password" style="width:200px;height:30px;" maxlength="60" class="bordo_form"></td></tr>
											<tr><td height="10px"></td></tr>
											<tr><td align="left"><input type="submit" value="ACCEDI" class="button"></td></tr>
											</form>
										</table>
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