<!--Shop Manuale -->
<!--#include virtual="/connessionesql.inc"-->
<%  

'on error goto resume next
session.lcid=1040
merchant=118

'Elimina l'articolo
if request("cmd")="del" then
		articolo=cint(request("prID"))
		StrSQL="Delete from shop_products where catalogID=" & articolo
		connm.Execute StrSQL	
		StrSQL="Delete from shop_merchantproducts where catalogID=" & articolo & " and merchantID=" & merchant
		connm.Execute StrSQL	
		response.redirect "merchant_articoli.asp?cmd=new&merchant=118"
end if
   
Function CA(ByVal Testo)
	ca=Trim(replace(testo,"'","‘"))
End Function

Function IDate(Byval Data)
	If Len(Data)>1 Then
		Data=cdate(Data)
		Idate=year(Data) & "/" & month(Data) & "/" & day(Data)
	Else
		Idate=""
	End If
End Function

Function Name(byval num )
    Set Tbmerch = Server.CreateObject("ADODB.RecordSet")
	Sql="Select  * from shop_Merchant where Idmerchant=" & Cint(num)
	Tbmerch.Open Sql,connm
	If not Tbmerch.EOF then
	  Name=Tbmerch("Ragionesoc1")
	Else
	  Name="Non Pervenuto"  
    End if
End Function



'Valori Form
codarticolo=Request.Form("codarticolo")
hidden=lcase(Request.Form("hidden"))
frommaindb=false
if len(codarticolo)=0 then
	codarticolo=Request.Form("hcodarticolo")
	frommaindb=true
end if
desarticolo=Request.Form("desarticolo")
artdettagli=Request.Form("artdettagli")

if Trim(Request.Form("immaginepdf"))<>"" then
  immaginepdf=Request.Form("immaginepdf")
else
  immaginepdf="nessunfile-pdf"
end if
if Trim(Request.Form("immagine"))<>"" then
  immagine=Request.Form("immagine")
else
  immagine="vuoto.gif"
end if
if Trim(Request.Form("immagine1"))<>"" then
  immagine1=Request.Form("immagine1")
else
  immagine1="vuoto.gif"
end if
if Trim(Request.Form("immagine2"))<>"" then
  immagine2=Request.Form("immagine2")
else
  immagine2="vuoto.gif"
end if
if Trim(Request.Form("immagine3"))<>"" then
  immagine3=Request.Form("immagine3")
else
  immagine3="vuoto.gif"
end if
if Trim(Request.Form("immagine4"))<>"" then
  immagine4=Request.Form("immagine4")
else
  immagine4="vuoto.gif"
end if
rifarticolo=Request.Form("rifarticolo")
articoloofferta=Request.Form("articoloofferta")
cstock=Request.Form("stock")
prezzo=Request.Form("prezzo")
prezzoofferta=Request.Form("prezzoofferta")
scorta=Request.Form("scorta")
sottoscorta=Request.Form("sottoscorta")
disponibile=Request.Form("disponibile")
civa=Request.Form("esenteiva")
if trim(civa)="on" then 
  civa="no"
else
  civa="si"
end if	
'Categoria e Sottocategoria
categoria=Request.Form("categorie")
sottocategoria=lcase(Request.Form("sottocategoriaid"))
'Conversione boolean
bartoff=true
tg1=lcase(Request.Form("taglia1"))
tg2=lcase(Request.Form("taglia2"))
tg3=lcase(Request.Form("taglia3"))
tg4=lcase(Request.Form("taglia4"))
tg5=lcase(Request.Form("taglia5"))
tg6=lcase(Request.Form("taglia6"))
if tg1="on" then tg1="xs"
if tg2="on" then tg2="s"
if tg3="on" then tg3="m"
if tg4="on" then tg4="l"
if tg5="on" then tg5="xl"
if tg6="on" then tg6="xxl"
tgtot="- "+tg1+" "+tg2+" "+tg3+" "+tg4+" "+tg5+" "+tg6+" -"


