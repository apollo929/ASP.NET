
<!-- #include file = "cuteeditor_files/include_CuteEditor.asp" --> 
<!-- #include file = "connessionesql.inc" -->	

<html>	
    <head>
		<title></title>
		<link rel="stylesheet" href="asp.css"  type="text/css" />
	</head>
	<body>
		<form name="theForm" action="todatabase.asp?action=save" method="post" ID="Form2">
		<h1>AGGIUNTA NOTIZIE</h1>
		<hr>
		<div class="infobox"></div>
		<br>
		<%  on error resume next
					
			dim content
			
			if request("action")="save" then
				titolo		=	Request.Form("titolo")
				sottotitolo		=	Request.Form("sottotitolo")
				notizia	=	Request.Form("Editor1")     	
            
				sql="select titolo,sottotitolo,notizia from news"
				set rs=server.createobject("adodb.recordset")
				rs.open sql,connm,3,3
				
				rs.addnew
				rs("titolo")	=	titolo
				rs("sottotitolo")	=	sottotitolo
				rs("notizia")	=	notizia
				rs.update
				
				response.write "<font size=5 color=darkred>aggiunto notizia</font>"
				response.write "<br>"
				rs.close
				set rs = nothing
			else
				MySQL="select * from news order by id DESC"
				set rs2=connm.execute(MySQL)
				if not rs2.eof then
					titolo	 = rs2("titolo")
					sottotitolo	 = rs2("sottotitolo")
					notizia  = rs2("notizia")
					rs2.close
					set rs2=nothing
				end if
			end if	
			%>
			
			TITOLO : <input name="titolo" type="text" maxlength="100" size="40" id="titolo" value="<%= titolo %>"class="NormalTextBox" style="width:600px;"> <br><br>
			SOTTOTITOLO : <input name="sottotitolo" type="text" maxlength="100" size="40" id="sottotitolo" value="<%= sottotitolo %>"class="NormalTextBox" style="width:600px;"> <br><br>
						
			<%						
						
				Dim editor
				Set editor = New CuteEditor
				editor.ID = "Editor1"
				editor.Text = notizia
				editor.FullPage = false
				editor.Draw()
			
				' Request.Form(ID) access from other page
		
			%>	
			<br>
			<input type="submit" value="AGGIORNA">
		</form>
	</body>
</html>
