<!-- #include file = "Include_GetString.asp" -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)" />
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)" />
		<link href="../Themes/<%=Theme%>/dialog.css" type="text/css" rel="stylesheet" />
		<!--[if IE]>
			<link href="../style/IE.css" type="text/css" rel="stylesheet" />
		<![endif]-->
		<script type="text/javascript" src="../Scripts/Dialog/DialogHead.js"></script>
		<style type="text/css">
		div		{position:absolute;}
		.simple	{font-size:11pt;}
		.double	{font-size:9pt;}
		.simpledia	{font-size:11pt;color:red}
		.doubledia	{font-size:9pt;color:red}
		.action	{font-size:7pt;color:white;}
		.clavier	{font-size:7pt;color:blue;}
		.sign		{font-size:7pt;color:gray;}
		</style>
	</head>
	<body>		
		<textarea id="keyboard_area" cols="40" rows="4" style="width:99%;height:60px;" name="keyboard_area"></textarea>
		<script type="text/javascript" src="../scripts/Keyboard/keyboard-data.js"></script>
		<script type="text/javascript" src="../scripts/Keyboard/keyboard-diacritic.js"></script>
		<script type="text/javascript" src="../scripts/Keyboard/keyboard-dialogue.js"></script>
		<script type="text/javascript" src="../scripts/Keyboard/keyboard-multihexa.js"></script>		
		<div style="width: 300px; position: absolute; height: 30px; left:60px;top:235px">
			<input type="button" value="<%= GetString("Insert") %>" class="formbutton" onclick="do_insert()" id="Button1" name="Button1">&nbsp;
			<input type="button" value="<%= GetString("Cancel") %>" class="formbutton" onclick="do_Close()" id="Button2" name="Button2">
		</div>
	</body>
	<script type="text/javascript" src="../Scripts/Dialog/DialogFoot.js"></script>
	<script type="text/javascript" src="../Scripts/Dialog/Dialog_Keyboard.js"></script>
</html>
