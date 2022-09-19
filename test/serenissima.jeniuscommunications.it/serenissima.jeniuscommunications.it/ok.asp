<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>MESSAGGIO INVIATO REGOLARMENTE</h2>
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
                             
								
								  
                                    
                         
									
							    <%if trim(request("nordine"))<>"" then %>
                                <h2>Ordine Inviato con Successo Numero:<b><%=request("nordine")%></b></h2>

												<table cellspacing="0" cellpadding="0" width="350px" border="1" class="tx14 nero">
													<tr><td colspan="2" height="10px">stampare o memorizzare il numero d'ordine</td></tr>
													<tr>
														<td class="tx18 rosso"><b>Totale + Iva</b><br></td>
														<td class="tx18 rosso" align="right"><b>&#8364;.&nbsp;<%=session("totcarta")%></b></td>
													</tr>
                                              
												</table>
											    <br><br>
						
							   <%else%>	
								 <h2>Mail inviata con successo</h2>
							   <%end if%>
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