<%

Session("colorpagina")="bgcolor=#ffffff"
Session("titolopagina")="HAT SERIES  mobile +39 335.7260239  Via Spalato, 76 - 10141 Torino "
Session("rimozionemail")="info@hatseries.com"
Session("spedizionemail")="info@hatseries.com"
Session("cartadicredito")="info@hatseries.com"
Session("defaultMailfrom")="info@hatseries.com"
Session("pecmail")=""
Session("stampemail")=""
Session("ragionesocialetesto")="HAT SERIES "
Session("titolofinepagina")="<br>mobile +39 335.7260239 <br> Via Spalato, 76  <br>10141 Torino <br>C.F. e P.I. xxxxxx"
Session("sitourl")="https://shop.hatseries.com/"
Session("colorpopup")="#C0C0C0"
Session("titolobreve")="HAT SERIES  mobile +39 335.7260239   " 
Session("sitourllogo")="https://shop.hatseries.com/images/LOGO-HAT-SERIES.png"   ' inserire logo con indirizzi e numeri telefonici
'Session("sitourllogo")="img/logo.jpg"  ' inserire logo con indirizzi e numeri telefonici
Session("faxnum")=""
Session("indirizzo")="Via Spalato, 76 - 10141 Torino"
Session("provincia_cliente")="TORINO"
Session("mobile")=""
Session("facebook")="https://www.facebook.com/hatseries/"
'Session("googlemap")="<iframe src='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2971.165853148914!2d12.590507115440788!3d41.86777797922301!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f6290b2e47853%3A0xd0aea1d32851e176!2sDIMENSIONE%20UFFICIO%2085%20BUFFETTI%20ROMA(RM)%2C%20TIMBRI%20IN%2010%20MINUTI%20ROMA%2C%20PEC%20ROMA%2C%20TONER%20E%20CARTUCCE%20ROMA!5e0!3m2!1sit!2sit!4v1576572492375!5m2!1sit!2sit' width='600' height='450' frameborder='0' style='border:0;' allowfullscreen=''></iframe>"
'Session("googlestr")="<iframe src='https://www.google.com/maps/embed?pb=!4v1576572277133!6m8!1m7!1sepvjIbNRg1rHOxNJvmsvrg!2m2!1d41.86777136172065!2d12.59285222233337!3f276.9378!4f0!5f0.7820865974627469' width='600' height='450' frameborder='0' style='border:0;' allowfullscreen=''></iframe>"


idir="C:\inetpub\vhosts\hatseries.com\shop.hatseries.com\admin\articoli\"

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

Session("filtro")="(DescCatMerc not Like '%manuali%') and (nomecasaprod not like '%Edipro%') and (nomecasaprod not like '%Data Ufficio%') " 

Session("partitaiva")=22
Session("partitaivac")=1.22
%>