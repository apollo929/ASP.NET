var XMLHTTP;

function carrellood(cod, fquantity)
{  
   var url = "carrellood.asp?cod=" + cod + "&fquantity=" + fquantity;
   XMLHTTP = ricavabrowser(cambiostato);
   XMLHTTP.open("GET", url, true);
   XMLHTTP.send(null);
   XMLHTTP.onload = function() {
	//alert(XMLHTTP.status);    
	if (XMLHTTP.status != 404) { // analyze HTTP status of the response
	swal( "Attenzione..." ,  "acquisto possibile solo con quantità minima" ,  "error" ); 
	return false;
	} else
		{   
		var url = "ricaricacarrello.asp";
		XMLHTTP = ricavabrowser(cambiostato);
		XMLHTTP.open("GET", url, true);
		XMLHTTP.send(null);
		swal("Perfetto! codice : "+cod , "Prodotto inserito nel CARRELLO!", "foto.asp?cat=catalogoisp/piccole&img="+cod+".jpg", {
		  buttons: {
			cancel: "continua con gli acquisti...",
			defeat: "vai al carrello.",
		  },
		})
		.then((value) => {
		  switch (value) {
		 
			case "defeat":
			location.href = 'carrellovisua.asp?#topage'; 
			return true;
			
			default:
			return false;
			//location.href = 'adappuntamentiKO.asp?appuntamento=yes&id='+id; 
			
		  }
		});	
	}
	};
}

function carrellobuffetti(cod, fquantity, esenteivac, blocco)
{  
   var url = "carrellobuffetti.asp?cod=" + cod + "&fquantity=" + fquantity + "&esenteivac=" + esenteivac + "&blocco=" + blocco;
   XMLHTTP = ricavabrowser(cambiostato);
   XMLHTTP.open("GET", url, true);
   XMLHTTP.send(null);
		swal("Perfetto! codice : "+cod , "Prodotto inserito nel CARRELLO!", "foto.asp?cat=catalogobuffetti2016_small&img="+cod+".jpg", {
		  buttons: {
			cancel: "continua con gli acquisti...",
			defeat: "vai al carrello.",
		  },
		})
		.then((value) => {
		  switch (value) {
		 
			case "defeat":
			location.href = 'carrellovisua.asp?#topage'; 
			return true;
			
			default:
			return false;
			//location.href = 'adappuntamentiKO.asp?appuntamento=yes&id='+id; 
			
		  }
		});	
}

function carrellomagazine(cod, fquantity)
{  
   var url = "carrellomagazine.asp?cod=" + cod + "&fquantity=" + fquantity;
   XMLHTTP = ricavabrowser(cambiostato);
   XMLHTTP.open("GET", url, true);
   XMLHTTP.send(null);
		swal("Perfetto! codice : "+cod , "Prodotto inserito nel CARRELLO!", "foto.asp?cat=catalogobuffetti2016_small&img="+cod+".jpg", {
		  buttons: {
			cancel: "continua con gli acquisti...",
			defeat: "vai al carrello.",
		  },
		})
		.then((value) => {
		  switch (value) {
		 
			case "defeat":
			location.href = 'carrellovisua.asp?#topage'; 
			return true;
			
			default:
			return false;
			//location.href = 'adappuntamentiKO.asp?appuntamento=yes&id='+id; 
			
		  }
		});	
}

function carrellomanuale(codice, fquantity, prezzo, titolo, iva, colore, taglia, cimageurl)
{  
   //var url = "carrellomanuale.asp?cod=" + cod + "&fquantity=" + fquantity + "&prezzo=" + prezzo + "&descrizione=" + descrizione;
   var url = "carrellomanuale.asp?codice=" + codice + "&prezzo=" + prezzo + "&titolo=" + titolo + "&fquantity=" + fquantity + "&iva=" + iva + "&colore=" + colore + "&taglia=" + taglia;
   //alert(<%=ecommeremanfoto(codice)%>);
   XMLHTTP = ricavabrowser(cambiostato);
   XMLHTTP.open("GET", url, true);
   XMLHTTP.send(null);
		swal("Perfetto! codice : "+codice , "Prodotto inserito nel CARRELLO!", "admin/articoli/"+"thum_"+cimageurl, {
		  buttons: {
			cancel: "continua con gli acquisti...",
			defeat: "vai al carrello.",
		  },
		})
		.then((value) => {
		  switch (value) {
		 
			case "defeat":
			location.href = 'carrellovisua.asp?#topage'; 
			return true;
			
			default:
			return false;
			//location.href = 'adappuntamentiKO.asp?appuntamento=yes&id='+id; 
			
		  }
		});	
}


