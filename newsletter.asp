<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html>
<%
'Invia un'Email
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

if request("tasto")="invio" then
			text_email=senza_apice(Request.Form("Email"))
							
			strBody = ""
			strBody = "<!DOCTYPE HTML PUBLIC -//IETF//DTD HTML//EN>" 
			strBody = strBody   & "<html>" 
			strBody = strBody   & "<head>" 
			strBody = strBody   & "<meta http-equiv=Content-Type>" 
			'strBody = strBody   & "<link rel=stylesheet href='" & sitourl & "/style.css'></head>" 			
			strBody = strBody   & "<body>"
			strBody = strBody   & "<img src='" & sitourllogo &"'><br>"						
			strBody = strBody & "INSERITO MAIL NELLA NOSTRA NEWSLETTER " & "<br>"
			strBody = strBody & "<br>"
			strBody = strBody & "" & "<br>" & "<br>"
			strBody = strBody & "Mail : "      & text_email  & "<br>"
			strBody = strBody & "</body></html>" 

			Rt1=SendEmail(spedizionemail,text_email,"Iscrizione Newsletter",strBody)
			Rt2=SendEmail(spedizionemail,spedizionemail,"Iscrizione Newsletter",strBody)
			Rt3=SendEmail(spedizionemail,"info@webhousesas.net","Iscrizione Newsletter",strBody)

			'dati   
			session.lcid=1040    
			StrSql="Insert into Contatti (nome,mail,data) values ('NEWSLETTER','" & text_email & "',current_date)"   	 
			connm.Execute StrSql
end if

%>
<html>
<!--#include file="head.inc" -->
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
 
 <button onclick="topFunction()" id="myBtn" title="Go to top">top</button>

 
  <div class="header-area">
        <div class="container">
           
                
                <div class="col-md-4">
                    <div class="header-right">
                  
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="./"><img src="images/logobuffettihome.jpg"></a></h1>	
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div >
                        <h2><font color="ffffff"><br>NEWSLETTER ISCRIZIONE OFFERTE</font></h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area">    
        <div class="container">
		<%if request("tasto")="invio" then%>
								<table width="70%" border="0" valign="top" align="center" cellpadding="1" cellspacing="0" class="tx18 nero">
								<tr><td colspan="2">&nbsp; </td></tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<tr> 
								<td align="left"></td>
								<td align="left" style="font-size: 26pt" >Grazie per aver inserito la tua email.</td>
								</tr>
								</table>
								<meta http-equiv="refresh" content="10;URL=<%=Session("sitourl")%>newsletter.asp">
		<%else%>
								<form action="newsletter.asp?tasto=invio" method="post" id="formnewsletter" name="formnewsletter">
								<table width="70%" border="0" valign="top" align="center" cellpadding="1" cellspacing="0" class="tx18 nero">
								<tr><td colspan="2">&nbsp; </td></tr>
								<tr><td colspan="2" height="5px"></td></tr>
								<tr> 
								<td align="left"><font color="#000000" size="+2">Scrivici&nbsp;la&nbsp;tua&nbsp;Mail&nbsp;&nbsp;:&nbsp;&nbsp;</font></td>
								<td align="left"><input style="font-size: 16pt" type="text" id="text_6" name="email" size="40"></td>
								</tr>
								<tr><td colspan="2" height="5px"><br></td></tr>
								<tr> 
								<td>&nbsp;</td>
								<td><input  type="submit" class="button" value="PREMI QUI     PER INVIARCI LA TUA EMAIL" name="submit1"></td>
								</tr>								
								<tr> 
								<td colspan="2" align="left"><br>
								In esecuzione D.Lgs. 30.06.2003 n. 196, recante disposizioni a tutela delle persone e degli altri soggetti rispetto al trattamento dei dati personali,<br>
								dichiaro di aver letto l'apposita <A class="tx12 azzurro lnk" href="privacy.asp" target="_new">informativa</A> e fornisco il consenso al trattamento <br>
								dei miei dati personali. Acconsento a ricevere comunicazioni su novita' e promozioni aziendali.<br>
								</td>
								</tr>
								</table>
								</form>
		<%end if%>						
												
                    </div>                    
                </div>
            </div>
        </div>
    </div>


  </body>
</html>
<!--#include file="sqlchiudi.inc"-->