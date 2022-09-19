<!--Shop Italian Genovese Marco-->
<!--#include file="_colors.inc"-->
<!--#include file="_money.inc"-->
<!--#include file="_images.inc"-->
<!--#include file="stat/count.asp"-->
<%  
    'Variabili Connessione Db
	Dim dbc
	Dim dbcmrc
	
	
	cDBStats = "db/scart.mdb"
     Sub Openconn
         stringdb5= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
         "Persist Security Info=False;" &_
         "Data Source=" & Server.MapPath(cDBStats)
          set dbc = Server.CreateObject("ADODB.Connection")
          dbc.open stringdb5
     End Sub
     
     Sub CloseConn()
     Dim dbc
	  if isobject(dbc) then
		if dbc.State = adStateOpen then
			dbc.Close
		end if
		set dbc = nothing
	  end if
     End sub
     
     
     
     cDBStats1 = "db/merchant.mdb"
     Sub Openconnmrc
      stringdb1= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Persist Security Info=False;" &_
      "Data Source=" & Server.MapPath(cDBStats1)
      set dbcmrc = Server.CreateObject("ADODB.Connection")
      dbcmrc.open stringdb1
     End Sub
     
     Sub closeConnmrc()
	  if isobject(dbcmrc) then
		if dbcmrc.State = adStateOpen then
			dbcmrc.Close
		end if
		set dbcmrc = nothing
	  end if
     End sub
     
     
     cDBStats2 = "db/merchant.mdb"
     Sub Openconncar
      stringdb2= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Persist Security Info=False;" &_
      "Data Source=" & Server.MapPath(cDBStats2)
      set dbcmrc = Server.CreateObject("ADODB.Connection")
      dbccar.open stringdb2
     End Sub
     
     Sub closeConncar()
	  if isobject(dbccar) then
		if dbccar.State = adStateOpen then
			dbccar.Close
		end if
		set dbccar = nothing
	  end if
     End sub	


	Function Totcarrello
	 'Apertura Database Carrello
	 cDBStatscar = "db/carrello.mdb"
    'Apertura Database Carrello
	 strDSNcar =  "Provider=Microsoft.Jet.OLEDB.4.0;" &_
     "Persist Security Info=False;" &_
     "Data Source=" & Server.MapPath(cDBStatscar)
     'Response.Write (Server.MapPath(cDBStatscar))
	 Set cncar = Server.CreateObject("ADODB.Connection")
	 cncar.Open strDSNcar
	 'Tabelle Utilita
	 Set tbcar = Server.CreateObject("ADODB.Recordset")
	 Sql="Select Prezzo,Quantita from Carrello Where SessionId='" & trim(Session.SessionID) & "'"
	 Tbcar.Open Sql,cncar
	 Totcarrello=0
	 if not Tbcar.EOF then
	  do while not Tbcar.EOF
	   Totcarrello=Totcarrello+(Tbcar("Quantita")*Tbcar("Prezzo"))
	   Tbcar.MoveNext
	  loop
	 else 
	  Totcarrello=0
	 end if 
	End Function


	Function Scritta(byval testo)
		arparole=split(testo & " ")
		txt=""
		for f=0 to ubound(arparole)
			txt=txt & Ucase(Left(arparole(f),1)) & lcase(mid(arparole(f),2)) & " "
		next
		Scritta=trim(txt)
	End function
	    

	Sub Categorie(byval id)
		'Controlla le offerte in corso (Massimo 2)
		openconn
		set rs = server.CreateObject("ADODB.Recordset")
		strSQL = "Select * from categories order by catdescription"
		rs.Open strSQL,dbc
		If not rs.EOF Then
		    counter=0
		    if id=1 then
		     Response.Write "<table width='100%' border=0><tr><td width='15%'></td><td>"
		    else
		     Response.Write "<table width='100%' border=0><tr><td>"
		    end  if 
		    i=1
		    Do while not rs.EOF
			   if id=1 then  
			     Response.Write "<table cellspacing=""0"" cellpadding=""0"" width='100%' border=0><tr><td >"
				 Response.Write "<a class=orange01 href=categoria.asp?id=" & rs("categoryid") & ">&nbsp;&nbsp;&nbsp;&nbsp;" &  rs("catdescription") & "</a>"
				 Response.Write "</td></tr></table>"
				 Sottocategorie(rs("categoryid")) 
				else 
				 if i=1 then 
				  i=i-1
				  Response.Write "<table cellspacing=""0"" cellpadding=""0"" width='100%' border=0><tr><td >"
				  Response.Write "<a class=menuprod1 href=categoria.asp?id=" & rs("categoryid") & ">&nbsp;&nbsp;&nbsp;&nbsp;" &  rs("catdescription") & "</a>"
				  Response.Write "</td></tr></table>"
				 else
				  i=i+1
				  Response.Write "<table cellspacing=""0"" cellpadding=""0"" width='100%' border=0><tr><td >"
				  Response.Write "<a class=menuprod2 href=categoria.asp?id=" & rs("categoryid") & ">&nbsp;&nbsp;&nbsp;&nbsp;" &  rs("catdescription") & "</a>"
				  Response.Write "</td></tr></table>"
				 end if 
				end if 
				rs.movenext
				counter=counter+1
				'if counter>16 then exit do
		    Loop
		    Response.Write "</td></tr></table>"
		End if
		rs.close
		closeconn
	End sub	
	
	Sub Sottocategorie(byval id)
		'Controlla le offerte in corso (Massimo 2)
		openconn
		set rss = server.CreateObject("ADODB.Recordset")
		strSQL = "Select * from subcategories where categoria=" & cint(id) & " order by descrizione "
		rss.Open strSQL,dbc
		If not rss.EOF Then
		    counter=0
		    Response.Write "<table width='100%' border=0><tr><td width='15%'></td><td>"
		    Do while not rss.EOF
			    Response.Write "<table width='100%' border=0><tr><td >"
				Response.Write "<a class=navy11 href=categoria.asp?id=" & rss("categoria") & "&subid=" & rss("codice") & ">" &  rss("descrizione") & "</a>"
				Response.Write "</td></tr></table>"
				rss.movenext
				counter=counter+1
				'if counter>16 then exit do
		    Loop
		    Response.Write "</td></tr></table>"
		End if
		rss.close
		closeconn
	End sub	


