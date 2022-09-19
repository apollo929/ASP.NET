                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="adpratiche.asp">PRATICHE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="adinsertpratica1.asp">INSER. PRATICA</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne1" class="panel-collapse collapse in">
                                            <div class="panel-body">							
                                   
												<%  
													
												  
													'Database 10 Pratiche
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "select idpratica as numpratica,idpratica as modificapratica,idpratica as docpratica,idpratica,numeropratica,nome,cognome,provincia,mobile,dati,allegati,esitibanca,inviopratica,perizia,rogito,data from pratiche  " & filtroricerca & " agente like '%" & session("loginnominativo") & "%' order by idpratica desc limit 10"
													'response.write(Grid.SQL)
													Grid.Cols("numpratica").AttachExpression "<a class=navy11 HREF=""adinsertpratica2.asp?update=modifica&idpratica={{idpratica}}""><center><img src='images/user.png' border='0'></center></a>"
													Grid.Cols("modificapratica").AttachExpression "<a class=navy11 HREF=""admodificapratica.asp?oper=modifica&idpratica={{idpratica}}""><center><img src='images/edit.gif' border='0'></center></a>"
													Grid.Cols("numpratica").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("modificapratica").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("docpratica").AttachExpression "<a class=navy11 HREF=""adinsertpratica4.asp?doc=doc&idpratica={{idpratica}}""><center><img src='images/scambia.png' border='0'></center></a>"
													Grid.Cols("docpratica").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("idpratica").hidden = True
													Grid.Cols("idpratica").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("nome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("cognome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cognome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													'Grid.Cols("mail").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("mobile").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mobile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("dati").Caption="comp. dati"
													Grid.Cols("esitibanca").Caption="&nbsp;esito banca&nbsp;&nbsp;"
													Grid.Cols("allegati").Caption="&nbsp;inser. allegati&nbsp;&nbsp;&nbsp;"
													Grid.Cols("inviopratica").Caption="&nbsp;&nbsp;invio pratica&nbsp;"
													Grid.Cols("perizia").Caption="&nbsp;perizia&nbsp;"
													Grid.Cols("rogito").Caption="&nbsp;rogito&nbsp;"
													Grid.Cols("data").Caption="&nbsp;&nbsp;data_oper.&nbsp;&nbsp;"
													Grid.Cols("data").FormatDate "%d %m, %Y"
													'MAX RECORD
													Grid.MaxRows=10
													Grid("dati").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>","<img src='images/nonrisposti.png' border='0'>")
													Grid("dati").VArray = Array(0, 1, 2) ' DB values	
													Grid("esitibanca").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													Grid("esitibanca").VArray = Array(0, 1) ' DB valuezs
													Grid("allegati").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>","<img src='images/nonrisposti.png' border='0'>")
													Grid("allegati").VArray = Array(0, 1, 2) ' DB values
													Grid("inviopratica").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													Grid("inviopratica").VArray = Array(0, 1) ' DB values
													Grid("perizia").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													Grid("perizia").VArray = Array(0, 1) ' DB values
													Grid("rogito").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>")
													Grid("rogito").VArray = Array(0, 1) ' DB values
												    
													
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
										
										<div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="adappuntamenti.asp">APPUNTAMENTI</a> 
                                            </h4>
                                        </div>
                                        <div id="collapseOne2" class="panel-collapse collapse in">
                                            <div class="panel-body">							





												<%  
													

													'Database Pratiche
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "select id as numpratica,data,time,nome,cognome,titolo,indirizzoapp,noteapp,esito,esitodesc,operazione from appuntamenti " & filtroricercan & " idcontatto='" & session("loginid") & "' order by id desc limit 10 "
													'response.write(Grid.SQL)
													Grid.Cols("numpratica").AttachExpression "<a class=navy11 HREF=""adappuntamentivisua.asp?id={{numpratica}}""><center><img src='images/user.png' border='0'>&nbsp;&nbsp;&nbsp;&nbsp;</center></a>"
													Grid.Cols("numpratica").Caption="&nbsp;"
													'Grid.Cols("id").readonly = True
													'Grid.Cols("id").Caption="&nbsp;"
													Grid.Cols("data").Caption="&nbsp;&nbsp;&nbsp;data&nbsp;app.&nbsp;&nbsp;&nbsp;"
													Grid.Cols("time").Caption="&nbsp;&nbsp;ora&nbsp;app.&nbsp;&nbsp;"
													Grid.Cols("cognome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cognome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("nome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("indirizzoapp").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;luogo&nbsp;incontro&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("titolo").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;motivo&nbsp;incontro&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("noteapp").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;note app.&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("esito").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;esito&nbsp;app.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("esitodesc").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;esito desc&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid("data").FormatDate "%d %b %Y", "%d %b %Y"
													Grid.Cols("operazione").Caption="&nbsp;&nbsp;data_oper.&nbsp;&nbsp;&nbsp;"
													Grid("operazione").FormatDate "%d %m, %Y "
													'MAX RECORD
													Grid.MaxRows=10
													'Grid("dati").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>","<img src='images/nonrisposti.png' border='0'>")
													'Grid("dati").VArray = Array(0, 1, 2) ' DB values	
													Grid("esito").Array = Array("<img src='images/no.png' border='0'>","<img src='images/si.png' border='0'>","<img src='images/nonrisposti.png' border='0'>")
													Grid("esito").VArray = Array(0, 1, 2) ' DB values
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
										
										<div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="adleads.asp">LEADS / CONTATTI</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="adaggiuntaleads.asp">AGGIUNGI LEADS / CONTATTI</a> 
                                            </h4>
                                        </div>
                                        <div id="collapseOne3" class="panel-collapse collapse in">
                                            <div class="panel-body">							
												<%  

													'Database Pratiche
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "select id,nome,cognome,indirizzo,citta,provincia,telefono,cellulare,mail,provenienza,appartenenza,note,data from contatti " & filtroricercan & " appartenenza not like '%app_fissato%' order by id desc limit 10 "
													'response.write(Grid.SQL)
													Grid.Cols("id").AttachExpression "<a class=navy11 HREF=""admodificaleads.asp?mod=yes&id={{id}}""><center><img src='images/user.png' border='0'>&nbsp;&nbsp;&nbsp;&nbsp;</center></a>"
													'Grid.Cols("idcanc").AttachExpression "<a class=navy11 HREF=""adleadscanc.asp?id={{idcanc}}""><center><img src='images/elimina.png' border='0'>&nbsp;&nbsp;&nbsp;&nbsp;</center></a>"
													Grid.Cols("id").Caption="&nbsp;"
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
													Grid.Cols("data").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data_oper.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("data").FormatDate "%d %m, %Y"
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
									
								