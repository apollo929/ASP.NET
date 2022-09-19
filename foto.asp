<%		
        foto_annuncig="https://img.schede.eu/cataloghi/" & request("cat") & "/" & replace(replace(request("img"),".jpg",".jpg"),"spi","")
		'response.write(foto_annuncig)
		'response.end
		set fso = Server.CreateObject("Scripting.FileSystemObject")		
		' Creo un'istanza dell'oggetto XMLHTTP
		Set objxmlhttp = Server.CreateObject("Microsoft.XMLHTTP")
		' Apro e lancio la richiesta HTTP
		objxmlhttp.Open "GET", foto_annuncig, false
		objxmlhttp.Send
		
		' Se l'immagine esiste la mostro
		if CInt(objxmlhttp.Status) = 200 then
          'ok
		  Response.Redirect(foto_annuncig)
		else
				Response.Redirect("images/nophoto.png")  
		end if	   
%>