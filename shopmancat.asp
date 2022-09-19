<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%  
on error resume next

sub categorie(byval id)
	'controlla le offerte in corso (massimo 2)
	set rs = server.createobject("adodb.recordset")
	strsql = "select * from shop_categories order by catdescription"
	rs.open strsql,connm
	if not rs.eof then
		counter=0
		i=1
		do while not rs.eof
			response.write "<a class='tx16 red lnk peso' href=shopmancat.asp?id=" & rs("categoryid") & "#primaindietro>" &  ucase(rs("catdescription")) & "</a>"
			sottocategorie(rs("categoryid")) 
			rs.movenext
		loop		
	end if
	rs.close
end sub	

sub sottocategorie(byval id)
	'controlla le offerte in corso (massimo 2)
	set rss = server.createobject("adodb.recordset")
	strsql = "select * from shop_subcategories where categoria=" & cint(id) & " order by descrizione "
	rss.open strsql,connm
	if not rss.eof then
		counter=0
		do while not rss.eof
			response.write "<a class='tx12 nero' href=shopmancat.asp?id=" & rss("categoria") & "&subid=" & rss("codice") & "#primaindietro>" &  ucase(rss("descrizione")) & "</a>"
			rss.movenext
		loop
	end if
	response.write("<hr>")
	rss.close
end sub	



sub writesubcategories
	'apertura connessione
	strsql = "select * from shop_subcategories where categoria="+trim(catid) & " order by descrizione"
	set rs=connm.execute(strsql)
	ihtml="<table border=0 width=230>"
	flipflop=1
	ihtml=ihtml+"<tr><td colspan=2 align=left>"
	ihtml=ihtml & "<a class='tx12 grigioscuro lnk' href=""categoriaall.asp?" & chr(34) & ">"
	ihtml=ihtml & "<b>tutto il settore <br></b>"
	ihtml=ihtml & "</a><br><br>"
	ihtml=ihtml+"</td></tr>"
	ihtml=ihtml+"<tr><td align=left>"
	do while not rs.eof	
		if flipflop=1 then
			ihtml=ihtml & "<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" bgcolor="&color3&">"
			ihtml=ihtml+"<tr><td align=left>"
			ihtml=ihtml & "<a class='tx12 red lnk' href=""categoria.asp?id="& trim(catid) & "&subid=" & trim(rs("codice")) & chr(34) & ">"
			ihtml=ihtml & "<b>" & scritta(trim(rs("descrizione"))) & "</b>"
			ihtml=ihtml & "</a>"
			ihtml=ihtml+"</td></tr>"
			ihtml=ihtml & "</table>"
		else	  
			ihtml=ihtml & "<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" bgcolor="&color3&">"
			ihtml=ihtml+"<tr><td align=left>"
			ihtml=ihtml & "<a class='tx12 red lnk' href=""categoria.asp?id="& trim(catid) & "&subid=" & trim(rs("codice")) & chr(34) & ">"
			ihtml=ihtml & "<b>" & scritta(trim(rs("descrizione"))) & "</b>"
			ihtml=ihtml & "</a>"
			ihtml=ihtml+"</td></tr>"
			ihtml=ihtml & "</table>"
		end if	  
		flipflop=-flipflop
		rs.movenext
	loop
	ihtml=ihtml+"</td></tr></table>"
	response.write ihtml
end sub

'gestione prodotti
dim catid, strcat
catid = request.querystring("id")
subcatid = request.querystring("subid")
strcat = request.querystring ("cat")
'controlla se è stata selezionata la sottocategoria
if len(trim(subcatid))>0 then 
	scategoria=true 
	'legge la descrizione della sottocategoria
	strsql = "select * from shop_subcategories where codice="+trim(subcatid)+" and categoria=" & trim(catid)
	set rs=connm.execute(strsql)
	
	if not rs.eof then
		descrizione_sottocategoria=rs("descrizione")
	end if
	rs.close
else 
	scategoria=false
	descrizione_sottocategoria=""		
