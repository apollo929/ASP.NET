<!--#include file="connessionesql.inc"-->	
<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.8.2.min.js"></script>
<!-- jQuery Popup Overlay -->
<script src="jquery.popupoverlay.js"></script>
<!-- Set defaults -->
<script>
$(document).ready(function () {
	$.fn.popup.defaults.pagecontainer = '.container'
});
</script><!-- Basic -->
<script>
$(document).ready(function () {
  $('#basic').popup({
	autoopen: true, /* per non far aprire al caricamento impostare su false */
	transition: 'all 0.3s',
	scrolllock: true
  });
});
</script>
<script>
$(document).ready(function () {
  $('#active_bg').popup({
	backgroundactive:true
  });
});
</script>
<body>

    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>LEAD ALL</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div >
        <div class="container">
                <div class="col-md-4" width="450px" >
					
                
                <div class="col-md-8" >
                    <div >
                        <div>	
						
						
				            
							<a href="lead.asp"><img src="admin/images/addnew.gif" border=0>NUOVO LEAD</a><br><br>
															<script>													
								
								function doSomething(id)
								{
								var domanda = confirm("Inserire il Lead dal Cliente ?");
								if (domanda === true) {
								location.href = 'lead.asp?copiare=si&id='+id;  
								}else{
								alert('non interessato..');
								//return false;
								location.href = 'leadall.asp'; 
								}
								}
								</script>
								<center>
											<%		sql="select count(*) as numrec from contatti_lead"
													'response.write(sql)
													'response.end
													set tbcountn=connm.execute(sql)
													response.write("NUMERO RECORD INSERITI : " & tbcountn("numrec")) & " <br>"
													tbcountn.close
													'Database LEAD
													Set Grid = Server.CreateObject("Persits.Grid")
													'Connessione
													Grid.Connect strConnect, "", ""
													Grid.SQL=""
													Grid.SQL = "select id,id as idtrasf,appartenenza,nome,cognome,indirizzo,citta,provincia,telefono,mail,provenienza,note,data from contatti_lead order by id desc "
													Grid.Cols("id").AttachExpression "<a  HREF=""lead.asp?mod=si&id={{id}}""><img src='admin/images/user.png' border='0'>&nbsp;&nbsp;&nbsp;&nbsp;</a>"
													Grid.Cols("idtrasf").AttachExpression "<a  HREF=""javascript:doSomething({{idtrasf}});""><img src='admin/images/leadtrasf.png' border='0'>&nbsp;&nbsp;&nbsp;&nbsp;</a>"
													Grid.Cols("id").Caption="&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;"
													Grid.Cols("id").Cell.Align = "center"
													Grid.Cols("idtrasf").Caption="&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;"
													Grid.Cols("idtrasf").Cell.Align = "center"
													Grid.Cols("nome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("cognome").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cognome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("indirizzo").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;indirizzo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("citta").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;citta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("provincia").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;provincia&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("telefono").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;telefono&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("note").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;___________note____________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("data").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;______data_____&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid.Cols("provenienza").Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;provenienza&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													Grid("data").FormatDate "%b %d, %Y"
													'Grid.Cols("hiredate").FormatDate "%b %d, %Y"
													'MAX RECORD
													Grid.MaxRows=200
																							
													' Enable sorting
													Grid.ColRange(1,33).CanSort = False
													Grid.ColRange(1,33).Cell.Align = "center"
													' Set Colors
													Grid.ColRange(1,33).Header.BGColor = "#f6f6f6"
													Grid.ColRange(1,33).Header.Font.Face = "sans-serif"
													Grid.ColRange(1,33).Cell.Font.Face = "sans-serif"
													Grid.ColRange(1,33).Cell.Font.Size = "2"
													Grid.ColRange(1,33).Header.Font.Size = "2"
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

													Set Grid = Nothing%>											
						
							 </center>
					
                            </div>



                            </div>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>




  </body>
</html>
<!--#include file="sqlchiudi.inc"-->					