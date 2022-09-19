<!--#include file="connessionesqlcar.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
'SE NESSUNA RICERCA 
if clng(Request("modelloId"))="" or clng(Request("modelloId"))=0  then response.redirect "articolonontrovato.asp"
%>  
<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->  
    <%Response.Buffer = True%>  
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>CARTUCCE <%=ucase(request("preisp"))%>  <%=ucase(request("mod"))%></h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
                <div class="col-md-4">
				<!--#include file="menusx.inc" -->	
				<!--#include file="odcartucce.asp"-->				
				<form action="odcartuccericerca.asp#primaindietro" method="get" id="formcartuccericerca" name="formcartuccericerca" >
				<input type="text" style="height:45px;width:250px;" id="termscartucce" name="termscartucce"  placeholder="modello stampante" ><input type="submit" style="height:45px;" value="Search">
				</form>	
				<br><br>
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
						
									<a name="primaindietro"></a>
									
									<%Response.Buffer = True%>  
									<div id="loadingimg"><img width="200px" src="images/loading.gif"></div>
									<%
									Response.Flush
									%>
									<p>						
									<%  
									session.lcid=1040
									Dim Mprezzo	  										
									counterfrm=1000
									'Set Recordset						              
									Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")	
									Set Tbmod = Server.CreateObject("ADODB.RecordSet") 									
									sSQL = "select Modello.*,modello_disp_add.* FROM Modello INNER JOIN modello_disp_add ON Modello.id = modello_disp_add.idmodello where modello_disp_add.idmodello=" & clng(Request("modelloId")) 
									Tbmod.Open sSQL, conn	
									if not Tbmod.eof then 
									   response.write("<h2>" & ucase(Request("marca")) & " - " & Tbmod("modello")  & "</h2>")
									else
                                       response.redirect "articolonontrovato.asp"
									end if	
									Do While not Tbmod.eof
										'queryd2="Select * from prodotti where codice_od='" & Tbmod("Codice_isp")  & "' or (codice_buf like '%" & left(right(Tbmod("Codice_isp"),7),5)  & "%' and descrizione like '%comp %') order by fornitore desc"
										'response.write(queryd2)
                                        queryd2="Select * from prodotti where codice_od='" & Tbmod("Codice_isp")  & "' order by codice_od asc"										
										tbprodcatalogo.Open queryd2,connm																						
										Do While not (tbprodcatalogo.eof)
											counterfrm=counterfrm+1
											 %> 		
											<!--#include file=ricercacatalogood.inc-->															
											<%
											tbprodcatalogo.movenext
										Loop
										tbprodcatalogo.close								
									Tbmod.MoveNext		        
									Loop	
									Tbmod.close	
									
									%>	
						
									
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
    </div>


<!--#include file="foot.inc"-->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->									