col1=lcase(Request.Form("colore1"))
col2=lcase(Request.Form("colore2"))
col3=lcase(Request.Form("colore3"))
col4=lcase(Request.Form("colore4"))
col5=lcase(Request.Form("colore5"))
col6=lcase(Request.Form("colore6"))
col7=lcase(Request.Form("colore7"))
col8=lcase(Request.Form("colore8"))
col9=lcase(Request.Form("colore9"))
if col1="on" then col1="blu"
if col2="on" then col2="azzurro"
if col3="on" then col3="nero"
if col4="on" then col4="bianco"
if col5="on" then col5="rosso"
if col6="on" then col6="giallo"
if col7="on" then col7="arancione"
if col8="on" then col8="verde"
if col9="on" then col9="marrone"
coltot=" "+col1+" "+col2+" "+col3+" "+col4+" "+col5+" "+col6+" "+col7+" "+col8+" "+col9+" "

'dati nuovi
'dati nuovi
'dati nuovi
prezzoqta1=Request.Form("prezzoqta1")
qta1=cint(Request.Form("qta1"))
prezzoqta2=Request.Form("prezzoqta2")
qta2=cint(Request.Form("qta2"))
prezzoqta3=Request.Form("prezzoqta3")
qta3=cint(Request.Form("qta3"))
aliqiva=Request.Form("aliqiva")
homepage=Request.Form("homepage")
if not isnumeric(prezzoqta1) and len(prezzoqta1)<>0 then  prezzoqta1=0
if not isnumeric(prezzoqta2) and len(prezzoqta2)<>0 then  prezzoqta2=0
if not isnumeric(prezzoqta3) and len(prezzoqta3)<>0 then  prezzoqta3=0
if not isnumeric(qta1) and len(qta1)<>0 then  qta1=0
if not isnumeric(qta2) and len(qta2)<>0 then  qta2=0
if not isnumeric(qta3) and len(qta3)<>0 then  qta3=0
if not isnumeric(aliqiva) and len(aliqiva)<>0 then  aliqiva=0
if trim(homepage)="on" then  
  homepage=1
else  
  homepage=0
end if  
if civa="no" then aliqiva=0
'dati nuovi
'dati nuovi
'dati nuovi



'Controlli
errore=""
If not isdate(disponibile) and len(disponibile)<>0 Then
	'Errore data
	errore="dt"
end if
If not isnumeric(sottoscorta) and len(sottoscorta)<>0 then
	'Errore sottoscorta
	errore="ss"
end if
If len(sottoscorta)>0 and isnumeric(sottoscorta) then
	If cdbl(sottoscorta)<0 Then
		'Errore sottoscorta
		errore="sm"
	end if
end if
If not isnumeric(scorta) and len(scorta)<>0 then
	'Errore scorta
	errore="sc"
end if
If not isnumeric(prezzo) and len(prezzo)<>0 then
	'Errore prezzo
	errore="pr"
end if
If len(prezzo)>0 and isnumeric(prezzo) then
	If cdbl(prezzo)<0 then
		'Errore prezzo
		errore="pm"
	end if
end if
If not isnumeric(prezzoofferta) and len(prezzoofferta)<>0 then
	'Errore prezzoofferta
	errore="of"
end if
If len(prezzoofferta)>0 and isnumeric(prezzoofferta) then
	If cdbl(prezzoofferta)<0 then
		'Errore prezzoofferta
		errore="om"
	end if
end if

if frommaindb=false then
	if hidden<>"disabled" or Request.Form("insdb")<>"true" then
		If Len(trim(codarticolo))=0 then
			'Errore descrizione
			errore="wa"
		end if
		If Len(trim(desarticolo))=0 then
			'Errore descrizione
			errore="de"
		end if
	end if
end if

'Se Errore redirect
If Len(errore)>0 Then
	WriteSession
	Response.redirect "merchant_articoli.asp?prID=" & request("prID") & "&act=mod&errore=errore&merchant=" & merchant
End If



' Controlla se utilizza il dataBase Principale
if request("owner")="true" then 
	codarticolo=articolo
	addnew=false
else
	if hidden="disabled" then 
		codarticolo=articolo
		addnew=false
	else
		addnew=true	
	end if
end if

'Controlla se c'è la data
If Len(Disponibile)>0 then
	dataok=true
else
	dataok=false
end if

'Assume a zero i campi nulli
if len(scorta)=0 then
	scorta=0
end if
if len(sottoscorta)=0 then
	sottoscorta=0
