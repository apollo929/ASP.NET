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
									
									<%  
'set data
session.lcid=1040     
'Invia un'Email			
function SendEmail(byval strfrom,byval strto, byval strsubject, byval strbody)
	dim myMail
	Set myMail=CreateObject("CDO.Message")
	myMail.Subject=strsubject
	myMail.From=strfrom
	myMail.HTMLBody=strBody
	myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=1
	myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "c:\inetpub\mailroot\pickup"
	myMail.Configuration.Fields.Update
	myMail.To=strto
	myMail.Send
	set myMail=nothing
end function  
				
If request("tipo")="invio" then
			HTML = ""
			HTML = "<!DOCTYPE HTML PUBLIC -//IETF//DTD HTML//EN>" 
			HTML = HTML   & "<html>" 
			HTML = HTML   & "<head><style>A:hover {text-decoration: ; color: BLACK}A {color: RED;text-decoration: underline};BODY{FONT-FAMILY: Verdana;FONT-SIZE: 10pt;MARGIN-TOP: 1px}</style>" 
			HTML = HTML   & "<meta http-equiv=Content-Type >" 
			HTML = HTML   & "</head>" 
			HTML = HTML   & "<body bgcolor=WHITE>"
			HTML = HTML   & "<img src='" & Session("sitourllogo") &"'><br>"	    
			HTML = HTML &  request.Form("TEXTAREA2")
			HTML = HTML &  request.Form("TEXTAREA3")					
			HTML = HTML & "</body></html>" 
			testoemail=request.Form("MAIL")
			'tolto possibile errore '(& "")'
			titolo=request.Form("TITOLO") & " "
			Rt=SendEmail(Session("spedizionemail"),testoemail,titolo,HTML)			
			Rt1=SendEmail(Session("spedizionemail"),Session("spedizionemail"),titolo,HTML)  %>

			<table width="90%" align="center" name="document" border="0">
			<tr>
			<td align="center" class="nero">
			<br><br>Mail inviata correttamente!<br><br>						    
			</td>
			</tr>	
			</table>		    
		<%
else					               
			Set Tb = Server.CreateObject("ADODB.RecordSet")
			sSQL = "select * From Registrazione where Id=" & clng(Request("Id")) 
			Tb.Open sSQL, connm				
					
			If not Tb.EOF then
				mail=Tb("email")		
				utente=Tb("utente1")
				psw=Tb("password2")
			else  	
				Response.Write " Utente non presente. ATTENZIONE!"		
			end if
			Informazioni="<p class=nero11>Gentile cliente,<br>la informiamo che la sua registrazione e' andata a buon fine.<br>Le ricordiamo i suoi dati di accesso al nostro servizio e-commerce.<br>"
			Informazioni=Informazioni & "Utente :" & utente & "<br>" & "Password :" & psw & "<br>"
			Informazioni=Informazioni & "grazie per averci scelto<br>" & Session("sitourl") & "</p>"
			
			'Informazioni="<p class=nero11>Utente :" & utente & "<br>" & "Password :" & psw & "<br>"
			'Informazioni=Informazioni & " collegati al sito web e visiona le nostre offerte <a class=nero11 href=" & Session("sitourl") & ">" & Session("sitourl") & "</a><br></p><br>"
			'Informazioni=Informazioni & indirizzo & "<br><br>"
			'Informazioni=Informazioni & " Lo Staff Ringrazia<br>"   	
			Tb.close

		%>

			<FORM name="form1" method="post" action="adutentipromail.asp?tipo=invio" >
													
			<table width=90% align=center name=document border=0>
			<tr>
			<td align=center  class=nero>
															
			<tr>
				<td class=nero>A:</td>
				<td><input id="text_1" maxLength="80" size=80 name="MAIL" value=<%=MAIL%>></td>
			</tr>
																
			<tr>
				<td class=nero>Titolo : </td>
				<td class=nero><INPUT CLASS=NERO  maxLength="80" size=80 name="TITOLO" value="Utente e Password"></td>
			</tr>   
															
			<tr><td colspan=2><hr></td></tr> 
								
									
			<tr>
			<td class=nero>Testo : </td>
			<td class=nero>
			<img border="0" src="img/small_preview.gif" ><br>
			<textarea CLASS=NERO id="TEXTAREA3" name="TEXTAREA3" cols=55 rows=6 name="informazioni" ><%=informazioni%></textarea></td>
			</tr>   										
																		
			<tr height=10>
			<td></td>
			<td></td>
			</tr>
														
			<tr>
			<td></td>
			<td><input type="image" border="0" name="imgsave" src="images/inviamail.gif"></td>
			</tr>
												
												
		</form>
		</td>
		</tr>	
		</table>

<%end if%>
										
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