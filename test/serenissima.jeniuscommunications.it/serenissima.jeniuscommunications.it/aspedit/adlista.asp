<!-- #include file = "cuteeditor_files/include_CuteEditor.asp" --> 
<!-- #include file = "connessionesql.inc" -->	
<html>	
    <head>
		<title></title>
		<link rel="stylesheet" href="/admin/style.css"  type="text/css" />
			<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta charset="utf-8">
	</head>
	<body>
	<br>
	 <!-- #include virtual="/admin/_menu.inc" -->

		
		<h1>LISTA NOTIZIE</h1>
		<hr>
		<div class="infobox">
			<form name="theForm" action="addettaglio.asp?action=nuova" method="post" ID="Form2">
			<input type="submit" value="NOTIZIA NUOVA">
		    </form>
		
		</div>
		<br>
		<%  
			LCID = 1040
			Session.LCID = LCID
		
			MySQL="select * from news where titolo<>'homepage' and titolo<>'marchio' order by id DESC"
			set rs2=connm.execute(MySQL)
			
			do while not rs2.eof
			    id	 = rs2("id")
				titolo	 = rs2("titolo")
				sottotitolo	 = rs2("sottotitolo")
				notizia  = rs2("notizia")
				dataora	 = rs2("dataora")
			
			%>	<a href="addettaglio.asp?id=<%=id%>">
			DATA ORA : <%= dataora %><br>	
			TITOLO : <%= titolo %><br>
			SOTTOTITOLO : <%= sottotitolo %><br></a>	
			<hr><%	
			'response.end
			rs2.movenext
			Loop
			rs2.close
			set rs2=nothing
			%>	
			<br>
			<div id="row">
			<form name="theForm" action="addettaglio.asp?action=nuova" method="post" ID="Form2">
			<input type="submit" value="NOTIZIA NUOVA">
		    </form>
			</div>
	</body>
</html>
