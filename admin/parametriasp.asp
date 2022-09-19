<%
'parametri generali da settare cliente x cliente
linkuserid=Request.ServerVariables("SERVER_NAME")

Session("colorpagina")="bgcolor=#ffffff"
Session("titolopagina")="BUFFETTI FELTRE ERREBI S.A.S. VIALE GIUSEPPE MAZZINI 20/22 32032 FELTRE BELLUNO - Tel. 0439.302181 Fax 0439.304613"
Session("rimozionemail")="remove@buffettifeltre.com"
Session("spedizionemail")="ordini@buffettifeltre.com"
Session("cartadicredito")="ordini@buffettifeltre.com"
Session("defaultMailfrom")="no-reply@buffettifeltre.com"
Session("titolofinepagina")="ERREBI S.A.S. VIALE GIUSEPPE MAZZINI 20/22 32032 FELTRE BELLUNO - Tel. 0439.302181 Fax 0439.304613  PI 00653840256"
Session("sitourl")="http://www.errebifeltre.com/"
Session("colorpopup")="#C0C0C0"
Session("titolobreve")="BUFFETTI FELTRE ERREBI S.A.S. VIALE GIUSEPPE MAZZINI 20/22 32032 FELTRE BELLUNO - Tel. 0439.302181 Fax 0439.304613  PI 00653840256"
Session("sitourllogo")="http://www.errebifeltre.com/" & linkuserid & "/images/logo.jpg"  ' inserire logo con indirizzi e numeri telefonici
Session("faxnum")="0439.304613"
Session("indirizzo")="VIALE GIUSEPPE MAZZINI 20/22 32032 FELTRE BELLUNO"
Session("provincia_cliente")="BELLUNO"

'foto isp
Session("sitourlfotocartucce")= sitourl & "foto.asp?cat=catalogoisp%2Fpiccole&img="
Session("percorsofotocartucce")="C:\Inetpub\vhosts\schede.eu\httpdocs\cataloghi\catalogoisp\piccole\"
Session("sitourlfotocartucceg")=  sitourl & "foto.asp?cat=catalogoisp&img="
Session("percorsofotocartucceg")="C:\Inetpub\vhosts\schede.eu\httpdocs\cataloghi\catalogoisp\"

'area informatica
Session("sitourlfotopc")= sitourl &  "foto.asp?cat=catalogopcpiccole&img="
Session("percorsofotopc")="C:\Inetpub\vhosts\schede.eu\httpdocs\cataloghi\catalogopcpiccole\"
Session("sitourlfotopcg")= sitourl &  "foto.asp?cat=catalogopcgrandi&img="
Session("percorsofotopcg")="C:\Inetpub\vhosts\schede.eu\httpdocs\cataloghi\catalogopcgrandi\"

Session("filtro")="(DescCatMerc not Like '%manuali%') " 

%>