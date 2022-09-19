<!--#include file=connessionesql.inc-->
<!DOCTYPE html>
<html lang="en">
    <head>
		<TITLE>JENIUS COMMUNICATIONS - MARCO GENOVESE</TITLE>
		<meta name="keywords" content="JENIUS">
		<meta name="description" content="JENIUS">
		<link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Backoffice JENIUS</title>
        <<!-- Bootstrap Core CSS -->
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
				<!--#include file=navbarback.inc-->
				<!--#include file=top_menu_sotto.inc-->
                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
									<a class=nero10 href=adutentipro.asp><img border=0 src='images/indietro.png'>&nbsp;INDIETRO</a><br><br>
																			<% 	
txt_password1=Request("password1")   
txt_ragione=Request("ragsoc")  

function apc(s)
	if isnull(s) then 
		apc=""
	else
		s=replace(s,"'","`")
		apc=s
	end if
end function
'update
Set Tbprofilo = Server.CreateObject("ADODB.RecordSet")
SQL = "select * from Profilo where id=" & cdbl(Request("id"))	
Tbprofilo.Open SQL,connm	
'response.Write("---")
'response.End
if trim(request("mod"))<>"" then
	SQL="update Profilo set descrizione='" & apc(trim(request.form("descrizione"))) & "' where  id=" & cdbl(Request("mod"))
	Connm.execute((SQL))
	SQL="update Profilo set prezzo=" & replace(trim(request.form("prezzo")),",",".") & " where  id=" & cdbl(Request("mod"))
	Connm.execute((SQL))
	response.Redirect "adutentiproprofilo.asp?password1=" & trim(Request("password1"))
end if
if trim(request("del"))<>"" then
	SQL="delete from Profilo where id=" & cdbl(Request("del"))
	Connm.execute((SQL))
	response.Redirect "adutentiproprofilo.asp?password1=" & trim(Request("password1"))
end if
%>
<FORM ACTION="adutentiproprofilodet.asp?mod=<%=cdbl(Request("id"))%>&password1=<%=trim(Request("password1"))%>" METHOD="post" ID=Form1>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="400">
<TR><TD bgcolor=white>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="3" WIDTH="100%">
	<TR>
		<TD width=200><B >N° Prodotto:</B></TD>
		<TD ><% = cdbl(Request("id"))%></TD>
	</TR>
		<TR>
		<TD ><B >CODICE:</B></TD>
		<TD ><B ><%=ucase(Tbprofilo("codice_isp"))%></B></TD>
	</TR>
	<TR>
		<TD ><B >DESCRIZIONE:</B></TD>
		<TD ><INPUT TYPE="TEXT" SIZE=50 NAME="descrizione" VALUE="<%=Tbprofilo("descrizione")%>" ID=TEXT1></TD>
	</TR>
	<TR>
		<TD ><B >PREZZO:</B></TD>
		<TD WIDTH=300><INPUT TYPE="TEXT" NAME="prezzo" VALUE="<%=Tbprofilo("prezzo")%>" ID=TEXT2></TD>
	</TR>
	<TR>
		<TD ALIGN=right>
		<input type="image" src="images/salva1.png" id="image1" width=30px name="image1">
		</FORM>
		</td><td><a href="adutentiproprofilodet.asp?del=<%=cdbl(Request("id"))%>&password1=<%=trim(Request("password1"))%>" ><img width=30px  src='images/elimina.png' border=0 ></a></TD></TR>
		<TR><TD  width=250><B >USCITA SENZA MODIFICHE</b><img width=200 height=1 src='images/frecciaw.gif'></TD>
		<TD ><a href=adutentiproprofilo.asp?password1=<%=trim(Request("password1"))%> ><img src='images/senzamodifiche.gif' border=0 ></a></TD>
	</TR>
	</TABLE>
										
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