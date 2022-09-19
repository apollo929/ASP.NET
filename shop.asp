<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
'Magazine
querymag="select * from magazinebuffetti "
if request("ric")="yes" then
			if Len(Trim(Request.Form("codice_ispf")))<>0 then
			cod_ric=Trim(Request.Form("codice_ispf"))
			else 
			cod_ric=Trim(Request("codice_ispf"))
			end if
			aring=split(cod_ric," ")
			sSQL="Select * from magazinebuffetti where      "
			sSQL=left(sSQL,len(sSQL)-4)			
			querymag = sSql & "  (codice Like '%" & cod_ric & "%' or descrizione Like '%" & cod_ric & "%')"
end if
'loggaVisSchede "MagazineBuffetti","Magazine","Magazine",Request.ServerVariables("remote_host"),Session("nomeutente"),Session("Chisono")
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
                        <h2>Shopping Bag</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
			
			
			   <%
    'Catalogo
	queryset="SELECT * FROM magazineweb"
	Set tbsetup = Server.CreateObject("ADODB.RecordSet")
	tbsetup.Open queryset,conn
    %>
	   			
				<div class="col-md-3 col-sm-6">
				<div class="single-shop-product">
				<a class="tx18 lnk azzurro peso" target=_blank href="<%=tbsetup("linkweb")%>">
				<img src="<%=tbsetup("linkfoto")%>" width=250px border=0><br>
				<h2>clicca l'immagine <br>per sfogliare il magazine</a></h2>
				</div>
				</div>
			
					<% tbsetup.close   									

		
		'Pagine
		Divpagine=100
		'Pagine gestione
		paginasp=request("Pagsp")
		if paginasp="" then 
			paginasp=0
		else 
			paginasp=cint(paginasp)*Divpagine
		end if		
		querymagcount="SELECT count(*) as tot FROM magazinebuffetti"
		Set tbcount = Server.CreateObject("ADODB.RecordSet")				
		tbcount.Open querymagcount,conn		
		npaginecat=formatnumber(Cint(tbcount("tot")) / 100,0)
		npaginemax=Cint(tbcount("tot"))
		tbcount.close
		
		'response.Write(npaginemax)		
		'response.Write(npaginecat)			
		querymag=querymag & " order by codice desc LIMIT " & paginasp & " , " & Divpagine	
		Set tbmag = Server.CreateObject("ADODB.RecordSet")
		'response.write(querymag)
		tbmag.Open querymag,conn			
		counterfrm=1
		Do While not tbmag.eof
		    counterfrm=counterfrm+1
		    response.Write "<form name=form" & counterfrm & " >"						
			%>
			
			
			
			
			
                <div style="height:480px;" class="col-md-3 col-sm-6">
                    <div class="single-shop-product">
                        <div class="product-upper">
                            <a HREF="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>"><img src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbmag("codice")%>.jpg' border=0></a>	
                        </div>
                        <h2><a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>"><b><%=ucase(tbmag("codice"))%></b><br><font color="#000000"><%=ucase(mid(tbmag("descrizione"),1,80))%></font></a></h2>
                        <div class="product-carousel-price">
						<% 
						'sconto%
						v1=formatnumber(tbmag("prezzo"),2)
						v2=formatnumber(tbmag("prezzoofferta"),2)
						percsconto=formatnumber(((v1-v2)*100)/v1,0)
						%>
                            <ins>&#8364;.<%=formatnumber(tbmag("prezzoofferta"),2)%></ins>
							<br>
							<font size=+1 color=#F86605>sconto magazine del <%=percsconto%>%</font><br><del>&#8364;.<%=formatnumber(tbmag("prezzo"),2)%></del>
							<br>
							<% if tbmag("qta")<>1 then %>
							<font size=+1 color=#F86605>quantita' min acquistabile pz. <%=tbmag("qta")%></font>
							<%end if%>
							<font size=+1 color=#F86605><%=valore_iva(tbmag("codice"))%></font>
                        </div>  
                        
                        <div class="product-option-shop">
						                         <div class="quantity buttons_added">                              
													<input type="button" onClick="dimqta('qta<%=counterfrm%>')"  class="minus" value="-" >
                                                    <input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" class="input-text qty text" title="Qty" value="<%=tbmag("qta")%>" min="<%=tbmag("qta")%>" step="<%=tbmag("qta")%>">
													<input type="button" onClick="aggqta('qta<%=counterfrm%>')"  class="plus" value="+" >
                                                </div>
					
						    <input type="button" onMouseOver="" border="0" class="shop" onClick="carrellomagazine('<%=tbmag("codice")%>', document.form<%=counterfrm%>.qta<%=counterfrm%>.value)" value="">
							<a href="javascript:opensn('listinovisua.asp?For=buffetti&Op=Ins&Cod_Lis=<%=tbmag("codice")%>','Dettagli');" class="tx10 nero lnk"><img src="images/preferiti.jpg">AGG. PREFERITI</a>
							<hr>
                        </div>                       
                    </div>
                </div>
							<%
							response.Write("</form>")
			tbmag.movenext
		Loop%>
				
				
             </div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="product-pagination text-center">
							<strong>
							<%paginabol=false
							 for fsp=0 to npaginecat-1								 										        
									if trim(request("pagsp"))=cstr(fsp) then%>
									<button class="bott_lista_p_black"><%=fsp+1%></button>
								<%else
									if trim(request("pagsp"))="" and paginabol=false then%>
										<button class="bott_lista_p_black">1</button>
										<%paginabol=true
									else%>
										<button class="bott_lista_p" onClick="top.location.href='shop.asp?pagsp=<%=fsp%>'"><%=fsp+1%></button>
									<%end if 
								end if 
								'Response.Write "</a>"
							 next
							 tbmag.close
							 conn.execute("REPAIR TABLE magazinebuffetti QUICK;")%> </strong>                        
                    </div>
                </div>
            </div>
        </div>
    </div>


<!--#include file="foot.inc"-->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->