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
                        <h2>ARCHIVIO BUFFETTI </h2>
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
						<h2 class="related-products-title">REGISTRATORI Buffetti  </h2>
						<div class="single-product">


					                  
						
			<%
										'Pagine
										Divpagine=20
										'Pagine gestione
										paginasp=request("Pagsp")
										if paginasp="" then 
											paginasp=0
										else 
											paginasp=cint(paginasp)*Divpagine
										end if
										
										
										'Query
										querydcount="Select count(*) as Tot From prodotti where descrizione like '%regist%' and codice_buf like '78%' and fornitore like '%buffetti%'"
										Set Tbcount = Server.CreateObject("ADODB.RecordSet")				
										Tbcount.Open querydcount,connm
										
										npaginecat=Formatnumber(Cint(Tbcount("Tot")) / 20,0)
										npaginemax=Cint(Tbcount("Tot"))
										Tbcount.close
									
										'query x nome prodotto
										Set Tbst = Server.CreateObject("ADODB.RecordSet")
										querydp="Select * From prodotti where descrizione like '%regist%'  and codice_buf like '78%' and fornitore like '%buffetti%' order by p1 asc "
										'response.Write(querydp)
										Tbst.Open querydp,connm
										
																
										'response.Write(queryd2)
										i=0
										counterfrm=10
										Do While not (Tbst.eof)
											counterfrm=counterfrm+1
											i=i+1
											Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
											sSQLisp1 = "select * From prodotti where codice_buf='" & Trim(Tbst("Codice_buf")) & "'  limit 1"
											tbprodcatalogo.Open sSQLisp1, connm%>
												<!--#include file=ricercacatalogobuffetti.inc-->
											<%							
											tbprodcatalogo.Close
											Tbst.movenext
										Loop
										'response.Write(i)
										Tbst.close%>	
						
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