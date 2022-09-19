<!-- #include file = "Include_GetString.asp" -->
<html>
	<head id="Head1">
		<title><%= GetString("Preview") %></title>		
		<meta name="content-type" content="text/html ;charset=Unicode" />
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)" />
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)" />
		<link href="../Themes/<%=Theme%>/dialog.css" type="text/css" rel="stylesheet" />
		<style type="text/css">	
		html, body, ajaxdiv{height: 100%;}
		#idSource{WIDTH: 100%; HEIGHT: 100%;background-color:#ffffff;}
		#divouter{border-top:1px solid #a0a0a0;border-left:1px solid #a0a0a0;border-bottom:1px solid #ffffff;border-right:1px solid #ffffff;vertical-align: top;width:100%;height:100%; background-color:white;}
		</style>
		<!--[if IE]>
			<link href="../Style/IE.css" type="text/css" rel="stylesheet" />
		<![endif]-->
		<script type="text/javascript" src="../Scripts/Dialog/DialogHead.js"></script>
	</head>
	<body>
		<div id="ajaxdiv" style="padding:3px;">
			<table style="height:100%" cellspacing="0" cellpadding="0" width="100%">
				<tbody>
					<tr>
						<td style="HEIGHT: 100%" colspan="3">
							<div id="divouter">
							<iframe id="idSource" src="../Template.asp" scrolling="auto" frameborder="0">
							</iframe>
							</div>
						</td>
					</tr>
					<tr>
						<td>
<img src="../Images/print.gif" onclick="window.print();" title="<%= GetString("Print") %>" class="cursor dialogButton" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);" />
						</td>
						<td style="PADDING-LEFT: 30px;">
							<%= GetString("Width") %>: <input type="text" name="inc_width" id="inc_width" size="5" />&nbsp;&nbsp; 
							<%= GetString("Height") %>: <input type="text" name="inc_height" id="inc_height" size="5" />
						</td>
						<td class="dialogFooter" align="right" style="padding:15px">
							<!--<%= GetString("Size") %>: <input type='radio' name="radio_size" id="W640" onclick='ResizeThis(640,480)' />640x480
							<input type='radio' name="radio_size" id="W800" onclick='ResizeThis(800,600)' />800x600
							<input type='radio' name="radio_size" id="W1024" onclick='ResizeThis(1024,768)' />1024x768 -->
							&nbsp;&nbsp;&nbsp;&nbsp; <input class="formbutton" type="button" value="<%= GetString("Cancel") %>" onclick="do_Close()" />&nbsp;
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
	<script type="text/javascript" src="../Scripts/Dialog/DialogFoot.js"></script>
	<script type="text/javascript" src="../Scripts/Dialog/Dialog_Preview.js"></script>
</html>