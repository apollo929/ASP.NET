<%
Set Tbmag = Server.CreateObject("ADODB.RecordSet")
querymag="SELECT codice,descrizione,prezzo,prezzoofferta FROM magazinebuffetti order by rand() limit 18"
Tbmag.Open querymag,conn
%>
	
	<div class="slider-area">
        	<!-- Slider -->
			<div id="box" class="block-slider block-slider4">
				<ul class="" id="bxslider-home4">
					<%
					i=0
					do while i<>4
					i=i+1
					codice=Tbmag("codice")
					%>
						<li>
						    <img src="images/vuota.jpg" style="max-width:1px;right:350px;" >
						   	<a href="http://www.schede.eu/shopingbag/volantino-scuola.pdf" target="_blank"><img style="max-width:180px;right:350px;" src="http://www.schede.eu/shopingbag/magazinescuola.jpg" border="0"></a>
						    <img src="images/vuota.jpg" style="max-width:10px;right:350px;" >
						    <a href="shop.asp" target="_blank"><img style="max-width:180px;right:350px;" src="http://www.informaticaml.biz/catalogo/magazine.jpg" border="0"></a>
							<img src="images/vuota.jpg" style="max-width:50px;right:350px;" >
							<a href="dettaglibuffettishop.asp?cod=<%=Tbmag("codice")%>"><img src="foto.asp?cat=catalogobuffetti2016_big&img=<%=Tbmag("codice")%>.jpg" style="max-width:220px;right:350px;" alt="<%=left(Tbmag("descrizione"),50)%>"></a>
							<img src="images/vuota.jpg" style="max-width:90px;right:350px;" >
							<div class="caption-group">
								<h2 class="caption title">
								<%=Tbmag("codice")%>
								</h2>
								<h4 class="caption subtitle"><%=left(Tbmag("descrizione"),20)%></h4>
														<%
						'sconto%
						v1=formatnumber(Tbmag("prezzo"),2)
						v2=formatnumber(Tbmag("prezzoofferta"),2)
						percsconto=formatnumber(((v1-v2)*100)/v1,2)
						%>
                           
								<span class="primary"><strike><strong>&#8364;.<%=formatnumber(Tbmag("prezzo"),2)%></strong></strike></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><font color=darkorange>sconto magazine <%=percsconto%>%</font><br><strong>&#8364;.<%=formatnumber(Tbmag("prezzoofferta"),2)%></strong></span>
								<input type='button' onmouseover='' style=" border:none;cursor:pointer;" border='0' class='shop' onclick="carrellomagazine('<%=replace(codice," ","")%>','1')">
								<img src="images/vuota.jpg" style="max-width:5px;right:350px;" >							
							</div>	
						</li>
						
					<%
					Tbmag.movenext
					loop
					%>
				</ul>
			</div>
			<!-- ./Slider -->

			
    </div> <!-- End slider area -->



