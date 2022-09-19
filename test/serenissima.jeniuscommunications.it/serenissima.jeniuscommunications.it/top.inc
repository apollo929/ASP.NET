 
 <button onclick="topFunction()" id="myBtn" title="Go to top">top</button>

 
  <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                           
                            <!---li><a href="listino.asp"><i class="fa fa-heart"></i>Preferiti</a></li>
                            <li><a href="carrellovisua.asp"><i class="fa fa-user"></i> Checkout</a></li--->
													<%if Session("Chisono")<>"" then%>
						     <li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">user :</span><span class="value">profilo </span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="registratiupdate.asp">modifica</a></li>
                                </ul>
                            </li>

						<%else%>
							<li><i class="fa fa-user"></i>
							<%response.write("user non collegato")%>
							</li>
						<%end if%>
						 <li><a href="index.asp"><i class="fa fa-user"></i> Accedi</a></li>
							<li><a href="logout.asp"><i class="fa fa-user"></i> Logout</a></li>	                            
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="header-right">
                        <ul class="list-unstyled list-inline">

						
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
                        <h1><a href="./"><img src="images/logohome.jpg"></a></h1>
						
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
	