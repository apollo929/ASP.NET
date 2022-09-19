<!--#include file=connessionesql.inc-->
<%      
'controllo session pratica   
if request("idpratica")<>"" then  session("idpratica")=trim(request("idpratica"))
session("titolonavigazione")="INSERIMENTO DOCUMENTI ALLA PRATICA"
if trim(session("idpratica"))="" then response.redirect "adindex.asp"
	    
%>
<!DOCTYPE html>
<html lang="en">
<head>
<TITLE>KIRON S.p.A</TITLE>
<meta name="keywords" content="KIRON S.p.A">
<meta name="description" content="KIRON S.p.A">
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Backoffice Kiron S.p.A.</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="css/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/startmin.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
        <div id="wrapper">

            <!-- Navigation -->
				<!--#include file=topmenu.inc-->
				<!-- /.navbar-top-links -->
				<!--#include file=navbarback.inc--><br>
				<!--#include file=top_menu_pratica.inc-->



                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                 
								 
								 
							
							<table cellspacing="0" border="0" cellpadding="0" align="left" style=<%=par_table_upload%>>	
							<form action="uploadallfileimmobile.asp" method="post" enctype="multipart/form-data">							
							<%
						    sqltd="select * from pratiche_documentiimmobile where idpratica='" & session("idpratica") & "' group by nomedocumento order by id asc "
							'response.write(sqltd)
							'response.end
							Set tbtd=Server.CreateObject("ADODB.Recordset")
							tbtd.open sqltd,conn	
							do while not tbtd.eof		  %>							
									<tr> 
									<td align=left><b><%=senza_apice(tbtd("nomedocumento"))%></b><br>
								
									</td>
								
										<td align=left><input type="file" name="<%=senza_apice(tbtd("nomedocumento"))%>"></td>
						
									<td align=left>&nbsp;&nbsp;</td>
									<%
									if tbtd("nomefile")<>"" then%>
									<td align=left>
									<a href="upload/<%=senza_apice(tbtd("nomefile"))%>">file presente (clicca)<br><%=mid(tbtd("nomefile"),40)%></a></td>
									<%end if%>
									</tr>
									<tr><td colspan="4" height="15px"></td></tr>
							<% 
							 tbtd.movenext
							loop
							tbtd.close
							%>
														 <tr> 
							<td align=left>
							</td>

							<td align=left><input type="submit" class="btn btn-primary" value="upload"></td>
							<td align=left></td>
							</tr>
							<tr><td colspan=2><hr></td></tr>
							<tr>

							<td align="left">&nbsp;<button type="button" onclick="javascript:history.back();" class="btn btn-primary"  >INDIETRO</button></td>
							</tr>
							</table>
							</form>
							
							
																		
							
							<br>	
								 
								 
								 
                                </div>
                            </div>
                            <!-- .panel-body -->
                        					
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                
                <!-- /.row -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/startmin.js"></script>

    </body>
</html>
<!--#include file=closesql.inc-->