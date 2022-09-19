<!--#include file="connessionesql.asp" -->

<html>
	<head>
		<title>SITO WEB E-COMMERCE BACK OFFICE</title>
		
		<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
function inserthtml(form,txthtml) {
	document.form1.TEXTAREA2.value=document.form1.TEXTAREA2.value+txthtml;
	document.form1.TEXTAREA2.focus();
}

function popupfoto(w, h) { 
	myWin=window.open('','preview', 'width=' + w + ',height=' + h + ',resizable=no,status=no,toolbar=no,menubar=no,scrollbars=yes');
	myWin.document.write('<html><title>Preview</title><body>');
	myWin.document.write('<font face=Verdana Size=2><p align=justify>');
	myWin.document.write(document.form1.TEXTAREA2.value);
	myWin.document.write('<//font><//p>');
	myWin.document.write('</body>');
} 
function popupfoto1(w, h) { 
	myWin=window.open('','preview', 'width=' + w + ',height=' + h + ',resizable=no,status=no,toolbar=no,menubar=no,scrollbars=yes');
	myWin.document.write('<html><title>Preview</title><body>');
	myWin.document.write('<font face=Verdana Size=2><p align=justify>');
	myWin.document.write(document.form1.TEXTAREA3.value);
	myWin.document.write('<//font><//p>');
	myWin.document.write('</body>');
} 
function controlla_titolo() {
	var d=document.form1.text2.value;
	if (d.length < 1) {
		alert("Titolo Obbligatorio");
		document.form1.text1.focus();
	}
}

function controlla_data() {
    var tf = true;
    var d = document.form1.text1.value;
    var s = "",sg,sm;
    var d_odierna= new Date();
    
    sg = d_odierna.getDate() + "/";
    if (sg.length < 3) {
		sg="0" + sg;
    }
    sm = (d_odierna.getMonth() + 1) + "/";
    if (sm.length < 3) {
		sm="0" + sm;
    }
    s += sg ;
    s += sm ;
    s += d_odierna.getYear();
    if (d.length < 10 || d.charAt(2) != '/' || d.charAt(5) != '/') tf = false;
    for(i=0;i<d.length;i++) {
      if (d.charAt(i) != '/' && (d.charAt(i) < '0') || (d.charAt(i) > '9')) tf = false;
    }
    if (d.substring(0,2) < "01" || d.substring(0,2) > "31") tf = false;
    if (d.substring(3,5) < "01" || d.substring(3,5) > "12") tf = false;    
    if (!tf) {
      alert("ATTENZIONE!\nData non valida.\nEsempio: 01/01/2001");
      document.form1.text1.value = s;
      document.form1.text1.focus();
    }
  }
function insertimage(file) {
	popupimg(400,400);
}

function popupimg(w, h) { 
	myWin=window.open('browseimg.asp','preview', 'width=' + w + ',height=' + h + ',resizable=no,status=no,toolbar=no,menubar=no,scrollbars=yes');
	if (myWin.opener == null) myWin.opener = self;

} 

</script>
		</head>

<body bgcolor=white class=nero11>
<HR>
<a class=nero10 href=adutentipro.asp><img border=0 src=imgnew/tasto.gif>&nbsp;INDIETRO</a><br>
<HR>
<%  
'set data
session.lcid=1040     
'invia un'Email
Function SendEmail(byval strfrom,byval strTo, byval strSubject, byval strBody)				
	Dim objCDOMail
	'HTML = HTML  & vbCrLf
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	objCDOMail.From = strfrom
	objCDOMail.To = strTo
	objCDOMail.Subject = strSubject
	objCDOMail.BodyFormat = 0 
	objCDOMail.MailFormat = 0 
	objCDOMail.Body = strBody 
	objCDOMail.Send
	Set objCDOMail = Nothing				
End Function     
				
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
			Informazioni="<p class=nero11>Gentile cliente,<br>la informiamo che la sua registrazione è andata a buon fine.<br>Le ricordiamo i suoi dati di accesso al nostro servizio e-commerce.<br>"
			Informazioni=Informazioni & "Utente :" & utente & "<br>" & "Password :" & psw & "<br>"
			Informazioni=Informazioni & "grazie per averci scelto<br>" & Session("sitourl") & "</p>"
			
			'Informazioni="<p class=nero11>Utente :" & utente & "<br>" & "Password :" & psw & "<br>"
			'Informazioni=Informazioni & " collegati al sito web e visiona le nostre offerte <a class=nero11 href=" & Session("sitourl") & ">" & Session("sitourl") & "</a><br></p><br>"
			'Informazioni=Informazioni & indirizzo & "<br><br>"
			'Informazioni=Informazioni & " Lo Staff Ringrazia<br>"   	
			Tb.close

		%>

			<FORM name="form1" method="post" action="mail.asp?tipo=invio" >
													
			<table width=90% align=center name=document border=0>
			<tr>
			<td align=center  class=nero>
															
			<tr>
				<td class=nero>A:</td>
				<td><input id="text_1" maxLength="80" size=80 name="MAIL" value=<%=MAIL%>></td>
			</tr>
																
			<tr>
				<td class=nero>Titolo </td>
				<td class=nero><INPUT CLASS=NERO  maxLength="80" size=80 name="TITOLO" value="Utente e Password"></td>
			</tr>   
															
			<tr><td colspan=2><hr></td></tr> 
								
			<tr>
				<td></td>                    
				<td>                    
					<img border="0" src="img/small_center.gif" onClick="inserthtml(this.form,'<p align=center>');"> 
					<img border="0" src="img/small_justify.gif" onClick="inserthtml(this.form,'<p align=justify>');"> 
					<img border="0" src="img/small_closep.gif" onClick="inserthtml(this.form,'</p>');"> 
					<img border="0" src="img/small_hr.gif" onClick="inserthtml(this.form,'<hr>');"> 
					<img border="0" src="img/small_br.gif" onClick="inserthtml(this.form,'<br>');"> 
					<img border="0" src="img/small_img.gif" onClick="insertimage('red/13.jpg')">
					<img border="0" src="img/small_preview.gif" onClick="popupfoto(480, 600);">
				</td>                
			</tr>                                        
				<tr><td class=nero>Testo:</font></td>
				<td><textarea cols="35" rows="15" id="TEXTAREA2" name="TEXTAREA2"><%=tx_txt%></textarea></td>
			</tr>
									
			<tr>
			<td class=nero>Informazioni Agg.</td>
			<td class=nero>
			<img border="0" src="img/small_preview.gif" onClick="popupfoto1(480, 600);"><br>
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

</body>
</html>
<!-- #include file=sqlchiudi.inc --->
