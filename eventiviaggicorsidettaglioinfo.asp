<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
Set tbeventoinfo = Server.CreateObject("ADODB.RecordSet")
SQL = "select descrizionet From eventi where id_sottotitolo=" & request("id") & " limit 1"
tbeventoinfo.Open SQL, connm
'response.write(SQL)
'response.end

%>
<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<body>

				
                <div>
                    <div class="product-content-center">
                        <div class="woocommerce">	
						
								
								
 
												
														<table align="center" width='100%' valign="middle"><tr><td width='100%' style="font-size:16px;">
														<%=tbeventoinfo("descrizionet")%>														
														</td></tr></table>	
														 
												 
								
								
											
										
											
						 </div>
					</div>
				</div>                        


<%tbeventoinfo.close%>
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->										
                          