<%@ CODEPAGE=65001 %> 
<% Response.CodePage=65001%> 
<% Response.Charset="UTF-8" %> 
<!-- #include file = "include_Security.asp" -->
<fieldset><legend><%= GetString("Src") %></legend>
	<input type="text" id="inp_src" style="width:320px"><button id="btnbrowse"><%= GetString("Browse") %></button>
</fieldset>
<fieldset style="height:180px;width:270px;overflow:hidden;"><legend><%= GetString("Demo") %></legend>
	<object id=flash_preview classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,42,0"
		VIEWASTEXT>
		<embed type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
	</object>
</fieldset>

<script type="text/javascript" src="../Scripts/Dialog/Dialog_Tag_Flash.js"></script>

