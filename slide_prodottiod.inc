	<%
	Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
	queryodslide="SELECT codice_od,descrizione,fornitore,categoria,AA_Qta_Conf,p1,p2,p3,p4,p5 FROM prodotti where fornitore like '%od%' and categoria like '%cancelleria%' order by rand() limit 12"
	tbprodcatalogo.Open queryodslide,connm
	%>
	<!--#include file="ricercacatalogoparametriod.inc" -->
	
	<div class="slider-area">
        	<!-- Slider -->
			<div id="box" class="block-slider block-slider4">
				<ul class="" id="bxslider-home4">
					<%
					i=0
					do while i<>12
					i=i+1
					codice=tbprodcatalogo("codice_od")
					%>
						<li>
						    <img src="images/vuota.jpg" style="max-width:1px;right:350px;" >
						   	<a href="https://www.schede.eu/shopingbag/VOLANTINO-SPECIALE-COVID.pdf" target="_blank"><img style="max-width:180px;right:350px;" src="https://www.schede.eu/shopingbag/magazinecovid.jpg" border="0"></a>
						    <img src="images/vuota.jpg" style="max-width:10px;right:350px;" >
						    <a href="shop.asp" target="_blank"><img style="max-width:180px;right:350px;" src="https://www.informaticaml.biz/catalogo/magazine.jpg" border="0"></a>
							<img src="images/vuota.jpg" style="max-width:50px;right:350px;" >
							<a href="oddettagli.asp?cod=<%=tbprodcatalogo("codice_od")%>"><img style="max-width:220px;right:350px;"  src='foto.asp?cat=catalogoisp&img=<%=tbprodcatalogo("codice_od")%>.jpg' border=0></a>
							<img src="images/vuota.jpg" style="max-width:90px;right:350px;" >
							<div class="caption-group">
								<h2 class="caption title">
								<%=tbprodcatalogo("codice_od")%>
								</h2>
								<h4 class="caption subtitle"><%=left(tbprodcatalogo("descrizione"),20)%></h4>
							<%
							'sconto%
							v1=formatnumber(Mprezzo1,2)
							v2=formatnumber(Mprezzo2,2)
							percsconto=""
							if v1-v2<>0 then percsconto=cstr(formatnumber(((v1-v2)*100)/v1,2)) & "%<br>"
							%>
                           
								<span class="primary"><!---strike><strong>&#8364;.<%=formatnumber(Mprezzo1,2)%></strong></strike></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><font color=darkorange>sconto magazine <%=percsconto%>%</font--->
								<br><strong>&#8364;.<%=formatnumber(Mprezzo2,2)%></strong></span>
								<input type='button' onmouseover='' style=" border:none;cursor:pointer;" border='0' class='shop' onclick="carrellood('<%=tbprodcatalogo("codice_od")%>','1')">
								<img src="images/vuota.jpg" style="max-width:5px;right:350px;" >							
							</div>	
						</li>
						
					<%
					tbprodcatalogo.movenext
					loop
					tbprodcatalogo.close
					%>
				</ul>
			</div>
			<!-- ./Slider -->

			
    </div> <!-- End slider area -->



