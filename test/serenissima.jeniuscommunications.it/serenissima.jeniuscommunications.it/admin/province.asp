					<div class="row" >
						<div class="col-lg-4">
                            <div class="panel-body">
									<form name="formcerca" action="interventi_scelta.asp" method="post">				
											<div class="form-group">
											<select class="form-control" name="provincia" id="Provincia">
											<%if provincia<>"" then%>
											<option value="<%=provincia%>" selected="selected"><%=lcase(provincia)%></option>
											<%end if%>
											<%do while not tbprov.eof%>
											<%if provincia<>"" then%>
											<%if tbprov("Provincia")=provicia then tbprov.movenext()%>
											<%end if%>
											<option value="<%=tbprov("Provincia")%>"><%=lcase(tbprov("Provincia"))%></option>
											<%
											tbprov.movenext()
											loop
											tbprov.close	
											%>
											</select><br>
											<input type="submit" class="btn btn-primary"></button> 
											</div>											
									</form>	
                                </div>
                            <!-- .panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>

