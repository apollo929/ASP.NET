<!-- #include file = "cuteeditor_files/include_CuteEditor.asp" --> 
<html>	
    <head>
		<title>ASP Editor Demo</title>
		<link rel="stylesheet" href="asp.css"  type="text/css" />
	</head>
    <body>
		
		<form name="theForm" action="Get_HtmlContent.asp" method="post">
					
		<h1>Enable All Toolbars</h1>
		<hr>
		<p>This example shows you all the predefined buttons. </p>
		<br />
		<%
			Dim editor
			Set editor = New CuteEditor
			editor.ID = "Editor1"
			editor.Text = "Type here"
			
			editor.EditorBodyStyle = "font:normal 12px arial;"
			editor.EditorWysiwygModeCss = "asp.css"
			editor.Draw()
												
			' Request.Form(ID) access from other page
		%>
						
		</form>
	</body>
</html>