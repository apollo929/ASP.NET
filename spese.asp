<%
Sped=0 
'Se abilitato spese di spedizione gratis
If Session("tot")>=99 then %>
	<b>Gratis</b>
	<%Sped=0
else%>
	<b>&#8364;.9,90</b>
	<%Sped=9.9
end if
Session("CostoSpese")=Sped	
%>

  