 
 <button onclick="topFunction()" id="myBtn" title="Go to top">top</button>

 
  <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                            <li><a href="accedi.asp"><font color=#ff0000><i class="fa fa-user"></i> Accedi</a></font></li>
                            <li><a href="listino.asp"><i class="fa fa-heart"></i>Preferiti</a></li>
                            <li><a href="carrellovisua.asp"><i class="fa fa-user"></i> Checkout</a></li>
							<li><a href="logout.asp"><i class="fa fa-user"></i> Logout</a></li>	                            
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="header-right">
                        <ul class="list-unstyled list-inline">
						<%if Session("Chisono")<>"" then%>
						     <li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">user :</span><span class="value">profilo </span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="registratiupdate.asp">modifica</a></li>
                                </ul>
                            </li>
							<li><font color=#ff0000><i class="fa fa-user"></i>
							<%if Session("sRagione")<>"" then
								response.Write(Session("sRagione"))
							else
								if Session("sRagione")<>"" then
									response.Write(Session("sRagione"))
								else
									response.Write(Session("nomeutente"))
								end if
							end if%></font>
							</li>
						<%else%>
							<li><i class="fa fa-user"></i>
							<%response.write("user non collegato")%>
							</li>
						<%end if%>
						
                            <!---li class="dropdown dropdown-small">
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
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="./"><img src="images/logobuffettihome.jpg"></a></h1>
						<!---a href="odcat.asp" onmouseover="visualizza_menuod();document.getElementById('divmenuod').style.visibility ='visible';">Catalogo B&B</a>
						<div id="divmenuod"   style="visibility:hidden;z-index:9999;width:680px;height:500px:position:absolute;margin:20px 0 0 0px;text-align:right;text-align: right;vertical-align: left;"></div--->	
                    </div>
                </div>
				<%if mobile<>"ok" then%>
                <div class="col-sm-6">
                    <div class="shopping-item">
					<%if mobile<>"ok" then %> 
					<a href="carrellovisua.asp" onmouseover="Visualizza_carrello();document.getElementById('divcarrello').style.visibility ='visible';"><span class="cart-amunt"><div id="risultato"></div></span> <i class="fa fa-shopping-cart"></i> <span class="product-count"><%=session("sommaitem")%></span></a>
					<%else%>
					<a href="carrellovisua.asp"><span class="cart-amunt"><div id="risultato"></div></span> <i class="fa fa-shopping-cart"></i> <span class="product-count"><%=session("sommaitem")%></span></a>
					<%end if%>
					</div>
                </div>
				<div id="divcarrello" style="visibility:hidden;z-index:9999;width:680px;position:absolute;margin:120px 0 0 680px;text-align:right;text-align: right;vertical-align: right;"></div>
				<%else%>
				<div class="col-sm-6">
                    <div class="shopping-item">
 					<%if mobile<>"ok" then %> 
					<a href="carrellovisua.asp" onmouseover="Visualizza_carrello();document.getElementById('divcarrello').style.visibility ='visible';"><span class="cart-amunt"><div id="risultato"></div></span> <i class="fa fa-shopping-cart"></i> <span class="product-count"><%=session("sommaitem")%></span></a>
					<%else%>
					<a href="carrellovisua.asp"><span class="cart-amunt"><div id="risultato"></div></span> <i class="fa fa-shopping-cart"></i> <span class="product-count"><%=session("sommaitem")%></span></a>
					<%end if%>					
					</div>
                </div>
				<div id="divcarrello" style="visibility:hidden;z-index:9999;width:680px;position:absolute;margin:20px 0 0 0px;text-align:right;text-align: right;vertical-align: right;"></div>
				
				<%end if%>
            </div>
        </div>
    </div> <!-- End site branding area -->
	