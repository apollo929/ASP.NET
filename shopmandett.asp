<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
on error resume next

Function senza_apice(byval txt)
lt=len(txt)
tx=""
for f=1 to lt
	c=mid(txt,f,1)
	if c="'" then
		c="`"
	end if
	tx=tx+c
next
senza_apice=tx
End function

'dettagli
q = chr(34)
if trim(request("ccode"))="" then 
 txt_code="non cercare questo "
else
 txt_code=trim(request("ccode"))
end if 
sql="select shop_products.*, shop_products.catalogid, shop_products.catalogid as shownid " &_
" from shop_products where shop_products.catalogid=" & cdbl(request("id")) & " or shop_products.ccode='" & txt_code & "' limit 1"
'response.write(sql)
set rs = server.createobject("adodb.recordset")
rs.open sql,connm
if rs.eof then response.redirect "articolonontrovato.asp"
%>
<!doctype html>
<html>
<!--#include file="head.inc" -->
<style>
nav>div{
border-radius:50%;
border:solid 2px gray;
margin-left:5px;
width:25px;
height:25px;
float:left;
margin:2px;
text-align: center;
}
#rosso{
background-color:red;
}
#verde{
background-color:green;
}
#blu{
background-color:blue;
}
#grigio{
background-color:lightgray;
}
#azzurro{
background-color:lightblue;
}
#nero{
background-color:black;
}
#giallo{
background-color:yellow;
}
input{
margin:8.5px;
margin-top:0px;
}
</style>
<body onload="ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->  
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>SHOP <%=ucase(rs("ccode"))%></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	
	
	    <%if mobile<>"ok" then %> 
    <div class="single-product-area">
	<%else%>
	<div class="single-product-area2">
	<%end if%>
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
			
			                <div class="col-md-4">
							<a style="position:relative;top:-80px;" name="topage"></a>
 
                    
                    <div class="single-sidebar">
					
					
								<link rel="stylesheet" href="css/yBox.min.css">
								<script src="yBox.min.js"></script>	
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
                        
						<%
						if mobile<>"ok" then%>
						<h2 class="sidebar-title">prodotti simili</h2>
						<% 
						
							'query x nome prodotto
							set tbprodsimili = server.createobject("adodb.recordset")
							querydp="select shop_products.*, shop_products.catalogid, shop_products.catalogid as shownid from shop_products where shop_products.ccategory= " & rs("ccategory")
							'response.write(querydp)
							'response.end
							tbprodsimili.open querydp,connm
							do while not tbprodsimili.eof
							%>
								<div class="thubmnail-recent">
								<a href="shopmandett.asp?id=<%=tbprodsimili("catalogid")%>&subcatid=<%=cdbl(request("subcatid"))%>#primaindietro"><%newimmagine=replace(tbprodsimili("cimageurl")," ","%20")%><img src='admin/articoli/<%=newimmagine%>' width='30%'></a>
								<h2><a href="shopmandett.asp?id=<%=tbprodsimili("catalogid")%>&subcatid=<%=cdbl(request("subcatid"))%>#primaindietro"><b><%=tbprodsimili("ccode")%></b><br><%=tbprodsimili("cname")%></a></h2>
								<div class="product-sidebar-price">
									<%
									mprezzo2=0
									profilo=false
									if trim(session("chisono"))<>"" then
										set tb3 = server.createobject("adodb.recordset")
										ssql3 = "select prezzo from profilo where codice_isp='" & trim(cstr((tbprodsimili("ccode")))) & "'"
										tb3.open ssql3,connm									
										if not tb3.eof then
											mprezzo2=formatnumber(tb3("prezzo"),2)
											profilo=true										
										else
											mprezzo2=formatnumber(tbprodsimili("cprice"),2)
										end if
										tb3.close
									else
										mprezzo2=formatnumber(tbprodsimili("cprice"),2)
									end if
									mprezzo1=mprezzo2+20
									'sconto%
									v1=formatnumber(mprezzo1,2)
									v2=formatnumber(mprezzo2,2)
									if v1-v2<>0 then percsconto=cstr(formatnumber(((v1-v2)*100)/v1,2)) & "%<br>"
									%>
							<del>&#8364;.<%=formatnumber(tbprodsimili("cpriceofferta"),2)%></del><br>
                            <ins>&#8364;.<%=v2%></ins><br></div>                            
								</div>
							<%
							tbprodsimili.movenext
							loop
							
						end if%>
						
                    </div>
                </div>
				<script language="JavaScript">
				function gallery(varimg) {
				var varimg2="admin/articoli/"+varimg;
				immagine1.src=varimg2;
				} 
				function valoremod(varinputc){
				//alert(1);
				//alert(varinputc);
				//var txtcolore=document.getElementById(varinputc).value;
				//alert(txtcolore);										
				//document.Form1.item_name.value='ciao';
				
				}
				</script>
               				
				<form action="javascript: history.back()" method=post id=formback name=formback>
				<input type="submit" value="indietro" name="proceed" class="checkout-button button alt wc-forward"><br><br><br>
				</form>
                
                <div class="col-md-8">
                    <div class="product-content-right">                      
                        <div class="row">
                            <div class="col-sm-6">
							<div class="product-images">			
							
							<div id="gallery" class="product-upper">							
							<%newimmagine=replace(rs("cimageurl")," ","%20")%>
							<img onClick="ZoomIn('<%=newimmagine%>','ecommerce');" id="immagine1" name="immagine1" src='admin/articoli/<%=newimmagine%>' class="demo-img pos-center">						
							</div>
							<%		counterfrm=10
									subid=rs("cscategory")	
									profilo=false								
									if trim(session("chisono"))<>"" then
										set tb3 = server.createobject("adodb.recordset")
										ssql3 = "select prezzo from profilo where codice_isp='" & trim(cstr((rs("ccode")))) & "' and password1='" & trim(session("chisono")) & "'"
										tb3.open ssql3,connm									
										if not tb3.eof then
											mprezzo2=formatnumber(tb3("prezzo"),2) 
											profilo=true
										else
											mprezzo2=formatnumber(rs("cprice"),2)
										end if
										tb3.close
									else
										mprezzo2=formatnumber(rs("cprice"),2)
									end if
								
									'zoom
									counterfrm=counterfrm+1%>

                                    
                                    <div class="product-gallery">
										<br><br><br><br><br><br>
									<%if trim(replace(rs("cimageurl")," ","%20"))<>"" then%>
										<a href="javascript:gallery('<%=replace(rs("cimageurl")," ","%20")%>');"><img src='admin/articoli/<%=replace(rs("cimageurl")," ","%20")%>'></a>
									<%end if%>
									<%if trim(replace(rs("cimageurl1")," ","%20"))<>"" then%>
										<a href="javascript:gallery('<%=replace(rs("cimageurl1")," ","%20")%>');"><img src='admin/articoli/<%=replace(rs("cimageurl1")," ","%20")%>'></a>
									<%end if%>
									<%if trim(replace(rs("cimageurl2")," ","%20"))<>"" then%>
										<a href="javascript:gallery('<%=replace(rs("cimageurl2")," ","%20")%>');"><img src='admin/articoli/<%=replace(rs("cimageurl2")," ","%20")%>'></a>
									<%end if%>
									<%if trim(replace(rs("cimageurl3")," ","%20"))<>"" then%>
										<a href="javascript:gallery('<%=replace(rs("cimageurl3")," ","%20")%>');"><img src='admin/articoli/<%=replace(rs("cimageurl3")," ","%20")%>'></a>
									<%end if%>
									<%if trim(replace(rs("cimageurl4")," ","%20"))<>"" then%>
										<a href="javascript:gallery('<%=replace(rs("cimageurl4")," ","%20")%>');"><img src='admin/articoli/<%=replace(rs("cimageurl4")," ","%20")%>'></a>
									<%end if%><br>

									
									<%if trim(rs("filepdf"))<>"" and trim(rs("filepdf"))<>"nessunfile-pdf" then%>
										<a class="yBox yBox_iframe"  href="admin/articoli/<%=trim(replace(rs("filepdf")," ","%20"))%>"><img src='images/pdf.jpg'></a>
									<%end if%>
                                     </div>
									 
									 
                                </div>
                            </div>
                            
                            <div class="col-sm-6">
                                <div class="product-inner">
                                    <h2 class="product-name"><b>codice : <%=rs("ccode")%></b><br><br><%=rs("cname")%></h2>
                                    <div class="product-carousel-price">
									
									
								 <%
								counterfrm="01"
								response.write "<form name='formmanuale" & counterfrm & "' id='formmanuale" & counterfrm & "' >" 
								'colore
								t_como_colore=""
								t_como_colore=replace(rs("colore"),"-"," ")
								if trim(t_como_colore)<>"" then
								 response.write("<hr style='border-top: 0.1 #0291ed;'>colore :	<nav id='colori'>")
								'response.write("<select onchange=javascript:valoremod('colore" & counterfrm & "'); id='colore" & counterfrm & "' name='colore" & counterfrm & "'>")
								aring=""
								aring=split(t_como_colore," ")						
								for f=0 to ubound(aring)
									if trim(aring(f))<>""  then
									    response.write ("<div value='" & trim(aring(f)) & "' name='colore' id='" & trim(aring(f)) & "'><br><br><input checked='checked' type='radio' value='" & trim(aring(f)) & "' name='colore" & counterfrm & "' id='" & trim(aring(f)) & "'></input></div>")
										'response.write("<option value='" & trim(aring(f)) & "'>" & trim(aring(f)) & "</option>")
									end if
								next
								response.write("</nav>")
								'response.write("</select>")
								else	
								response.write("<input type=hidden id='colore" & counterfrm & "' name='colore" & counterfrm & "'>")
								end if			
								'taglie
							     t_como_taglie=""
							     t_como_taglie=replace(rs("taglia"),"-"," ")
							    if trim(t_como_taglie)<>"" then
								    response.write("<hr style='border-top: 0.1 #0291ed;'>taglia :	")
									response.write("<select id='taglia" & counterfrm & "' name='taglia" & counterfrm & "' >")
									aring=""
									aring=split(t_como_taglie," ")						
									for f=0 to ubound(aring)
										if trim(aring(f))<>""  then
											response.write("<option value='" & trim(aring(f)) & "'>" & trim(aring(f)) & "</option>")
										end if
									next
									response.write("</select>")
								else	
								 response.write("<input type=hidden  id='taglia" & counterfrm & "' name='taglia" & counterfrm & "'>")
								end if
								%>		<br><br><br>
								<hr>												
											

										<%if trim(rs("cstock"))="on" then%>
										<br><img src="images/pmag1.png"><hr>	
										<%else%>
										<br><img src="images/pmag2.png"><hr>	
										<%end if%>	
										<%if trim(rs("coffmag"))="on" then%>
										<br><img src="images/promo.png"><hr>
										<%end if%>		<br>
									
									
									
									
											<%
											if rs("iva")="si" then 
											   scrittaiva=rs("aliqiva") & "% aliq iva" 
											 else
											   scrittaiva="esente iva"
											end if
											'sconto%
											if rs("cpriceofferta")=0 then 
											  v1=formatnumber(mprezzo2,2)
											else
											  v1=formatnumber(rs("cpriceofferta"),2)	
										    end if
											v2=formatnumber(mprezzo2,2)
											percsconto=formatnumber(((v1-v2)*100)/v1,2)
											if v1=v2 then 
											%>
											<ins>&#8364;.<%=v1%></ins>&nbsp;&nbsp;<%=scrittaiva%><br>
											<%else%>
											<del>&#8364;.<%=v2%>&nbsp;&nbsp;<%=scrittaiva%></del><br>
											<ins>&#8364;.<%=v1%></ins>&nbsp;&nbsp;<%=scrittaiva%><br>
											<%end if%>
											</div> 
											<%
											'### quantita' price
											if rs("cprice1")>0  and rs("qta1")>0 then
											  response.write("per n&#176;" & rs("qta1")) & " pezzi &#8364;." & formatnumber(rs("cprice1"),2)
											end if
											if rs("cprice2")>0  and rs("qta2")>0 then
											  response.write("<br>per n&#176;" & rs("qta2")) & " pezzi &#8364;." & formatnumber(rs("cprice2"),2)
											end if											
											if rs("cprice3")>0  and rs("qta3")>0 then
											  response.write("<br>per n&#176;" & rs("qta3")) & " pezzi &#8364;." & formatnumber(rs("cprice3"),2)
											end if											
											
											'### quantita' price
											%>											
											
											<div class="product-option-shop">
												<div class="quantity buttons_added">
												<input type="button" onclick="dimqta('qta<%=counterfrm%>')"  class="minus" value="-" >
												<input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" class="input-text qty text" title="qty" value="1" min="1" step="1">
												<input type="button" onclick="aggqta('qta<%=counterfrm%>')"  class="plus" value="+" >
												</div>
												<input type="button" onmouseover="" border="0" class="shop" onclick="carrellomanuale('<%=rs("ccode")%>',document.formmanuale<%=counterfrm%>.qta<%=counterfrm%>.value ,'<%=v1%>','<%=rs("cname")%>','<%=rs("iva")%>',document.formmanuale<%=counterfrm%>.colore<%=counterfrm%>.value,document.formmanuale<%=counterfrm%>.taglia<%=counterfrm%>.value,'<%=rs("cimageurl")%>')" >
												<%response.write("</form>")%>
												<a class="yBox yBox_iframe" href="listinovisua.asp?for=shopmanuale&op=ins&cod_lis=<%=rs("ccode")%>" class="tx10 nero"><img src="images/preferiti.jpg">agg. preferiti</a>
												<hr>	
												<form action="https://www.paypal.com/it/cgi-bin/webscr" method="post" ID=Form1>
												<input type="hidden" name="cmd" value="_ext-enter" ID=Hidden1>
												<input type="hidden" name="redirect_cmd" value="_xclick" ID=Hidden6> 
												<input type="hidden" name="business" value="<%=Session("cartadicredito")%>" ID=Hidden2>
												<input type="hidden" name="item_name" value="<%=rs("ccode")+" "+rs("cname")%>" ID=Hidden3>
												<input type="hidden" name="currency_code" value="EUR" ID=Hidden4>
												<input type="hidden" name="email" value="<%=Session("cartadicredito")%>" ID=Hidden7>
												<input type="hidden" name="amount" value="<%=Replace(session("totcarta"),",",".")%>" ID=Hidden5>
												<input type="image" src="images/pagaadesso.png" name="submit" alt="PayPal. È un sistema rapido, gratuito e sicuro." ID=Image1>
												</form>										
												<hr>				
											
											</div>
                                    
                                    <div class="product-inner-category">
                                             	
                                    <div role="tabpanel">
                                        <ul class="product-tab" role="tablist">
                                            <li role="presentation" class="active"><a href="#" aria-controls="home" role="tab" data-toggle="tab">descrizione</a></li>
                                            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">richiedi info prodotto</a></li>     
                                        </ul>
												
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                                <h2>descrizione del prodotto</h2>  
												<p class=nero><%=rs("cdescription")%></p> 
												
												</div>
                                       </div>
									          <div role="tabpanel" class="tab-pane fade" id="profile">
                                                <h2>richiedi info prodotto</h2>
                                                <div class="submit-review">
												<form action="regmail.asp" method="post" id="formod" name="formod">
                                                    <p><label for="name">nominativo</label> <input name="nome" type="text"></p>
                                                    <p><label for="email">email</label> <input name="email" type="email"></p>
                                                    <p><label for="review">richiesta</label> <textarea name="note" id="" cols="30" rows="10" >cod.<%=rs("ccode")%></textarea></p>
													codice di conferma:
													<%'response.write(linkurl)
													if linkurl="contattaci.asp" or linkurl="registrati.asp" or linkurl="software.asp" or linkurl="software1.asp" or linkurl="oddettagli.asp"  then
													'niente
													else
													session("checktext")=""
													randomize
													session("checktext")=cint ( ( 9 * rnd() ) + 0) & cint ( ( 9 * rnd() ) + 0) & cint ( ( 9 * rnd() ) + 0) & cint ( ( 9 * rnd() ) + 0) 
													end if
													response.write("<font class='tx18 rosso'>" & session("checktext") & "</font>")
													%><br>
													ricopialo qui <input  type="text" size="8" id="checktext" maxlength="4" name="checktext">
													<br><br>
                                                    <p><input type="submit" value="invia richiesta"></p>
													</form>
                                                </div>
                                            </div>
                                    </div>
									<%if session("chisono")<>"" then
                                    loggavisschede "manuale",rs("ccode"),rs("cname"),rs("cname"),session("nomeutente"),session("chisono")
									end if
									rs.close%>
									
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