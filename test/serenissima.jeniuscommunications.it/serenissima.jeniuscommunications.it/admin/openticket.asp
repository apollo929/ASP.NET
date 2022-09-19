<!--#include file=connessionesql.inc-->
<%
    session("titolonavigazione")="OPEN TICKET"
    text_titolo=trim(senza_apice(Request.Form("titolo")))
    text_richiesta=trim(senza_apice(Request.Form("richiesta")))

    'controllo
    if request("tasto")<>"" then
        
		verrore=" Errore >>>"
		rossi=""
		errore="false"		
		'form insert	
		text_email=trim(senza_apice(Request.Form("email")))
		text_telefono=trim(senza_apice(Request.Form("telefono")))															
		text_provincia=replace(senza_apice(Request.Form("provincia")),"%20"," ")
      
        if text_telefono="" then
            errore="true"
            rossi=rossi & "telefono,"
            verrore=verrore & "Telefono ,"
        end if  
		if text_email="" then
            errore="true"
            rossi=rossi & "email,"
            verrore=verrore & "Email ,"
        end if
		if text_provincia="" then
            errore="true"
            rossi=rossi & "provincia,"
            verrore=verrore & "Provincia ,"
        end if
		if text_titolo="" then
            errore="true"
            rossi=rossi & "titolo,"
            verrore=verrore & "Titolo ,"
        end if	


        HTML = ""
        HTML = "<!DOCTYPE HTML PUBLIC -//IETF//DTD HTML//EN>" 
        HTML = HTML & "<html>" 
        HTML = HTML & "<head>" 
        HTML = HTML & "<meta http-equiv=Content-Type>" 
        'HTML = HTML & "<link rel=stylesheet href='https://" & linkuserid & "/style.css'></head>" 
        HTML = HTML & "<body class='nero10'>"
        'HTML = HTML & "<img src='" & sitourllogo &"'><br>"	
        HTML = HTML & "Nominativo : " & session("loginnominativo")   & "<br>"		
        HTML = HTML & "Provincia : " & text_provincia  & "<br>"								
        HTML = HTML & "Telefono  : " & text_telefono   & "<br>"								
        HTML = HTML & "Mail      : " & text_email   & "<br>"								
        HTML = HTML & "<hr>"	
        HTML = HTML & "Titolo : " & text_titolo & "<br>"
        HTML = HTML & "<hr>"		
        HTML = HTML & "Richiesta : " & text_richiesta & "<br>"			        
        HTML = HTML & "<hr><br>Lo Staff ringrazia <br>Al piu' presto sarai ricontattato<br><br><br>"	
        HTML = HTML & "</body>" 
        HTML = HTML & "</html>" 
        if errore="false" and trim(request("tasto"))="invia" then			
                    titolobreve="KIRON open ticket"	
                    rt=sendEmail(spedizionemail,trim(text_email),titolobreve,HTML)
					txt_fine=date()
					txt_fine=year(txt_fine) & "/"  & month(txt_fine) &  "/" & day(txt_fine) & " " & time()
                    sql="insert into TICKET (nominativo,mail,cellulare,titolo,provincia,note,data) values ('"+session("loginnominativo")+"','"+text_email+"','"+text_telefono+"','"+text_titolo+"','"+text_provincia+"','"+text_richiesta+"','"+txt_fine+"')"
	                conn.execute(lcase(sql))
					verrore=" INSERIMENTO RIUSCITO"
					'log
					'loggaVisSchede "inserimento lead","insert lead","lead","inserimento lead di :" & text_cognome & "  " & text_nome,session("loginnominativo")
                    response.Redirect("openticketall.asp")           
          end if
		end if
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
<script type="text/javascript">
function eseguiform()
{
swal("sei sicuro di voler inserire un ticket ?", {
buttons: {
cancel: "non inserire",
defeat: "inserimento ticket",
},
})
.then((value) => {
switch (value) {

case "defeat":
document.formticket.submit();
return true;

default:
return false;
//location.href = ''; 

}
});}
</script>
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
                                 
								 
								 
							
						    <form name="formticket" action="openticket.asp?tasto=invia" method="post" >
						    <table style="width:400px;" border=0 cellpadding="2" cellspacing="2">
							
                      			  
                                    <% if request("tasto")<>"" then%>
                                        <tr><td colspan="2">
                                            <font color="red" size="2"><strong><center><% Response.write(verrore)%></center></strong></font>
                                        </td></tr>
                                    <%end if%>
                         
									<tr>
							<td style="text-align:right;" ><span class="bold">AGENTE KIRON&nbsp;&nbsp;:&nbsp;&nbsp;</span></td>
							<td align=left><input type="text" size="35" id="agente" name="agente" readonly="readonly" value="<%=session("loginnominativo")%>"></td>
							</tr>
							<tr><td colspan="2" height="5px"></td></tr>
							
                                <tr>
                                    <td style="text-align:right;" ><span class="bold">E-MAIL&nbsp;&nbsp;:&nbsp;&nbsp;<font color="#FF0000">*</font>&nbsp;&nbsp;</span></td>
                                    <td><input type="text"  name="email" style="border:1px solid #abadb3;" size="60" id="email" value="<%=session("loginmail")%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>
                                <tr>
                                    <td style="text-align:right;" ><span class="bold">TEL/MOBILE&nbsp;&nbsp;:<font color="#FF0000">*</font>&nbsp;&nbsp;</span></td>
                                    <td><input  type="text" name="telefono" style="border:1px solid #abadb3;" size="15"  id="telefono" value="<%= session("logintel")%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>

								
                                <tr>
                                    <td  style="text-align:right;" ><span class="bold">PROVINCIA&nbsp;&nbsp;:&nbsp;&nbsp;<font color="#FF0000">*</font>&nbsp;&nbsp;</span></td>
                                    <td>
                                        <SELECT name="provincia" id="provincia" class="preventivicoldxnero1">
											<option selected="selected" value=<%=ucase(session("loginprovincia"))%> > <%=ucase(session("loginprovincia"))%></option> 
                                            <option value=AGRIGENTO>AGRIGENTO</option>
                                            <option value=ALESSANDRIA>ALESSANDRIA</option>
                                            <option value=ANCONA>ANCONA</option>
                                            <option value=AOSTA>AOSTA</option>
                                            <option value=AREZZO>AREZZO</option>
                                            <option value=ASCOLI%20PICENO>ASCOLI PICENO</option>
                                            <option value=ASTI>ASTI</option>
                                            <option value=AVELLINO>AVELLINO</option>
                                            <option value=BARI>BARI</option>
                                            <option value=BARLETTA-ANDRIA-TRANI>BARLETTA-ANDRIA-TRANI</option>
                                            <option value=BELLUNO>BELLUNO</option>
                                            <option value=BENEVENTO>BENEVENTO</option>
                                            <option value=BERGAMO>BERGAMO</option>
                                            <option value=BIELLA>BIELLA</option>
                                            <option value=BOLOGNA>BOLOGNA</option>
                                            <option value=BOLZANO>BOLZANO</option>
                                            <option value=BRESCIA>BRESCIA</option>
                                            <option value=BRINDISI>BRINDISI</option>
                                            <option value=CAGLIARI>CAGLIARI</option>
                                            <option value=CALTANISSETTA>CALTANISSETTA</option>
                                            <option value=CAMPOBASSO>CAMPOBASSO</option>
                                            <option value=CARBONIA-IGLESIAS>CARBONIA-IGLESIAS</option>
                                            <option value=CASERTA>CASERTA</option>
                                            <option value=CATANIA>CATANIA</option>
                                            <option value=CATANZARO>CATANZARO</option>
                                            <option value=CHIETI>CHIETI</option>
                                            <option value=COMO>COMO</option>
                                            <option value=COSENZA>COSENZA</option>
                                            <option value=CREMONA>CREMONA</option>
                                            <option value=CROTONE>CROTONE</option>
                                            <option value=CUNEO>CUNEO</option>
                                            <option value=ENNA>ENNA</option>
                                            <option value=ESTERO-CARINZIA>ESTERO-CARINZIA</option>
                                            <option value=ESTERO-CROAZIA>ESTERO-CROAZIA</option>
                                            <option value=ESTERO-FRANCIA>ESTERO-FRANCIA</option>
                                            <option value=ESTERO-ISTRIA>ESTERO-ISTRIA</option>
                                            <option value=ESTERO-SLOVENIA>ESTERO-SLOVENIA</option>
                                            <option value=ESTERO-SVIZZERA>ESTERO-SVIZZERA</option>
                                            <option value=FERMO>FERMO</option>
                                            <option value=FERRARA>FERRARA</option>
                                            <option value=FIRENZE>FIRENZE</option>
                                            <option value=FOGGIA>FOGGIA</option>
                                            <option value=FORLI>FORLI</option>
                                            <option value=FROSINONE>FROSINONE</option>
                                            <option value=GENOVA>GENOVA</option>
                                            <option value=GORIZIA>GORIZIA</option>
                                            <option value=GROSSETO>GROSSETO</option>
                                            <option value=IMPERIA>IMPERIA</option>
                                            <option value=ISERNIA>ISERNIA</option>
                                            <option value=LA%20SPEZIA>LA SPEZIA</option>
                                            <option value=LATINA>LATINA</option>
                                            <option value=LECCE>LECCE</option>
                                            <option value=LECCO>LECCO</option>
                                            <option value=LIVORNO>LIVORNO</option>
                                            <option value=LODI>LODI</option>
                                            <option value=LUCCA>LUCCA</option>
                                            <option value=L`AQUILA>L`AQUILA</option>
                                            <option value=MACERATA>MACERATA</option>
                                            <option value=MANTOVA>MANTOVA</option>
                                            <option value=MASSA%20CARRARA>MASSA CARRARA</option>
                                            <option value=MATERA>MATERA</option>
                                            <option value=MEDIO%20CAMPIDANO>MEDIO CAMPIDANO</option>
                                            <option value=MESSINA>MESSINA</option>
                                            <option value=MILANO>MILANO</option>
                                            <option value=MODENA>MODENA</option>
                                            <option value=MONZA%20-%20BRIANZA>MONZA - BRIANZA</option>
                                            <option value=NAPOLI>NAPOLI</option>
                                            <option value=NOVARA>NOVARA</option>
                                            <option value=NUORO>NUORO</option>
                                            <option value=OGLIASTRA>OGLIASTRA</option>
                                            <option value=OLBIA-TEMPIO>OLBIA-TEMPIO</option>
                                            <option value=ORISTANO>ORISTANO</option>
                                            <option value=PADOVA>PADOVA</option>
                                            <option value=PALERMO>PALERMO</option>
                                            <option value=PARMA>PARMA</option>
                                            <option value=PAVIA>PAVIA</option>
                                            <option value=PERUGIA>PERUGIA</option>
                                            <option value=PESARO>PESARO</option>
                                            <option value=PESARO URBINO>PESARO URBINO</option>
                                            <option value=PESCARA>PESCARA</option>
                                            <option value=PIACENZA>PIACENZA</option>
                                            <option value=PISA>PISA</option>
                                            <option value=PISTOIA>PISTOIA</option>
                                            <option value=PORDENONE>PORDENONE</option>
                                            <option value=POTENZA>POTENZA</option>
                                            <option value=PRATO>PRATO</option>
                                            <option value=RAGUSA>RAGUSA</option>
                                            <option value=RAVENNA>RAVENNA</option>
                                            <option value=REGGIO CALABRIA>REGGIO CALABRIA</option>
                                            <option value=REGGIO%20EMILIA>REGGIO EMILIA</option>
                                            <option value=RIETI>RIETI</option>
                                            <option value=RIMINI>RIMINI</option>
                                            <option value=ROMA>ROMA</option>
                                            <option value=ROVIGO>ROVIGO</option>
                                            <option value=SALERNO>SALERNO</option>
                                            <option value=SASSARI>SASSARI</option>
                                            <option value=SAVONA>SAVONA</option>
                                            <option value=SIENA>SIENA</option>
                                            <option value=SIRACUSA>SIRACUSA</option>
                                            <option value=SONDRIO>SONDRIO</option>
                                            <option value=TARANTO>TARANTO</option>
                                            <option value=TERAMO>TERAMO</option>
                                            <option value=TERNI>TERNI</option>
                                            <option value=TORINO>TORINO</option>
                                            <option value=TRAPANI>TRAPANI</option>
                                            <option value=TRENTO>TRENTO</option>
                                            <option value=TREVISO>TREVISO</option>
                                            <option value=TRIESTE>TRIESTE</option>
                                            <option value=UDINE>UDINE</option>
                                            <option value=VARESE>VARESE</option>
                                            <option value=VENEZIA>VENEZIA</option>
                                            <option value=VERBANIA>VERBANIA</option>
                                            <option value=VERBANO-CUSIO-OSSOLA>VERBANO-CUSIO-OSSOLA</option>
                                            <option value=VERCELLI>VERCELLI</option>
                                            <option value=VERONA>VERONA</option>
                                            <option value=VIBO VALENTIA>VIBO VALENTIA</option>
                                            <option value=VICENZA>VICENZA</option>
                                            <option value=VITERBO>VITERBO</option>
                                        </SELECT>
                                    </td>
                                </tr>
								<tr><td colspan="2" height="25px"><hr></td></tr>			

								                                <tr>
                                    <td style="text-align:right;" ><span class="bold">TITOLO&nbsp;&nbsp;:&nbsp;&nbsp;<font color="#FF0000">*</font>&nbsp;&nbsp;</span></td>
                                    <td><input type="text" name="titolo" style="border:1px solid #abadb3;" size="45" id="titolo" value="<%=text_titolo%>" /></td>
                                </tr>
								<tr><td colspan="2" height="5px"></td></tr>	
								<tr>
                                    <td style="text-align:right;" ><span class="bold">SEGNALA&nbspTIPO&nbsp;PROBLEMA&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;<font color="#FF0000">*</font>&nbsp;&nbsp;</span></td>
                                    <td style="text-align:left;"><textarea name="richiesta" rows="2" cols="55" ><%=text_richiesta%></textarea></td>
                                </tr>  
							    <tr><td height="10px"><font color="#FF0000">*</font>campi obbligatori</td></tr>								
                                <tr>
									<td  height="5px">
									
									</td>
									<td style="height:20px; text-align:left;"  class="preventivicoldxnero1">  
										<button type="button"  onclick="eseguiform();" class="btn btn-primary" >OPEN&nbsp;TICKET</button>										
										<button type="button"  onclick="location.href='openticketall.asp';" class="btn btn-primary" >ALL&nbsp;TICKET</button>									
									</td>
								</tr>
	
                            </table>
                            </form>
								 
								 
								 
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