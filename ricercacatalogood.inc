<%			
if tbprodcatalogo.Eof then response.end	
' Ricerca Catalogo
if not tbprodcatalogo.Eof then 
    %>
				<!--#include file="ricercacatalogoparametriod.inc" -->
				<div style="height:680px;" class="col-md-3">
				<div class="single-shop-product">
				<div class="product-upper">
					<a HREF="oddettagli.asp?cod=<%=tbprodcatalogo("codice_od")%>#odposizione"><img src='foto.asp?cat=catalogoisp\piccole&img=<%=tbprodcatalogo("codice_od")%>.jpg' border=0></a>	
				</div>
				<a href="oddettagli.asp?cod=<%=tbprodcatalogo("codice_od")%>#odposizione"><b><%=ucase(tbprodcatalogo("codice_od"))%></b> <br><font color="#000000"><%=mid(ucase(tbprodcatalogo("descrizione")),1,30)%></font></a>
				<div class="product-carousel-price">
				<%
				'sconto%
				v1=formatnumber(Mprezzo1,2)
				v2=formatnumber(Mprezzo2,2)
				percsconto=""
				if v1-v2<>0 then percsconto=cstr(formatnumber(((v1-v2)*100)/v1,0)) & "%<br>"
				%>
					<ins>&#8364;.<%=formatnumber(Mprezzo2,2)%></ins><font size=+1 color=#ff5700><%=magazinesconto%><%=percsconto%></font><br><del>&#8364;.<%=formatnumber(Mprezzo1,2)%></del>
					<hr>
					disponibilita' pezzi  <%=tbprodcatalogo("giacenza")%><hr>
					quantita' minima acquistabile pz.<%=tbprodcatalogo("AA_Qta_Conf")%><br>
				</div>  
				<br><font size=+1 color=#ff5700><%=valore_iva(tbprodcatalogo("codice_od"))%></font>
				
				<div class="product-option-shop">
				<%response.Write "<form name=formb" & counterfrm & " >" %> 
										 <div class="quantity buttons_added">
													<input type="button" onClick="dimqta('qta<%=counterfrm%>')"  class="minus" value="-" >
                                                    <input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" class="input-text qty text" title="Qty" value="1" min="1" step="1">
													<input type="button" onClick="aggqta('qta<%=counterfrm%>')"  class="plus" value="+" >
										</div>
			     
					<input type="button" onMouseOver="" border="0" class="shop" onClick="carrellood('<%=tbprodcatalogo("codice_od")%>', document.formb<%=counterfrm%>.qta<%=counterfrm%>.value)" value="">
					<%response.Write("</form>")%><hr>
					   <!---a href="carrellood.asp?cod=<%=tbprodcatalogo("codice_od")%>&fquantity=12" >carrello</a--->
					<a href="javascript:opensn('listinovisua.asp?For=od&Op=Ins&Cod_Lis=<%=tbprodcatalogo("codice_od")%>','Dettagli');" class="tx10 nero lnk"><img src="images/preferiti.jpg">AGG. PREFERITI</a>
				</div>                       
			</div>
		</div>
<%
end if%>
