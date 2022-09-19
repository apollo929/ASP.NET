<div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">  
								<form name="formsearch" action="adutentipro.asp?ric=search" method="post">
                                <div class="input-group custom-search-form">								    
                                    <input type="text" name="dett" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="submit">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>									
                                </div>
								</form>
                                <!-- /input-group -->
                            </li>
                            <li>
                                <a href="adutentipro.asp"><i class="fa fa-dashboard fa-fw"></i> DASHBOARD <br><%=Session("ragionesocialetesto")%><span class="fa arrow"></span></a>
								                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="adutentiamministratori.asp">utenti area riservata</a>
                                    </li>
									<li>
                                        <a href="adcoupon.asp">gestione coupon</a>
                                    </li>
								
                             </ul>
                            </li>
							<li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> GESTIONE EVENTI <span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="eventi_titolo.asp">gestione eventi</a>
                                    </li>
									
									<!---li>
                                        <a href="../cuteditor/editor.asp">modifica newsletter</a>
                                    </li>
									<li>
                                        <a href="adnewsinviate.asp">newsletter inviate</a>
                                    </li>
									<li>
                                        <a href="adnewsinvio.asp">invio newsletter</a>
                                    </li--->
                             </ul>
                                <!-- /.nav-second-level -->
                            </li>							
							<!---li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> GESTIONE NEWSLETTER <span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="adnewsimport.asp">lista mail import excel </a>
                                    </li>
									
									<li>
                                        <a href="../cuteditor/editor.asp">modifica newsletter</a>
                                    </li>
									<li>
                                        <a href="adnewsinviate.asp">newsletter inviate</a>
                                    </li>
									<li>
                                        <a href="adnewsinvio.asp">invio newsletter</a>
                                    </li>
                             </ul>
                                <!-- /.nav-second-level -->
                            </li--->
                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> UTENTI<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="adutentiinternet.asp">utenti internet</a>
                                    </li>
									                                    <li>
                                        <a href="adutentipro.asp">utenti interni</a>
                                    </li>
                             </ul>
                                <!-- /.nav-second-level -->
                            </li>
							
							
						<!---li>
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> GESTIONE PRODOTTI DATI&FOTO<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="adgestionefotobuffetti.asp">gestione prodotti buffetti</a>
                                    </li>
									                                    <li>
                                        <a href="adgestionefotood.asp">gestione prodotti od</a>
                                    </li>
																		                                    <li>
                                        <a href="adgestionedaeliminare.asp">prodotti da eliminare dopo aggiornamento</a>
                                    </li>
                             </ul>
                                <!-- /.nav-second-level -->
                            </li--->
							
						
							                            <li>
                                <a href="#">	<i class="fa fa-gear fa-fw"></i>E-COMMERCE MANUALE<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
																	<li>
									<a href="merchant_articoli.asp?cmd=new">tutti i prodotti</a>
									</li>
									<li>
									<a href="merchant_articoli.asp?cmd=new">inserimento prodotti</a>
									</li>
									<li>
									<a href="merchant_adcategorie.asp">categorie prodotti</a>
									</li> 
									<li>
									<a href="merchant_adsottocategorie.asp">sottocategorie prodotti</a>
									</li> 									
                                </ul>
                               
                                <!-- /.nav-second-level -->
                            </li>
							
							
                            <li>
                                <a href="#"><i class="fa fa-wrench fa-fw"></i>ORDINI ESEGUITI<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
									<li>
									<a href="adordini.asp">ordini via web</a>
									</li>                                 
                                </ul>
                               
                                <!-- /.nav-second-level -->
                            </li>
										                <li class="active">
                                <a href="adindex.asp"><i class="fa fa-files-o fa-fw"></i>SHOP FACEBOOK<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
																		<li>
									<a href="adcreafacebookshop.asp">file export .csv per facebook</a>
									</li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
							                            <li>
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>LOG UTENTI COLLEGATI<span class="fa arrow"></span></a>
								                              <ul class="nav nav-second-level">
									<li>
									<a href="adutenticollegati.asp">statistiche log utenti al sito</a>
									</li>
                                  
                                </ul>
                            </li>
			                <li class="active">
                                <a href="adindex.asp"><i class="fa fa-sign-out fa-fw"></i>TORNA IN HOMEPAGE<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
																		<li>
									<a href="logout.asp">logout</a>
									</li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
		<!-----		GRAFICO fa fa-bar-chart-o fa-fw
				CASA fa fa-home fa-fw
				LOGOUT fa fa-sign-out fa-fw---->
            </nav>