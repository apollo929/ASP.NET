<!--#include file=connessionesql.inc-->
<%
if request("canc")="yes" and isnumeric(request("id"))=true then
 sqldel="delete from contatti where id=" & cdbl(request("id"))
 conn.execute(sqldel)
end if
if request("assegnami")="yes" and isnumeric(request("id"))=true then
 sqlupdapp="update contatti set appartenenza='" & session("loginnominativo") & "' where appartenenza='libero' and id=" & cdbl(request("id"))
 conn.execute(sqlupdapp)
end if
%>
<!DOCTYPE html>
<html lang="en">
<head>
<TITLE>KIRON S.p.A</TITLE>
<meta name="keywords" content="KIRON S.p.A">
<meta name="description" content="KIRON S.p.A">

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
				<!--#include file=top_menu_sotto.inc-->

                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
									




									   <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne1">CALENDARIO</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne1" class="panel-collapse collapse in">
                                            <div class="panel-body">							
                                   
												<iframe src="https://calendar.google.com/calendar/b/2/embed?height=800&amp;wkst=1&amp;bgcolor=%23039BE5&amp;ctz=Europe%2FRome&amp;src=YXBwdW50YW1lbnRpLmtpcm9uQGdtYWlsLmNvbQ&amp;src=OThmc20xcWJia3AwdHEwbDhtY2FzczU3NWtAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&amp;src=Z2lhbmNhcmxvLmtpcm9uQGdtYWlsLmNvbQ&amp;src=bGF1cmVuemFuYS5hbGU4OEBnbWFpbC5jb20&amp;src=OW1pcmlhbWRvbmF0b0BnbWFpbC5jb20&amp;src=Nm4zOWZwNGU5NzRkamZvcGQxcjdqa2lrcGtAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&amp;src=cnM0bzQ4aDhpaGVhOXFncWRjN2VkaXZsbmtAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&amp;src=YWxlLm1haWVyOTVAZ21haWwuY29t&amp;src=YWxlc3NnYWxsaW5hQGdtYWlsLmNvbQ&amp;src=YW5kcmVhLm1vbnRhZ25lcjgxQGdtYWlsLmNvbQ&amp;src=YXBwdW50YW1lbnRpLm5vc2VhQGdtYWlsLmNvbQ&amp;src=ZGVib3JhYi5raXJvbkBnbWFpbC5jb20&amp;src=ZmtyYXVza2lyb25AZ21haWwuY29t&amp;src=Z2l1bGlhLmtpcm9uQGdtYWlsLmNvbQ&amp;src=bWFyY29yYWdnaTAwQGdtYWlsLmNvbQ&amp;src=bWNlcmF1bG9raXJvbkBnbWFpbC5jb20&amp;src=c3BsZW5kb3JlZW5yaWNvNzJAZ21haWwuY29t&amp;src=YWxlc3NhbmRyby5hcmJvaXRAZ21haWwuY29t&amp;src=YWxlc3NpYS5kZXNpbW9uQGdtYWlsLmNvbQ&amp;src=c2VncmV0ZXJpYWtpcm9udHJpZXN0ZUBnbWFpbC5jb20&amp;src=c3RlZmFuby50cmlhbm5pQGdtYWlsLmNvbQ&amp;color=%23039BE5&amp;color=%23795548&amp;color=%23C0CA33&amp;color=%237986CB&amp;color=%23616161&amp;color=%23F09300&amp;color=%237CB342&amp;color=%237CB342&amp;color=%23F6BF26&amp;color=%237986CB&amp;color=%23D81B60&amp;color=%23B39DDB&amp;color=%23F6BF26&amp;color=%239E69AF&amp;color=%23E67C73&amp;color=%234285F4&amp;color=%23D81B60&amp;color=%239E69AF&amp;color=%23EF6C00&amp;color=%23A79B8E&amp;color=%23F6BF26&amp;mode=MONTH" style="border-width:0" width="1000" height="800" frameborder="0" scrolling="no"></iframe>           </div>
                                        </div>
										
										
									
								

										
                                    </div>
									

							
									
									
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