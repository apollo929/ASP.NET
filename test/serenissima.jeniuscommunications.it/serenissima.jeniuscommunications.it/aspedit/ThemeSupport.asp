<!-- #include file = "cuteeditor_files/include_CuteEditor.asp" --> 
<html>	
    <head>
		<title></title>
		<link rel="stylesheet" href="asp.css"  type="text/css" />
	</head>
	<body bottommargin="0" topmargin="0" marginheight="0" marginwidth="0">
		<form name="theForm" action="Get_HtmlContent.asp" method="post" ID="Form2">
				<h1>Built in theme support</h1>
					<hr>
					<div class="infoBox">
					Cute Editor provides several built in themes that are ready to use. You can 
choose from several predefined themes or create your own. 
					</div>
					<br>
						<%							
							Dim editor
							Set editor = New CuteEditor  'Create a new editor class object									
									
							'Set the ID of this editor class
							editor.ID = "Editor1" 
									
							'Set the initial HTML value of editor control
							editor.Text = "Type here" 
							
							editor.DisableItemList = "Save"
							
							'editor.Template= "Bold,Italic,Underline"
							
							'editor.Width = 740
							editor.Height = 200
							editor.ThemeType="Office2003Blue"
							editor.EditorWysiwygModeCss = "asp.css"
							editor.AutoConfigure = "Simple"
							editor.Draw()
							
							Response.Write "<br><br>"
							Dim editor2
							Set editor2 = New CuteEditor  'Create a new editor class object									
							
							editor2.subsequent = true
							editor2.ID = "Editor2" 'Set the ID of this editor class
							editor2.Text = "Type here"
							editor2.EditorWysiwygModeCss = "asp.css"
							editor2.MaxImageSize = 50
							editor2.Height = 200
							editor2.AutoConfigure = "Simple"
							editor2.Draw()
							
							Response.Write "<br><br>"
							Dim editor3
							Set editor3 = New CuteEditor  'Create a new editor class object									
							
							editor3.subsequent = true
							editor3.ID = "editor3" 'Set the ID of this editor class
							editor3.Text = "Type here"
							editor3.EditorWysiwygModeCss = "asp.css"
							editor3.ThemeType="officexp"
							editor3.Height = 200
							editor3.AutoConfigure = "Simple"
							editor3.Draw()
	
							' Retrieve the data from editor: Request.Form("Editor1") 
							%>
						<br>
						<input type="submit" value="Update"  class="button65" ID="Submit1" NAME="Submit1">
		</form>
	</body>
</html>