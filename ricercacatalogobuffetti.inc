<%			
if tbprodcatalogo.Eof then response.end	
' Ricerca Catalogo
if not tbprodcatalogo.Eof then 
    %>
	<!--#include file="ricercacatalogoparametribuffetti.inc" -->
				<div style="height:680px;" class="col-md-3">
				<div class="single-shop-product">
				<div class="product-upper">

					<a HREF="dettaglibuffettishop.asp?cod=<%=tbprodcatalogo("codice_buf")%>#buffposizione"><img src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbprodcatalogo("codice_buf")%>.jpg' border=0></a>	
				</div>
				<a href="dettaglibuffettishop.asp?cod=<%=tbprodcatalogo("codice_buf")%>#buffposizione"><b><%=ucase(tbprodcatalogo("codice_buf"))%></b><br><font color="#000000"><%=mid(ucase(tbprodcatalogo("descrizione")),1,30)%></font></a>
				<div class="product-carousel-price">
				
					<ins>&#8364;.<%=formatnumber(Mprezzo2,2)%></ins><font size=+1 color="#000000"><%=magazinesconto%></font><br><del>&#8364;.<%=formatnumber(tbprodcatalogo("prezzo_vendita_buffetti"),2)%></del>
					
					<%if cdbl(tbprodcatalogo("qta2"))>1 and boolmagazine="false" then
						response.write("<br>per n&#176;" & tbprodcatalogo("qta2") & " pezzi &#8364;." & FormatNumber(tbprodcatalogo("p2"),2))						
					end if
					if cdbl(tbprodcatalogo("qta3"))>1 and boolmagazine="false" then
						response.write("<br>per n&#176;" & tbprodcatalogo("qta3") & " pezzi &#8364;." & FormatNumber(tbprodcatalogo("p3"),2))						
					end if
					if cdbl(tbprodcatalogo("qta4"))>1 and boolmagazine="false" then
						response.write("<br>per n&#176;" & tbprodcatalogo("qta4") & " pezzi &#8364;." & FormatNumber(tbprodcatalogo("p4"),2))						
					end if
					if cdbl(tbprodcatalogo("qta5"))>1 and boolmagazine="false" then
						response.write("<br>per n&#176;" & tbprodcatalogo("qta5") & " pezzi &#8364;." & FormatNumber(tbprodcatalogo("p5"),2))						
					end if%>
					<hr>
					<%if boolmagazine="false" then %>
					quantita' minima acquistabile pz.1 
					<%end if%>
					<br><font size=+1 color=#072466><%=valore_iva(tbprodcatalogo("codice_buf"))%></font>
					<center><img src="images/buffetti.jpg"></center>
					<hr>
				</div>  
				
				<div class="product-option-shop">
				<%response.Write "<form name=formb" & counterfrm & " >" %> 
										 <div class="quantity buttons_added">
													<input type="button" onClick="dimqta('qta<%=counterfrm%>')"  class="minus" value="-" >
													<%if boolmagazine="false" and magqta=1 then %>
                                                    <input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" class="input-text qty text" title="Qty" value="1" min="1" step="1">
													<%else%>
													<input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" class="input-text qty text" title="Qty" value="<%=magqta%>" min="<%=magqta%>" step="<%=magqta%>">
													<%end if%>
													<input type="button" onClick="aggqta('qta<%=counterfrm%>')"  class="plus" value="+" >
										</div>
			
					<input type="button" onMouseOver="" border="0" class="shop" onClick="carrellobuffetti('<%=tbprodcatalogo("codice_buf")%>', document.formb<%=counterfrm%>.qta<%=counterfrm%>.value)" value="">
					<%response.Write("</form>")%><hr>
					<a href="javascript:opensn('listinovisua.asp?For=buffetti&Op=Ins&Cod_Lis=<%=tbprodcatalogo("Codice_buf")%>','Dettagli');" class="tx10 nero lnk"><img src="images/preferiti.jpg">AGG. PREFERITI</a>
				</div>                       
			</div>
		</div>
<%
end if%>

