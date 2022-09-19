<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="adutentipro.asp">Jenius Communications</a>
                </div>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>

                <ul class="nav navbar-nav navbar-left navbar-top-links">
                    <!---li><a href="logout.asp"><i class="fa fa-home fa-fw"></i>Torna al sito (LOGOUT)</a></li>
				    <li><a href="#"><i class="fa fa-home fa-fw"></i>Nome utente:<%=ucase(session("utentetipo"))%> </a></li--->
				                   </ul>

                <ul class="nav navbar-right navbar-top-links">
                    <li class="dropdown navbar-inverse">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell fa-fw"></i> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-comment fa-fw"></i> Nessun commento
                                        <span class="pull-right text-muted small">Nessuno</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> Nuovi messaggi
                                        <span class="pull-right text-muted small">Nessuno</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> Messaggi Inviati
                                        <span class="pull-right text-muted small">Nessuno</span>
                                    </div>                               
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a class="text-center" href="#">
                                    <strong>Tutti i messaggi</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i><%=session("loginnominativo")%><b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <i class="fa fa-user fa-fw"></i><%=tipo%><b class="caret"></b>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i>I tuoi dati</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="logout.asp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
			