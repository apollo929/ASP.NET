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
					
                        <ul>
					
								<%'Catalogo
										if trim(request("cat"))="" then
										 queryd1="Select Distinct Categoria From prodotti where fornitore='Gruppo Buffetti S.p.A.' order by Categoria asc"
										else
										 queryd1="Select Distinct Categoria From prodotti where fornitore='Gruppo Buffetti S.p.A.' and categoria='" & request("cat") & "' order by Categoria asc"
										end if
										Set Tbc = Server.CreateObject("ADODB.RecordSet")
										Tbc.Open queryd1,connm
										Do While not Tbc.eof	
											if trim(Tbc("categoria"))<>"Altro" then
													txt_categoria=trim(replace(replace(Tbc("categoria"),"%20"," "),"'","`"))				 
													response.Write "<li><h2><font color='#072466'><img align='center' valign='middle' src='img/ico_freccia.png' border='0'>&nbsp;" & Ucase(Tbc("Categoria")) & "</font></h2></li>"
													queryd2="Select Distinct SottoCategoria,Categoria from prodotti where fornitore='Gruppo Buffetti S.p.A.' and Categoria='" & Tbc("categoria") & "' order by SottoCategoria asc"
													'response.Write(queryd2)
													'response.end
													Set Tbst = Server.CreateObject("ADODB.RecordSet")
													Tbst.Open queryd2,connm
													Do While not Tbst.eof														
														Response.Write "<li><a class=m_scritte href='catbuffettilista.asp?id=" & Replace(Tbst("SottoCategoria")," ","%20") & "&cat=" & Replace(Tbst("Categoria")," ","%20") & "#buffposizione'>&nbsp;" & ucase(Tbst("SottoCategoria"))  & "</a></li>"			
														Tbst.movenext
													Loop
													Tbst.Close						
											end if
											Tbc.movenext
										Loop
										Tbc.close
										%> 
										
										       </ul>
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