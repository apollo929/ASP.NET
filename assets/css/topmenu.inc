    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" id="menu-toggle" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="main-menu">
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
						querydmenu="Select distinct categoria,sottocategoria From prodotti order by categoria asc,sottocategoria asc"	
						Set tbmenutop = Server.CreateObject("ADODB.RecordSet")
						tbmenutop.Open querydmenu,connm
						%>
						
						
                        <li class="active"><a href="index.asp">HOME</a></li>	
						<li class="has-dropdown">
							<a href="odcat.asp?cat=ABBATTITORI#topage">ABBATTITORI<i class="fa fa-angle-down"></i></a>
							<!-- Sub Menu -->
							<%if mobile<>"ok" then%>
							<ul class="sub-menu" style="list-style-type: none;">
							  <%do while not tbmenutop.eof
								if ucase(trim(tbmenutop("categoria")))="ABBATTITORI" then%>
								<li><a href="odlista.asp?sotto=<%=ucase(trim(tbmenutop("sottocategoria")))%>&cat=<%=ucase(trim(tbmenutop("categoria")))%>#odposizione"><%=ucase(trim(tbmenutop("sottocategoria")))%></a></li><hr>                                        
							  <%end if 
							  tbmenutop.movenext
							  loop%>
								<div class="menu-banner mb-3">
								<a href="odcat.asp?cat=ABBATTITORI#topage" class="menu-banner-link">
								<img class="menu-banner-img" src="images/05M.jpg" alt="">
								</a>
								</div>
							</ul>
							<%end if%>
						</li>
					
							
					   <li class="has-dropdown has-megaitem">
						   <a href="odcat.asp?cat=COTTURA 650#topage">COTTURA 650<i class="fa fa-angle-down"></i></a>
							<!-- Mega Menu -->
							<%if mobile<>"ok" then%>
							<div class="mega-menu">
								<ul class="mega-menu-inner" style="list-style-type: none;">
								 <%i=0											   
								  tbmenutop.movefirst
								  do while not tbmenutop.eof	
									if ucase(trim(tbmenutop("categoria")))="COTTURA 650" then
										if i=0 then 
											response.write("<li class='mega-menu-item'><ul class='mega-menu-sub'>")
										end if  
										i=i+1%>
										<li><a href="odlista.asp?sotto=<%=ucase(trim(tbmenutop("sottocategoria")))%>&cat=<%=ucase(trim(tbmenutop("categoria")))%>#odposizione"><%=ucase(trim(tbmenutop("sottocategoria")))%></a></li><hr>                                        
										<%
										if i=5 then 
											response.write("</ul></li>")		
											i=0
										end if
									end if												
								  tbmenutop.movenext
								  loop%>   
								</ul>
								<div >
									<a href="odcat.asp?cat=COTTURA 650#topage" class="menu-banner-link">
									<img class="menu-banner-img" src="images/09-650M.jpg" alt="">
									</a>
								</div>
							</div>
							<%end if%>
						</li>						
										
					
					   <li class="has-dropdown has-megaitem">
						   <a href="odcat.asp?cat=COTTURA 700#topage">COTTURA 700<i class="fa fa-angle-down"></i></a>
							<!-- Mega Menu -->
							<%if mobile<>"ok" then%>
							<div class="mega-menu">
								<ul class="mega-menu-inner" style="list-style-type: none;">
								 <%i=0											   
								  tbmenutop.movefirst
								  do while not tbmenutop.eof	
									if ucase(trim(tbmenutop("categoria")))="COTTURA 700" then
										if i=0 then 
											response.write("<li class='mega-menu-item'><ul class='mega-menu-sub'>")
										end if  
										i=i+1%>
										<li><a href="odlista.asp?sotto=<%=ucase(trim(tbmenutop("sottocategoria")))%>&cat=<%=ucase(trim(tbmenutop("categoria")))%>#odposizione"><%=ucase(trim(tbmenutop("sottocategoria")))%></a></li><hr>                                        
										<%
										if i=5 then 
											response.write("</ul></li>")		
											i=0
										end if
									end if												
								  tbmenutop.movenext
								  loop%>   
								</ul>
								<div >
								<a href="odcat.asp?cat=COTTURA 700#topage" class="menu-banner-link">
								<img class="menu-banner-img" src="images/09-700M.jpg" alt="">
								</a>
								</div>
							</div>
							<%end if%>
						</li>							
						
					
					   <li class="has-dropdown has-megaitem">
						   <a href="odcat.asp?cat=COTTURA 900#topage">COTTURA 900<i class="fa fa-angle-down"></i></a>
							<!-- Mega Menu -->
							<%if mobile<>"ok" then%>
							<div class="mega-menu">
								<ul class="mega-menu-inner" style="list-style-type: none;">
								 <%i=0											   
								  tbmenutop.movefirst
								  do while not tbmenutop.eof	
									if ucase(trim(tbmenutop("categoria")))="COTTURA 900" then
										if i=0 then 
											response.write("<li class='mega-menu-item'><ul class='mega-menu-sub'>")
										end if  
										i=i+1%>
										<li><a href="odlista.asp?sotto=<%=ucase(trim(tbmenutop("sottocategoria")))%>&cat=<%=ucase(trim(tbmenutop("categoria")))%>#odposizione"><%=ucase(trim(tbmenutop("sottocategoria")))%></a></li><hr>                                        
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
								<a href="odcat.asp?cat=COTTURA 900#topage" class="menu-banner-link">
								<img class="menu-banner-img" src="images/09-900M.jpg" alt="">
								</a>
								</div>
							</div>
							<%end if%>
						</li>						
						
						
						<li class="has-dropdown">
							<a href="odcat.asp?cat=FORNI#topage">FORNI<i class="fa fa-angle-down"></i></a>
							<!-- Sub Menu -->
							<%if mobile<>"ok" then%>
							<ul class="sub-menu" style="list-style-type: none;">
							  <%
							  tbmenutop.movefirst
							  do while not tbmenutop.eof
								if ucase(trim(tbmenutop("categoria")))="FORNI" then%>
								<li><a href="odlista.asp?sotto=<%=ucase(trim(tbmenutop("sottocategoria")))%>&cat=<%=ucase(trim(tbmenutop("categoria")))%>#odposizione"><%=ucase(trim(tbmenutop("sottocategoria")))%></a></li><hr>                                        
							  <%end if 
							  tbmenutop.movenext
							  loop%>
								<div class="menu-banner mb-3">
								<a href="odcat.asp?cat=FORNI#topage" class="menu-banner-link">
								<img class="menu-banner-img" src="images/04M.jpg" alt="">
								</a>
								</div>
							</ul>
							<%end if%>
						</li>	
						<li class="has-dropdown">
							<a href="odcat.asp?cat=REFRIGERAZIONE#topage">REFRIGERAZIONE<i class="fa fa-angle-down"></i></a>
							<!-- Sub Menu -->
							<%if mobile<>"ok" then%>
							<ul class="sub-menu" style="list-style-type: none;">
							  <%
							  tbmenutop.movefirst
							  do while not tbmenutop.eof
								if ucase(trim(tbmenutop("categoria")))="REFRIGERAZIONE" then%>
								<li><a href="odlista.asp?sotto=<%=ucase(trim(tbmenutop("sottocategoria")))%>&cat=<%=ucase(trim(tbmenutop("categoria")))%>#odposizione"><%=ucase(trim(tbmenutop("sottocategoria")))%></a></li><hr>                                        
							  <%end if 
							  tbmenutop.movenext
							  loop
							  %>
								<div class="menu-banner mb-3">
								<a href="odcat.asp?cat=REFRIGERAZIONE#topage" class="menu-banner-link">
								<img class="menu-banner-img" src="images/01M.jpg" alt="">
								</a>
								</div>
							</ul>
							<%end if%>
						</li>
						
 						
						


	             
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

					

	
		