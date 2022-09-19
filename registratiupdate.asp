<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<% 

if session("nomeutente")="" or session("tipoutente")="" then
	response.Redirect("/")
end if

'#### IMPOSTAZIONI ####

'tabella
tabella="registrazione"
text_logo="thum_nologo.jpg"

'### CONTROLLI ###
Function tosql(byval txt)
	tosql=trim(replace(txt,"'","\'"))
End function

'#### PAGINA ####
   
Set rs = Server.CreateObject("ADODB.Recordset")	
if request("act")="" then
	
	Sqlpro="Select * From " & tabella & " where utente1='" & session("nomeutente") & "'"
	rs.Open Sqlpro,Connm
	if rs.eof then
		rs.close
		response.Redirect("/")
	end if
	text_password=rs("password2")
	text_email=rs("Email")
	text_telefono=rs("telefono")
	text_azienda=rs("Ragione")
	text_partitaiva=rs("PI")	
	text_sdi=rs("sdi")	
	text_codicefiscale=rs("CF")																						
	text_nome=rs("Nome")
	text_cognome=rs("Cognome")
	text_indirizzo=rs("Indirizzo")
	text_citta=rs("Citta")
	text_cap=rs("Cap")
	text_provincia=rs("Provincia")
	check_newsletter=cstr(rs("ricevereofferte"))
	text_logo=cstr(rs("logo"))
	rs.close
