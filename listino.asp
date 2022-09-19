
<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
'Variabili 
Dim Tipocatalogo
Dim text_prezzo
Dim text_prezzog
Dim text_fornitore
'Variabili Connessione Db
Dim dbc3
Dim dbc4
Dim Mprezzo

Function fotoshopman(Byval Cod)
	Set tbfoto = Server.CreateObject("ADODB.RecordSet")
	sSql="SELECT cimageurl FROM shop_products where ccode='" & lcase(Trim(Cod)) & "' limit 1"
	tbfoto.Open sSql, connm
	Nome_foto=""
	Tipocatalogo="" 
	if tbfoto.eof then
	    fotoshopman=" "
	else
		fotoshopman=Trim(tbfoto("cimageurl")) 
	end if 	
	tbfoto.Close
End function

'x cancellare
If Request("del")="yes"  then
	'del listino codice spicers
	Set Tbdel = Server.CreateObject("ADODB.RecordSet")
	sSQLdel = "Delete From Listino where Id=" & Clng(Request("Cod"))
	Tbdel.Open sSQLdel,connm	
End if

'Pagine
Divpagine=20
'Pagine gestione
paginasp=request("Pagsp")
if paginasp="" then 
	paginasp=0
else 
	paginasp=cint(paginasp)*Divpagine
end if
if Trim(cstr(Replace(Request("Ricerca"),"%20"," ")))<>"" then
	vordine=Trim(cstr(Replace(Request("Ricerca"),"%20"," ")))
else
	vordine=" SottoCategoria,Prezzo asc "
end if

'utente normale o navigante
If Trim(Session("Chisono"))="" then 
	txtcodcliente="NN"
	text_sessionid=Trim(Session.SessionID)

	'Query
	querydcount="Select count(*) as Tot from listino where codcliente='NN' and password1='" & text_sessionid & "' order by id desc"
	Set Tbcount = Server.CreateObject("ADODB.RecordSet")				
	Tbcount.Open querydcount,connm
	
	npaginecat=Formatnumber(Cint(Tbcount("Tot")) / 20,0)
	npaginemax=Cint(Tbcount("Tot"))
	Tbcount.close

	sqlvis="Select * from listino where codcliente='NN' and password1='" & text_sessionid & "' order by id desc LIMIT " & paginasp & " , " & Divpagine
		
else
	txtcodcliente="REG"
	text_sessionid=cstr(Session("Chisono"))
	
	'Query
	querydcount="Select count(*) as Tot from listino where codcliente='REG' and password1='" & text_sessionid & "' order by id desc "
	Set Tbcount = Server.CreateObject("ADODB.RecordSet")				
	Tbcount.Open querydcount,connm
	
	npaginecat=Formatnumber(Cint(Tbcount("Tot")) / 20,0)
	npaginemax=Cint(Tbcount("Tot"))
	Tbcount.close
	
	sqlvis="Select * from listino where codcliente='REG' and password1='" & text_sessionid & "' order by id desc LIMIT " & paginasp & " , " & Divpagine
	
End if 	

