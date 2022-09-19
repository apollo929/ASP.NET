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
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<script src="../sweetalert.min.js"></script>
    </head>
    <body>
<%

Function senza_apice(byval txt)
	lt=len(txt)
	tx=""
	for f=1 to lt
		c=mid(txt,f,1)
		if c="'" then
			c="`"
		end if
		tx=tx+c
	next
	senza_apice=tx
End function



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

Queryp="SELECT * FROM newsletter_editor where id=1 limit 1"   
set tbeditor=connm.Execute(Queryp) 

%>



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
									titoloins=true
									testoemail=request("titolo")
									notizia="" & tbeditor("notizia") & ""
									NHTM="<html><body>"+notizia

									if request("inviotest")="" then
									     response.write("<h2>SEND MAIL</h2>")
									end if 		

									
									if trim(request("inviotest"))="INVIO_DI_TEST"  then
										testoemail=request("titolo")
										'taglio ragione sociale
										if len(testoemail)>40 then
											testoemail=senza_apice(Mid(testoemail,1,60))
											testoemail=Ucase(Replace(Replace(Replace(Trim( testoemail),".","_"),",","_"),"&","-"))		
										else
										    titoloins=false
										end if										    
										'invio utente e psw
										if titoloins=true then
										    NHTM=NHTM+"</body></html>"
											Rt2=SendEmail(spedizionemail,spedizionemail,testoemail,NHTM)
											Rt3=SendEmail(spedizionemail,"info@webhousesas.net",testoemail,NHTM)
											Rt4=SendEmail(spedizionemail,"marco.genovese@jeniuscommunications.it",testoemail,NHTM)
											Rt5=SendEmail(spedizionemail,"jeniuscommunications@gmail.com",testoemail,NHTM)
										end if
										response.write("<h2>INVIO_DI_TEST  <img src='../images/save.gif'></h2>")	
									end if
									
									
									if trim(request("invioint"))="INVIO_REGISTRATI_INTERNET" then
										'taglio ragione sociale
										if len(testoemail)>40 then
											testoemail=senza_apice(Mid(testoemail,1,60))
											testoemail=Ucase(Replace(Replace(Replace(Trim( testoemail),".","_"),",","_"),"&","-"))										 
										else
										    titoloins=false
										end if	
										if titoloins=true then										
											Queryreg="SELECT id,email,utente1,password2 FROM registrazioneint where email not in (select mail from newsletter_mail_inviate) order by email asc"  										
											set tbreg=connm.Execute(Queryreg) 
											'i=0
											do while not tbreg.eof
												'i=i+1
												NHTM=notizia
												if trim(request("utente"))="on" or trim(request("utente"))="utente" then
													NHTM=NHTM+"<center><hr><font size=6><b>utente : " & tbreg("utente1") & "<br>"
													NHTM=NHTM+"<font size=6>password : " & tbreg("password2") & "</b><br><hr></center></body></html>"
												end if
												'invio mail
												response.write(tbreg("id") & " - " & tbreg("email") & "<img src='../images/save.gif'><br>")
												Rtok=SendEmail(spedizionemail,tbreg("email"),testoemail,NHTM)
												'Rt3=SendEmail(spedizionemail,"info@webhousesas.net",testoemail,NHTM) 
												queryins="insert into newsletter_mail_inviate (mail) value ('" & tbreg("email") & "')"	
												connm.execute(queryins)											
												tbreg.movenext
											loop
											tbreg.close	
											response.write("<h2>INVIO_REGISTRATI_INTERNET <img src='../images/save.gif'></h2>")
										end if										
									end if
									
									if trim(request("inviow"))="INVIO_REGISTRATI_WINCODY" then										
										'taglio ragione sociale
										if len(testoemail)>40 then
											testoemail=senza_apice(Mid(testoemail,1,60))
											testoemail=Ucase(Replace(Replace(Replace(Trim( testoemail),".","_"),",","_"),"&","-"))										 
										else
										    titoloins=false
										end if	
										if titoloins=true then										
											Queryreg="SELECT id,email,utente1,password2 FROM registrazione where email not in (select mail from newsletter_mail_inviate) order by email asc"  										
											set tbreg=connm.Execute(Queryreg) 
											'i=0
											do while not tbreg.eof
												'i=i+1
												NHTM=notizia
												if trim(request("utente"))="on" or trim(request("utente"))="utente" then
													NHTM=NHTM+"<center><hr><font size=6><b>utente : " & tbreg("utente1") & "<br>"
													NHTM=NHTM+"<font size=6>password : " & tbreg("password2") & "</b><br><hr></center></body></html>"
												end if
												'invio mail
												response.write(tbreg("id") & " - " & tbreg("email") & "<img src='../images/save.gif'><br>")
												Rtok=SendEmail(spedizionemail,tbreg("email"),testoemail,NHTM)
												'Rt3=SendEmail(spedizionemail,"info@webhousesas.net",testoemail,NHTM) 
												queryins="insert into newsletter_mail_inviate (mail) value ('" & tbreg("email") & "')"	
												connm.execute(queryins)											
												tbreg.movenext
											loop
											tbreg.close			
											response.write("<h2>INVIO_REGISTRATI_WINCODY <img src='../images/save.gif'></h2>")
										end if										
									end if
									
									
									if trim(request("invionews"))="INVIO_LISTE_MAIL_IMPORTATE" then										
										'taglio ragione sociale
										if len(testoemail)>40 then
											testoemail=senza_apice(Mid(testoemail,1,60))
											testoemail=Ucase(Replace(Replace(Replace(Trim( testoemail),".","_"),",","_"),"&","-"))										 
										else
										    titoloins=false
										end if	
										if titoloins=true then										
											Queryreg="SELECT distinct mail  from newsletter_mail where mail not in (select mail from newsletter_mail_inviate) order by mail asc"   										
											set tbimpmail=connm.Execute(Queryreg) 
											do while not tbimpmail.eof
												'NHTM=notizia
												'invio mail
												response.write(tbimpmail("mail") & "<img src='../images/save.gif'><br>")
												NHTM=NHTM+"</body></html>"
												Rtok=SendEmail(spedizionemail,tbimpmail("mail"),testoemail,NHTM)
												queryins="insert into newsletter_mail_inviate (mail) value ('" & tbimpmail("mail") & "')"
												connm.execute(queryins)
												tbimpmail.movenext
											loop
											tbimpmail.close			
											response.write("<h2>INVIO_LISTE_MAIL_IMPORTATE <img src='../images/save.gif'></h2>")	
										end if
									end if
									
									'NHTM=""
									'NHTM="" & tbeditor("notizia") & ""

									%>																					
										<script>
										function submitForm() {
										return confirm('Sicuro che vuoi inviare tutte le email ?');
										}
										</script>
													
									<form name="forminvio" action="adnewsinvio.asp" onsubmit="return submitForm(this);" method="get" ID="forminvio">
										<hr>
										<div class="infobox">
										TITOLO MAIL (min 10 caratteri)  : <input type=text id=titolo name=titolo value="<%=testoemail%>" size=100 >
										</div>
										<div class="infobox" style="width:700px;">							
										<%
										response.write("" & notizia & "")  
										 
										%>

										</div>
										<div class="infobox">
										<input type="checkbox" checked id="utente" name="utente" value="utente">
										<label >INVIO ANCHE UTENTE & PASSWORD </label><br>
										</div>
										<div class="infobox">
										<br>
										<input type="submit"  style="width:230px;height:45px;font-size:12px;"  value="INVIO_DI_TEST"  ID="inviotest" NAME="inviotest">
										
										<input type="submit"  style="width:230px;height:45px;font-size:12px;"  value="INVIO_REGISTRATI_INTERNET"  ID="invioint" NAME="invioint">
										
										<input type="submit"  style="width:230px;height:45px;font-size:12px;"  value="INVIO_REGISTRATI_WINCODY"  ID="inviow" NAME="inviow">
																					 
										<input type="submit"  style="width:230px;height:45px;font-size:12px;"  value="INVIO_LISTE_MAIL_IMPORTATE"  ID="invionews" NAME="invionews">
										</div>	
										</form>
										<%	
										if titoloins=false then%>
										<script>
										{
										alert('inserire il titolo di almeno 40 caratteri grazie .....');
										//return true;
										}
										</script>
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