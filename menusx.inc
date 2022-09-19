   
                    
                    <div class="single-sidebar" style="width:220px;left:0px">
					
					
					
								<%if Session("Chisono")="" then%>
									<table width="220px" cellpadding="0" cellspacing="0" >
										<tr><td height="20px"></td></tr>
										<form action="clienti.asp?ut=psw" method="post" id="Form2" name="form1">
										<tr><td>UTENTE:</td><td><input type="text" name="utente" style="width:150px;" maxlength="60" class="bordo_form"></td></tr>
										<tr><td height="5px"></td></tr>
										<tr><td>PASSWORD:</td><td><input type="password" name="password" style="width:150px;" maxlength="60" class="bordo_form"></td></tr>
										<tr><td height="10px"></td></tr>
										<tr><td align="center" colspan="2"><input type="submit" value="ACCEDI" class="button"></td></tr>
										</form>
										<tr><td height="20px"></td></tr>
									</table>
								<%else%>
									<table width="220px" cellpadding="0" cellspacing="0" class="tx12 nero">
										<tr><td height="20px"></td></tr>
										<tr><td colspan="2" align="center">
											<%if Session("sRagione")<>"" then
												response.Write(Session("sRagione"))
											else
												if Session("sRagione")<>"" then
													response.Write(Session("sRagione"))
												else
													response.Write(Session("nomeutente"))
												end if
											end if%>
										</td></tr>
										<tr><td colspan="2" height="10px"></td></tr>
										<tr><td align="center"><button style="width:220px;background:#ff0000;color:#ffffff;height:45px;border: solid 1px #ff0000;  " onclick="top.location.href='logout.asp'">&nbsp;&nbsp;LOGOUT&nbsp;&nbsp;</button></td></tr>
										<tr><td colspan="2" height="10px"></td></tr>
									</table>
								<%end if%>
									
					                       
								<%

								if mobile<>"ok" then

									'genero categorie per menusx
									querymenusx="Select Distinct catdescription,categoryID From shop_categories order by catdescription asc"
									set tbmenusx = server.createobject("adodb.recordset")
									tbmenusx.open querymenusx,connm
									%>
									<h2 class="sidebar-title">Menu'</h2>
									<ul>
									<%do while not tbmenusx.eof										
										%>					
										<li><a href="shopmancat.asp?id=<%=tbmenusx("categoryID")%>#primaindietro" ><%=ucase(tbmenusx("catdescription"))%></a></li>
										<%
										tbmenusx.movenext
									loop
									tbmenusx.close							   
								 %>
			
									  <!---li>
									  <center><br><a href="shop.asp" target="_blank"><img src="http://www.informaticaml.biz/catalogo/magazine.jpg" border="0"></a></center>
									  </li---> 
									  <li>
									  <center><br><div class="fb-like-box" data-href="<%=Session("facebook")%>" data-width="230" data-height="300" data-colorscheme="light" data-show-faces="true" data-header="true" data-stream="false" data-show-border="true"></div></center>
										
									  </li>
									</ul>
								 
						     <%end if%>
							
                    </div>
                </div>
		 
				<%
				'response.write(linkurl)
				if linkurl<>"index.asp" then%>
				<a style="position:relative;top:-60px;" name="primaindietro"></a>	
				<form action="javascript: history.back()" method=post id=formback name=formback>
				<input type="submit" value="indietro" name="proceed" class="checkout-button button alt wc-forward"><br><br><br>
				</form>
				<%end if%>