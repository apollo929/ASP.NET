<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" style="color:#ffffff;"  href="adindex.asp">Kiron S.p.A.</a> <a style="color:#ffffff;" class="navbar-brand" href="#"><%=session("titolonavigazione")%></a>
                </div>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <ul class="nav navbar-nav navbar-left navbar-top-links">
                    <!---li><a href="logout.asp"><istyle="color:#ffffff;  class="fa fa-home fa-fw"></i>Torna al sito (LOGOUT)</a></li>
				    <li><a  href="#"><i class="fa fa-home fa-fw"></i>Nome utente:<%=session("Cognome")%>&nbsp;<%=session("nome")%><%=session("Ragione")%> </a></li--->
				                   </ul>

                <ul class="nav navbar-right navbar-top-links">
                    <li class="dropdown navbar-inverse">
                        <a href="adindex.asp?log=ok">
                            <i style="color:<%=session("colore_promemoria")%>;" class="fa fa-bell fa-fw"></i><b style="color:<%=session("colore_promemoria")%>;" class="caret"></b>
                        </a>
                        
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" style="color:#ffffff;"  data-toggle="dropdown" href="#">
                            <i style="color:#ffffff;" class="fa fa-user fa-fw"></i><%=session("loginnominativo")%><b style="color:#ffffff;" class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                        
                            <li><a   href="logout.asp"><i   class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
			