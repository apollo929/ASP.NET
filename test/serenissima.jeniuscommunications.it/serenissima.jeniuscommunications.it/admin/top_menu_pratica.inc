             <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                               <li><a href="#"><i class="fa fa-home fa-fw"></i> nome utente:<%=session("loginnominativo")%> </a></li>
                            </div>
                            
                        </div>
                    </div>
                    <!-- /.col-lg-4 -->
                    <div class="col-lg-4">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                              <li><a href="#"><i class="fa fa-envelope-o"></i> email: </a><%=session("loginmail")%></li>
                            </div>
                            
                        </div>
                    </div>
                    <!-- /.col-lg-4 -->
                    <div class="col-lg-4">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <li><a href="#"><i class="fa fa-phone"></i> tel/mobile: </a><%=session("logintel")%></li>
                            </div>
                            
                        </div>
                    </div>
                    <!-- /.col-lg-4 -->
                </div>
                <!-- /.row -->  
				 <!-- /.row -->
                <div class="row">
					
                    <!-- /.col-lg-2 -->
                    <div class="col-lg-2">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                               <a href="adpratiche.asp"><i class="">TUTTE LE PRATICHE</i></a>
                            </div>                            
                        </div>
                    </div>
                    <!-- /.col-lg-2 -->
                    <div class="col-lg-2">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                              <a href="adinsertpratica2.asp?idpratica=<%=session("idpratica")%>"><i class="">MODIFICA PRATICA (dati intestatario)</i></a>
                            </div>							
							 </div>
                    </div>
                    <!-- /.col-lg-2 -->
					                    <!-- /.col-lg-2 -->
                    <div class="col-lg-2">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                              <a href="adinsertpratica3.asp?idpratica=<%=session("idpratica")%>"><i class="">MODIFICA PRATICA (dati immobile finanziari)</i></a>
                            </div>							
							 </div>
                    </div>
                    <!-- /.col-lg-2 -->
                    <div class="col-lg-2">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                              <a href="adinsertpratica4.asp?idpratica=<%=session("idpratica")%>"><i class="">DETTAGLIO PRATICA (tutti opzioni)</i></a>
                            </div>
                            
                        </div>
                    </div>

                </div>
				
                <!-- /.row --> 
                <div class="row">
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                              <a href="adinsertpratica4.asp?idpratica=<%=session("idpratica")%>"><i class="fa fa-files-o fa-fw"></i>HOMEpage numero pratica :<%=session("idpratica")%> </a>
                            </div>
                        </div>
                    </div>
                    <!-- /.col-lg-4 -->
                    <div class="col-lg-4">
                    </div>
                    <!-- /.col-lg-4 -->
                    <div class="col-lg-4">

                    </div>
                    <!-- /.col-lg-4 -->
                </div>