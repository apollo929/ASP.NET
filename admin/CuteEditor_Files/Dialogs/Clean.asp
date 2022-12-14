<!-- #include file = "Include_GetString.asp" -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><%= GetString("CleanCode") %> </title>
		
		<meta name="content-type" content="text/html ;charset=Unicode" />
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)" />
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)" />
		<link href="../Themes/<%=Theme%>/dialog.css" type="text/css" rel="stylesheet" />
		<!--[if IE]>
			<link href="../style/IE.css" type="text/css" rel="stylesheet" />
		<![endif]-->
		<script type="text/javascript" src="../Scripts/Dialog/DialogHead.js"></script>
		<style type="text/css">
			.codebutton
			{
				width:200px; 
				height:28px;
				display:block;
	            font:normal 11px Tahoma;
                padding: 1px 3px 1px 3px;
                text-decoration: none;
                padding-top: 3px;
                border:outset 1px #ccc;
				background:#999;
				color:#666;
				background:url(../Images/formbg.gif) repeat-x left top;
           }
			.codebutton:hover
            {
	            display:block;
	            font:normal 11px Tahoma;
                padding: 1px 3px 1px 3px;
                color: #000;
				width:200px; 
				height:28px;	
                text-decoration: none;
                padding-top: 3px;
                border: #ff0000 1px solid; background-color: #c0c0c0;
            }
		</style>
	</head>
	<body>
		<div id="container">
			<table cellspacing="0" cellpadding="5" width="100%" class="normal">
				<tr>
					<td>
					    <a href="###" class="codebutton" onclick="codeCleaner('allhtml');">					
					        <img src="../Images/code.gif" title="<%= GetString("RemoveHTMLTags") %>" style="border:0;vertical-align:middle;" />
							<%= GetString("RemoveHTMLTags") %> 
					    </a>
					</td>
				</tr>
				<tr>
					<td><a href="###" class="codebutton" onclick="codeCleaner('word');">					
					        <img src="../Images/doc.gif" title="<%= GetString("RemoveWordMarkup") %>" style="border:0;vertical-align:middle;" />
							<%= GetString("RemoveWordMarkup") %> 
					    </a>
					</td>
				</tr>
				<tr>
					<td>
					    <a href="###" class="codebutton" onclick="codeCleaner('css');">					
					        <img src="../Images/style.font.gif" title="<%= GetString("CleanupCSS") %>" style="border:0;vertical-align:middle;" />
							<%= GetString("CleanupCSS") %> 
					    </a>
					</td>
				</tr>
				<tr>
					<td>					    
					    <a href="###" class="codebutton" onclick="codeCleaner('font');">					
					        <img src="../Images/fontend.gif" title="<%= GetString("CleanupFont") %>" style="border:0;vertical-align:middle;" />
							<%= GetString("CleanupFont") %> 
					    </a>
					</td>
				</tr>
				<tr>
					<td>					    			    
					    <a href="###" class="codebutton" onclick="codeCleaner('span');">					
					        <img src="../Images/spanend.gif" title="<%= GetString("CleanupSpan") %>" style="border:0;vertical-align:middle;" />
							<%= GetString("CleanupSpan") %> 
					    </a>
					</td>
				</tr>
			</table>
			<br>
			<div id="container-bottom">
				<input type="button" value="<%= GetString("Cancel") %>" class="formbutton" onclick="Close()" ID="Button1" NAME="Button1">
			</div>					
		</div>
	</body>
	<script type="text/javascript" src="../Scripts/Dialog/DialogFoot.js"></script>
	<script type="text/javascript" src="../Scripts/Dialog/Dialog_Clean.js"></script>
</html>