else
	text_logo=senza_apice(trim(tosql(Request.Form("imglogo"))))
	boolact=true
	StrSqlogo="update " & tabella & " set logo='" & text_logo & "'"
	StrSqlogo= StrSqlogo & " where password1='" & Session("Chisono") & "'"
	connm.Execute StrSqlogo
	'response.write(StrSqlogo)
	'response.end	
	text_password=trim(tosql(Request.Form("password")))
	text_email=trim(tosql(Request.Form("Email")))
	text_telefono=trim(tosql(Request.Form("telefono")))
	text_azienda=tosql(Request.Form("Azienda"))
	text_partitaiva=tosql(Request.Form("Partitaiva"))		
	text_codicefiscale=tosql(Request.Form("codicefiscale"))
	text_sdi=senza_apice(Request.Form("sdi"))		
	text_nome=tosql(Request.Form("Nome"))
	text_cognome=tosql(Request.Form("Cognome"))
	text_indirizzo=tosql(Request.Form("Indirizzo"))
	text_citta=tosql(Request.Form("Citta"))
	text_cap=tosql(Request.Form("Cap"))
	text_provincia=tosql(Request.Form("Provincia"))
	check_newsletter=request("newsletter")
	text_nazione=ucase(senza_apice(Request.Form("nazione")))
	if trim(text_nazione)<>"ITALIA" then text_provincia="ESTERO"
	
	if check_newsletter="" then check_newsletter="0"
		
	rossi=""	
	errore=false
	
	'##verifica univocita' password
	if text_password<>"" then
	    sqlver="select utente1,password2 from registrazione  where password2='" & text_password & "'"
		'response.write(sqlver)
		'response.end
		rs.open sqlver,connm
		if not rs.eof then
			'errore=true
			rossi=rossi & "password,"
			perr="<b><font color='red'>La password è gia' presente in archivio</font></b>"
		end if
		rs.close
		'response.write(perr)
		'response.end
	end if

	if trim(request("aziendacc"))="1" then
		if text_partitaiva="" then
		 errore="true"
		 rossi=rossi & "partitaiva,"
		 verrore=verrore & "Partitaiva è obbligaoria ,"
		end if  
		valoreazienda="checked"
		valoreprivato=""	
		'response.write(text_provincia & "----------")
		'response.end
		if text_azienda="" then
		 errore="true"
		 rossi=rossi & "ragione sociale,"
		 verrore=verrore & "ragione sociale ,"
		end if 					
	else		
		valoreazienda=""				
		valoreprivato="checked"				
	end if	

	if text_partitaiva="" then
	 errore=true
	 rossi=rossi & "partitaiva,"
	end if  
	if text_codicefiscale="" then
	 errore=true
	 rossi=rossi & "codicefiscale,"
	end if  
	if text_sdi="" then
	 errore="true"
	 rossi=rossi & "sdi,"
	 verrore=verrore & "SDI  è obbligatorio ,"
	end if 		
	if text_nome="" then
	 errore=true
	 rossi=rossi & "nome,"
	end if  
	if text_cognome="" then
	 errore=true
	 rossi=rossi & "cognome,"
	end if  
	if text_indirizzo="" then
	 errore=true
	 rossi=rossi & "indirizzo,"
	end if  
	if text_citta="" then
	 errore=true
	 rossi=rossi & "citta,"
	end if  
	if text_cap="" then
	 errore=true
	 rossi=rossi & "cap,"
	end if  
	if text_provincia="" then
	 errore=true
	 rossi=rossi & "provincia,"
	end if  
	num=instr(1,cstr(text_email),"@") 
	if len(trim(text_email))=0 or num=0 then
	 errore=true
	 rossi=rossi & "email,"
	else
		if text_email="" then
		 errore=true
		 rossi=rossi & "email,"
		end if   
	end if	
	if text_telefono="" then
	 errore=true
	 rossi=rossi & "telefono,"
	end if  
	if not errore then
		StrSql="update " & tabella & " set Ragione='" & text_azienda & "',Nome='" & text_nome & "', Cognome='" & text_cognome & "' ,Indirizzo='" & text_indirizzo & "' ,citta='" & text_citta & "' ,nazione='" & text_nazione & "' ,provincia='" & text_provincia & "' ,telefono='" & text_telefono & "' ,Email='" & text_email & "',Sede='" & text_indirizzo & "',PI='" & text_partitaiva & "',CF='" & text_codicefiscale & "',sdi='" & text_sdi & "',Cap='" & text_cap & "', ricevereofferte='" & check_newsletter & "' "
		if request("password")<>"" then
			StrSql= StrSql & ", password2='" & text_password & "' "
		end if		
		StrSql= StrSql & "where password1='" & Session("Chisono") & "'"
		Connm.Execute StrSql
		'Benvenuto 
		Session("sRagione") =  text_azienda 
		Session("sSede") =  text_indirizzo
		Session("sProvincia") = text_provincia 
		upd="yes"
		'response.Redirect("registratiupdate.asp?upd=yes#topage")
		
	end if									
end if													

'Tabelle Utilita Registrazione
Set tbpro = Server.CreateObject("ADODB.Recordset")	
		
'Apertura Database Italia
'Visuaprovincie
Sqlpro="Select * From Italia_Province order by Provincia"       
tbpro.Open Sqlpro,connm    

if text_sdi="0000000" then
	valoreazienda="" 
	valoreprivato="checked"
else
	valoreazienda="checked" 
	valoreprivato=""	
end if	

if trim(text_nazione)="" then 
  text_provincia="TREVISO"
  text_nazione="ITALIA"
end if 


