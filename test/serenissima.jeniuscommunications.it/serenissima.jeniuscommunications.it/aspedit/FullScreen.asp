<!-- #include file = "cuteeditor_files/include_CuteEditor.asp" --> 
<html>	
    <head>
		<link rel="stylesheet" href="asp.css"  type="text/css" />
	</head>
    <body>
		
		<form name="theForm" action="Get_HtmlContent.asp" method="post">
		<h1>Full screen mode</h1>
		<hr>
		<div class="infoBox">
				Full screen mode button (F12 shortcut)  allows you to stretch the Cute Editor control to the width and height of your browser window. <BR>
		</div>
		<br />
		<%
			dim content
			content = "Type here"			
					
			Dim editor
			Set editor = New CuteEditor
			editor.ID = "Editor1"
			editor.Text = content
			
			editor.FullPage = true
			editor.EditorBodyStyle = "font:normal 12px arial;"
			editor.EditorWysiwygModeCss = "asp.css"
			editor.Draw()
												
			' Request.Form(ID) access from other page
		%>
						
		</form>
	</body>
</html>