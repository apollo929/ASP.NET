<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%  

sub categorie(byval id)
	'controlla le offerte in corso (massimo 2)
	set rs = server.createobject("adodb.recordset")
	strsql = "select * from shop_categories order by catdescription"
	rs.open strsql,connm
	if not rs.eof then
		counter=0
		i=1
		do while not rs.eof
			response.write "<a class='tx16 nero lnk peso' href='shopmancat.asp?id=" & rs("categoryid") & "#primaindietro'>" &  ucase(rs("catdescription")) & "</a>"
			sottocategorie(rs("categoryid")) 
			rs.movenext
		loop		
	end if
	rs.close
end sub	

sub sottocategorie(byval id)
	'controlla le offerte in corso (massimo 2)
	set rss = server.createobject("adodb.recordset")
	strsql = "select * from shop_subcategories where categoria=" & cint(id) & " order by descrizione "
	rss.open strsql,connm
	if not rss.eof then
		counter=0
		do while not rss.eof
			response.write "<a class='tx12 azzurro' href='shopmancat.asp?id=" & rss("categoria") & "&subid=" & rss("codice") & "#primaindietro'>" &  ucase(rss("descrizione")) & "</a>"
			rss.movenext
		loop
	end if
	response.write("<hr>")
	rss.close
end sub	
%>
<!doctype html>
<html>
<!--#include file="head.inc" -->
<body onload="ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->    

   
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>SHOP PRODOTTI</h2>
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
						
					 
                
						<div class="col-md-8">
						<div class="product-content-right"> 
						<a style="position:relative;top:-80px;" name="primaindietro"></a>							
						<h2 class="related-products-title">shop prodotti </h2>
						<div class="single-product">


                    <div class="single-sidebar">                   
					
					<%categorie(1)%>				
										
                       
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