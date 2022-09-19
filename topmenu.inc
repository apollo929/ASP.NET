    <% on error resume next %>
	<div style="background:#515151;" class="header-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" id="menu-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="main-menu" >
						<nav>
                                <ul>
					   <!--- li class="dropdown dropdown-small">
							<a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">currency :</span><span class="value">EUR </span><b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">EUR</a></li>
							</ul>
						</li>
						<li class="dropdown dropdown-small">
							<a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">language :</span><span class="value">Italian </span><b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Italian</a></li>

							</ul>
						</li--->
						
						<% 'MENU
						querydmenu="Select Distinct catdescription,categoryID From shop_categories order by catdescription asc"	
						Set tbmenutop = Server.CreateObject("ADODB.RecordSet")
						tbmenutop.Open querydmenu,connm
						%>
						
						
                        <li class="active"><a style="color:#ffffff;" href="https://shop.hatseries.com/">HOME</a></li>	
						<li><a style="color:#ffffff;" href="iscrizioni.asp#topage">ISCRIZIONE</a></li>
						<li class="has-dropdown">
							<a class="active2" style="color:#ffffff;" href="shopmancat.asp#topage">HATSERIES GADGET<i class="fa fa-angle-down"></i></a>
							<!-- Sub Menu -->
							<%if mobile<>"ok" then%>
							<ul class="sub-menu" style="list-style-type: none;">
							  <%do while not tbmenutop.eof
								%>
								<li><a href="shopmancat.asp?id=<%=tbmenutop("categoryID")%>#topage"><%=ucase(trim(tbmenutop("catdescription")))%></a></li><hr>                                        
							  <% 
							  tbmenutop.movenext
							  loop%>
								<div class="menu-banner mb-3">
								<a href="odcat.asp?cat=ABBATTITORI#topage" class="menu-banner-link">
								<img class="menu-banner-img" src="images/05M.jpg" alt="">
								</a>
								</div>
							</ul>
							<%end if
						tbmenutop.close%>
						</li>
					
							
					   
					   	<%'EVENTO
						querydmenu="SELECT * FROM eventi_titolo INNER JOIN eventi_sottotitolo ON eventi_titolo.categoryID = eventi_sottotitolo.categoria INNER JOIN eventi ON eventi.categoria = eventi_sottotitolo.categoria group by id_sottotitolo order by categoryID asc,id_sottotitolo asc"
						tbmenutop.Open querydmenu,connm
						%>
						<li class="has-dropdown has-megaitem">
						   <a style="color:#ffffff;"   href="eventi.asp">PARTECIPA EVENTI<i class="fa fa-angle-down"></i></a>
							<!-- Mega Menu -->
							<%if mobile<>"ok" then%>
							<div class="mega-menu">
								<ul class="mega-menu-inner" style="list-style-type: none;">
								 <%i=0											   
								  tbmenutop.movefirst
								  do while not tbmenutop.eof
								    if ucase(trim(tbmenutop("eventoviaggiocorso")))="EVENTO" then
										if i=0 then 
											response.write("<li class='mega-menu-item'><ul class='mega-menu-sub'>")
										end if  
										i=i+1%>
										<li><a href="eventiviaggicorsidettaglio.asp?id=<%=tbmenutop("categoryID")%>#topage"><%=ucase(trim(tbmenutop("titolo")))%><%=ucase(trim(tbmenutop("sottotitolo")))%></a></li><hr>                                        
										<%
										if i=7 then 
											response.write("</ul></li>")		
											i=0
										end if	
									end if			
								  tbmenutop.movenext
								  loop%>   
								</ul>
								<div >									
								</div>
							</div>
							<%end if%>
						</li>						
				
							
					
					   <li class="has-dropdown has-megaitem">
						   <a style="color:#ffffff;"  href="eventi.asp">PARTECIPA VIAGGI<i class="fa fa-angle-down"></i></a>
							<!-- Mega Menu -->
							<%if mobile<>"ok" then%>
							<div class="mega-menu">
								<ul class="mega-menu-inner" style="list-style-type: none;">
								 <%i=0											   
								  tbmenutop.movefirst
								  do while not tbmenutop.eof	
									if ucase(trim(tbmenutop("eventoviaggiocorso")))="VIAGGIO" then
										if i=0 then 
											response.write("<li class='mega-menu-item'><ul class='mega-menu-sub'>")
										end if  
										i=i+1%>
										<li><a href="eventiviaggicorsidettaglio.asp?id=<%=tbmenutop("categoryID")%>#topage"><%=ucase(trim(tbmenutop("titolo")))%><%=ucase(trim(tbmenutop("sottotitolo")))%></a></li><hr>                                        
										<%
										if i=7 then 
											response.write("</ul></li>")		
											i=0
										end if	
									end if			
								  tbmenutop.movenext
								  loop%>   
								</ul>
								<div >								
								</div>
							</div>
							<%end if%>
						</li>							
				 
					
					   <li class="has-dropdown has-megaitem">
						   <a style="color:#ffffff;" href="eventi.asp">PARTECIPA CORSI<i class="fa fa-angle-down"></i></a>
							<!-- Mega Menu -->
							<%if mobile<>"ok" then%>
							<div class="mega-menu">
								<ul class="mega-menu-inner" style="list-style-type: none;">
								 <%i=0											   
								  tbmenutop.movefirst
								  do while not tbmenutop.eof	
									if ucase(trim(tbmenutop("eventoviaggiocorso")))="CORSO" then
										if i=0 then 
											response.write("<li class='mega-menu-item'><ul class='mega-menu-sub'>")
										end if  
										i=i+1%>
										<li><a href="eventiviaggicorsidettaglio.asp?id=<%=tbmenutop("categoryID")%>#topage"><%=ucase(trim(tbmenutop("titolo")))%><%=ucase(trim(tbmenutop("sottotitolo")))%></a></li><hr>                                        
										<%
										if i=7 then 
											response.write("</ul></li>")		
											i=0
										end if	
									end if			
								  tbmenutop.movenext
								  loop%>   
								</ul>
								<div >								
								</div>
							</div>
							<%end if%>
						</li>		
						<li><a style="color:#ffffff;" href="contattaci.asp#topage">CONTATTACI</a></li> 

	             
                                </ul>
                            </nav>
                </div>  
            </div>
        </div>
    </div>  
	
	<!-- End mainmenu area -->
	
					
					<div class="container" style="background:#ffffff;">
					<div class="row">
					<div class="col-sm-6" style="height:85px;width:100%;">
						<div class="single-sidebar"><br>
							<!-- javascript -->
							<link type="text/css" rel="stylesheet" href="css/styles.css" />
							<script src="js/search.js" type="text/javascript" ></script>
							<script src="js/pagination.js" type="text/javascript"></script>
							<script type="text/javascript">
							<!--
							function mostraLoad() {
							terms.className="ajax_loader";
							return false;
							}
							function nomostraLoad() {
							terms.className="ajax_loader.clear";
							return false;
							}
							//-->
							</script>			
							<%if mobile="ok" then%>
								<form action="ricercagenerica.asp" method="get" id="formricerca" name="formricerca" >
								<input type="text" style="height:45px;width:200px;" id="terms" name="terms" onkeypress="mostraLoad();" onkeydown="nomostraLoad();" onkeyup="getScriptPage('show_results','terms','1');" onblur="nomostraLoad();if ( this.value == '' ) this.value = this.defaultValue" onfocus="if ( this.value == this.defaultValue ) this.value = ''" placeholder="codice , descrizione del prodotto che cerchi (min. 4 caratteri)" ><input type="submit" style="height:45px;" value="Search">
								</form>
							 <%else%>
								<form action="ricercagenerica.asp" method="get" id="formricerca" name="formricerca" >
								<input type="text" style="height:45px;width:480px;" id="terms" name="terms" onkeypress="mostraLoad();" onkeydown="nomostraLoad();" onkeyup="getScriptPage('show_results','terms','1');" onblur="nomostraLoad();if ( this.value == '' ) this.value = this.defaultValue" onfocus="if ( this.value == this.defaultValue ) this.value = ''" placeholder="codice , descrizione del prodotto che cerchi (min. 4 caratteri)" ><input type="submit" style="height:45px;" value="Search">
								</form>			 
							<%end if%>	
							<div id="content">
							<div id="show_results" ></div><!-- end counter display -->
							</div>	  
						
					</div>
					</div>
					</div>	
</div>

					

	
		