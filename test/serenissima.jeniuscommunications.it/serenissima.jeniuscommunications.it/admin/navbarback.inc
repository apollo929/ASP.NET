<div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
								<form name="formsearch" action="adindex.asp?ric=search" method="post">
                                <div class="input-group custom-search-form">								    
                                    <input type="text" id="codice_per_ricerca" name="codice_per_ricerca" class="form-control" placeholder="n pratica & nominativo...">
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
                                <a href="adindex.asp"><i class="fa fa-dashboard fa-fw"></i> Dashboard <%=ucase(session("loginprovincia"))%></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Le mie pratiche<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="adpratiche.asp">Lista Pratiche</a>
                                    </li>
									                                    <li>
                                        <a href="adinsertpratica1.asp">Inserimento Pratica</a>
                                    </li>
		
                             </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="adappuntamenti.asp"><i class="fa fa-table fa-fw"></i>I Miei Appuntamenti<span class="fa arrow"></span></a>
								    <ul class="nav nav-second-level">
															  									<li>
									<a href="adappuntamenti.asp">Tutti in ordine inserimento</a>
									</li>
									<li>
									<a href="adappuntamenti.asp?tric=0">Mese in Corso</a>
									</li>
																		</li>
									<li>
									<a href="adappuntamenti.asp?tric=3">Mese Prossimo</a>
									</li>
									<li>
									<a href="adappuntamenti.asp?tric=1">Oggi</a>
									</li>
									<li>
									<a href="adappuntamenti.asp?tric=2">Domani</a>
									</li>                                    
                                </ul>
                            </li>
							
						
							    <li>
                                <a href="#">	<i class="fa fa-gear fa-fw"></i>Gestione Contatti / Leads<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
									<li>
									<a href="adleads.asp">Leads (tutti)</a>
									</li>
									<li>
									<a href="#">Leads Eliminati</a>
									</li>
									<li>
									<a href="#">Leads in Sospeso</a>
									</li>                                    
                                </ul>
                               
                                <!-- /.nav-second-level -->
                            </li>
							
							
                            <li>
                                <a href="#"><i class="fa fa-wrench fa-fw"></i>Assistenza / Rimozione<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
									<li>
									<a href="openticket.asp">open ticket</a>
									</li>
									<li>
									<a href="openticketall.asp">all ticket</a>
									</li>
                                </ul>
                               
                                <!-- /.nav-second-level -->
                            </li>
							                            <li>
                                <a href="#"><i class="fa fa-wrench fa-fw"></i>DataBase<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
									<li>
									<a href="dbamministratore.asp">DB Amministratore</a>
									</li>
									<li>
									<a href="dbpromemoria.asp">DB Promemoria</a>
									</li> 
									<li>
									<a href="dblead.asp">DB Tipo Lead / Contatti</a>
									</li>
									<li>
									<a href="dbdoc.asp">DB Tipo Documenti</a>
									</li> 
									<li>
									<a href="dbdocimm.asp">DB Tipo Doc. Immobili</a>
									</li> 
									<li>
									<a href="dbmutuo.asp">DB Tipo Mutuo</a>
									</li> 
									<li>
									<a href="dbfinanziamento.asp">DB Tipo Finanziamento</a>
									</li> 
									<li>
									<a href="dblavoratore.asp">DB Tipo Lavoratore</a>
									</li> 								
                                </ul>
                               
                                <!-- /.nav-second-level -->
                            </li>
														                            <li>
                                <a href="#"><i class="fa fa-wrench fa-fw"></i>DataBase Banche<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
																					<li>
									<a href="dbbanche.asp">DB Lista Banche</a>
									</li> 
									<li>
									<a href="dbbancaagricolevariabile.asp">DB Credit Agricole VAR.</a>
									</li>  
																		<li>
									<a href="dbbancaagricolefisso.asp">DB Credit Agricole FISSO</a>
									</li>
									<li>
									<a href="#">DB Monte Paschi di Siena</a>
									</li>  									
                                </ul>
                               
                                <!-- /.nav-second-level -->
                            </li>
			                <li class="active">
                                <a href="adindex.asp"><i class="fa fa-files-o fa-fw"></i>Torna in homepage<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
																	<li>
									<a href="adindex.asp">HOMEPAGE</a>
									</li>
									<li>
									<a href="dblog.asp">LOG OPERAZIONI</a>
									</li>
									<li>
									<a href="logout.asp">LOGOUT</a>
									</li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>