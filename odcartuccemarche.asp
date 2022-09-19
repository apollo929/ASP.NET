<!--#include file="connessionesqlcar.inc"-->	
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
                        <h2>CARTUCCE MARCHE</h2>
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

							 
								
							<%  
							
 	 
							 Set Tbc = Server.CreateObject("ADODB.RecordSet")
							 sSQL = "select * From MarcaUti where visibile='true' order by Marca asc"
								Tbc.Open sSQL,conn
								'response.write(sSQL)
								If not Tbc.EOF then
								    'response.write(sSQL)
									response.write("<BR><BR><TABLE border='0' valign='TOP' cellspacing='0' cellpadding='0' width=90%  ><TR><td width=50px></td><TD valign='top' height=15  align=left >")
									I=0
									Controlla="True"
									Do While not Tbc.eof
										'Controlla
										marca=trim(Tbc("id"))
										Response.Write "<a class='tx16 nero lnk' href='odcartuccesottomarche.asp?id=" & marca & "&Preisp=" & Tbc("Preisp") & "#primaindietro'><img  src='img/ico_freccia.png' border='0'> " & UCase(Tbc("Marca"))  & " </a> <br>"
										Tbc.movenext
										I=I+1										
										If I=23  then
										  Response.Write "</TD><TD height=15 valign='MIDDLE'   align=left>"
										  I=0
										End if  
										
									loop
								else
									Controlla="False"		
								end if
								Response.Write "</TD></TR><tr><td height='20px'></td></tr></TABLE>"				
								Tbc.close
						
							 
							%>
									
							<br>
							
					
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