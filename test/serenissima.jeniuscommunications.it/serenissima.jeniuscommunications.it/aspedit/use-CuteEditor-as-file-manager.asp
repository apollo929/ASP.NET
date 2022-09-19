<!-- #include file = "cuteeditor_files/include_CuteEditor.asp" --> 
<html>	
    <head>
		<link rel="stylesheet" href="asp.css"  type="text/css" />
	</head>
    <body>
	
					<h1>Use CuteEditor as a file manager</h1>
					<hr />
					<div class="infoBox">This example demonstrates how to use CuteEditor as a file manager.</div>
					<br />
		            <input name="docFld" type="text" id="docFld" style="width:300px;" /> 
		            <input name="Change" id="Change" type="button" value="File Manager" onclick="callInsertImage()" />   
						<br />
						<%
							Dim editor
							Set editor = New CuteEditor
							
							editor.ID = "Editor1"
							editor.Text = ""
			                editor.Width="1"
			                editor.Height="1" 
			                editor.AutoConfigure="None"
			                
			                editor.ThemeType="OfficeXp"
			                editor.ShowBottomBar=false
							editor.Draw()
																								
							' Request.Form(ID) access from other page
						%>
							
						<br/><br/>					
			
		                <script language="javascript">
		                    function callInsertImage() {
		                        var editor1 = document.getElementById('<%=editor.ClientID%>');
		                        var editdoc = editor1.GetDocument();
		                        editdoc.body.innerHTML = "";
		                        editor1.ExecCommand('insertdocument');
		                        InputURL();
		                        document.getElementById("docFld").focus();
		                    }

		                    function InputURL() {
		                        var editor1 = document.getElementById('<%=editor.ClientID%>');
		                        var editdoc = editor1.GetDocument();
		                        var links = editdoc.getElementsByTagName("a");
		                        if (links.length > 0 && links[links.length - 1].href != "") {
		                            document.getElementById("docFld").value = links[links.length - 1].href;
		                        }
		                        else {
		                            setTimeout(InputURL, 500);
		                        }
		                    }
						</script> 
	</body>
</html>