													<script type="text/javascript">
													function cancella(id)
													{
													swal("sei sicuro di voler LEAD / CONTATTO?", {
													buttons: {
													cancel: "non cancellare",
													defeat: "cancella LEAD / CONTATTO",
													},
													})
													.then((value) => {
													switch (value) {

													case "defeat":
													location.href = 'adleads.asp?canc=yes&id=' + id;
													return true;

													default:
													return false;
													//location.href = 'adappuntamentiKO.asp?appuntamento=yes&id='+id; 

													}
													});}
													</script>




									   <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne1">LEADS/CONTATTI</a>
												<br><br>
												 <a href="adaggiuntaleads.asp">INSERIMENTO LEADS/CONTATTI</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne1" class="panel-collapse collapse in">
                                            <div class="panel-body">							
                                   
												<%

													'Database Pratiche
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "select id,id as idcanc,nome,cognome,indirizzo,citta,provincia,telefono,cellulare,mail,provenienza,appartenenza,note,data from contatti where appartenenza not like '%app_fissato%' order by id desc "
													Grid.Cols("id").AttachExpression "<a class=navy11 HREF=""admodificaleads.asp?mod=yes&id={{id}}""><center><img src='images/user.png' border='0'>&nbsp;&nbsp;&nbsp;&nbsp;</center></a>"
													Grid.Cols("idcanc").AttachExpression "<a class=navy11 onclick=""cancella({{idcanc}})""><center><img src='images/elimina.png' border='0'>&nbsp;&nbsp;&nbsp;&nbsp;</center></a>"
													Grid.Cols("id").Caption="&nbsp;"
													Grid.Cols("idcanc").Caption="&nbsp;"
													Grid.Cols("mail").hidden = True
													'Grid.Cols("id").readonly = True
													'Grid.Cols("id").Caption="&nbsp;"													
													Grid.Cols("nome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("cognome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cognome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("indirizzo").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;indirizzo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("citta").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;citta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("provincia").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;provincia&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("telefono").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;telefono&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("note").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;note&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("data").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("provenienza").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;provenienza&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid("data").FormatDate "%d %b %Y", "%d %b %Y"
													'MAX RECORD
													Grid.MaxRows=10
													'Grid("dati").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>","<img src='images/nonrisposti.png' border='0'>")
													'Grid("dati").VArray = Array(0, 1, 2) ' DB values	
													'Grid("esito").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													'Grid("esito").VArray = Array(0, 1) ' DB values
													'Grid("allegati").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>","<img src='images/nonrisposti.png' border='0'>")
													'Grid("allegati").VArray = Array(0, 1, 2) ' DB values
													'Grid("inviopratica").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													'Grid("inviopratica").VArray = Array(0, 1) ' DB values
													
													' Enable sorting
													Grid.ColRange(1,33).CanSort = False
													Grid.ColRange(1,33).Cell.Align = "center"
													' Set Colors
													Grid.ColRange(1,33).Header.BGColor = "#f6f6f6"
													Grid.ColRange(1,33).Header.Font.Face = "sans-serif"
													Grid.ColRange(1,33).Cell.Font.Face = "sans-serif"
													Grid.ColRange(1,33).Cell.Font.Size = par_font_size
													Grid.ColRange(1,33).Header.Font.Size = par_font_size
													Grid(0).Header.BGColor = "#f6f6f6"
													Grid(999).Header.BGColor = "#f6f6f6"
															
													' Specify location of button images
													Grid.ImagePath = "images/"
													' Set <TABLE> attributes
													Grid.Table.Border = 0
													Grid.Table.CellSpacing = 0
													Grid.Table.CellPadding =0
														
													Grid.readonly = True
													Grid.Display
													Grid.Disconnect

													Set Grid = Nothing
													
												%>

                                            </div>
                                        </div>
										
										
									
								