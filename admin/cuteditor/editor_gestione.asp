<!--#include file=connessionesql.inc-->
<!-- #include file = "CuteEditor_Files/include_CuteEditor.asp" -->
<%
if request("Id")="" then 
	
	response.Redirect("http://www.costruttori.it/login/index.asp")	
else
	session("Id")=""
	session("Id")=request("Id")
	Queryp="SELECT * FROM Lista where id=" & session("Id") & " union SELECT * FROM Lista1 where id=" & session("Id") & " limit 1"   
	set Tblista=Conn.Execute(Queryp) 
end if
%>
<html>
<head>
<title>Costruttori.it , portale edile , edilizia ,costruttori , costruttore , imprese edile , materiali edili , noleggio edilizia , noleggio edile </title>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="it" />
<meta name="Robots" content="All" />
<meta name="Owner" content="info@costruttori.it" /> 
<meta name="Author" content="Costruttori.it" />  
<meta name="Copyright" content="Costryttori s.r.l." />
<meta name="keywords" content="Portale edile ,costruttori , costruttore ,edilizia,costruttori,1996,restauri,immobili,ponteggi,gru,annunci,gratis,ristutturi,cemento,prefabbricati">
<meta name="description" content="Costruttori.it , il portale dedicato all'edilizia e dintorni.Offre ai suoi iscritti numerosi servizi gratuiti, come la vetrina aziendale, annunci gratuiti e maggiore visibilita nel web">
<style type="text/css">
<!--
.Stile15 {color: #0066CC}
.Stile18 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 24px;
}
-->
</style><style type="text/css">
<!--
.ciao { border: 1px solid #0033CC; }
.Stile6 {color: #FF6600}
.Stile15 {color: #0066CC}
.Stile17 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000; text-decoration:none;}
.Stilep {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: bold; color:#FFFFFF    }
.desc {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;  color:#000000    }
.Stile18 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 24px;
}
.nero{
font-family:verdana;
color:#000000;
font-size:11px;
}
.Stile22 {font-family: Verdana, Arial, Helvetica, sans-serif; font-weight: bold; font-size: 12px; }
-->
</style>
</head>
<body>
<table width="100%"  border=0 align="center" cellpadding=0 cellspacing=0>
<tr>
    <td valign=top><a href="http://www.costruttori.it"><img src="../vetrine/images/costruttori.jpg" border="0"></a></td>
    <td colspan="3" align="center" valign="top" width=100%><p class="Stile18">VETRINA DELL'AZIENDA </p></td>
</tr>
</table>
  <table width="100%">
  <tr>
  <td width="15%" valign="top">
  	<table>
		<tr>
			<td><img src="images/eximage.gif" border="0"></td>
			<td class="nero">Inserisci immagini</td>
		</tr>
		<tr>
			<td><img src="images/document.gif" border="0"></td>
			<td class="nero">Inserisci documento pdf</td>
		</tr>
		<tr>
			<td><img src="images/swf.gif" border="0"></td>
			<td class="nero">Inserisci animazione flash</td>
		</tr>
		<tr>
			<td><img src="images/media.gif" border="0"></td>
			<td class="nero">Inserisci media</td>
		</tr>
		<tr>
			<td><img src="images/you-sma.png" border="0"></td>
			<td class="nero">Inserisci video</td>
		</tr>
		<tr><td colspan=2 class="nero"><strong></strong><u>non si possono cancellare/rinominare i file in upload<br>si consiglia di creare propria cartella</u></td></tr>
		<tr>
			<td colspan="2">
				<table>
					<tr>
						<td align="center"><a href="http://www.materialiedilistore.com/negozio.asp"><img title="inserisci materiali in vendita" src="http://www.costruttori.it/vetrine/images/materiali.gif" border="0"></a></td>
						<td><a href="http://www.materialiedilistore.com/negozio.asp" class="nero">Inserisci Materiali</a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
  </td>
  <td width="70%">	
  <table align="center" width="70%">
  <tr>
  <td>
<form action="editorsave.asp" method="post">
				<%
				'cute editor	
				Dim editor
				Set editor = New CuteEditor
				editor.ID = "Editor1"
				editor.Text = "" & Tblista("Descrizione") & ""
				editor.FilesPath = "CuteEditor_Files"
				editor.DisableItemList = "Save"
				editor.Height = 350
				editor.ThemeType="Office2003_BlueTheme"
				editor.EditorWysiwygModeCss = "asp.css"
				editor.Draw()
				%>
			<div class="Stile22">Full screen (F12)  </div>
<p align="left"><input type="image" src="images/salva-scheda-tecnica.png"/></p>
</form>
</td>
</tr>
</table>
</td>
<td width="15%" valign="top">
	<table>
		<tr><td align="center"><a href="http://www.youtube.com/?gl=IT&hl=it" target="_blank"><img src="images/youtube.png" width="100" height="58" border="0"></a></td></tr>
		<tr>
			<td class="nero">
			<strong>Per caricare un video seguire questi passaggi</strong>:<br>
			<strong>1</strong>-scegliere un video da youtube<br>
			<strong>2</strong>-selezionate tutto(sotto la riga URL) il codice che trovate sotto la scritta "Codice da incorporare".<br>
			<strong>3</strong>-dopo averlo selezionato cliccate con il tasto destro del mause e selezionate copia<br>
			<strong>4</strong>-tornate nella pagina di modifica descrizione azienda e cliccate sull'icona di youtube(in alto a destra) <br>
			<strong>5</strong>-comparirà una finestra con scritto Embed a YouTube video<br>
			<strong>6</strong>-nel campo Paste the YouTube Embed code inserire il codice che avete precedentemente copiato da youtube<br>
			<strong>7</strong><u>non si possono cancellare/rinominare i file in upload<br>si consiglia di creare propria cartella</u>
		  </td>
		</tr>
	</table>
</td>
</tr>
</table>
</form>
<table width="100%" >
	<tr>
		<td width="79%" align="right"><img src="http://www.costruttori.it/interventi/img/ico_indietro.jpg"></td>
		<td width="21%">
			<%if session("ragione")<>"" then%>
				<a href="http://www.costruttori.it/login/logaziende.asp" class="nero">Torna al pannello azienda</a>
			<%else%>
				<a href="http://www.costruttori.it/login/logpriv.asp" class="nero">Torna al pannello privati</a>
			<%end if%>
	  </td>
	</tr>
</table>
<table width="100%">
  <tr>
    <td><div align="center"><span class="Stile6 Stile15">_______________________________________________________________________________________________________</span></div></td>
  </tr>
  <tr>
  <td align="right">  <div align="center">© <span class="Stile17"><%=year(date())%> Costruttori s.r.l. - Tutti i diritti riservati.<br>
    Lun-Ven ore 9.00-13.00 e 15.00-17.00<br>
    Tel.: 0422.775465<br>
    Fax:0422.882967<br>
	E-mail: <a class="Stile17" href="mailto:info@jeniuscommunications.it"><u>info@costruttori.it</u></a></span><br>
  </div>
</table>
</body>
</html>