%><HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE></TITLE>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script LANGUAGE="JavaScript">
function ViewImage(ifile,ix,iy,ititle) { 
var win;
var sWidth;
var sHeight;
var NS = (document.layers) ? 1 : 0;
win = window.open("","imageviewer","width="+ix+",height="+iy+",menubar=no,toolbar=no");
if (NS) {
sWidth = win.innerWidth;
sHeight = win.innerHeight;
} else {
sWidth = win.document.body.clientWidth;
sHeight = win.document.body.clientHeight;
}
if(sWidth!=ix || sHeight!=iy) {
win.close();
setTimeout("ViewImage('"+ifile+"',"+ix+","+iy+",'"+ititle+"')", 250);
return;
}
win.document.open();
win.document.write("<html><head><title>"+ititle+"</title>");
win.document.write("<link href='_styles.inc' rel='stylesheet' type='text/css'></head><body bgcolor=#33bbee>");
win.document.write('<div style="position:absolute;width:'+ix+'px;height:'+iy+'px;left:0px;top:0px">');
win.document.write("<img class=border src="+ifile+"></div></body></html>");
win.document.close();
}
</script>
<SCRIPT language=JavaScript>
<!--

function changeImg(strIDImg){
	document.images["immagine"].src = "img/"+"big"+ strIDImg +".jpg";
	//document.images["title"].src = "../../Img_Big/Azienda/title"+ strIDImg +".jpg";
	//document.images["txt"].src = "../../Img_Big/Azienda/txt"+ strIDImg +".jpg";
}
//-->
</SCRIPT>
</HEAD>
<BODY>
<TABLE WIDTH=753 align=center border=0 height="100%" CELLSPACING=0 CELLPADDING=0  >
	<TR>
		<TD>
			<TABLE WIDTH=753 align=center height="100%" BORDER=0 CELLSPACING=0 CELLPADDING=0>
				<TR>
					<TD COLSPAN=2>
            <OBJECT id=logo 
            codeBase=http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0 
            height=100 width=753 
            classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000><PARAM NAME="_cx" VALUE="19923"><PARAM NAME="_cy" VALUE="2646"><PARAM NAME="FlashVars" VALUE=""><PARAM NAME="Movie" VALUE="logo.swf"><PARAM NAME="Src" VALUE="logo.swf"><PARAM NAME="WMode" VALUE="Window"><PARAM NAME="Play" VALUE="-1"><PARAM NAME="Loop" VALUE="-1"><PARAM NAME="Quality" VALUE="High"><PARAM NAME="SAlign" VALUE=""><PARAM NAME="Menu" VALUE="-1"><PARAM NAME="Base" VALUE=""><PARAM NAME="AllowScriptAccess" VALUE="always"><PARAM NAME="Scale" VALUE="ShowAll"><PARAM NAME="DeviceFont" VALUE="0"><PARAM NAME="EmbedMovie" VALUE="0"><PARAM NAME="BGColor" VALUE="FFFFFF"><PARAM NAME="SWRemote" VALUE=""><PARAM NAME="MovieData" VALUE=""><PARAM NAME="SeamlessTabbing" VALUE="1">
            																				<embed name="logo" src="logo.swf" quality="high" bgcolor="#FFFFFF"
					width="753" height="100"
					
					            					type="application/x-shockwave-flash"
            					pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
           >
					</embed>					</OBJECT>
					
					
					
					
					</TD>
				</TR>
				<TR>
					<TD width=181 height="100%" valign=top background=img2/bkgr_gray.gif>
					<!--#include file=menusx2.inc-->
	
					</TD>
					<TD  ALIGN=middle width=350 valign=top CLASS=sfondo1>
            		<br><br>	<%
									Categorie(1)
							%>	
          						
					</TD>
