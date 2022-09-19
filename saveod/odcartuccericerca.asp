<!--#include file="connessionesqlcar.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%

if Len(Trim(Request.Form("termscartucce")))<>0 then
cod_ric=Trim(Request.Form("termscartucce"))
else 
cod_ric=Replace(Trim(Request("termscartucce")),"%20"," ")
end if	
'SE NESSUNA RICERCA 
if cod_ric="" then response.redirect "articolonontrovato.asp"



Trovato=False
Sub Ricmodello(Byval cod_ricerca)
	Set Tbmodello = Server.CreateObject("ADODB.RecordSet")
	Set Tbmodelloc = Server.CreateObject("ADODB.RecordSet")	
	aring=split(cod_ricerca," ")						
	sSQL="select Modello.*,Marcauti.Marca FROM Modello INNER JOIN Marcauti ON Modello.tipologia = Marcauti.id where "
	for f=0 to ubound(aring)
		if trim(aring(f))<>"" then
			sSQL=sSQL & "Modello.Modello like '%" & trim(aring(f)) & "%' or "
		end if
	next
	sSQL=left(sSQL,len(sSQL)-4)
	'response.write(sSQL)
	'response.end
	'sSQL = "select Modello.*,Marcauti.Marca FROM Modello INNER JOIN Marcauti ON Modello.tipologia = Marcauti.id where Modello.Modello Like '%" & Trim(cod_ricerca) &  "%' order by Marca asc Limit 500"
	Tbmodello.Open sSQL,conn
	If not Tbmodello.EOF then
		i=0
		Do While not Tbmodello.eof
			'Controlla
			marca=trim(Tbmodello("id"))
			sSQLad = "select * From Modello_Disp_Add where Idmodello=" & Tbmodello("id") & " limit 1"
			Tbmodelloc.Open sSQLad,conn
			If not Tbmodelloc.EOF then
			    Trovato=True
	            response.Write "<a href='odcartuccelista.asp?mod=" & Replace(Ucase(Tbmodello("Modello"))," ","%20")  & "&id=" & request("Id") & "&Preisp=" & request("Preisp") & "&Modelloid=" & Tbmodello("id") & "#primaindietro' >(" & Ucase(Tbmodello("Marca"))  & ") - " & Ucase(Tbmodello("Modello")) & "</a><br>"
				i=i+1
	        end if
	        Tbmodelloc.close				
			Tbmodello.movenext				
		Loop		
	Else
		response.Write " "
	End if		
	Tbmodello.close	
End sub
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
                        <h2>CARTUCCE RICERCA</h2>
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
										counterfrm=1																								
									
										if trim(cod_ric)<>"" then 
										 call ricmodello(cod_ric)
									    end if	
								
										'codice costruzione composta con split
										aring=split(cod_ric," ")						
										sSQL="Select * from prodotti where categoria='consumabili' and "
										for f=0 to ubound(aring)
											if trim(aring(f))<>"" then
												if len(trim(aring(f)))>3 then sSQL=sSQL & " partnumber like '%" & trim(aring(f)) & "%' or "
												if len(trim(aring(f)))>3 then sSQL=sSQL & " codice_od like '%" & trim(aring(f)) & "%' or "
											end if
										next								
								        sSQL=left(sSQL,len(sSQL)-4) & " limit 30"	
								        
										Set tbst = Server.CreateObject("ADODB.RecordSet")							
										tbst.Open sSQL,connm
								        response.write("<br><h2>articoli legati a questa stampante</h2><br>")
										Do While not (tbst.eof)
											counterfrm=counterfrm+1
											i=i+1
											Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
											sSQLisp1 = "select * From prodotti where codice_buf='" & Trim(Tbst("Codice_buf")) & "' and codice_od='" & Trim(Tbst("Codice_od")) & "' limit 1"
											tbprodcatalogo.Open sSQLisp1, connm
											'response.Write(sSQLisp1)
											if lcase(trim(tbprodcatalogo("fornitore")))="od" then %>
											<!--#include file=ricercacatalogood.inc-->
											<%else%>
											<!--#include file=ricercacatalogobuffetti.inc-->
											<%end if							
											tbprodcatalogo.Close
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
    </div>




<!--#include file="foot.inc"-->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->									