<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<div id="basic" class="well" style="max-width:44em;">
<div class="single-sidebar">                   
<ul>
<%'Catalogo
if trim(request("cat"))="" then
 queryd1="Select Distinct Categoria From prodotti where fornitore='od' order by Categoria asc"
else
 queryd1="Select Distinct Categoria From prodotti where fornitore='od' and categoria='" & request("cat") & "' order by Categoria asc"
end if
Set Tbc = Server.CreateObject("ADODB.RecordSet")
Tbc.Open queryd1,connm
Do While not Tbc.eof	
	if trim(Tbc("categoria"))<>"" then
			txt_categoria=trim(replace(replace(Tbc("categoria"),"%20"," "),"'","`"))				 
			response.Write "<li><h2><font color='#F86605'><img align='center' valign='middle' src='img/ico_freccia.png' border='0'>&nbsp;" & Ucase(Tbc("Categoria")) & "</font></h2></li>"
			queryd2="Select Distinct SottoCategoria,Categoria from prodotti where fornitore='od' and Categoria='" & Tbc("categoria") & "' order by SottoCategoria asc"
			'response.Write(queryd2)
			'response.end
			Set Tbst = Server.CreateObject("ADODB.RecordSet")
			Tbst.Open queryd2,connm
			Do While not Tbst.eof
				 If request("menu")="yes" and Tbst("SottoCategoria")=request("sotto") then
					Response.Write "<li><table border=0><tr><td><a href='odlista.asp?sotto=" & Replace(Tbst("SottoCategoria")," ","%20") & "&cat=" & Replace(Tbst("Categoria")," ","%20") & "'>&nbsp;" & ucase(Tbst("SottoCategoria"))  & "</a></td><td width=15px></td><td><a href='odcat.asp?menu=no&cat=" & Replace(Tbst("Categoria")," ","%20") & "&sotto=" & Replace(Tbst("SottoCategoria")," ","%20") & "'><div class='quantity buttons_added'><input style='background: #0394D8;' type='button' class='plus' value='-' ></div></a></td></tr></table></li>"
					querydsottocat="Select Distinct nome_prodotto From prodotti where Categoria='" & Replace(Tbst("Categoria")," "," ") & "' and SottoCategoria='" & Replace(Tbst("SottoCategoria")," "," ") & "'  and fornitore like '%od%' order by SottoCategoria asc"
					'response.Write(querydsottocat)
					Set Tbsotto = Server.CreateObject("ADODB.RecordSet")
					Tbsotto.Open querydsottocat,connm
					Do While not Tbsotto.eof
					 Response.Write "<li><a href='odlistaprod.asp?nomeprodotto=" & Replace(Tbsotto("nome_prodotto")," ","%20") & "'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & Lcase(Tbsotto("nome_prodotto"))  & "</a></li>"
					 Tbsotto.movenext
					Loop
					response.Write("<br>")
				  Else
				   Response.Write "<li><table border=0><tr><td><a href='odlista.asp?sotto=" & Replace(Tbst("SottoCategoria")," ","%20") & "&cat=" & Replace(Tbst("Categoria")," ","%20") & "'>&nbsp;" & ucase(Tbst("SottoCategoria"))  & "</a></td><td width=15px></td><td><a href='odcat.asp?menu=yes&cat=" & Replace(Tbst("Categoria")," ","%20") & "&sotto=" & Replace(Tbst("SottoCategoria")," ","%20") & "'><div class='quantity buttons_added'><input type='button' class='plus' value='+' ></div></a></td></tr></table></li>"			
				  End if
				Tbst.movenext
			Loop
			Tbst.Close		
	end if
	Tbc.movenext
Loop
Tbc.close
%> 
</ul>
</div>
<a href="#" onclick="document.getElementById('divmenuod').style.visibility ='hidden';"><button class="basic_close btn btn-default">chiudi</button></a>
</div>
<!--#include file="sqlchiudi.inc" -->