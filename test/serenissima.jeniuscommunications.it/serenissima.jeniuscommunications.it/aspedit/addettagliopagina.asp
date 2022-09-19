<!-- #include file = "cuteeditor_files/include_CuteEditor.asp" --> 
<!-- #include file = "connessionesql.inc" -->
<%txt_id=Request("id")%>	
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
		<form name="theForm" action="addettagliopagina.asp?action=modifica&id=<%=txt_id%>" method="post" ID="Form2">
		<h1><%=ucase(request("tit"))%></h1>
		<%  'on error resume next
					
			dim content
			LCID = 1040
			Session.LCID = LCID
			
			
		
			    if request("action")="modifica" then
							titolo		=	Request.Form("titolo")
							sottotitolo		=	Request.Form("sottotitolo")
							notizia	=	Request.Form("Editor1")     
							txt_id=Request("id")							
						    sql="update news set notizia='" & tosql(notizia) & "' where id=" & Request("id") & " limit 1"
						    'response.write(sql)
							'response.end
							connm.execute(sql)
				else
						on error resume next
						MySQL="select * from news where id=" & Request("id") & " order by id DESC"
						set rs2=connm.execute(MySQL)
						if not rs2.eof then
						    txt_id=rs2("id")
							dataora	 = rs2("dataora")
							titolo	 = rs2("titolo")
							sottotitolo	 = rs2("sottotitolo")
							notizia  = rs2("notizia")
							rs2.close
							set rs2=nothing
						end if
				end if	

							
						
			
			Dim editor
			Set editor = New CuteEditor
			editor.ID = "Editor1"
			editor.Text = notizia
			editor.Height = 550
			editor.EditorBodyStyle = "font:normal 12px arial;"
			editor.EditorWysiwygModeCss = "asp.css"
			editor.Draw()
			
			
				' Request.Form(ID) access from other page
		
			%>	
			<br>
			<div class="infobox">
			<input  type="submit" value="AGGIORNA"></form>
			<button onclick="window.open('../adanteprimapagina.asp?id=<%=txt_id%>', '_blank')">&nbsp;ANTEPRIMA&nbsp;</button>
		
		
		</div>
			
		
	</body>
</html>
