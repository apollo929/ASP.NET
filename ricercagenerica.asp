<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
if Len(Trim(Request.Form("terms")))<>0 then
	cod_ric=Trim(Request.Form("terms")) & " "
else 
	cod_ric=Trim(Request("terms")) & " "
end if
lung_cod_ric=len(cod_ric)
cod_ric=left(cod_ric,lung_cod_ric-1)
'SE NESSUNA RICERCA 
if cod_ric="" then response.redirect "articolonontrovato.asp"

%>                      
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
                         <h2>Art. Trovati <%=ucase(cod_ric)%></h2>
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
						<h2 class="related-products-title">Ricerca Prodotto</h2>
       
								<%Response.Buffer = True%>  
								<div id="loadingimg"><img width="200px" src="images/loading.gif"></div>
								<%
								Response.Flush
								%>
								<p>
				
								<%
							
								
								'############# CODICE RICERA AFFINATO  PHP
								'############# CODICE RICERA AFFINATO  PHP
								'############# CODICE RICERA AFFINATO  PHP
								cod_ric=replace(replace(replace(replace(replace(replace(replace(replace(replace(cod_ric," il "," ")," per "," ")," un "," ")," la "," ")," e "," ")," una "," ")," it","-it")," a "," ")," con "," ")
								'SELECT * FROM prodotti_mondadori  WHERE (codice_prodotto LIKE '%maurizio%' AND codice_prodotto LIKE '%de%' AND codice_prodotto LIKE '%giovanni%') OR (descrizione LIKE '%maurizio%' AND descrizione LIKE '%de%' AND descrizione LIKE '%giovanni%') OR (autori LIKE '%maurizio%' AND autori LIKE '%de%' AND autori LIKE '%giovanni%') OR (codice_originale LIKE '%maurizio%' AND codice_originale LIKE '%de%' AND codice_originale LIKE '%giovanni%') order by autori asc 
								aring=split(trim(cod_ric)," ")						
								sSQL="SELECT descrizione1,codice_buf,partnumber,codice_od,descrizione,fornitore FROM prodotti where (codice_buf<>'' or codice_od<>'') and "
								sSQL1=""
								sSQL2=""
								sSQL3=""
								sSQL4=""
								sSQL5=""
								for f=0 to ubound(aring)
									if trim(aring(f))<>"" then	
									'response.write(cstr(trim(aring(f))) & f & "ciaooo<br>")
												sSQL1=sSQL1 & "descrizione like '%" & cstr(trim(aring(f)))  & "%' and  "
												'sSQL2=sSQL2 & "partnumber like '%" & cstr(trim(aring(f)))  & "%' and  "
												sSQL3=sSQL3 & "codice_od like '%" & cstr(trim(aring(f)))  & "%' and  "
												sSQL4=sSQL4 & "codice_buf like '%" & cstr(trim(aring(f)))  & "%' and  "
												'sSQL5=sSQL5 & "descrizione1 like '%" & cstr(trim(aring(f)))  & "%' and  "
									end if
								next
								'response.write(cstr(trim(aring(f))) & f & "ciaooo<br>")
								sSQL1="(" & left(sSQL1,len(sSQL1)-5) & ")"
								'sSQL2="(" & left(sSQL2,len(sSQL2)-5) & ")"
								sSQL3="(" & left(sSQL3,len(sSQL3)-5) & ")"
								sSQL4="(" & left(sSQL4,len(sSQL4)-5) & ")"
								'sSQL5="(" & left(sSQL5,len(sSQL5)-5) & ")"
								sSQL=sSQL & sSQL1 & " or " &  sSQL3 & " or " &  sSQL4 '& " or " &  sSQL5
								sSQLec=" union SELECT cdescription,ccode,cname,catalogid,cimageurl,fornitore FROM shop_products where "
								'sSQLec1=""
								sSQLec2=""
								sSQLec3=""
								for f=0 to ubound(aring)
									if trim(aring(f))<>"" then	
												'response.write(cstr(trim(aring(f))) & f & "ciaooo<br>")
												'sSQLec1=sSQLec1 & "cdescription like '%" & cstr(trim(aring(f)))  & "%' and  "
												sSQLec2=sSQLec2 & "ccode like '%" & cstr(trim(aring(f)))  & "%' and  "
												sSQLec3=sSQLec3 & "cname like '%" & cstr(trim(aring(f)))  & "%' and  "
									end if
								next
								'response.write(cstr(trim(aring(f))) & f & "ciaooo<br>")
								'sSQLec1="(" & left(sSQLec1,len(sSQLec1)-5) & ")"
								sSQLec2="(" & left(sSQLec2,len(sSQLec2)-5) & ")"
								sSQLec3="(" & left(sSQLec3,len(sSQLec3)-5) & ")"								
								sSQLec=sSQLec & sSQLec2 & " or " &  sSQLec3  								
								sSQLtot=sSQL & sSQLec & " order by fornitore asc limit 180"
								'response.write(sSQLtot & " >>>> TEST SQL <<<<")		
								'response.Write(sSQLtot & "<hr>")
								'response.end
								Set tbst = Server.CreateObject("ADODB.RecordSet")							
								tbst.open sSQLtot,connm							
								'############# CODICE RICERA AFFINATO PHP
								'############# CODICE RICERA AFFINATO PHP
								'############# CODICE RICERA AFFINATO PHP

								iod=1
								ibuffetti=1
								iecommerce=1
								i=0
								Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
								Do While not (tbst.eof) and i<>180
									counterfrm=counterfrm+1
									i=i+1
									sSQLisp1=""
									if lcase(trim(tbst("fornitore")))="od" and iod=<60 then
										iod=iod+1											
										sSQLisp1 = "select * from prodotti where codice_od='" & Trim(tbst("codice_od")) & "' limit 1"										
										tbprodcatalogo.Open sSQLisp1, connm
										if not tbprodcatalogo.eof then %>
											<!--#include file=ricercacatalogood.inc-->
									<%  end if
										tbprodcatalogo.close												
									end if
									'buffetti controllo errori
									if lcase(trim(tbst("fornitore")))="gruppo buffetti s.p.a." and ibuffetti=<60  then 	
										ibuffetti=ibuffetti+1 										    
										sSQLisp1 = "select * From prodotti where codice_buf='" & Trim(tbst("codice_buf")) & "' limit 1"										
										tbprodcatalogo.Open sSQLisp1, connm
										if not tbprodcatalogo.eof then%>
											<!--#include file=ricercacatalogobuffetti.inc-->
									<%   end if
									   tbprodcatalogo.close
									end if
									'response.write(lcase(trim(tbst("fornitore"))))
									if lcase(trim(tbst("fornitore")))="ecommerce" and iecommerce=<60 then
										iecommerce=iecommerce+1											
										sql="SELECT shop_products.*, shop_products.catalogID, shop_products.catalogID AS shownID from shop_products WHERE shop_products.ccode='" & Trim(tbst("codice_buf")) & "' limit 1 "
										tbprodcatalogo.open Sql,connm
										if not tbprodcatalogo.eof then												
										%>
										<!--#include file=ricercacatalogomanuale.inc-->
										<%   
										end if
										tbprodcatalogo.close
									end if		
									tbst.movenext
								Loop
								tbst.close%>
				
							
								<br>
								
							</p>

							<%
							
							Response.Flush
							%>
							<script language="javascript">
							<!--
							document.getElementById("loadingimg").style.display="none";
							//-->
							</script>
							
					
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