end if
if len(prezzo)=0 then
	prezzo=0
end if
if len(prezzoofferta)=0 then
	prezzoofferta=0
end if

if request("cmd")="new" and ca(trim(rifarticolo))<>"" then
		
			'Aggiunge il record anche sull'archivio articoli
			StrSQL="insert into shop_products (ccode,cname,cdescription,cprice,cprice1,cprice2,cprice3,cpriceofferta,qta1,qta2,qta3,cimageurl,cimageurl1,cimageurl2,cimageurl3,cimageurl4,filepdf,coffmag,cstock,iva,taglia,colore,ccategory,cscategory,cliente,owner,aliqiva,homepage)"	
			'StrSQL="insert into products (ccode,cname,cdescription,cprice,cpriceofferta,cimageurl,ccategory,cscategory,cliente,owner)"	
			StrSQL=StrSQL & " values ("
			'StrSQL=StrSQL & trim(codarticolo) & "',"
			StrSQL=StrSQL & "'" & ca(trim(rifarticolo)) & "',"
			StrSQL=StrSQL & "'" & ca(trim(desarticolo)) & "',"
			StrSQL=StrSQL & "' " & ca(trim(artdettagli)) & "',"
			StrSQL=StrSQL & prezzo & ","
			StrSQL=StrSQL & prezzoqta1 & ","
			StrSQL=StrSQL & prezzoqta2 & ","
			StrSQL=StrSQL & prezzoqta3 & ","
			StrSQL=StrSQL & prezzoofferta & ","
			StrSQL=StrSQL & qta1 & ","
			StrSQL=StrSQL & qta2 & ","
			StrSQL=StrSQL & qta3 & ","	
			StrSQL=StrSQL & "'" & ca(trim(immagine)) & "',"
			StrSQL=StrSQL & "'" & ca(trim(immagine1)) & "',"
			StrSQL=StrSQL & "'" & ca(trim(immagine2)) & "',"
			StrSQL=StrSQL & "'" & ca(trim(immagine3)) & "',"
			StrSQL=StrSQL & "'" & ca(trim(immagine4)) & "',"
			StrSQL=StrSQL & "'" & ca(trim(immaginepdf)) & "',"	
			StrSQL=StrSQL & "'" & trim(articoloofferta) & "',"
			StrSQL=StrSQL & "'" & trim(cstock) & "',"	
			StrSQL=StrSQL & "'" & trim(civa) & "',"			
			StrSQL=StrSQL & "'" & tgtot & "',"		
			StrSQL=StrSQL & "'" & trim(coltot) & "',"		
			StrSQL=StrSQL & trim(categoria) & ","
			StrSQL=StrSQL & trim(sottocategoria) & ","
			'StrSQL=StrSQL & trim(bartoff) & ","
			StrSQL=StrSQL & "'" & trim(Name(merchant)) & "',"
			StrSQL=StrSQL & trim(merchant) & ","
			StrSQL=StrSQL & trim(aliqiva) & ","
			StrSQL=StrSQL & trim(homepage)				
			StrSQL=StrSQL + ")"
			'Stampa pdf
			'response.write(StrSQL)	
			'response.end				
			'On Error Resume Next 
			connm.Execute StrSQL

			'Trova Codice Articolo
			'Trova il nuovo codice articolo
			Set tbshop = Server.CreateObject("ADODB.RecordSet")
			sSQL = "Select * from shop_products order by catalogID desc"
			'Apertura Recordset (Static)
			tbshop.Open sSQL,connm
			codarticolo= tbshop("catalogID")
			tbshop.Close

		'Trova il nuovo codice articolo
			Set tbshop = Server.CreateObject("ADODB.RecordSet")
			sSQL = "Select * from shop_merchantproducts "
			'Apertura Recordset (Static)
			tbshop.Open sSQL,connm,1,3
			tbshop.AddNew
			tbshop("merchantID") = merchant
			tbshop("catalogID") = codarticolo
			tbshop("ccode") = ca(trim(rifarticolo))
			tbshop("cprice") = prezzo
			tbshop("cpriceofferta") = prezzoofferta 
			tbshop("cscorta") = scorta
			tbshop("csottoscorta") = sottoscorta
			tbshop("cdisponibile") = date()
			'tbshop("coffmag")= Trim(bartoff) & ","
			tbshop("counter") = "A"
			tbshop.Update
			tbshop.Close
			
