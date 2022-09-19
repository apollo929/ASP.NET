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
						<h2 class="related-products-title">Cancelleria BUFFETTI</h2>


					                  
						
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
										querydcount="Select count(*) as Tot From prodotti where SottoCategoria='" & Trim(Replace(Request("id"),"%20"," ")) & "' and codice_buf<>'' limit 1"
										Set Tbcount = Server.CreateObject("ADODB.RecordSet")				
										Tbcount.Open querydcount,connm
										
										npaginecat=Formatnumber(Cint(Tbcount("Tot")) / 20,0)
										npaginemax=Cint(Tbcount("Tot"))
										Tbcount.close
									
										'query x nome prodotto
										Set Tbst = Server.CreateObject("ADODB.RecordSet")
										querydp="Select * From prodotti where Sottocategoria='" & Trim(Replace(Request("id"),"%20"," ")) & "'  and codice_buf<>'' order by codice_buf desc LIMIT " & paginasp & " , " & Divpagine
										'response.Write(querydp)
										Tbst.Open querydp,connm
										
										
										if	not (Tbst.eof) then			
											'response.Write("<br>")									
											'Response.write "<br><a href='catbuffetti.asp' class='tx12 azzurro lnk'><b>" & Ucase(Tbst("Categoria")) & "</a>&nbsp;&nbsp;--&nbsp;&nbsp;<font class='tx3 grigioscuro'>" & Ucase(Tbst("SottoCategoria")) & "</font></b><br><br>"
										else
											queryd2="Select * From prodotti where Sottocategoria='" & Trim(Replace(Request("id"),"%20"," ")) & "' codice_buf<>'' LIMIT " & abs(npaginemax-Divpagine) & " , " & Divpagine
											Tbst.Close	
											Tbst.Open queryd2,conn
											'controllo
											'response.Write(queryd2)
										end if
										
										'response.Write(queryd2)
										i=0
										counterfrm=10
										Do While not (Tbst.eof)
											counterfrm=counterfrm+1
											i=i+1
											Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
											sSQLisp1 = "select * From prodotti where codice_buf='" & Trim(Tbst("Codice_buf")) & "' order by codice_buf desc"
											tbprodcatalogo.Open sSQLisp1, connm%>
												<!--#include file=ricercacatalogobuffetti.inc-->
											<%							
											tbprodcatalogo.Close
											Tbst.movenext
										Loop
										'response.Write(i)
										%>	
						
						</div>
						</div>		
						</div>	
						<br><br>
						</div>
						            <div class="row">
                <div class="col-md-12">
                    <div class="product-pagination text-center">
							<strong>
							<%paginabol=false
							 for fsp=0 to npaginecat-1								 										        
									if trim(request("pagsp"))=cstr(fsp) then%>
									<button class="bott_lista_p_black"><%=fsp+1%></button>
								<%else
									if trim(request("pagsp"))="" and paginabol=false then%>
										<button class="bott_lista_p_black">1</button>
										<%paginabol=true
									else%>
										<button class="bott_lista_p" onClick="top.location.href='catbuffettilista.asp?pagsp=<%=fsp%>&id=<%=Trim(Replace(Request("id")," ","%20"))%>&cat=<%=Trim(Replace(Request("cat")," ","%20"))%>&ricerca=<%=Trim(Request("ricerca"))%>'"><%=fsp+1%></button>
									<%end if 
								end if 
								'Response.Write "</a>"
							 next
							 Tbst.close%> </strong>                        
               		   </div>
                </div>
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