Set Tbcarins = Server.CreateObject("ADODB.RecordSet")		
Tbcarins.Open sqlvis, connm

	If Trim(Session("Chisono"))="" then 	 
		queryd2="Select * from listino where codcliente='NN' and password1='" & text_sessionid & "' GROUP BY codice_isp  order by id desc" 
		Tbcarins.Close	
		Tbcarins.Open queryd2,connm
		'controllo
		'response.Write(queryd2)
	else
		queryd2="Select * from listino where codcliente='REG' and password1='" & text_sessionid & "' GROUP BY codice_isp  order by id desc"
		Tbcarins.Close	
		Tbcarins.Open queryd2,connm
		'controllo
		'response.Write(queryd2)
	end if
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
                        <h2>Preferiti</h2>
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
            <div class="row">
                <div class="col-md-3">
						
						<!--#include file="menusx.inc" -->	
					
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">	

							
								<TABLE width="90%" align="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" class="tx12 nero">
								<tr><td height="10px"></td></tr>			
								<%
								counterfrm=10
								i=0
								if not Tbcarins.eof then
									Do While not Tbcarins.eof
										counterfrm=counterfrm+1
										i=i+1
										Descrizione=Trim(replace(replace(replace(Tbcarins("Descrizione"),"'","`"),"*"," "),"&"," "))
										'Mprezzo=Tbcarins("Prezzo")											
										%>
										
										<tr> 
										     <td width=15px>
											 	<a href="listino.asp?del=yes&cod=<%=Tbcarins("id")%>">X</a><br><br>
											 </td>
											<td align="center">
											<% 
											if lcase(Tbcarins("fornitore"))="od" then%>
												<a href="oddettagli.asp?cod=<%=Tbcarins("codice_isp")%>"><img src='foto.asp?cat=catalogoisp\piccole&img=<%=Tbcarins("codice_isp")%>.jpg' border="0"></a>												
											<%end if
											if lcase(Tbcarins("fornitore"))="buffetti" or lcase(Tbcarins("fornitore"))="magazine" then%>
												<a href="dettaglibuffettishop.asp?cod=<%=Tbcarins("codice_isp")%>"><img src='foto.asp?cat=catalogobuffetti2016_small&img=<%=Tbcarins("codice_isp")%>.jpg' border="0"></a>											
											<%end if
											if lcase(tbcarins("fornitore"))="shopmanuale" then%>
											<%
											txt_imm=fotoshopman(trim(tbcarins("codice_isp")))
											newimmagine=replace(txt_imm," ","%20")%>
											<img src='admin/articoli/<%=newimmagine%>'	style="max-width:180px;max-height:120px;">								
											<%end if%>												
											</td>
											<%counterfrm=counterfrm+1%>
											<td align="left">
												<%=ucase(Tbcarins("codice_isp"))%><br>
												<%=Descrizione%>
											</td>								
											
											<td></td>
											
										
											<td align="left" width="230px" height="150px">

												<br>
												<%if lcase(tbcarins("fornitore"))="shopmanuale" then%>
												<a href="shopmandett.asp?ccode=<%=Tbcarins("codice_isp")%>"><input type="submit"  border="0" class="button"  value="&nbsp;&nbsp;PROCEDI&nbsp;CON&nbsp;L'&nbsp;ACQUISTO&nbsp;"></a><br><br>
												<%else%>
												<a href="ricercagenerica.asp?terms=<%=Tbcarins("codice_isp")%>"><input type="submit"  border="0" class="button"  value="&nbsp;&nbsp;PROCEDI&nbsp;CON&nbsp;L'&nbsp;ACQUISTO&nbsp;"></a><br><br>
												<%end if%>
              								</td>		
											
											
										</tr>	
										<%
										Tbcarins.movenext
										if not Tbcarins.eof then
										%>
										<tr><td height="10px"></td></tr>
										<tr><td colspan="8" height="1px" bgcolor="#009ac5"></td></tr>
										<tr><td height="10px"></td></tr>
										<%
										end if
									Loop
								else
									%>
									<tr><td>NESSUN ELEMENTO PRESENTE</td></tr>
								<%end if%>
								</TABLE>
								
								<center>
								<table>
									<tr>
										<td>
											<%
												
											paginabol=false
											for fsp=1 to npaginecat		
																									
											Response.Write "<a  class=gray9  href='listino.asp?pagsp=" & fsp & "'>"
											if trim(request("pagsp"))=cstr(fsp) then
												Response.Write " [" & fsp & "] "
											else
												if trim(request("pagsp"))="" and paginabol=false then
													Response.Write " [1] "
													paginabol=true
												else
													Response.Write " " & fsp & " "
												end if 
											end if 
											Response.Write "</a>"
											next
											
											%>    
										</td>
									</tr>
								</table>
								</center>
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
						