end if
if request("act")="mod" then

			' Apertura Database
			'Modifica Record
			StrSQL="update shop_merchantproducts set " 'counter='A'"
			StrSQL=StrSQL+ "merchantID=" & trim(merchant)
			StrSQL=StrSQL+ ",catalogID=" & trim(codarticolo)
			StrSQL=StrSQL+ ",ccode='" & trim(rifarticolo) & "'"
			'StrSQL=StrSQL+ ",coffmag=" & bartoff
			StrSQL=StrSQL+ ",cprice=" & trim(prezzo)
			StrSQL=StrSQL+ ",cpriceofferta=" & trim(prezzoofferta)
			StrSQL=StrSQL+ ",cscorta=" & trim(scorta)
			StrSQL=StrSQL+ ",csottoscorta=" & trim(sottoscorta)
			'if dataok=true then StrSQL=StrSQL+ ",cdisponibile=#" & idate(disponibile) & "#"
			StrSQL=StrSQL+ " where catalogID=" & trim(codarticolo) & " and merchantID=" & trim(merchant)
			'response.write(StrSql)
			
			connm.Execute StrSQL
			'Modifica anche l'archivio articolo
			StrSQL="update shop_products set ccode='"+ca(trim(rifarticolo)) & "'"
			StrSQL=StrSQL+ ",cname='" & ca(trim(desarticolo)) & "'"
			StrSQL=StrSQL+ ",cdescription=' " & ca(trim(artdettagli)) & "'"
			StrSQL=StrSQL+ ",cimageurl='" & ca(trim(immagine)) & "'"
			StrSQL=StrSQL+ ",cimageurl1='" & ca(trim(immagine1)) & "'"
			StrSQL=StrSQL+ ",cimageurl2='" & ca(trim(immagine2)) & "'"
			StrSQL=StrSQL+ ",cimageurl3='" & ca(trim(immagine3)) & "'"
			StrSQL=StrSQL+ ",cimageurl4='" & ca(trim(immagine4)) & "'"
			StrSQL=StrSQL+ ",filepdf='" & ca(trim(immaginepdf)) & "'"	
			StrSQL=StrSQL+ ",coffmag='" & ca(trim(articoloofferta)) & "'"
			StrSQL=StrSQL+ ",cstock='" & ca(trim(cstock)) & "'"
			StrSQL=StrSQL+ ",iva='" & ca(trim(civa)) & "'"
			StrSQL=StrSQL+ ",taglia='" & ca(tgtot) & "'"
			StrSQL=StrSQL+ ",colore='" & ca(trim(coltot)) & "'"
			StrSQL=StrSQL+ ",cprice=" & prezzo			
			StrSQL=StrSQL+ ",cprice1=" & prezzoqta1
			StrSQL=StrSQL+ ",cprice2=" & prezzoqta2
			StrSQL=StrSQL+ ",cprice3=" & prezzoqta3	
			StrSQL=StrSQL+ ",aliqiva=" & aliqiva		
			StrSQL=StrSQL+ ",homepage=" & homepage	
			StrSQL=StrSQL+ ",qta1=" & qta1
			StrSQL=StrSQL+ ",qta2=" & qta2
			StrSQL=StrSQL+ ",qta3=" & qta3				
			StrSQL=StrSQL+ ",ccategory=" & categoria
			StrSQL=StrSQL+ ",cscategory=" & sottocategoria
			StrSQL=StrSQL+ ",cpriceofferta=" & trim(prezzoofferta)
			StrSQL=StrSQL+ " where catalogID=" & trim(codarticolo)
			'response.write("<br>" & StrSql)
			'response.end
			connm.Execute StrSQL
			
end if

if ca(trim(rifarticolo))="" then 
	Response.redirect "merchant_articoli.asp?merchant=" & merchant & "&prID=" & codarticolo & "&act=mod&err=si"
else
	' Redirect Pagina
	Response.redirect "merchant_articoli.asp?merchant=" & merchant & "&prID=" & codarticolo & "&act=mod"
end if 
%>