end if
%>
<!doctype html>
<html>
<!--#include file="head.inc" -->
<body onload="ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->    

   
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>SHOP PRODOTTI <%=descrizione_sottocategoria%></h2>
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
                <div class="col-md-3">
						
						<!--#include file="menusx.inc" -->	
					
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
						
					<a style="position:relative;top:-80px;" name="topage"></a>
                
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
								'connessione scart
								q = chr(34)		
								if trim(request("subid"))="" then
								   if trim(request("id"))="" then
								     sql= "select shop_products.*, shop_products.ccategory, shop_categories.catdescription from shop_categories inner join shop_products on shop_categories.categoryid = shop_products.ccategory order by shop_products.ccategory asc "
								   else
									 sql= "select shop_products.*, shop_products.ccategory, shop_categories.catdescription from shop_categories inner join shop_products on shop_categories.categoryid = shop_products.ccategory where (shop_products.ccategory)=" & cdbl(request("id")) & " order by shop_products.cprice asc "
								   end if
								else	
									sql= "select shop_products.*, shop_products.ccategory, shop_categories.catdescription from shop_categories inner join shop_products on shop_categories.categoryid = shop_products.ccategory where (shop_products.ccategory)=" & cdbl(request("id")) & " and (shop_products.cscategory)=" & cdbl(request("subid")) & " order by shop_products.cprice asc "
								end if    
								set rs=connm.execute(sql)
                                if not rs.eof then								
								catname = rs("catdescription")%>
								<center>
								<br><h4>
								<b><%=ucase(catname)%></b><br>
								<b><%=ucase(descrizione_sottocategoria)%></b></h4>
								</center><br><br>
								<%

								if mobile<>"ok" then 
								  response.write("<div class='col-md-12' style='width:1030px;'><div class='product-content-right'><div class='col-md-12'>") 
								else
                                  response.write("<div class='col-md-12'><div class='product-content-right'><div class='col-md-12'>") 
								end if		
			   				    counterfrm=10
								countdiv=0
								while not rs.eof 
											countdiv=countdiv+1
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
											counterfrm=counterfrm+1											
											%>
									
											<div  class="col-md-3" style="height:500px;"><div class="product-content-left">									
											<div class="product-upper">
											<center>
												<a href="shopmandett.asp?id=<%=rs("catalogid")%>&subcatid=<%=catid%>#primaindietro"><%newimmagine=replace(rs("cimageurl")," ","%20")%><img src='admin/articoli/<%=newimmagine%>' style="max-width:200px;max-height:150px;min-width:200px;min-height:150px;"></a>	
											</center>
											</div>
											<div style="height:50px;">
											<center>
											<a href="shopmandett.asp?id=<%=rs("catalogid")%>&subcatid=<%=catid%>#primaindietro"><b><%=rs("ccode")%></b><br><p><font color="#000000"><%=mid(ucase(rs("cname")),1,40)%></font></p></a> 
											</center>
											</div>
											<div class="product-carousel-price">
											<center>
											<%
									         response.write "<form name=formmanuale" & counterfrm & " ><table border=0><tr>" 
											'colore
											 t_como_colore=""
											 t_como_colore=replace(rs("colore"),"-"," ")
											if trim(t_como_colore)<>"" then
												response.write("<td><hr style='border-top: 0.1 #0291ed;'>colore :	")
												response.write("<select  id='colore" & counterfrm & "' name='colore" & counterfrm & "'>")
												aring=""
												aring=split(t_como_colore," ")						
												for f=0 to ubound(aring)
													if trim(aring(f))<>""  then
														response.write("<option value='" & trim(aring(f)) & "'>" & trim(aring(f)) & "</option>")
													end if
												next
												response.write("</select></td>")
											else	
											 'response.write("<hr style='border-top: 0.1 #0291ed;'>")
											 response.write("<input type=hidden id='colore" & counterfrm & "' name='colore" & counterfrm & "'>")
											end if			
											'taglie
											 t_como_taglie=""
											 t_como_taglie=replace(rs("taglia"),"-"," ")
											if trim(t_como_taglie)<>"" then
												response.write("<td><hr style='border-top: 0.1 #0291ed;'>taglia :	")
												response.write("<select id='taglia" & counterfrm & "' name='taglia" & counterfrm & "' >")
												aring=""
												aring=split(t_como_taglie," ")						
												for f=0 to ubound(aring)
													if trim(aring(f))<>""  then
														response.write("<option value='" & trim(aring(f)) & "'>" & trim(aring(f)) & "</option>")
													end if
												next
												response.write("</select></td>")
											else					
											 response.write("<input type=hidden  id='taglia" & counterfrm & "' name='taglia" & counterfrm & "'>")
											end if
											response.write("</tr></table><hr style='border-top: 0.1 #0291ed;'>") 		
												
											if trim(rs("cstock"))="on" then%>
											<img src="images/pmag1.png"><hr>
											<%else%>
											<img src="images/pmag2.png"><hr>
											<%end if%>	
											<%if trim(rs("coffmag"))="on" then%>
											<img src="images/promo.png"><hr>
											<%else
											if mobile<>"ok" then response.write("<img src='images/nopromopng.png'><hr>")
											end if
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
									 
											<%
											'### quantita' price
											if rs("cprice1")>0  and rs("qta1")>0 then
											  response.write("per n&#176;" & rs("qta1") & " pezzi &#8364;." & formatnumber(rs("cprice1"),2) & "<br>")
											end if
											if rs("cprice2")>0  and rs("qta2")>0 then
											  response.write("per n&#176;" & rs("qta2") & " pezzi &#8364;." & formatnumber(rs("cprice2"),2) & "<br>")
											end if											
											if rs("cprice3")>0  and rs("qta3")>0 then
											  response.write("per n&#176;" & rs("qta3") & " pezzi &#8364;." & formatnumber(rs("cprice3"),2))
											end if	
											'### quantita' price
											%>
											</center>
											</div> 
											<!---div style="positon:absolute;position: absolute;bottom:0px;" class="product-option-shop">
												<div class="quantity buttons_added">
												<input type="button" onclick="dimqta('qta<%=counterfrm%>')"  class="minus" value="-" >
												<input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" class="input-text qty text" title="qty" value="1" min="1" step="1">
												<input type="button" onclick="aggqta('qta<%=counterfrm%>')"  class="plus" value="+" >
												</div>
												<input type="button" onmouseover="" border="0" class="shop" onclick="carrellomanuale('<%=rs("ccode")%>',document.formmanuale<%=counterfrm%>.qta<%=counterfrm%>.value,'<%=v1%>','<%=rs("cname")%>','<%=rs("iva")%>',document.formmanuale<%=counterfrm%>.colore<%=counterfrm%>.value,document.formmanuale<%=counterfrm%>.taglia<%=counterfrm%>.value,'<%=rs("cimageurl")%>')" >
												<% response.write("</form>")	%>
												<a class="yBox yBox_iframe" href="listinovisua.asp?for=shopmanuale&op=ins&cod_lis=<%=rs("ccode")%>" class="tx10 nero"><img src="images/preferiti.jpg">agg. preferiti</a>
												<br><br>
											</div--->
											<center><a href="shopmandett.asp?id=<%=rs("catalogid")%>&subcatid=<%=catid%>#primaindietro"><%newimmagine=replace(rs("cimageurl")," ","%20")%><img src='images/dettaglio.png' ></a></center>												
										    <%if mobile="ok" then response.write("<hr>")%>
										</div>								 										
									</div>	
									<%
									  if countdiv=4 then
										  response.write("</div>")	
										  response.write("<div class='col-md-12'><br><br><hr>") 
										  countdiv=0
								      else		  
									  end if
									  rs.movenext
									wend								
							response.write("</div></div>")									  
							response.write("</div>")
                            end if							
							%>
  									
								
							
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