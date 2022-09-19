<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%
on error goto 0
Set rs = Server.CreateObject("ADODB.RecordSet")		
'rs.Open sqlvis, connm

function isValidEmail(s)
	res=true
	if instr(s,"@") < 2 then res=false
	if instr(s,".") < 1 then res=false
	isValidEmail=res
end function

'Invia un'Email
Function SendEmail(byval strfrom,byval strTo, byval strSubject, byval strBody)
			
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
		
%>	
<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->  
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Recupera Password</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
                <div class="col-md-4">
				<!--#include file="menusx.inc" -->		
					
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">	
						
						
							
								<%if not isValidEmail(request("email")) then%>
								<%if request.form("email")<>"" then%>
								<b><font color="red"><br>Inserire un indirizzo email valido<br></font></b>
								<%end if%>
								<table width="450px" border="0" cellspacing="0" cellpadding="4" class="tx14 nero">
								<tr>
								<td align="left" >
									<p><br><br>
									Hai dimenticato la tua password? <br>
									Inserisci l'e-mail con la quale ti sei registrato al portale E-commerce <%=sitourl%>, ti sar&agrave; 
									spedita direttamente nella tua casella di posta elettronica. </p>
									<form method="post" action="registrazionepersa.asp" ID="Form1">
										<table width="100%" border="0" cellspacing="0" cellpadding="2" class="tx2 nero">
										<tr> 
											<td>Tua email:</td>
											<td><input type="text" size="35" name="email" value="" ></td>
										</tr>
										<tr><td height="20px"></td></tr>
										<tr> 
											<td>&nbsp;</td>
											<td><input type="submit" class="button" value="&nbsp;RICHIEDO&nbsp;PASSWORD"></td>
										</tr>
										</table>
									</form>
									<p align="center">&nbsp; </p>
								</td>
								</tr>
								</table>
								<%else
								email = trim(replace(request("email"),"'",""))
								
								rs.open "select utente1,password2 from registrazione  where email='" & email & "' union select utente1,password2 from registrazioneint where email='" & email & "'",connm
								if rs.eof then
								%>
								indirzzo email non trovato.
								<%
								else	
								HTML = ""
								HTML = "<!DOCTYPE HTML PUBLIC -//IETF//DTD HTML//EN>" 
								HTML = HTML   & "<html>" 
								HTML = HTML   & "<head>" 
								HTML = HTML   & "<meta http-equiv=Content-Type>" 
								'HTML = HTML   & "<link rel=stylesheet href='" & sitourl & "/style.css'></head>" 
								
								HTML = HTML   & "<body>"
								HTML = HTML   & "<img src='" & sitourllogo &"'><br>"	
								HTML = HTML & "Ecco i tuoi dati di accesso al sito " & sitourl & "<br><br>"															
								HTML = HTML & "Utente: "  & rs("utente1")   & "<br>"								
								HTML = HTML & "Password : "  & rs("password2")   & " <br>"								
																											
								HTML = HTML & "</body>" 
								HTML = HTML & "</html>" 
								SendEmail defaultMailfrom,email, "Recupero password", html 
								%>
								<table width="400px" border="0" cellspacing="0" cellpadding="2">
									<tr><td align="center"><br><br><img src="img/ok.png" border="0"></td></tr>
									<tr><td>Mail Inviata!</td></tr>
									<tr><td>Abbiamo inviato un messaggio contenente i tuoi dati di accesso al tuo indirizzo email.</td></tr>
								</table>
								
								<%
								rs.close
								end if
								
								end if%>
							
	<br>
							
					
                            </div>



                            </div>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>


<!--#include file="foot.inc"-->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->											