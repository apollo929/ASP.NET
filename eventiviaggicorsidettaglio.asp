<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
sql="SELECT * FROM eventi_titolo INNER JOIN eventi_sottotitolo ON eventi_titolo.categoryID = eventi_sottotitolo.categoria INNER JOIN eventi ON eventi.categoria = eventi_sottotitolo.categoria where eventi.categoria=" & request("id") & "   group by id_sottotitolo order by categoryID asc,id_sottotitolo asc"
Set tbevento = Server.CreateObject("ADODB.RecordSet")
'SQL = "select eventi_sottotitolo.id,eventi_sottotitolo.*,eventi_titolo.catdescription,eventi_titolo.datainizioevento,eventi_titolo.datafineevento From eventi_sottotitolo INNER JOIN  eventi_titolo ON eventi_sottotitolo.categoria = eventi_titolo.categoryid where eventoviaggiocorso='evento' order by codice asc,categoryID asc"
tbevento.Open SQL, connm
'response.write(SQL)
'response.end

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
								
								
 
												<script>
												window.onload = function(){

												let myYbox;
												if(document.querySelector('.yBox')){
												myYbox = new yBox();
												myYbox.init();
												}
												myYbox.onYboxOpen = function(){
												document.body.classList.add('yBoxIsOpen');
												}
												myYbox.onYboxClose = function(){
												document.body.classList.remove('yBoxIsOpen');
												}
												myYbox.onNextItemClick = function(){
												console.log('next item clicked');
												};
												myYbox.onPrevItemClick = function(){
												console.log('prev item clicked');
												}
												Ricarica_carrello(0, 0, 0, 0);
												};
												</script>									
								
											<link href="prova.min.css" rel="stylesheet">
											<%if mobile<>"ok" then 
											valoreww="width:40%;"%> 
											<div class="row" style="width:1100px">
											<%else
											 valoreww=""%>
											<div class="row" >
											<%end if%>
											<div class="product-bit-title text-center">
											 <h2 style="color:#000000;"><%=tbevento("titolo")%></h2>	
											 </div>
											<ul class="event-list">
											
											
											<%
											'response.write(SQL)
											'response.end
											counti=0											 
											do while not tbevento.eof
											counti=counti+1%>
											  <li>
												<time style="background-color:#ff0000;color:#ffffff;<%=valoreww%>;"><br>
												<!---time style="background-color:#0072B5;color:#ffffff;">
												<time style="background-color:#0072B5;color:#ffffff;">
												<time style="background-color:#ffffff;color:#ff0000;"--->
												  <span class="month"><%=tbevento("sottotitolo")%></span>
												  <span class="day"> &#8364;.<%=tbevento("prezzo_vendita")%></span>
												  <%
												  codice=tbevento("id") & "_" & replace(tbevento("sottotitolo")," ","")
												  nomeprodotto=replace(tbevento("titolo")," ","_") & "_" & replace(tbevento("sottotitolo")," ","_")%>
												  <span class="month"><a class="month" onclick="carrelloevc('<%=codice%>','1','<%=tbevento("prezzo_vendita")%>','<%=nomeprodotto%>','si','<%=tbevento("cimageurl1")%>')" href="#"> <img src="img/shoph.png" ></a></span>
											     </time>
												 
												<div class="info">
												  												
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
												 
														<table><tr><td width='100%'>
														<%=mid(tbevento("descrizionet"),1,700)%><a class='yBox yBox_iframe' href="eventiviaggicorsidettaglioinfo.asp?id=<%=tbevento("id_sottotitolo")%>">....(info)</a>
														</td></tr></table>	
														 
												  </div>
												</div>
												<div class="social">
												<br>
												  <ul>												   
													<a class='yBox yBox_iframe' href="eventiviaggicorsidettaglioinfo.asp?id=<%=tbevento("id_sottotitolo")%>"><img src="img/info.png" href="instagram.com" style="width:50px;height:50px;"></a>
												  </ul>
												<br>  
												</div>
											  </li>
											  <% 'if tbevento.eof then exit do		
											     tbevento.movenext		
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
                          