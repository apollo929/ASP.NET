   
                    <a style="position:relative;" name="topage"></a><br><br><br><br>
                    <div class="single-sidebar">
					
								<%
								if mobile<>"ok" or linkurl="index.asp" then
								
								
								
								if Session("Chisono")="" then%>
									<table width="240px" cellpadding="0" cellspacing="0" class="tx12 nero">
									    <tr><td align="left" colspan="2">
										<button class="rettangolo_blu" >&nbsp;LOGIN&nbsp;</button></td></tr>
										<tr><td height="20px"></td></tr>
										<form action="clienti.asp?ut=psw" method="post" id="Form2" name="form1">
										<tr><td>UTENTE:</td><td><input type="text" name="utente" style="background:#E86868;color:#ffffff;width:150px;" maxlength="60" class="bordo_form"></td></tr>
										<tr><td height="5px"></td></tr>
										<tr><td>PASSWORD:</td><td><input type="password" name="password" style="background:#E86868;color:#ffffff;width:150px;" maxlength="60" class="bordo_form"></td></tr>
										<tr><td height="10px"></td></tr>
										<tr><td align="center" colspan="2"><input type="submit" value="ACCEDI" class="button"></td></tr>
										</form>
										<tr><td height="20px"></td></tr>
									</table>
								<%else%>
									<table width="240px" cellpadding="0" cellspacing="0" class="tx12 nero">
										<tr><td height="20px"></td></tr>
										<tr><td colspan="2" align="center">utente collegato<br>
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
										<tr><td align="center"><button class="rettangolo_arancio" onclick="top.location.href='logout.asp'">&nbsp;&nbsp;LOGOUT&nbsp;&nbsp;</button></td></tr>
										<tr><td colspan="2" height="10px"></td></tr>
										<tr><td align="center"> <div class="coupon">
										<form action=preventivocarica.asp#topage method=post id=formceck name=formceck>
										<input type="submit" style="color: #fff;background: #E86868;padding: 11px 20px;" value="LISTA PREVENTIVI" name="proceed"  class="rettangolo_arancio">
										</form></div></td></tr>
										<tr><td colspan="2" height="10px"></td></tr>
										<tr><td align="center"> <div class="coupon">
										<form action=ordinecarica.asp#topage method=post id=formceck name=formceck>
										<input type="submit" style="color: #fff;background: #E86868;padding: 11px 20px;" value="LISTA ORDINATI" name="proceed"  class="rettangolo_arancio">
										</form></div></td></tr>										
										<tr><td colspan="2" height="10px"></td></tr>
									 
									</table>
								<%end if							

								
									%>
									<h2 >																		
										<button class="rettangolo_arancio" onclick="top.location.href='odcat.asp'" >&nbsp;MENU'&nbsp;</button>
									</h2>
									<ul>
									<%
									tbmenutop.movefirst
									do while not tbmenutop.eof
									    if mem<>tbmenutop("categoria") then
										 mem=""%>
											<li><a href="odcat.asp?cat=<%=replace(tbmenutop("categoria")," ","%20")%>#<%=replace(tbmenutop("categoria")," ","%20")%>" class="m_scritte"><%=ucase(tbmenutop("categoria"))%></a></li>
										<%end if
										mem=tbmenutop("categoria")
										tbmenutop.movenext
									loop
									'CHIUSURA
									tbmenutop.close

							     'end if
								 %>	
				
								</ul>
								<br><br><br><br> 
								<!---br><br><br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br--->  
								<%
								'fine navigazione smarphone
								end if%>
								
								</div>
								</div>

								<%
								'response.write(linkurl)
								if linkurl<>"index.asp" then%> 									
								<form action="javascript: history.back()" method=post id=formback name=formback>
								<input type="submit" value="indietro" name="proceed" class="checkout-button button alt wc-forward"><br><br><br>
								</form>
								<%end if%>