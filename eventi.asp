<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
sql="SELECT * FROM eventi_titolo INNER JOIN eventi_sottotitolo ON eventi_titolo.categoryID = eventi_sottotitolo.categoria INNER JOIN eventi ON eventi.categoria = eventi_sottotitolo.categoria group by id_sottotitolo order by categoryID asc,id_sottotitolo asc"
Set tbevento = Server.CreateObject("ADODB.RecordSet")
'SQL = "select eventi_sottotitolo.id,eventi_sottotitolo.*,eventi_titolo.catdescription,eventi_titolo.datainizioevento,eventi_titolo.datafineevento From eventi_sottotitolo INNER JOIN  eventi_titolo ON eventi_sottotitolo.categoria = eventi_titolo.categoryid where eventoviaggiocorso='evento' order by codice asc,categoryID asc"
tbevento.Open SQL, connm
'response.write(SQL)

%>
<!DOCTYPE html><html>
<!--#include file="head.inc" -->
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->  
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>EVENTI HATseries.com</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    <%if mobile<>"ok" then %> 
    <div class="single-product-area">
	<%else%>
	<div class="single-product-area2">
	<%end if%>
        <div class="zigzag-bottom"></div>
        <div class="container">
                <div class="col-md-4">
				<!--#include file="menusx.inc" -->		 
				
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">	
						
						<a style="position:relative;top:-80px;" name="topage"></a>
								
													<script type="text/javascript">
													function eventidettaglio(id)
													{												
													location.href = 'eventiviaggicorsidettaglio.asp?id='+id+'#topage';
													}
													</script>
								
								
											<link href="prova.min.css" rel="stylesheet">
											<%if mobile<>"ok" then %> 
											<div class="row" style="width:1100px">
											<%else%>
											<div class="row" >
											<%end if%>
											<ul class="event-list">
											
											
											<%
											
											counti=0
											do while not tbevento.eof
											counti=counti+1%>
											  <li onclick="eventidettaglio('<%=tbevento("categoria")%>');" style="cursor: pointer;">											   
												<%
												if counti=1 then response.write("<time style='background-color:#ff0000;color:#ffffff;'>")											
												if counti=2 then response.write("<time style='background-color:#0072B5;color:#ffffff;'>")
												if counti=3 then response.write("<time style='background-color:#626262;color:#ffffff;'>")
												%>
												  <span class="day"><%=right("0" & day(tbevento("datainizioevento")),2)%></span>
												  <span class="month"><%=MonthName(month(tbevento("datainizioevento")))%></span>
												  <span class="year"><%=year(tbevento("datainizioevento"))%></span>								
												</time>
												<img class="big" alt="" src="admin/articoli/<%=tbevento("cimageurl1")%>" />											 
												<div class="info">
												  <h2 class="title"><%=tbevento("titolo")%></h2>												
												  <div class = "icons">
													<%
													if mobile<>"ok" then 
														txt_style="height:120px;width:150px;padding-top:7px;"
													else
														txt_style="height:70px;width:100px;padding-top:5px;"
													end if
													%>												  
													  <img class="icon" src="admin/articoli/thum_<%=tbevento("cimageurl1")%>" style="<%=txt_style%>">
													  <img class="icon" src="admin/articoli/thum_<%=tbevento("cimageurl2")%>" style="<%=txt_style%>">
													  <img class="icon" src="admin/articoli/thum_<%=tbevento("cimageurl3")%>" style="<%=txt_style%>">
													 <br>
													<div class = "icons">													
                                                    <%
													
													i=""
													i=tbevento("categoria")																											
													do while i=tbevento("categoria") and not tbevento.eof																											
														response.write("<table><tr><td width='150px;'>" & tbevento("sottotitolo") & "</td><td> &#8364;." & tbevento("prezzo_vendita") & "</td></tr></table>")
													    response.write("<table width='450px;'><tr height='1px' bgcolor='#000000'><td></td></tr></table>")														
														if tbevento.eof then exit do														
													 tbevento.movenext
													loop
													if counti=3 then counti=0
													%>
													
													</div>
												  </div>
												</div>
												<div class="social">
												<br>
												  <ul>
												    <img src="img/fb.png"href="facebook.com" style="width:50px;height:50px;">
													<img src="img/ig.png" href="instagram.com" style="width:50px;height:50px;">
												  </ul>
												<br>  
												</div>
											  </li>
											  <% if tbevento.eof then exit do		
											      'tbevento.movenext		
											 loop%>
											 							  
											</ul>
											</div>								
								
								
								
								
											
										
											
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
                          