<TD  ALIGN=middle width=222 valign=top CLASS=sfondo1>
								Categorie(0)	
</TD>
				</TR>




                <TR><TD COLSPAN=2>
            <OBJECT id=fine 
            codeBase=http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0 
            height=57 width=753 
            classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000><PARAM NAME="_cx" VALUE="19923"><PARAM NAME="_cy" VALUE="1508"><PARAM NAME="FlashVars" VALUE=""><PARAM NAME="Movie" VALUE="fine.swf"><PARAM NAME="Src" VALUE="fine.swf"><PARAM NAME="WMode" VALUE="Window"><PARAM NAME="Play" VALUE="-1"><PARAM NAME="Loop" VALUE="-1"><PARAM NAME="Quality" VALUE="High"><PARAM NAME="SAlign" VALUE=""><PARAM NAME="Menu" VALUE="-1"><PARAM NAME="Base" VALUE=""><PARAM NAME="AllowScriptAccess" VALUE="always"><PARAM NAME="Scale" VALUE="ShowAll"><PARAM NAME="DeviceFont" VALUE="0"><PARAM NAME="EmbedMovie" VALUE="0"><PARAM NAME="BGColor" VALUE="FFFFFF"><PARAM NAME="SWRemote" VALUE=""><PARAM NAME="MovieData" VALUE=""><PARAM NAME="SeamlessTabbing" VALUE="1">
            																								<embed name="fine" src="fine.swf" quality="high" bgcolor="#FFFFFF"
						width="753" height="57"
						
						            						type="application/x-shockwave-flash"
            						pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
           >
						</embed>
  						</OBJECT>
                
                </TD></TR>

				</TABLE>
	</TD>
	</TR>
</TABLE>				

</BODY>
</HTML>
