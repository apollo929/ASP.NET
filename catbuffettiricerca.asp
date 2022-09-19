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
                         <h2><%=Session("ragionesocialetesto")%></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
						
						<!--#include file="menusx.inc" -->
                
						<div class="col-md-8">
						<div class="product-content-right"> 
						<a style="position:relative;top:-80px;" name="buffposizione"></a>	      
						<h2 class="related-products-title">Cancelleria Buffetti</h2>
						<div class="single-product">


                    <div class="single-sidebar">                   
					
                      
					

							<%
							if Len(Trim(Request.Form("codiceispf")))<>0 then
							cod_ric=Trim(Request.Form("codiceispf"))
							else 
							cod_ric=Trim(Request("codiceispf"))
							end if
							'costruzione composta con split
							aring=split(cod_ric," ")
							sSQL="Select * from prodotti  where codice_buf<>'' and ("
							for f=0 to ubound(aring)
							 if len(trim(aring(f)))>4 then sSQL=sSQL & "descrizione1 like '%" & mid(trim(aring(f)),1,len(trim(aring(f)))-1) & "%' or "
							next
							sSQL=left(sSQL,len(sSQL)-4)			
							sSQLisp1 = sSql & " )  order by p1 asc limit 170"
							'controllo 2 righe
							'response.write(sSQLisp1)
							'response.end
							Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
							tbprodcatalogo.Open sSQLisp1,connm			
							'se ricerca non a buon fine
							if not tbprodcatalogo.Eof then 
								counterfrm=10
								Do While not (tbprodcatalogo.eof)%>
									<!--#include file=ricercacatalogobuffetti.inc-->
									<%
								tbprodcatalogo.movenext
								Loop
								tbprodcatalogo.close
							else
								tbprodcatalogo.close
								Response.Redirect "catbuffetti.asp?ric=nn" 
							end if                        %>
						
								
										
										  
                    </div>
                </div>
						</div>		
						</div>	
						<br><br>
						</div>
									
				
				
            </div>
        </div>
    </div>
	
        <div class="container">
            <div class="row">
                		
						
						

				
				<!--#include file="shopfooter4.inc"-->
				


									
				
				
            </div>
        </div>
    </div>
	

    
<!--#include file="foot.inc"-->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->