function carrelloevc(codice, fquantity, prezzo, titolo, iva, cimageurl)
{  
   var url = "carrellomanualeevc.asp?codice=" + codice + "&prezzo=" + prezzo + "&titolo=" + titolo + "&fquantity=" + fquantity + "&iva=" + iva + "&cimageurl=" +cimageurl;
   XMLHTTP = ricavabrowser(cambiostato);
   XMLHTTP.open("GET", url, true);
   XMLHTTP.send(null);
		swal("Perfetto! codice : "+codice , "Prodotto inserito nel CARRELLO!", "admin/articoli/"+"thum_"+cimageurl, {
		  buttons: {
			cancel: "continua con gli acquisti...",
			defeat: "vai al carrello.",
		  },
		})
		.then((value) => {
		  switch (value) {
		 
			case "defeat":
			location.href = 'carrellovisua.asp?#topage'; 
			return true;
			
			default:
			return false;
			
		  }
		});	
}


function Ricarica_carrello(codsp, cod, prezzo, fquantity)
{
   var url = "ricaricacarrello.asp";
   XMLHTTP = ricavabrowser(cambiostato);
   XMLHTTP.open("GET", url, true);
   XMLHTTP.send(null);
}

function Visualizza_carrello()
{
   var url = "ricaricacarrellovisua.asp?#topage"
   XMLHTTP = ricavabrowser(cambiostatocarrello);
   XMLHTTP.open("GET", url, true);
   XMLHTTP.send(null);
}

function carrelloconsegne()
{
   // alert('ciao');
   var url = "ricaricamenuod.asp"
   XMLHTTP = ricavabrowser(cambiostatocarrello);
   XMLHTTP.open("GET", url, true);
   XMLHTTP.send(null);
}

function Registrati(codsp)
{
   
			swal("Attenzione..." ,  "Per inserire un prodotto nel carrello bisogna essere registrati." ,  "error", {
		  buttons: {
			cancel: "accedi se sei registrato...",
			defeat: "registrati",
		  },
		})
		.then((value) => {
		  switch (value) {
		 
			case "defeat":
			location.href = 'registrati.asp'; 
			return true;
			
			default:
			location.href = 'accedi.asp'; 
			return true;
			//location.href = 'adappuntamentiKO.asp?appuntamento=yes&id='+id; 
			
		  }
		});	
}

function cambiostato()
{
    if (XMLHTTP.readyState == 4)
    {
        var R = document.getElementById("risultato");
		var R1 = document.getElementById("risultato1");
        R.innerHTML = XMLHTTP.responseText;		
		R1.innerHTML = XMLHTTP.responseText;	
		return false;	
    }
}

function cambiostatocarrello()
{
    if (XMLHTTP.readyState == 4)
    {
        var visuacar = document.getElementById("divcarrello");
	    visuacar.innerHTML = XMLHTTP.responseText;		
		return false;	
    }
}
function cambiostatonpezzi()
{
    if (XMLHTTP.readyState == 4)
    {
        var npezzi = document.getElementById("numpezzi");
	   npezzi.innerHTML = XMLHTTP.responseText;		
		return false;	
    }
}

function ricavabrowser(QualeBrowser)
{
    if (navigator.userAgent.indexOf("MSIE") != (-1))
    {
        var Classe = "Msxml2.XMLHTTP";
        if (navigator.appVersion.indexOf("MSIE 5.5") != (-1));
        {
            Classe = "Microsoft.XMLHTTP";
        } 
        try
        {
            OggettoXMLHTTP = new ActiveXObject(Classe);
            OggettoXMLHTTP.onreadystatechange = QualeBrowser;
            return OggettoXMLHTTP;
        }
        catch(e)
        {
            alert("Errore: l'ActiveX non verrà eseguito!");
        }
    }
    else if (navigator.userAgent.indexOf("Mozilla") != (-1))
    {
        OggettoXMLHTTP = new XMLHttpRequest();
        OggettoXMLHTTP.onload = QualeBrowser;
        OggettoXMLHTTP.onerror = QualeBrowser;
        return OggettoXMLHTTP;
    }
    else
    {
        alert("L'esempio non funziona con altri browser!");
    }
}