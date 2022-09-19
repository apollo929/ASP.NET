<!--#include file="connessionesqlcar.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%  
Sub Insmodello
Set Tb = Server.CreateObject("ADODB.RecordSet")
Set Tbadd = Server.CreateObject("ADODB.RecordSet")
sSQL = "select * From Modello where Tipologia=" & cdbl(Request("Id")) &  " order by Modello"
Tb.Open sSQL,conn
If not Tb.EOF then			
	I=0
	response.write("<TABLE border='0' valign=top cellspacing='0' cellpadding='0' width='100%'><tr><td height='10px'></td></tr><TR><td width='10px'></td><TD valign=top  align=left >")
	Do While not Tb.eof
		'Controlla
		marca=trim(Tb("Id"))
		sSQLad = "select * From Modello_Disp_Add where Idmodello=" & Tb("ID")
		Tbadd.Open sSQLad,conn
		if not Tbadd.EOF then
            Response.Write "<a class='12 nero lnk' href='odcartuccelista.asp?marca=" & Replace(Ucase(Tb("Modello"))," ","%20")  & "&id=" & request("Id") & "&Preisp=" & request("Preisp") & "&Modelloid=" & Tb("Id") & "#primaindietro'><img align=center valign=middle src='img/ico_freccia.png' border='0'> " & UCase(Tb("Modello"))  & "</a><br>"
			I=I+1
        end if
        Var=request("Preisp")
        if i=500 AND not Tbadd.EOF then
            Response.Write "</TD><TD valign=top  align=left>"
            i=0
        end if      
       
		Tbadd.close				
		Tb.movenext				
	Loop			
Else
	Response.Write "------------------"
End if
	
Response.Write "</TD></TR><tr><td height='10px'></td></tr></TABLE>"
Tb.close	
End sub
'x data	
session.lcid=1040         
'Ricerca marca
sSQL = "select * From MarcaUti where id=" & cdbl(request("id"))
Set Tbmarche = Server.CreateObject("ADODB.RecordSet")
Tbmarche.Open sSQL,conn
ScrittaMarca=Tbmarche("Marca")		  
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
                        <h2>CARTUCCE STAMPANTI E MODELLI</h2>
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
				<a style="position:relative;top:-80px;" name="primaindietro"></a>	
				<!--#include file="odcartucce.asp"-->				
				<form action="odcartuccericerca.asp#primaindietro" method="get" id="formcartuccericerca" name="formcartuccericerca" >
				<input type="text" style="height:45px;width:250px;" id="termscartucce" name="termscartucce"  placeholder="modello stampante" ><input type="submit" style="height:45px;" value="Search">
				</form>	
				<br><br>	
					
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
							        
								
						
									<%Response.Buffer = True%>  
									<div id="loadingimg"><img width="200px" src="images/loading.gif"></div>
									<%
									Response.Flush
									%>
									<p>


									<br>
									<%Insmodello%>
									<br>
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