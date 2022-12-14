<!-- #include file = "Include_GetString.asp" -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="Head1">
		<title><%= GetString("Preview") %> 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		</title>
		
		<meta name="content-type" content="text/html ;charset=Unicode" />
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)" />
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)" />
		<link href="../Themes/<%=Theme%>/dialog.css" type="text/css" rel="stylesheet" />
		<!--[if IE]>
			<link href="../style/IE.css" type="text/css" rel="stylesheet" />
		<![endif]-->
		<script type="text/javascript" src="../Scripts/Dialog/DialogHead.js"></script>
	</head>
	<body>
		<form id="formSearch" method="post" runat="server">
			<table style="height:100%" cellspacing="0" cellpadding="5" width="100%">
				<tbody>
					<tr>
						<td style="HEIGHT: 100%" colspan="3">
							<iframe id="idSource" src="../Template.asp" scrolling="auto" style="WIDTH: 100%; HEIGHT: 100%;background-color:#ffffff;">
							</iframe>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../Images/print.gif" onclick="window.print();" title="<%= GetString("Print") %>" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);" />
						</td>
						<td align="right" style="PADDING-LEFT: 30px;">
							<%= GetString("Width") %>: <input type="text" name="inc_width" id="inc_width" size="5" />&nbsp;&nbsp; 
							<%= GetString("Height") %>: <input type="text" name="inc_height" id="inc_height" size="5" />
						</td>
						<td class="dialogFooter" valign="top" align="right" style="PADDING-RIGHT: 13px; PADDING-LEFT: 13px; PADDING-BOTTOM: 7px; PADDING-TOP: 7px">
							<%= GetString("Size") %>: <input type='radio' name="radio_size" id="W640" onclick='ResizeThis(640,480)' />640x480
							<input type='radio' name="radio_size" id="W800" onclick='ResizeThis(800,600)' />800x600
							<input type='radio' name="radio_size" id="W1024" onclick='ResizeThis(1024,768)' />1024x768 
							&nbsp;&nbsp;&nbsp;&nbsp; <input class="formbutton" type="button" value="<%= GetString("Cancel") %>" onclick="do_Close()" />&nbsp;
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
	<script type="text/javascript" src="../Scripts/Dialog/DialogFoot.js"></script>
	<script type="text/javascript" src="../Scripts/Dialog/Dialog_Preview.js"></script>
</html>