%>
<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<%if request("upd")="yes" or upd="yes" then %>
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
<div id="basic" class="well" style="max-width:44em;"> 
<button class="basic_close btn btn-default"><img src="images/modulo-regok-up.jpg" border=0></button><br>
<a href=""><img type="img" align="right"  style="width:40px;" class="basic_close btn btn-default" src="images/xxx.png" border=0></a><br>
</div>
<body onLoad="$('#basic').popup();Ricarica_carrello(0, 0, 0, 0);">
<%else%>
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<%end if%>
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->    

   
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Modifica i tuoi dati</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <%if mobile<>"ok" then %> 
    <div class="single-product-area">
	<%else%>
	<div class="single-product-area2">
	<%end if%>
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
						
						<!--#include file="menusx.inc" -->
                
						<div class="col-md-8">
						<div class="product-content-right">      
						<h2 class="related-products-title" style="color:#E86868;" >Modifica i tuoi dati</h2>
						<div class="single-product">
						
						
  
							
	
										<script language="javascript">
											function mostraazienda(val)		{
											    //alert(val);
												document.getElementById('varcitta_1').style.display = "block";
												if (val === undefined) {
												document.formuu.sdi.value='';	
												}
												else {
												document.formuu.sdi.value=val;	
												};																							
												}
											function mostraprivato()		{
											    //alert(0);
												document.getElementById('varcitta_1').style.display = "none";
												document.formuu.sdi.value="0000000";												
												}												
				
											
											</script>	
											<script>
												window.onload = function(){
												let myYbox;
												if(document.querySelector('.yBox')){
												myYbox = new yBox();
												myYbox.init();
												}
												myYbox.onYboxOpen = function(){
												document.body.classList.add('yBoxIsOpen');
												}
												myYbox.onYboxClose = function(){
												document.body.classList.remove('yBoxIsOpen');
												}
												myYbox.onNextItemClick = function(){
												console.log('next item clicked');
												};
												myYbox.onPrevItemClick = function(){
												console.log('prev item clicked');
												}	
												Ricarica_carrello(0, 0, 0, 0);				
												};
											</script>											
									
												
							<table border="0" cellpadding="0" cellspacing="0" width="98%" class="tx12 nero">
							<form action="registratiupdate.asp?act=1#topage" method="post" id="formuu" name="formuu">
							<tr> 
								<td align="left" colspan="2"><img src='admin/articoli/<%=("" & text_logo)%>' ></td>
								
							</tr>
							<tr> 
								<td align="left">&nbsp;LOGO:</td>
								<td align="left" valign="bottom">&nbsp;<input  size="36" type="text"  id="imglogo" maxlength="125" name="imglogo" value="<%=text_logo%>">&nbsp;<a class="yBox yBox_iframe"  href="selimmagine.asp?logo=<%=text_logo%>"> <button type="button" style="border-style:inset;border-width:0;background:#E86868;color:#ffffff;width:180px;height:40px;" value="" border="0">INS.&nbsp;MODIFICA&nbsp;LOGO</button></a></td>
							</tr>
					 							<tr><td colspan="2" height="10px"></td></tr>
							<tr> 
								<td align="left">&nbsp;CAMBIA PASSWORD:</td>
								<td align="left" valign="bottom">&nbsp;<%=perr%><input  size="36" type="text"  id="password" maxlength="125" name="password" value="<%=text_Password%>">
								<br>* compilare solo se si vuole modificare la password</td>
							</tr>									
							<tr> 
											  <td colspan="2" align="center">

											  <%																					  
											  if errore="true" then
											    if request("tasto")<>"" then%>
												  <font color="#E86868"><b><center class=nero10>Errori >>>><% Response.write(ucase(verrore)) %>    </center></b></font>
												
											  <%end if
											  end if%>
											  <% if request("tasto")="BLOCCO" then%>												 
													<div id="basic" class="well" style="max-width:44em;"> 
													<button class="basic_close btn btn-default"><img src="images/modulo-registrati.jpg" border=0></button><br>
													<button class="basic_close btn btn-default">chiudi</button>
													</div>
											  <%end if%>											  
											 </td>
											</tr>
												<tr><td colspan="2" height="10px"></td></tr>
												<tr><td colspan="2" height="1px" bgcolor="#E86868"></td></tr> 
												<tr><td colspan="2" height="10px"></td></tr>
												<tr><td colspan="2" align="center" height="10px"><input     type="radio" <%=valoreazienda%> id="aziendacc" name="aziendacc" value="1" onload="mostraazienda();" onclick="mostraazienda();" ><span class="tx4 grigio">&nbsp;&nbsp;azienda&nbsp;&nbsp;&nbsp;</span><input type="radio" <%=valoreprivato%> id="aziendacc" name="aziendacc" value="0" onload="mostraprivato();" onclick="mostraprivato();"><span class="tx4 grigio">&nbsp;&nbsp;privato&nbsp;&nbsp;&nbsp;</span></td></tr>
												<tr><td colspan="2" height="10px"></td></tr>
												<tr><td colspan="2" height="1px" bgcolor="#E86868"></td></tr> 
												<tr><td colspan="2" height="10px"></td></tr>
											<%
											bg=""
											if instr(rossi,"cognome,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>> 
											  <td align=left width="160px">&nbsp;Cognome / Referente:<font color="#E86868">*</font></td>
											  <td align=left ><input  type="text"  size="35"   id="cognome" maxlength="125" name="cognome" value="<%=text_Cognome%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<%
											bg=""
											if instr(rossi,"nome,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>> 
											  <td align=left >&nbsp;Nome:<font color="#E86868">*</font></td>
											  <td align=left ><input  type="text"  size="35"   id="nome" maxlength="125" name="nome" value="<%=text_Nome%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<tr><td colspan="2">
											
											
											<div id="varcitta_1"  style="display:block;">
											<table border="0" cellpadding="0" align="left" cellspacing="0" width="100%" class="tx1 grigio_scuro">
											<%
											bg=""
											if instr(rossi,"ragione sociale,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>>
											  <td width="160px" align="left">&nbsp;Nome Azienda <br>(ragione sociale):<font color="#E86868">*</font></td>
											  <td align="left" valign="bottom" ><input id="Azienda" size=45 maxlength="125"  type="text"  name="Azienda" value="<%=text_Azienda%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>																							
											<%
											bg=""
											if instr(rossi,"partitaiva,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Partita Iva:<font color="#E86868">*</font></td>
											  <td align=left ><input size="35"   type="text"  id="Partitaiva" maxlength="125" name="Partitaiva" value="<%=text_Partitaiva%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											</table>
											</div>
											
											
											</td></tr>	
											
											
											
											<%
											bg=""
											if instr(rossi,"codicefiscale,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Cod.Fiscale:<font color="#E86868">*</font></td>
											  <td align=left ><input size="35"  type="text"   id="Codicefiscale" maxlength="125" name="Codicefiscale" value="<%=text_codicefiscale%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<%
											
											bg=""
											if instr(rossi,"sdi,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Cod.SDI(fatt.elettronica):<font color="#E86868">*</font></td>
											  <td align=left ><input size="35" type="text"   id="sdi" name="sdi" value="<%=text_sdi%>">
											  </td>
											</tr>
											<tr><td colspan="2" height="10px"></td></tr>
											<tr><td colspan="2" height="1px" bgcolor="#E86868"></td></tr> 
											<tr><td colspan="2" height="10px"></td></tr>
											<%
											
											bg=""
											if instr(rossi,"indirizzo,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>> 
											  <td align=left >&nbsp;Indirizzo/Sede dell'azienda:<font color="#E86868">*</font></td>
											  <td align=left ><input  type="text"   id="text_3" maxlength="130" name="indirizzo" size=45 value="<%=text_Indirizzo%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<%
											bg=""
											if instr(rossi,"citta,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Città/Comune:<font color="#E86868">*</font></td>
											  <td align=left ><input  type="text"   size="35" id="citta" name="citta" maxlength="145" value="<%=text_Citta%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<%
											bg=""
											if instr(rossi,"cap,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Cap:<font color="#E86868">*</font></td>
											  <td align=left ><input  type="text"   size="8" id="cap" name="cap" maxlength="15" value="<%=text_Cap%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
										<%
											bg=""
											if instr(rossi,"nazione,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Nazione:<font color="#E86868">*</font></td>
											  <td align=left >	
													<select id="nazione" name="nazione" style="text-transform:uppercase;">									
													<option selected value="<%=text_nazione%>" ><%=text_nazione%></option>	
													<option value="afghanistan">afghanistan</option>
													<option value="albania">albania</option>
													<option value="algeria">algeria</option>
													<option value="andorra">andorra</option>
													<option value="angola">angola</option>
													<option value="antarctica">antartico</option>
													<option value="antigua and barbuda">antigua e barbuda</option>
													<option value="saudi arabia">arabia saudita</option>
													<option value="argentina">argentina</option>
													<option value="armenia">armenia</option>
													<option value="australia">australia</option>
													<option value="australia christmas island">australia - isola christmas</option>
													<option value="australia norfolk island">australia - isola norfolk</option>
													<option value="australia cocos keeling islands">australia - isole cocos</option>
													<option value="heard and mc donald islands">australia - isole heard e mcdonald</option>
													<option value="austria">austria</option>
													<option value="azerbaijan">azerbaijan</option>
													<option value="bahamas">bahamas</option>
													<option value="bahrain">bahrain</option>
													<option value="bangladesh">bangladesh</option>
													<option value="barbados">barbados</option>
													<option value="belgium">belgio</option>
													<option value="belize">belize</option>
													<option value="benin">benin</option>
													<option value="bhutan">bhutan</option>
													<option value="belarus">bielorussia</option>
													<option value="bolivia">bolivia</option>
													<option value="bosnia herzegovina">bosnia erzegovina</option>
													<option value="botswana">botswana</option>
													<option value="brazil">brasile</option>
													<option value="brunei">brunei</option>
													<option value="bulgaria">bulgaria</option>
													<option value="burkina faso">burkina faso</option>
													<option value="burundi">burundi</option>
													<option value="cambodia">cambogia</option>
													<option value="cameroon">camerun</option>
													<option value="canada">canada</option>
													<option value="cape verde">capo verde</option>
													<option value="chad">ciad</option>
													<option value="chile">cile</option>
													<option value="china">cina</option>
													<option value="china hong kong">cina - hong kong</option>
													<option value="china macau">cina - macao</option>
													<option value="cyprus">cipro</option>
													<option value="holy see">citta' del vaticano</option>
													<option value="colombia">colombia</option>
													<option value="comoros">comore</option>
													<option value="north korea">corea del nord</option>
													<option value="south korea">corea del sud</option>
													<option value="cote divoire">costa d'avorio</option>
													<option value="costa rica">costa rica</option>
													<option value="croatia">croazia</option>
													<option value="cuba">cuba</option>
													<option value="denmark">danimarca</option>
													<option value="denmark faroe islands">danimarca - isole faroe</option>
													<option value="dominica">dominica</option>
													<option value="ecuador">ecuador</option>
													<option value="egypt">egitto</option>
													<option value="el salvador">el salvador</option>
													<option value="united arab emirates">emirati arabi uniti</option>
													<option value="eritrea">eritrea</option>
													<option value="estonia">estonia</option>
													<option value="ethiopia">etiopia</option>
													<option value="fiji">figi</option>
													<option value="philippines">filippine</option>
													<option value="finland">finlandia</option>
													<option value="finland aland islands">finlandia - isole aland</option>
													<option value="france">francia</option>
													<option value="france guadeloupe">francia - guadalupa</option>
													<option value="france french guiana">francia - guyana francese</option>
													<option value="france martinique">francia - martinica</option>
													<option value="france mayotte">francia - mayotte</option>
													<option value="france new caledonia">francia - nuova caledonia</option>
													<option value="france french polynesia">francia - polinesia francese</option>
													<option value="france reunion">francia - reunion</option>
													<option value="france saint pierre and miquelon">francia - saint pierre e miquelon</option>
													<option value="france french southern territories">francia - territori francesi meridionali</option>
													<option value="france wallis and futuna islands">francia - wallis e futuna</option>
													<option value="gabon">gabon</option>
													<option value="gambia">gambia</option>
													<option value="georgia">georgia</option>
													<option value="germany">germania</option>
													<option value="ghana">ghana</option>
													<option value="jamaica">giamaica</option>
													<option value="japan">giappone</option>
													<option value="djibouti">gibuti</option>
													<option value="jordan">giordania</option>
													<option value="greece">grecia</option>
													<option value="grenada">grenada</option>
													<option value="greenland">groenlandia</option>
													<option value="guatemala">guatemala</option>
													<option value="guinea">guinea</option>
													<option value="equatorial guinea">guinea equatoriale</option>
													<option value="guinea bissau">guinea-bissau</option>
													<option value="guyana">guyana</option>
													<option value="haiti">haiti</option>
													<option value="honduras">honduras</option>
													<option value="india">india</option>
													<option value="indonesia">indonesia</option>
													<option value="iran">iran</option>
													<option value="iraq">iraq</option>
													<option value="ireland">irlanda</option>
													<option value="iceland">islanda</option>
													<option value="marshall islands">isole marshall</option>
													<option value="solomon islands">isole salomone</option>
													<option value="israel">israele</option>
													<option value="italia">italia</option>
													<option value="kazakhstan">kazakistan</option>
													<option value="kenya">kenya</option>
													<option value="kyrgyzstan">kirghizistan</option>
													<option value="kiribati">kiribati</option>
													<option value="kuwait">kuwait</option>
													<option value="laos">laos</option>
													<option value="lesotho">lesotho</option>
													<option value="latvia">lettonia</option>
													<option value="lebanon">libano</option>
													<option value="liberia">liberia</option>
													<option value="libya">libia</option>
													<option value="liechtenstein">liechtenstein</option>
													<option value="lithuania">lituania</option>
													<option value="luxembourg">lussemburgo</option>
													<option value="macedonia">macedonia</option>
													<option value="madagascar">madagascar</option>
													<option value="malawi">malawi</option>
													<option value="maldives">maldive</option>
													<option value="malaysia">malesia</option>
													<option value="mali">mali</option>
													<option value="malta">malta</option>
													<option value="morocco">marocco</option>
													<option value="mauritania">mauritania</option>
													<option value="mauritius">mauritius</option>
													<option value="mexico">messico</option>
													<option value="micronesia">micronesia</option>
													<option value="moldova">moldavia</option>
													<option value="mongolia">mongolia</option>
													<option value="montenegro">montenegro</option>
													<option value="mozambique">mozambico</option>
													<option value="myanmar">myanmar</option>
													<option value="namibia">namibia</option>
													<option value="nauru">nauru</option>
													<option value="nepal">nepal</option>
													<option value="nicaragua">nicaragua</option>
													<option value="niger">niger</option>
													<option value="nigeria">nigeria</option>
													<option value="norway">norvegia</option>
													<option value="norway bouvet island">norvegia - isola bouvet</option>
													<option value="norway svalbard and jan mayen islands">norvegia - svalbard</option>
													<option value="new zealand">nuova zelanda</option>
													<option value="new zealand cook islands">nuova zelanda - isole cook</option>
													<option value="new zealand niue">nuova zelanda - niue</option>
													<option value="new zealand tokelau">nuova zelanda - tokelau</option>
													<option value="holland">olanda</option>
													<option value="oman">oman</option>
													<option value="netherlands">paesi bassi</option>
													<option value="netherlands netherlands antilles">paesi bassi - antille olandesi</option>
													<option value="netherlands aruba">paesi bassi - aruba</option>
													<option value="pakistan">pakistan</option>
													<option value="palau">palau</option>
													<option value="palestine">palestina</option>
													<option value="panama">panama</option>
													<option value="papua new guinea">papua nuova guinea</option>
													<option value="paraguay">paraguay</option>
													<option value="peru">peru'</option>
													<option value="poland">polonia</option>
													<option value="puerto rico">porto rico</option>
													<option value="portugal">portogallo</option>
													<option value="principality of monaco">principato di monaco</option>
													<option value="qatar">qatar</option>
													<option value="united kingdom">regno unito</option>
													<option value="united kingdom anguilla">regno unito - anguilla</option>
													<option value="united kingdom bermuda">regno unito - bermuda</option>
													<option value="united kingdom gibraltar">regno unito - gibilterra</option>
													<option value="united kingdom guernsey">regno unito - guernsey</option>
													<option value="united kingdom isle of man">regno unito - isola di man</option>
													<option value="united kingdom cayman islands">regno unito - isole cayman</option>
													<option value="united kingdom falkland islands">regno unito - isole falkland</option>
													<option value="united kingdom pitcairn">regno unito - isole pitcairn</option>
													<option value="united kingdom south sandwich islands">regno unito - isole sandwich meridionali</option>
													<option value="united kingdom turks and caicos islands">regno unito - isole turks e caicos</option>
													<option value="united kingdom british virgin islands">regno unito - isole vergini britanniche</option>
													<option value="united kingdom jersey">regno unito - jersey</option>
													<option value="united kingdom monttserrat">regno unito - montserrat</option>
													<option value="united kingdom saint helena">regno unito - sant'elena</option>
													<option value="united kingdom british indian ocean territory">regno unito - terr. britannico dell'oceano indiano</option>
													<option value="czech republic">repubblica ceca</option>
													<option value="central african republic">repubblica centrafricana</option>
													<option value="republic of the congo">repubblica del congo</option>
													<option value="democratic republic of the congo">repubblica democratica del congo (ex zaire)</option>
													<option value="republic of san marino">repubblica di san marino</option>
													<option value="dominican republic">repubblica dominicana</option>
													<option value="romania">romania</option>
													<option value="rwanda">ruanda</option>
													<option value="russia">russia</option>
													<option value="western sahara">sahara occidentale</option>
													<option value="saint vincent and the grenadines">saint vincent e grenadines</option>
													<option value="samoa">samoa</option>
													<option value="saint kitts and nevis">san kitts e nevis</option>
													<option value="saint lucia">santa lucia</option>
													<option value="sao tome and principe">sao tome e principe</option>
													<option value="senegal">senegal</option>
													<option value="serbia">serbia</option>
													<option value="seyschelles">seychelles</option>
													<option value="sierra leone">sierra leone</option>
													<option value="singapore">singapore</option>
													<option value="syria">siria</option>
													<option value="slovakia">slovacchia</option>
													<option value="slovenia">slovenia</option>
													<option value="somalia">somalia</option>
													<option value="spain">spagna</option>
													<option value="sri lanka">sri lanka</option>
													<option value="united states of america">stati uniti d'america</option>
													<option value="united states of america guam">stati uniti d'america - guam</option>
													<option value="united states of america northern mariana islands">stati uniti d'america - isole marianne settentrionali</option>
													<option value="united states of america minor outlyng islands">stati uniti d'america - isole periferiche secondarie</option>
													<option value="united states of america virgin islands">stati uniti d'america - isole vergini statunitensi</option>
													<option value="united states of america american samoa">stati uniti d'america - samoa americane</option>
													<option value="south africa">sud africa</option>
													<option value="sudan">sudan</option>
													<option value="suriname">suriname</option>
													<option value="sweden">svezia</option>
													<option value="switzerland">svizzera</option>
													<option value="swaziland">swaziland</option>
													<option value="tajikistan">tagikistan</option>
													<option value="thailand">tailandia</option>
													<option value="taiwan">taiwan</option>
													<option value="tanzania">tanzania</option>
													<option value="east timor">timor dell'est</option>
													<option value="togo">togo</option>
													<option value="tonga">tonga</option>
													<option value="trinidad and tobago">trinidad e tobago</option>
													<option value="tunisia">tunisia</option>
													<option value="turkey">turchia</option>
													<option value="turkmenistan">turkmenistan</option>
													<option value="tuvalu">tuvalu</option>
													<option value="ukraine">ucraina</option>
													<option value="uganda">uganda</option>
													<option value="hungary">ungheria</option>
													<option value="uruguay">uruguay</option>
													<option value="uzbekistan">uzbekistan</option>
													<option value="vanuatu">vanuatu</option>
													<option value="venezuela">venezuela</option>
													<option value="vietnam">vietnam</option>
													<option value="yemen">yemen</option>
													<option value="zambia">zambia</option>
													<option value="zimbabwe">zimbabwe</option>
													</select>											
												</tr>
											<tr><td height="5px"></td></tr>												
											<%
											bg=""
											if instr(rossi,"provincia,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Provincia:<font color="#E86868">*</font></td>
											  <td align=left ><select  id="Provincia" name="Provincia">
											  <option value="ESTERO">ESTERO</option>
												  <option selected value="<%=text_provincia%>" ><%=text_provincia%></option>
												  <% Do While not tbpro.EOF %>
												  <option value="<%=ucase(tbpro("Provincia"))%>"><%=ucase(tbpro("Provincia"))%></option>
												  <% tbpro.MoveNext
													 Loop%>
												</select></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<%
											bg=""
											if instr(rossi,"email,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;E-Mail:<font color="#E86868">*</font></td>
											  <td align=left ><input   type="text"  id="text_6"   name="email" size=45 value="<%=text_Email%>"></td>
											</tr>
											<tr><td height="5px"></td></tr>
											<%
											bg=""
											if instr(rossi,"telefono,")>0 then
												bg="bgcolor='#E86868'"
											end if
											%>
											<tr <%=bg%>>
											  <td align=left >&nbsp;Telefono/ Cellulare/ Fax:<font color="#E86868">*</font></td>
											  <td align=left ><input  type="text"   id="telefono" maxlength="130" name="telefono" size=45 value="<%=text_telefono%>"></td>
											</tr>
											
							
											<tr><td colspan="2" height="10px"></td></tr>
											<tr><td colspan="2" height="1px" bgcolor="#E86868"></td></tr> 
											<tr><td colspan="2" height="10px"></td></tr>						
							<tr> 
							<td valign=center align=center colspan=2>
							
								<table cellspacing="0" cellpadding="0" width="450px" align="left" class="tx12 grigio">
								<tr><td>
									Allego le condizioni generali di utilizzo della privacy policy e dichiaro di aver letto le informazioni richieste come da GDPR - REGOLAMENTO 2016 / 679 .<br>
									<br>
									<a class="yBox yBox_iframe" href="privacy_it.pdf"><img src='images/gdpr-logo.png'   border="0">&nbsp;&nbsp;&nbsp;</a>
									<br>
									<%
									ck=""
									if check_newsletter<>"1" then
										ck=" checked=""checked"" "
									end if
									%>
									<input type="radio" <%=ck%> id="newsletter0" name="newsletter" value="0">Accetto
									&nbsp;&nbsp;&nbsp;
									<%
									ck=""
									if check_newsletter="1" then
										ck=" checked=""checked"" "
									end if
									%>
									<input type="radio" <%=ck%> id="newsletter1" name="newsletter" value="1" >Non accetto
								 </td>
								</tr></table>
							
							</tr>
							<tr><td colspan="2" height="10px"></td></tr>
							<tr><td colspan="2" align="left"><input type="submit" style="background:#E86868;color:#ffffff;width:180px;" value="AGGIORNA&nbsp;DATI" border="0"></td></tr>
							<tr><td colspan="2" height="10px"></td></tr>
							<tr><td colspan="2" height="10px">Per rimuoversi >>> <a class="tx1 azzurro lnk" href='MAILTO:<%=rimozionemail%>'><%=rimozionemail%></a></td></tr>
							</table>
							</form>
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
                  