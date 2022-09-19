 
<!-- #include file = "CuteEditor_Files/include_CuteEditor.asp" -->
 
<html>
<head>
<title>Modifica la vetrina azienda</title>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="it" />
<meta name="Robots" content="All" />
<meta name="Owner" content="info@costruttori.it" /> 
<meta name="Author" content="Costruttori.it" />  
<meta name="Copyright" content="Costryttori s.r.l." />
<meta name="keywords" content="Portale edile ,costruttori , costruttore ,edilizia,costruttori,1996,restauri,immobili,ponteggi,gru,annunci,gratis,ristutturi,cemento,prefabbricati">
<meta name="description" content="Costruttori.it , il portale dedicato all'edilizia e dintorni.Offre ai suoi iscritti numerosi servizi gratuiti, come la vetrina aziendale, annunci gratuiti e maggiore visibilita nel web">
<link rel="stylesheet" type="text/css" href="../login/style.css">
</head>
<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="top"><a href="https://www.costruttori.it" target="_self"><img src="../vetrine/images/costruttori.jpg" border="0"></a></td>
        <td align="left" width="100%">&nbsp;&nbsp;<font class="txt20 azzurro oswaldb">VETRINA DELL'AZIENDA</font>&nbsp;&nbsp;</td>
    </tr>
</table>
<table width="100%" border="0">
	<tr>
  		<td width="18%" valign="top">
  			<font class="txt16 oswaldb azzurro">COSA POSSO FARE?</font>
            <table class="txt12 nero arial">
            	<tr>
                    <td align="left"><img src="images/eximage.gif" border="0" alt=""></td>
                    <td align="left">Inserisci immagini</td>
                </tr>
                <tr>
                    <td align="left"><img src="images/document.gif" border="0" alt=""></td>
                    <td align="left">Inserisci documento pdf</td>
                </tr>
                <tr>
                    <td align="left"><img src="images/swf.gif" border="0" alt=""></td>
                    <td align="left">Inserisci animazione flash</td>
                </tr>
                <tr>
                    <td align="left"><img src="images/media.gif" border="0" alt=""></td>
                    <td align="left">Inserisci media</td>
                </tr>
                <tr>
                    <td align="left"><img src="images/you-sma.png" border="0" alt=""></td>
                    <td align="left">Inserisci video</td>
                </tr>
                <tr>
                	<td colspan="2" align="left"><u>non si possono cancellare/rinominare i file in upload si consiglia di creare propria cartella</u></td>
                </tr>
				<tr>
				<td align="left"><a href="https://www.costruttori.it/vetrine/upload.asp"><img title="carica un nuovo logo" src="../login/images/carica_logo.png" border="0"></a>	</td>
				<td align="left"><a href="https://www.costruttori.it/vetrine/upload.asp" class="txt12 oswaldb lnk grigioscuro">CARICA LOGO</a></td>
				</tr>
				                <tr>
                    <td align="left">
                    	<a href="https://www.costruttori.it/iscrizione/modificaazienda.asp" target="_self" title="Modifica dati Aziendali"><img src="https://www.costruttori.it/login/images/inserisci_materiali.png" border="0"></a>
                    </td>
                    <td align="left">
                    	<a href="https://www.costruttori.it/iscrizione/modificaazienda.asp" class="txt12 oswaldb lnk grigioscuro" title="">MODIFICA DATI AZIENDALI</a>
                    </td>
                </tr>
						<tr>
			<td align="left"><a href="https://www.costruttori.it/cuteditor/editor.asp"><img title="modifica la descrizione dell'azienda" src="https://www.costruttori.it/login/images/mod_descrizione.png" border="0"></a></td>
			<td align="left"><a href="https://www.costruttori.it/cuteditor/editor.asp" class="txt12 oswaldb lnk grigioscuro">MODIFICA DESCRIZIONE VETRINA</a></td>
		</tr>

                <tr>
                    <td align="left">
                    	<a href="https://www.costruttori.it/login/logaziende.asp" target="_self" class="txt12 nero lnk" title="Torna al pannello"><img src="https://www.costruttori.it/login/images/indietro.png" border="0"></a>
                    </td>
                    <td align="left">
                        <%if session("ragione")<>"" then%>
                            <a href="https://www.costruttori.it/login/logaziende.asp" target="_self" class="txt12 oswaldb lnk grigioscuro" title="Torna al pannello azienda">TORNA AL PANNELLO AZIENDA</a>
                        <%else%>
                            <a href="https://www.costruttori.it/login/logpriv.asp" target="_self" class="txt12 oswaldb lnk grigioscuro" title="Torna al pannello privati">TORNA AL PANNELLO PRIVATI</a>
                        <%end if%>
                    </td>
                </tr>
            </table>
            </font>
  		</td>
  		<td width="64%" valign="top">	
  			<table align="center" width="70%">
  				<tr>
  					<td>
						<form action="editorsave.asp" method="post">
							<%
							
                            'cute editor	
                            Dim editor
                            Set editor = New CuteEditor
                            editor.ID = "Editor1"
                            'editor.Text = "" & tbvetrina("Descrizione") & ""
                            editor.FilesPath = "CuteEditor_Files"
                            editor.DisableItemList = "Save"
                            editor.Height = 350
                            editor.ThemeType="Office2003_BlueTheme"
                            editor.EditorWysiwygModeCss = "asp.css"
                            editor.Draw()
                            %>
							<center>Full screen (F12)<br><br><input type="image" src="../login/images/salva-scheda-tecnica.png"/></center>
						</form>
					</td>
				</tr>
			</table>
		</td>
		<td width="18%" valign="top">
			<table>
				<tr><td align="center"><a href="https://www.youtube.com/?gl=IT&hl=it" target="_blank" title="Homepage di YouTube.it"><img src="images/youtube.png" height="58" border="0"></a></td></tr>
                <tr>
                    <td class="txt12 nero arial">
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
<br>

<!-- #include file = "../login/footer.asp" -->

</body>
</html>