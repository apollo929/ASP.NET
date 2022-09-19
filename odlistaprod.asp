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
                        <h2>CATALOGO <%=Session("ragionesocialetesto")%></h2>
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
						<a style="position:relative;top:-80px;" name="odposizione"></a>							
						
						
										<div class="single-product">
											<%
											'Query
											querylistcat="Select sottocategoria,categoria,nome_prodotto From prodotti where sottocategoria='" & Trim(Replace(Request("sotto"),"%20"," ")) & "' and fornitore like '%od%' and aboliti='0' group by nome_prodotto order by nome_prodotto"
											Set tblistcat = Server.CreateObject("ADODB.RecordSet")				
											tblistcat.Open querylistcat,connm
											'response.write(querylistcat)
											'response.end
											Do While not (tblistcat.eof)%>
											
											
												<div style="height:35px;" class="col-md-3">
												<div class="single-shop-product">
												<%
												Response.Write "<a style='font-size:11px;' class='m_scritte' href='odlistaprod.asp?nomeprodotto=" & replace(tblistcat("nome_prodotto")," ","%20") & "&sotto=" & request("sotto") & "#odposizione'>" & ucase(tblistcat("nome_prodotto"))  & "</a>"
												%>
												</div>	
												</div>	
												
								
											<%tblistcat.movenext
											Loop
											tblistcat.close
											%>
											
										</div>
						
						                
										<div class="single-product">
											<br>
											<form name="form" method="post" action='odlistaprod.asp?nomeprodotto=<%=Trim(Replace(Request("nomeprodotto")," ","%20"))%>' ID="Form1">
											<div style="float:left;">Ordina per:</div>
											<div style="float:left;">
											<select class="tx2 nero" id="ricerca" name="ricerca" size="1">
											<option value="p1 asc" >ordina per prezzo minore</option>
											<option value="p1 desc">ordina per prezzo maggiore</option>
											<option value="marchio asc">ordina per nome della marca </option>
											<option value="foto desc">articoli con foto</option>
											</select>	
											</div>	
											<div style="float:left;">										
											<INPUT type="image" style="position:relative;top:-5px;" border="0" width="30px"  src="img/search_blue_s.png"  ><br><br></div>
											</form>
										
										</div>
									
							
									
									<!-- ricerca x ordine -->  
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
									if Trim(cstr(Replace(Request("Ricerca"),"%20"," ")))<>"" then
									 	vordine=Trim(cstr(Replace(Request("Ricerca"),"%20"," ")))
									else
										 vordine=" giacenza desc "
									end if
									
									'Query
									querydcount="Select count(*) as Tot From prodotti where nome_prodotto='" & Trim(Replace(Request("nomeprodotto"),"%20"," ")) & "' and fornitore like '%od%'"
									Set Tbcount = Server.CreateObject("ADODB.RecordSet")				
									Tbcount.Open querydcount,connm
									
									npaginecat=Formatnumber(Cint(Tbcount("Tot")) / 20,0)
									npaginemax=Cint(Tbcount("Tot"))
									Tbcount.close
									'controllo
									'response.Write(npaginemax)		
									'response.Write(npaginecat)						
									queryd2="Select * From prodotti where nome_prodotto='" & Trim(Replace(Request("nomeprodotto"),"%20"," ")) & "' and fornitore like '%od%' order by  " & vordine & "  LIMIT " & paginasp & " , " & Divpagine
									Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")	
									tbprodcatalogo.Open queryd2,connm
									'controllo
									'response.Write(queryd2)
									
									
									counterfrm=20
									Do While not (tbprodcatalogo.eof)
										counterfrm=counterfrm+1
										'Nuovo_Prodotto=Ucase(Trim(tbprodcatalogo("Nuovoprodotto")))
										%>
										<!--#include file=ricercacatalogood.inc-->
										<%
										
										tbprodcatalogo.movenext
									Loop
									tbprodcatalogo.close%>
										   
									 
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
									<button class="bott_lista_p" onClick="top.location.href='odlistaprod.asp?pagsp=<%=fsp%>&sotto=<%=request("sotto")%>&nomeprodotto=<%=request("nomeprodotto")%>'"><%=fsp+1%></button>

										<%end if 
									end if 
									'Response.Write "</a>"
									next%> </strong>   
									   </div>
                </div>
            </div>
									
				
				
            </div>
        </div>
    </div>
	
        <div class="container">
            <div class="row">
                		
						
						

				
				<h2 class="product-wid-title">Marchi / Brand </h2>
				<div class="single-shop-product">
											<%
											'Query
											querylistcat="Select marchio,sottocategoria,categoria From prodotti where sottocategoria='" & Trim(Replace(Request("sotto"),"%20"," ")) & "' and fornitore like '%od%' and aboliti='0' group by marchio order by marchio"
											Set tblistcat = Server.CreateObject("ADODB.RecordSet")				
											tblistcat.Open querylistcat,connm
											'response.write(querylistcat)
											Do While not (tblistcat.eof)%>
											
											
											 	<div style="height:25px;" class="col-md-2">
												<div class="single-shop-product">
												<%
												Response.Write "<a class='m_scritte'  href='odmarchio.asp?sotto=" & replace(tblistcat("sottoCategoria")," ","%20") & "&marchio=" & replace(tblistcat("marchio")," ","%20") & "#odposizione'>" & ucase(tblistcat("marchio"))  & "</a>"
												%>
												</div>	
										 </div>	
											<%tblistcat.movenext
											Loop
											tblistcat.close
											%> 
				</div> 
				


									
				
				
            </div>
        </div>
    </div>
	

    
<!--#include file="foot.inc"-->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->